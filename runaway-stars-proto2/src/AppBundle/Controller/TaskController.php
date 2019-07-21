<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

use AppBundle\Entity\Participant;
use AppBundle\Entity\ParticipantResponse;
use AppBundle\Entity\ParticipantSession;

use AppBundle\Services\SessionService;
use AppBundle\Services\TasksService;

//view objects
use AppBundle\ViewObjects\ViewImage;

use AppBundle\Utils\GamificationTypes;
use AppBundle\Utils\UserAnswerEnum;

class TaskController extends BaseController
{
    const STEP                      = "task-number";

    const MAX_STEPS                 = "max-tasks";
    /**
     * @var SessionService
     */
    private $sessionService;
    /**
    * @var TaskService
    */
    private $taskService;

    public function __construct(SessionService $sessionService,TasksService $taskService)
    {
        $this->sessionService = $sessionService;
        $this->taskService = $taskService;
    }

     /**
     * @Route("task/", name="taskIndex")
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
        $session = $request->getSession();
        $userSession = $this->getUserSession($session);
        //creates and saves the user response in the session, when the user answer us, it will be save in the db
        $participantResponse = $this->taskService->createNewTaskForSession($userSession);
        $this->saveResponseIdToHttpSession($session, $participantResponse);
        
        $viewParams = $this->populateView($session,$participantResponse->getImageServed());
        return $this->render("task/real-tasks-index.html.twig", $viewParams);
    }

    /**
     * @Route("task/processResponse", name="processResponse")
     */
    public function processResponse(Request $request)
    {
        //if the session has ended
        //TODO use a interceptor,filter or something to check session ending
        $isUserLogged = $this->isUserLogged($request);

        if (!$isUserLogged) {
            return $this->redirectToTasks();
        }
        //TODO use symfony's forms validations
        $session = $request->getSession();
        $userSubmission = $request->request->get("answer");
        $userRelevantImages = $request->request->get("usedImages");
        $requestIsValid = isset($userSubmission)  && UserAnswerEnum::isValidValue(intval($userSubmission));
        if(!$requestIsValid) {
            return $this->redirectToTasks();
        }
        //gets the user response previously stored in the session, remember, this user response was not really answered yet
        $this->saveUserAnswer($session,$userSubmission,$userRelevantImages);
        
        return $this->advanceNextStep($session);
    }
    /**
     * 
     * @Route("task/logout", name="endTasks")
     */
    public function logout(Request $request)
    {
        $session = $request->getSession();
        //sets the user session as finished
        $userSession = $this->getUserSession($session);
        $this->sessionService->endSession($userSession);
        //deletes the last task because it was not answered
        $userResponseId = $this->getParticipantResponseIdFromSession($session);
        $this->taskService->deleteTaskWithId($userResponseId);
        $session-> invalidate();
        $viewParams = [];
        $viewParams["back_url"] = $this->generateUrl('homepage', array(), true);
        return $this->render("task/logout.html.twig", $viewParams);
    }

    private function getUserSession($session)
    {
        $userSessionId = $this->getUserSessionIdFromSession($session);
        return $this->sessionService->getById($userSessionId);
    }

    private function saveUserAnswer($session,$userSubmission,$userRelevantImages)
    {
        $userResponseId = $this->getParticipantResponseIdFromSession($session);
        $userResponse = $this->taskService->saveTaskWithId($userResponseId,$userSubmission,$userRelevantImages);
    }

    private function advanceNextStep($session)
    {
        $currentStep = $session->get(static::STEP);
        $nextStep    = $currentStep + 1;
        $session->set(static::STEP, $nextStep);

        return $this->redirectToURL("taskIndex");
    }

    private function populateView($session,$taskImage)
    {
        //builds view's parameters
        $viewParams = array();
        $currentStep = $session->get(static::STEP);
        $currentStep==1 ? $viewParams["show_help"]="true" : $viewParams["show_help"] = "";
        //gets the images's paths and passes them to the view
        $viewParams["images"] = $this->getViewImages($taskImage);
        $viewParams["post_url"]      = $this->generateUrl('processResponse', array(), true);
        $viewParams["finish_url"]    = $this->generateUrl('endTasks', array(), true);

        return $viewParams;
    }

}
