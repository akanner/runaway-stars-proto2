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
    const TRAINING_STEP                      = "training-task-number";

    const TRAINING_MAX_STEPS                 = "training-max-tasks";

    const STEP                      = "task-number";

    const MAX_STEPS                 = "max-tasks";

    const USER_SESSION_SESSION_KEY  = "user-session";

    const USER_RESPONSE_SESSION_KEY = "user-response";

    const POINTS_VIEW_SESSION_KEY   = "points-view";

    const GAMIFICATION_KEY          = "gamification-type"; 

    const PARAM_REPO                = "paramsRepository";

    const GAMIFICATION_REPO         = "gamificationTypeRepository";

    const PARTICIPANT_SESSION_REPO  = "participantSessionRepository";

    const PARTICIPANT_RESPONSE_SESSION_REPO = "participantResponseRepository";

    const TRAINING_REPO             = "trainingRepository";

    const IMAGES_REPO               = "imagesRepository";

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
     * transforms all Images Entities to DTO AppBundle\ViewObjects\ViewImage
     */
    protected function getViewImages($image,$tooltipText=null)
    {
        //in case that $img is correct, we take the path of the "marked" version of the image
        $markedBowshockImage= null;
        if($image->getIsCorrect())
        {
            $markedBowshockImage = $this->getTaskUrl($image->getMarkedBowshockImage());
        }
        $rgbImage = new \AppBundle\ViewObjects\ViewImage(
            $image->getId(),
            $this->getTaskUrl($image->getRgbImagePath())
            ,$image->getIsCorrect()
            ,$tooltipText
            ,$markedBowshockImage
            );
        $coolImage = new \AppBundle\ViewObjects\ViewImage(
            $image->getId(),
            $this->getTaskUrl($image->getCoolImagePath())
            ,$image->getIsCorrect()
            ,$tooltipText
            ,$markedBowshockImage
            );
        $heatImage = new \AppBundle\ViewObjects\ViewImage(
            $image->getId(),
            $this->getTaskUrl($image->getHeatImagePath())
            ,$image->getIsCorrect()
            ,$tooltipText
            ,$markedBowshockImage
            );
        $hsvImage = new \AppBundle\ViewObjects\ViewImage(
            $image->getId(),
            $this->getTaskUrl($image->getHsvImagePath())
            ,$image->getIsCorrect()
            ,$tooltipText
            ,$markedBowshockImage
            );

        return array($rgbImage,$coolImage,$heatImage,$hsvImage);
    }
    /**
     * transforms a TraningTask Entity to a ViewImage
     *
     * @param AppBundle\Entity\TrainingTask 
     *
     * @return ViewImage
     */
    protected function getTrainingImage($trainingTask)
    {
        return $this->getViewImages($trainingTask->getImageServed(),$trainingTask->getHelpText());
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
         $em = $this->getEntityManager();
         $em->detach($participantResponse);
         $httpSession->set(static::USER_RESPONSE_SESSION_KEY,$participantResponse);
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
        $em = $this->getEntityManager();
        //gets ParticipantResponseSerialized 
        $responseSerialized = $session->get(static::USER_RESPONSE_SESSION_KEY);
        $response = $em->merge($responseSerialized);
     
        return $response;
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

    protected function redirectToTasks()
    {
        return $this->redirectToURL("taskIndex");

    }

    /*----------------OBjects creation ---------------------*/
    protected function createParticipantSession($httpSessionId,$participantEntity,$gamificationTypEntity)
    {
        
        $participantSession = ParticipantSession::createWith($httpSessionId,new \Datetime("now"),$participantEntity,$gamificationTypEntity);
        $participantEntity->setSession($participantSession);
        return $participantSession;
    }
}