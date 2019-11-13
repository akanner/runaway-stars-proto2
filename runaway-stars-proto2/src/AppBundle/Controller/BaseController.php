<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

//entities

use AppBundle\Entity\Participant;
use AppBundle\Entity\ParticipantResponse;
use AppBundle\Entity\ParticipantSession;
use AppBundle\ViewObjects\ParticipantResponseSerialized;

//view objects
use AppBundle\ViewObjects\ViewImage;

use  AppBundle\Utils\ImagesViewsHelper;

abstract class BaseController extends Controller
{

    /**
     * session key that holds the user's session object
     */
    const TRAINING_STEP                      = "training-task-number";

    const TRAINING_MAX_STEPS                 = "training-max-tasks";

    const STEP                      = "task-number";

    const MAX_STEPS                 = "max-tasks";

    const USER_SESSION_SESSION_KEY  = "user-session";

    const USER_RESPONSE_SESSION_KEY = "user-response";

    const POINTS_VIEW_SESSION_KEY   = "points-view";

    const GAMIFICATION_KEY          = "gamification-type";
    protected function getEntityManager()
    {
        return $this->get("doctrine.orm.default_entity_manager");
    }

     /**
     * checks if the participant is logged
     */
    protected function isUserLogged($request)
    {
        $session = $request->getSession();
        $isUserLogged = $session->get("logged");
        return $isUserLogged;
    }



    /*-----------------session serialization/deserialization--------------------*/
    /**
     * Serializes per-persisted entities into the session
     *
     * @param Session   $session    http session
     * @param string    $key        session key
     * @param mixed     $entity     db entity to be serialized (must be already persisted)
     *
     * @return null
     */
    protected function serializeEntityIntoSession($session, $key, $entity)
    {
        $entityId = $entity->getId();
        $session->set($key, $entityId);
    }

    /**
     * gets the entity's id saved in the session
     *
     * @param Session                           $session    Http session
     * @param string                            $key        Session key
     * @param Doctrine\ORM\EntityRepository     $entityRepo entity to be deserialized's repository
     *
     * @return mixed Deserialized Entity
     */
    protected function getEntityIdFromSession($session, $key)
    {
        return $session->get($key);
    }
    //-------------------------------------------------------------------------------------------

    protected function getUserSessionIdFromSession($session)
    {
        return $this->getEntityIdFromSession($session,static::USER_SESSION_SESSION_KEY);
    }

    /**
     * Serializes a AppBundle\Entity\ParticipantSession intance into the http session
     *
     * @param Session   $session    Http session
     *
     * @return null
     */
    protected function saveParticipantSessionIdInHttpSession($httpSession, $participantSessionEntity)
    {
        $this->serializeEntityIntoSession($httpSession, static::USER_SESSION_SESSION_KEY, $participantSessionEntity);
    }

    //-------------------------------------------------------------------------------------------

    /**
     * Serializes a AppBundle\Entity\ParticipantResponse instance into the http session
     *
     * @param Session                               $session                Http session
     * @param AppBundle\Entity\ParticipantResponse  $participantResponse    Entity to be serialized
     *
     * @return null
     */
    protected function saveResponseIdToHttpSession($httpSession, $participantResponse)
    {
         $this->serializeEntityIntoSession($httpSession, static::USER_RESPONSE_SESSION_KEY, $participantResponse);
    }


    protected function getParticipantResponseIdFromSession($session)
    {
        return $this->getEntityIdFromSession($session,static::USER_RESPONSE_SESSION_KEY);
    }

    /*--------------------------------redirects to pages---------------------------------*/
    protected function redirectToTrainingTasks()
    {
        return $this->redirectToURL("trainingIndex");
    }

    protected function redirectToStadistics()
    {
        return $this->redirectToURL("stadistics");
    }

    protected function redirectToLogin($params = array())
    {
        return $this->redirectToURL("logInUser", $params);
    }

    protected function redirectToDefault()
    {
        return $this->redirectToURL("homepage");
    }

    protected function redirectToURL($routeName, $params = array())
    {
        return $this->redirect($this->generateUrl($routeName, $params, true));
    }

    protected function redirectToTasks()
    {
        return $this->redirectToURL("taskIndex");
    }
}
