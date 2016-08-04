<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

//entities

use AppBundle\Entity\Participant;
use AppBundle\Entity\ParticipantResponse;
use AppBundle\Entity\ParticipantSession;

//view objects
use AppBundle\ViewObjects\ViewImage;

use AppBundle\Utils\GamificationTypes;

class DefaultController extends BaseController
{

    /**
     * session key that holds the user's session object
     */
    const STEP                      = "task-number";

    const MAX_STEPS                 = "max-tasks";

    /**
     * TODO inject it into a variable
     */
    const IMAGES_REPO               = "imagesRepository";

    const POINTS_REPO               = "pointsRepository";

    const PARAM_REPO                = "paramsRepository";

    //const TRAINING_REPO             = "trainingRepository";


    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        //checks if the user is logged
        //TODO use a interceptor,filter or something to check session ending
        //-------------------------------------------------------------------
        $isUserLogged = $this->isUserLogged($request);
        if(!$isUserLogged)
        {
            return $this->redirect('logInUser');
        }

        //get the images
        $randomImages = $this->getTasksForQuestion($request);
        //creates and saves the user response in the session, when the user answer us, it will be save in the db
        $session = $request->getSession();
        //this should be injected, to do this, that controller should be declared as a service
        $em = $this->getEntityManager();
        $userSession = $this->deserializeEntityIntoTheSession($session,static::USER_SESSION_SESSION_KEY,$em);
        $participantResponse = ParticipantResponse::createFromSessionAndImages($userSession,$randomImages);
        $this->serializeEntityIntoTheSession($session,static::USER_RESPONSE_SESSION_KEY,$em,$participantResponse);


        //builds view's parameters
        $viewParams = array();
        //answer points
        $pointsRepository = $this->get(static::POINTS_REPO);
        $viewParams['correct_points']   = $pointsRepository->getPointsForCorrectAnswer();
        $viewParams['incorrect_points'] = $pointsRepository->getPointsForIncorrectAnswer();
        //gets the images's paths and passes them to the view
        $viewParams["images"] = $this->getViewImages($randomImages);
        $viewParams["points"] = $userSession->getTotalPoints();
        //gets current and max steps
        $viewParams["current_step"]  = $session->get(static::STEP);
        $viewParams["max_step"]      = $session->get(static::MAX_STEPS);

        $viewParams["post_url"]      = $this->generateUrl('processResponse', array(), true);
        $viewParams["end_url"]       = $this->generateUrl('logout',array(),true);
        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', $viewParams);
    }






    /**
     * @Route("/processResponse", name="processResponse")
     */
    public function processResponse(Request $request)
    {
        //TODO use synfony's forms validations
        $userSubmission = $request->request->get("answer");
        $requestIsValid = isset($userSubmission);

        //if the session has ended
        //TODO use a interceptor,filter or something to check session ending
        $isUserLogged = $this->isUserLogged($request);

        if(!$isUserLogged || !$requestIsValid)
        {
            return $this->redirectToIndex();
        }

        $imageRepository =$this->get(static::IMAGES_REPO);
        $session = $request->getSession();
        $this->advanceNextStep($session);
        //this should be injected, to do this, this controller should be declared as a service
        $em = $this->getEntityManager();
        $imageSelected = $imageRepository->findOneById($userSubmission);
        //add points
        $points = $this->assignPoints($imageSelected);
        //although it was fun dealing with entities and the session, this experiment has to stop! haha
        $this->sumPoints($em,$session,$points);
        //handles the training mode
        //gets the user response previously stored in the session, remember, this user response was not really answered yet
        $userResponse = $this->deserializeEntityIntoTheSession($session,static::USER_RESPONSE_SESSION_KEY,$em);
        //sets the user's actual response and saves it in the database
        $userResponse->setSelectedImage($imageSelected);
        $userResponse->setPointsEarned($points);

        $em->persist($userResponse);
        $em->flush();

        return $this->showNextTask($session);
    }


    /**
     * registers user's information
     *
     */
     /**
     * @Route("/logInUser", name="logInUser")
     */
    public function logInUser(Request $request)
    {
        $postUrl = $this->generateUrl('logInUserResponse', array(), true);
        $viewParams = array();
        $viewParams["post_url"] = $postUrl;

         //sets the type of gamification depending of an initial parameter in the URL
        $session = $request->getSession();
        $gamificationType = $request->query->get("gamification");
        if(!GamificationTypes::isAValidGamificationType($gamificationType))
        {
            $gamificationType = GamificationTypes::GAMIFICATION_BADGES;
        }
        $session->set(static::GAMIFICATION_KEY,$gamificationType);

        return $this->render('default/login.html.twig',$viewParams);
    }

    /**
     * registers user's information
     *
     */
     /**
     * @Route("/logInUserResponse", name="logInUserResponse")
     */
    public function logInUserResponse(Request $request)
    {
        //TODO use a interceptor,filter or something to check session ending
        //-------------------------------------------------------------------

        //if the user is already logged, we redirect it to the home page
        $isUserLogged = $this->isUserLogged($request);
        if($isUserLogged)
        {
            //redirects to the home
            return $this->redirectToIndex();
        }
        //-------------------------------------------------------------------
        //stores user's name in the session

        $session = $this->initializeSession($request);
        //gets user's data
        $username = $request->request->get("username");
        $age      = $request->request->get("age");
        $gender   = $request->request->get("gender");
        //creates user and session in the database
        $participant        = Participant::createWithNameAgeAndGender($username,$age,$gender);
        $participantSession = ParticipantSession::createWith($session->getId(),new \Datetime("now"),$participant);
        $participant->setSession($participantSession);
        //it would be better if this controller is defined as a service as well
        //gets the em from the IoC container
        //doctrine.orm.default_entity_manager
        $em = $this->getEntityManager();
        $em->persist($participant);
        $em->persist($participantSession);
        $em->flush();

        $this->serializeEntityIntoTheSession($session,static::USER_SESSION_SESSION_KEY,$em,$participantSession);


        //redirects to the home
        return $this->redirectToIndex();
    }

    private function initializeSession($request)
    {
        $session = $request->getSession();
        $username = $request->request->get("username");
        $session->set("username",$username);
        $session->set("logged",true);
        //sets the max number of tasks in the session
        $maxNumberOfTask = $this->getMaxNumberOfQuestions();
        $session->set(static::STEP,1);
        $session->set(static::MAX_STEPS,$maxNumberOfTask);

        return $session;
    }


    /**
     * adds points to the user
     * The Experiment with the entities in the session has gone too far :P
     *
     */
    private function sumPoints($em,$session,$points)
    {
        $userSession = $this->deserializeEntityIntoTheSession($session,static::USER_SESSION_SESSION_KEY,$em);
        $userSession->sumPoints($points);
        $em->persist($userSession);
        $em->flush();
        $this->serializeEntityIntoTheSession($session,static::USER_SESSION_SESSION_KEY,$em,$userSession);
    }



    private function getViewImages($images)
    {
        $viewImages = array();
        foreach ($images as $img)
        {
            $viewImages[] = new \AppBundle\ViewObjects\ViewImage($img->getId(),
                $this->getImageUrl($img->getFilePath()),$img->getIsCorrect());
        }


        return $viewImages;
    }


    private function getTasksForQuestion($request)
    {
        //it would be better if this controller is defined as a service as well
        //gets the image repository from the IoC container
        $imageRepository = $this->get(static::IMAGES_REPO);
        return $imageRepository->getRandomImages();
    }

    private function getMaxNumberOfQuestions()
    {
        $paramRepository = $this->get(static::PARAM_REPO);
        return $paramRepository->getMaxNumberOfQuestions();
    }
    /**
     * assigns points to the user's response
     *
     * @param
     *
     * @return int points given to the user
     *
     */
    private function assignPoints($imageSelected)
    {
        $pointsRepository = $this->get(static::POINTS_REPO);
        $points = $pointsRepository->getPointsForIncorrectAnswer();
        if($imageSelected->getIsCorrect())
        {
            $points = $pointsRepository->getPointsForCorrectAnswer();
        }
        return $points;
    }

    private function advanceNextStep($session)
    {
        $currentStep = $session->get(static::STEP);
        $nextStep    = $currentStep + 1;
        $session->set(static::STEP,$nextStep);
    }


    /**
     * shows the next task or ends the questionaire depending of the number of task completed and the max of tasks defined
     *
     */
    private function showNextTask($session)
    {
        $tasksCompleted = $session->get(static::STEP);
        $maxTasks       = $session->get(static::MAX_STEPS);

        $userShouldRespondMoreTasks = $tasksCompleted <= $maxTasks;
        if($userShouldRespondMoreTasks)
        {
            return $this->redirectToIndex();
        }
        else
        {
            return $this->redirect("logout/");
        }
    }

    private function redirectToIndex()
    {
        return $this->redirect("/");
    }

}
