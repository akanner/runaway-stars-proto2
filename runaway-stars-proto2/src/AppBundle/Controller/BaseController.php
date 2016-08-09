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

abstract class BaseController extends Controller
{

    /**
     * session key that holds the user's session object
     */
    const STEP                      = "task-number";

    const MAX_STEPS                 = "max-tasks";

    const USER_SESSION_SESSION_KEY  = "user-session";

    const USER_RESPONSE_SESSION_KEY = "user-response";

    const GAMIFICATION_KEY          = "gamification-type"; 

    const PARAM_REPO                = "paramsRepository";

    const GAMIFICATION_REPO         = "gamificationTypeRepository";

    const PARTICIPANT_SESSION_REPO  = "participantSessionRepository";

    const PARTICIPANT_RESPONSE_SESSION_REPO = "participantResponseRepository";

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

    /**
     * gets gets the URL of an image
     *
     * @param string    $imageName     image's name
     *
     * @return string image's URL
     *
     */
    protected function getImageUrl($imageName)
    {
        $assetsHelper = $this->get('templating.helper.assets');
        $urlImage = $assetsHelper->getUrl("bundles/app/images/$imageName");
        return $urlImage;
    }

    /**
     * gets gets the URL of an image
     *
     * @param string    $imageName     image's name
     *
     * @return string image's URL
     *
     */
    protected function getTaskUrl($imageName)
    {
        $assetsHelper = $this->get('templating.helper.assets');
        $urlImage = $assetsHelper->getUrl("bundles/app/images/tasks/$imageName");
        return $urlImage;
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
    protected function serializeEntityIntoSession($session,$key,$entity)
    {
        $entityId = $entity->getId();
        $session->set($key,$entityId);
    }

    /**
     * Deserializes pre-persisted entities from the session
     *
     * @param Session                           $session    Http session
     * @param string                            $key        Session key
     * @param Doctrine\ORM\EntityRepository     $entityRepo entity to be deserialized's repository
     *
     * @return mixed Deserialized Entity
     */
    protected function deserializeEntityFromSession($session,$key,$entityRepo)
    {
        $entityId = $session->get($key);
        $entity   = $entityRepo->findOneById($entityId);

        return $entity;
    }

    /**
     * Deserializes a participantSession Entity from the http session
     *
     * @param Session   $session    Http session
     *
     * @return AppBundle\Entity\ParticipantSession deserialized entity
     */
    protected function deserializeParticipantSessionEntityFromHttpSession($session)
    {
        $entityRepo = $this->get(static::PARTICIPANT_SESSION_REPO);

        return $this->deserializeEntityFromSession($session,static::USER_SESSION_SESSION_KEY,$entityRepo);
    }

    /**
     * Serializes a AppBundle\Entity\ParticipantSession intance into the http session
     *
     * @param Session   $session    Http session
     *
     * @return null
     */
    protected function serializeParticipantSessionIntoHttpSession($httpSession,$participantSessionEntity)
    {
        $this->serializeEntityIntoSession($httpSession,static::USER_SESSION_SESSION_KEY,$participantSessionEntity);
    }

    /**
     * Serializes a AppBundle\Entity\ParticipantResponse instance into the http session
     *
     * @param Session                               $session                Http session
     * @param AppBundle\Entity\ParticipantResponse  $participantResponse    Entity to be serialized
     *
     * @return null
     */
    protected function serializeResponseIntoHttpSession($httpSession,$participantResponse)
    {
         $responseDTO = new ParticipantResponseSerialized($participantResponse);
         $httpSession->set(static::USER_RESPONSE_SESSION_KEY,$responseDTO);
    }
    /**
     * Deserializes a AppBundle\Entity\ParticipantResponse instance from the http session
     *
     * @param Session   $session    http session
     *
     * @return AppBundle\Entity\ParticipantResponse deserialized instance
     */
    protected function deserializeParticipantResponseFromHttpSession($session)
    {
        //gets images and participant session repositories
        $sessionRepo = $this->get(static::PARTICIPANT_SESSION_REPO);
        $imageRepository =$this->get(static::IMAGES_REPO);
        //gets ParticipantResponseSerialized 
        $responseSerialized = $session->get(static::USER_RESPONSE_SESSION_KEY);
        //gets images and participant session
        $participantSessionEntity = $sessionRepo->findOneById($responseSerialized->sessionId);
        $firstImageServed         = $imageRepository->findOneById($responseSerialized->firstImageServed);
        $secondImageServed        = $imageRepository->findOneById($responseSerialized->secondImageServed);
        $thirdImageServed         = $imageRepository->findOneById($responseSerialized->thirdImageServed);
        //returns image entity
        $images = array($firstImageServed,$secondImageServed,$thirdImageServed);
        $response = ParticipantResponse::createFromSessionAndImages($participantSessionEntity,$images);
        return $response;
    }

    /*--------------------------------redirects to pages---------------------------------*/
    protected function redirectToTasks()
    {
        return $this->redirectToURL("taskIndex");
    }

    protected function redirectToLogout()
    {
        return $this->redirectToURL("logout");
    }

    protected function redirectToLogin($params=array())
    {
        return $this->redirectToURL("logInUser",$params);
    }

    protected function redirectToDefault()
    {
        return $this->redirectToURL("homepage");
    }

    protected function redirectToURL($routeName,$params=array())
    {
        return $this->redirect($this->generateUrl($routeName, $params,true));
    }
}