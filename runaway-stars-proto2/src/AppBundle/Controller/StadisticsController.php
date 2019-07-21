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

use AppBundle\Services\SessionService;
use AppBundle\Services\StatisticsService;
use AppBundle\Services\GamificationTypeService;

class StadisticsController extends BaseController
{
    /**
     * @var GamificationTypeService
     */
    private $gamificationTypeService;
    /**
     * @var StatisticsService
     */
    private $statisticsService;
    /**
     * @var SessionService
     */
    private $sessionService;

    public function __construct(SessionService $sessionService,StatisticsService $statisticsService,
        GamificationTypeService $gamificationTypeService)
    {
        $this->sessionService = $sessionService;
        $this->gamificationTypeService = $gamificationTypeService;
        $this->statisticsService = $statisticsService;
    }
     /**
     * @Route("stadistics/", name="stadistics")
     */
    public function indexAction(Request $request)
    {
        //TODO use a interceptor,filter or something to check session ending
        $isUserLogged = $this->isUserLogged($request);

        if (!$isUserLogged) {
            return $this->redirectToDefault();
        }
    
        //calculates percentile TODO: this could be a lot faster if it is calculated using a stored procedure
        $session = $request->getSession();
        $userSession = $this->getUserSession($session);
        $userPercentile = $this->statisticsService->calculatePercentile($userSession);
        $userSession->setPercentile($userPercentile);
        $this->sessionService->saveSession($userSession);
        //gets the stadistics of the training
        $gamificationType = $session->get(static::GAMIFICATION_KEY);
        $gamificationResult = 
            $this->statisticsService->getResultForGamificationStatusAndPercentajeOfCorrectness($gamificationType, 
            $userSession->getPercentageOfCorrectTasks());
        $leaderboard = $this->statisticsService->getLeadersboard($userSession);
        $viewName = $this->gamificationTypeService->getGamificationTypeView($gamificationType);

        $viewParams = [];
        $viewParams["post_url"]      = $this->generateUrl('endTraining', array(), true);
        $viewParams["points"]        = $userSession->getTotalPoints();
        $viewParams["gamType"]       = $gamificationType;
        $viewParams["level"]         = $gamificationResult["level"];
        $viewParams["legend"]        = $gamificationResult["legend"];
        $viewParams["leadersboard"]   = $leaderboard;
        $viewParams["percentile"]    = round($userPercentile, 2);
        return $this->render($viewName, $viewParams);
    }

     /**
     * @Route("stadistics/submit", name="endTraining")
     */
    public function endTraining(Request $request)
    {
        //TODO use a interceptor,filter or something to check session ending
        $isUserLogged = $this->isUserLogged($request);

        if (!$isUserLogged) {
            return $this->redirectToDefault();
        }
        $httpSession = $request->getSession();
        $participantSessionEntity = $this->getUserSession($httpSession);

        //saves the user's confidence
        $confidence = $request->request->get("confidence");
        $participantSessionEntity->setParticipantConfidence($confidence);
        $this->sessionService->saveSession($participantSessionEntity);
        //redirect to the training or to the real tasks
        $beginRealTasks = $request->request->get("user_choice");

        if ($beginRealTasks=="true") {
            $next = $this->beginRealTasks($httpSession);
        }
        else {
             //creates a new participant session
            $newUserSession = $this->sessionService->createNextParticipantSession($httpSession->getId(), 
            $participantSessionEntity);
            //sets the new session in the http session
            $this->serializeParticipantSessionIntoHttpSession($httpSession, $newUserSession);
            $next = $this->repeatTraining($httpSession);
        }
        return $next;
    }

    private function beginRealTasks($httpSession)
    {
        //sets the max number of tasks in the session
        $httpSession->set(static::STEP, 1);

        return $this->redirectToURL("taskIndex");
    }
    /**
     * repeats the training course
     *
     */
    private function repeatTraining($httpSession)
    {
        //resets the training
        $httpSession->set(static::TRAINING_STEP, 1);
        //redirects
        return $this->redirectToTrainingTasks();
    }

    private function getUserSession($session)
    {
        $userSessionId = $this->getUserSessionIdFromSession($session);
        return $this->sessionService->getById($userSessionId);
    }
}
