<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;


use AppBundle\Services\TrainingService;
use AppBundle\Services\SessionService;
//entities
use AppBundle\Entity\Participant;
use AppBundle\Entity\ParticipantTrainingResponse;
use AppBundle\Entity\ParticipantSession;

//view objects
use AppBundle\ViewObjects\ViewImage;

use AppBundle\Utils\GamificationTypes;
use AppBundle\Utils\UserAnswerEnum;

class TrainingController extends BaseController
{
    /**
     * @var TrainingService 
     */
    private $trainingService;
    /**
     * @var SessionService
     */
    private $sessionService;

    public function __construct(SessionService $partisipantSessionService,TrainingService $trainingService)
    {
        $this->trainingService = $trainingService;
        $this->sessionService = $partisipantSessionService;
    }

    /**
     * @Route("training/", name="trainingIndex")
     */
    public function indexAction(Request $request)
    {
        //checks if the user is logged
        //TODO use a interceptor,filter or something to check session ending
        //-------------------------------------------------------------------
        $isUserLogged = $this->isUserLogged($request);
        if (!$isUserLogged) {
            return $this->redirectToDefault();
        }
        //creates and saves the user response in the session, when the user answer us, it will be save in the db
        $session = $request->getSession();
        //gets the training task
        $trainingStepNumber = $session->get(static::TRAINING_STEP);
        $trainingTask = $this->trainingService->getTrainingTask($trainingStepNumber);

        //crates the new resopnse
        $userSession = $this->getUserSession($session);
        $participantResponse = $this->trainingService->createAndPersistNewTrainingResponse($userSession, $trainingTask);
        $this->saveResponseIdToHttpSession($session, $participantResponse);

        //builds view's parameters
        $currentStep = $session->get(static::TRAINING_STEP);
        $viewParams = $this->populateView($userSession,$trainingTask,$currentStep,$session->get(static::TRAINING_MAX_STEPS));
        return $this->render($session->get(static::POINTS_VIEW_SESSION_KEY), $viewParams);
    }

    /**
     * @Route("training/processResponse", name="processTrainingResponse")
     */
    public function processResponse(Request $request)
    {
        //TODO use synfony's forms validations
        $userSubmission = $request->request->get("answer");
        $requestIsValid = isset($userSubmission) && UserAnswerEnum::isValidValue(intval($userSubmission));
        //if the session has ended
        //TODO use a interceptor,filter or something to check session ending
        $isUserLogged = $this->isUserLogged($request);
        if (!$isUserLogged || !$requestIsValid) {
            return $this->redirectToIndex();
        }
        //gets the user response previously stored in the session, 
        //remember, this user response was not really answered yet
        $session = $request->getSession();
        $this->saveUserAnswer($session,$userSubmission);
        
        $this->advanceNextStep($session);
        return $this->showNextTask($session);
    }

    private function populateView($userSession,$trainingTask,$currentStep,$trainingMaxSteps)
    {
        $viewParams = array();
        //answer points
        $viewParams['correct_points']   = $this->trainingService->getPointsForCorrectAnswer();
        $viewParams['incorrect_points'] = $this->trainingService->getPointsForIncorrectAnswer();
        //gets the images's paths and passes them to the view
        $viewParams["images"] = $this->getTrainingImage($trainingTask);
        $viewParams["points"] = $userSession->getTotalPoints();

        //gets current and max steps
        $viewParams["current_step"]  = $currentStep;
        $currentStep==1 ? $viewParams["show_help"]="true" : $viewParams["show_help"] = "";
        $viewParams["max_step"]      = $trainingMaxSteps;
        $viewParams["training_mode"] = true;
        $viewParams["post_url"]      = $this->generateUrl('processTrainingResponse', array(), true);
        //looks in the http session the view to show (with or without points)
        //user session info
        $viewParams["show_user_session"] = $this->trainingService->getShowDebugUserSession();
        $viewParams["total_responses"] = $userSession->getNumberOfResponses();
        $viewParams["total_correct_responses"] = $userSession->getNumberOfCorrectResponses();
        $viewParams["correct_percentage"] = $userSession->getPercentageOfCorrectTasks();
        $viewParams["total_time"] = $userSession->getTimeInSecondsFromTheBeginning();

        return $viewParams;
    }

    private function saveUserAnswer($session,$userSubmission)
    {
        $userResponseId = $this->getParticipantResponseIdFromSession($session);
        $userResponse = $this->trainingService->getTrainingResponseById($userResponseId);
        $userResponse->setParticipantAnswer($userSubmission);
        //add points
        $userSession = $this-> getUserSession($session);
        $this->trainingService->assignPoints($userResponse,$userSession);
    }

    private function getUserSession($session)
    {
        $userSessionId = $this->getUserSessionIdFromSession($session);
        return $this->sessionService->getById($userSessionId);
    }

    private function advanceNextStep($session)
    {
        $currentStep = $session->get(static::TRAINING_STEP);
        $nextStep = $currentStep+1;

        $session->set(static::TRAINING_STEP, $nextStep);
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
        if ($userShouldRespondMoreTasks) {
            return $this->redirectToIndex();
        } else {
            return $this->redirectToStadistics();
        }
    }

    private function redirectToIndex()
    {
        return $this->redirectToTrainingTasks();
    }
}
