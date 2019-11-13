<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

//entities
use AppBundle\Entity\ParticipantSession;
use AppBundle\Entity\Participant;

//view objects
use AppBundle\ViewObjects\ViewImage;
use AppBundle\Utils\GamificationTypes;

use AppBundle\Services\GamificationTypeService;
use AppBundle\Services\SessionService;
use AppBundle\Services\TrainingService;

class LoginController extends BaseController
{
    private $gamificationService;
    /**
     * @var SessionService
     */
    private $sessionService;
    /**
     * @var TrainingService
     */
    private $trainingService;

    public function __construct(TrainingService $trainingService,SessionService $sessionService,GamificationTypeService $gamificationService)
    {
        $this->gamificationService = $gamificationService;
        $this->sessionService = $sessionService;
        $this->trainingService = $trainingService;
    }


     /**
      * @Route("/", name="homepage")
      */
    public function index(Request $request)
    {
        $postUrl = $this->generateUrl('login', array(), true);
        $viewParams = array();
        $viewParams["post_url"] = $postUrl;

        return $this->render('login/index.html.twig', $viewParams);
    }

     /**
     * @Route("login/", name="login")
     */
    public function login(Request $request)
    {
        //TODO use a interceptor,filter or something to check session ending
        //-------------------------------------------------------------------
        //if the user is already logged, we redirect it to the home page
        $isUserLogged = $this->isUserLogged($request);
        if ($isUserLogged) {
            //redirects to the home
            return $this->redirectToTrainingTasks();
        }
        //-------------------------------------------------------------------
        //balance the quantity of games using the different gamification types
        //the gamification type can be forced with a query param, if null the service will look for a valid gamification type
        $gamificationTypeName = $request->query->get("gamification");
        $gamificationType = $this->gamificationService->getGamificationTypeByNameOrRandom($gamificationTypeName);
        //creates user and session in the database
        $session = $request->getSession();
        $userSession = $this->sessionService->createAndPersistParticipantAndSession(null,$session->getId(),$gamificationType);
        //serializes the session into the http session
        $this->initializeSession($request, $gamificationType, $userSession);
        //redirects to the home
        return $this->redirectToURL("tutorial-01");
    }

    /**
     * registers user's information
     *
     */
    private function initializeSession($request, $gamificationType, $userSessionEntity)
    {
        $session = $request->getSession();
        if (!$session->get(static::GAMIFICATION_KEY)) {
            $session->set(static::GAMIFICATION_KEY, $gamificationType->getName());
          //sets the twig block called "points"
          //this is done here to avoid asking to the database in each step of the training
          //we show the user's points depending if the gamification type is "points" or not
          //to show the points we have defined two twig templates: 1)training/points.html.twig and 2)training/no-points/no-points.html.twig
          //both templates extend task/index.html
            $session->set(static::POINTS_VIEW_SESSION_KEY, $gamificationType->getPointsView());
        }
        $this->saveParticipantSessionIdInHttpSession($session, $userSessionEntity);
        //sets the max number of tasks in the session
        $maxNumberOfTask = $this->trainingService->getMaxNumberOfTrainingQuestions();
        $session->set(static::TRAINING_STEP, 1);
        $session->set(static::TRAINING_MAX_STEPS, $maxNumberOfTask);
        $session->set("logged", true);
        return $session;
    }
}
