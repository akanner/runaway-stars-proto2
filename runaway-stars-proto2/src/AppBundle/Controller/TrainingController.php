<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

//entities

use AppBundle\Entity\Participant;
use AppBundle\Entity\ParticipantTrainingResponse;
use AppBundle\Entity\ParticipantSession;

//view objects
use AppBundle\ViewObjects\ViewImage;

use AppBundle\Utils\GamificationTypes;

class TrainingController extends BaseController
{


    /**
     * TODO inject it into a variable
     */


    const POINTS_REPO               = "pointsRepository";


    /**
     * @Route("training/", name="trainingIndex")
     */
    public function indexAction(Request $request)
    {
        //checks if the user is logged
        //TODO use a interceptor,filter or something to check session ending
        //-------------------------------------------------------------------
        $isUserLogged = $this->isUserLogged($request);
        if(!$isUserLogged)
        {
            return $this->redirectToDefault();
        }
           //creates and saves the user response in the session, when the user answer us, it will be save in the db
        $session = $request->getSession();
        //get the images
        $trainingStepNumber = $session->get(static::TRAINING_STEP);
        $trainingStep = $this->getTrainingTask($trainingStepNumber);

     
        //this should be injected, to do this, that controller should be declared as a service
        $em = $this->getEntityManager();
        $userSession = $this->deserializeParticipantSessionEntityFromHttpSession($session);
        $participantResponse = ParticipantTrainingResponse::createFromSessionAndTrainingTask($userSession,$trainingStep);
        $this->serializeResponseIntoHttpSession($session,$participantResponse);


        //builds view's parameters
        $viewParams = array();
        //answer points
        $pointsRepository = $this->get(static::POINTS_REPO);
        $viewParams['correct_points']   = $pointsRepository->getPointsForCorrectAnswer();
        $viewParams['incorrect_points'] = $pointsRepository->getPointsForIncorrectAnswer();
        //gets the images's paths and passes them to the view
        $trainingImages = $this->getTasksForQuestion($trainingStep);
        $viewParams["images"] = $this->getViewImages($trainingImages);
        $viewParams["points"] = $userSession->getTotalPoints();
        //gets current and max steps
        $viewParams["current_step"]  = $session->get(static::TRAINING_STEP);
        $viewParams["max_step"]      = $session->get(static::TRAINING_MAX_STEPS);
        $viewParams["training_mode"] = true;
        $viewParams["post_url"]      = $this->generateUrl('processTrainingResponse', array(), true);
        //looks in the http session the view to show (with or without points)
        return $this->render($session->get(static::POINTS_VIEW_SESSION_KEY), $viewParams);
    }






    /**
     * @Route("training/processResponse", name="processTrainingResponse")
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
        $userResponse = $this->deserializeParticipantResponseFromHttpSession($session);
        //sets the user's actual response and saves it in the database
        $userResponse->setSelectedImage($imageSelected);
        $userResponse->setPointsEarned($points);

        $em->persist($userResponse);
        $em->flush();

        return $this->showNextTask($session);
    }


    /**
     * adds points to the user
     * The Experiment with the entities in the session has gone too far :P
     *
     */
    private function sumPoints($em,$session,$points)
    {
        $userSession = $this->deserializeParticipantSessionEntityFromHttpSession($session);
        $userSession->sumPoints($points);
        $em->persist($userSession);
        $em->flush();
        $this->serializeParticipantSessionIntoHttpSession($session,$userSession);
    }

    private function getTrainingTask($trainingStepNumber)
    {
        $trainingRepo = $this->get(static::TRAINING_REPO);
        return $trainingRepo->findOneByTrainingStep($trainingStepNumber);
    }

    private function getTasksForQuestion($trainingTask)
    {
        $firstImage     = $trainingTask->getFirstImage();
        $secondImage    = $trainingTask->getSecondImage();
        $thirdImage     = $trainingTask->getThirdImage();
        return array($firstImage,$secondImage,$thirdImage);
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
        $currentStep = $session->get(static::TRAINING_STEP);
        $nextStep    = $currentStep + 1;
        $session->set(static::TRAINING_STEP,$nextStep);
    }


    /**
     * shows the next task or ends the questionaire depending of the number of task completed and the max of tasks defined
     *
     */
    private function showNextTask($session)
    {
        $tasksCompleted = $session->get(static::TRAINING_STEP);
        $maxTasks       = $session->get(static::TRAINING_MAX_STEPS);

        $userShouldRespondMoreTasks = $tasksCompleted <= $maxTasks;
        if($userShouldRespondMoreTasks)
        {
            return $this->redirectToIndex();
        }
        else
        {
            return $this->redirectToStadistics();
        }
    }

    private function redirectToIndex()
    {
        return $this->redirectToTrainingTasks();
    }

}
