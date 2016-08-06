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

class LoginController extends BaseController
{

    /**
     * registers user's information
     *
     */
     /**
     * @Route("login/", name="logInUser")
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

        return $this->render('login/index.html.twig',$viewParams);
    }

    /**
     * registers user's information
     *
     */
     /**
     * @Route("login/response", name="logInUserResponse")
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
            return $this->redirectToTasks();
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
        return $this->redirectToTasks();
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

     private function getMaxNumberOfQuestions()
    {
        $paramRepository = $this->get(static::PARAM_REPO);
        return $paramRepository->getMaxNumberOfQuestions();
    }
}