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

class DefaultController extends Controller
{

    /**
     * session key that holds the user's session object
     */
    const USER_SESSION_SESSION_KEY  = "user-session";

    const USER_RESPONSE_SESSION_KEY = "user-response";

    /**
     * TODO inject it into a variable
     */
    const IMAGES_REPO               = "imagesRepository";

    const POINTS_REPO               = "pointsRepository";

    const TRAINING_REPO             = "trainingRepository";
    

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
            return $this->render('default/login.html.twig');
        }

        //get the images
        $randomImages = $this->getTasksForQuestion($request);
        //creates and saves the user response in the session, when the user answer us, it will be save in the db
        $session = $request->getSession();
        //this should be injected, to do this, that controller should be declared as a service
        $em = $this->get("doctrine.orm.default_entity_manager");

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
        $viewParams["training_mode"] = $this->isInTrainingMode($request);
        $viewParams["help_text"]     = $session->get("help-msj");
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
            return $this->redirect("/");
        }
        
        $imageRepository =$this->get(static::IMAGES_REPO);
        $session = $request->getSession();
        //this should be injected, to do this, this controller should be declared as a service
        $em = $this->get("doctrine.orm.default_entity_manager");
        $imageSelected = $imageRepository->findOneById($userSubmission);
        //add points
        $pointsRepository = $this->get(static::POINTS_REPO);

        if($imageSelected->getIsCorrect())
        {
            $points = $pointsRepository->getPointsForCorrectAnswer();
        }
        else
        {
            $points = $pointsRepository->getPointsForIncorrectAnswer();
        }
        //although it was fun dealing with entities and the session, this experiment has to stop! haha
        $this->sumPoints($em,$session,$points);
        //handles the training mode
        $this->handlesTrainingMode($session);
        //gets the user response previously stored in the session, remember, this user response was not really answered yet
        $userResponse = $this->deserializeEntityIntoTheSession($session,static::USER_RESPONSE_SESSION_KEY,$em);
        //sets the user's actual response and saves it in the database
        $userResponse->setSelectedImage($imageSelected);
        
        $em->persist($userResponse);
        $em->flush();

        //redirects the user to another question
        return $this->redirect("/");
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
        //TODO use a interceptor,filter or something to check session ending
        //-------------------------------------------------------------------
       
        //if the user is already logged, we redirect it to the home page
        $isUserLogged = $this->isUserLogged($request);
        if(!$isUserLogged)
        {

            //stores user's name in the session
            $session = $request->getSession();
            $username = $request->request->get("username");
            $session->set("username",$username);
            $session->set("logged",true);
            $session->set("training-mode",true);
            $session->set("training-step",1);
            //creates user and session in the database
            $participant        = Participant::createWithName($username);
            $participantSession = ParticipantSession::createWith($session->getId(),new \Datetime("now"),$participant);
            $participant->setSession($participantSession);
            //it would be better if this controller is defined as a service as well
            //gets the em from the IoC container
            //doctrine.orm.default_entity_manager
            $em = $this->get("doctrine.orm.default_entity_manager");
            $em->persist($participant);
            $em->persist($participantSession);
            $em->flush();

            $this->serializeEntityIntoTheSession($session,static::USER_SESSION_SESSION_KEY,$em,$participantSession);
        }
        //-------------------------------------------------------------------

       

        //redirects to the home
        return $this->redirect("/");
    }

    /**
     * @Route("/logout", name="logout")
     */
    public function logout(Request $request)
    {
          //TODO use a interceptor,filter or something to check session ending
        $isUserLogged = $this->isUserLogged($request);

        if(!$isUserLogged)
        {
            return $this->redirect("/");
        }

        $session = $request->getSession();
        //this should be injected, to do this, this controller should be declared as a service
        $em = $this->get("doctrine.orm.default_entity_manager");
        $userSession = $this->deserializeEntityIntoTheSession($session,static::USER_SESSION_SESSION_KEY,$em);
        //sets the user session as finished
        $userSession->setEndedAt(new \Datetime('now'));
        //this should be injected, to do that, this controller should be declared as a service
        $em = $this->get("doctrine.orm.default_entity_manager");
        $em->persist($userSession);
        $em->flush();
        //closes the session
        $session->clear();
        //redirects the user to the end
        return $this->render("default/thanks.html.twig");

    }


    private function handlesTrainingMode($session)
    {
        $trainingStep = $session->get("training-step");
        $trainingStep++;
        //move forward one step in training
        $session->set("training-step",$trainingStep);

        if($trainingStep > 3)
        {
            $session->set("training-mode",false);
            $session->set("help-msj",null);
        }
    }

    //http://doctrine-orm.readthedocs.org/projects/doctrine-orm/en/latest/cookbook/entities-in-session.html
    //TODO save only the entity's ID
    //IF the entity manager would be injected,and this method were on a superclass and if the method were something like 
    //storeEntityInSession($key,$entity) it could be a good idea, but the problem is that you need the entity manager and that 
    //would not work with a service layer
    private function serializeEntityIntoTheSession($session,$key,$em,$entity)
    {
        $em->detach($entity);
        $session->set($key,$entity);
    }
    //http://doctrine-orm.readthedocs.org/projects/doctrine-orm/en/latest/cookbook/entities-in-session.html
     //TODO save only the entity's ID
    private function deserializeEntityIntoTheSession($session,$key,$em)
    {
        $entity = $session->get($key);
        $entity = $em->merge($entity);
        return $entity;
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

    /**
     * gets gets the URL of an image
     *
     * @param string    $imageName     image's name
     *
     * @return string image's URL
     *
     */
    private function getImageUrl($imageName)
    {
     return $this
        ->get('templating.name_parser')
        ->parse("images/$imageName")
        ->getPath();
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

    /**
     * checks if the participant is logged
     */
    private function isUserLogged($request)
    {

        $session = $request->getSession();
        $isUserLogged = $session->get("logged");
        return $isUserLogged;
    }


    private function getTasksForQuestion($request)
    {

        //checks if the participant is not in training
        $isInTraining = $this->isInTrainingMode($request);

        if(!$isInTraining)
        {
            //if the participant is not in training, then we show it 3 random images;

            //it would be better if this controller is defined as a service as well
            //gets the image repository from the IoC container
            $imageRepository = $this->get(static::IMAGES_REPO);
            return $imageRepository->getRandomImages();
        }
        else
        {
            $session = $request->getSession();
            $trainingStep = $session->get("training-step");
            $trainingTask = $this->getTrainingStep($trainingStep);
            $session->set("help-msj",$trainingTask->getHelpText());
            return $this->getImagesForTrainingTask($trainingTask);
        }
    }

    private function getTrainingStep($trainingStep)
    {
        $trainingRepository = $this->get(static::TRAINING_REPO);
        $trainingTask = $trainingRepository->findOneByTrainingStep($trainingStep);
        return $trainingTask;
    }


    private function getImagesForTrainingTask($trainingTask)
    {
       

        $firstImage     = $trainingTask->getFirstImage();
        $secondImage    = $trainingTask->getSecondImage();
        $thirdImage     = $trainingTask->getThirdImage();
        return array($firstImage,$secondImage,$thirdImage);
    }

    private function isInTrainingMode($request)
    {
        $session = $request->getSession();
        $isInTraining = $session->get("training-mode");

        return $isInTraining;
    }
}
