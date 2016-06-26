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

class BaseController extends Controller
{

    const USER_SESSION_SESSION_KEY  = "user-session";

    const USER_RESPONSE_SESSION_KEY = "user-response";

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

    //http://doctrine-orm.readthedocs.org/projects/doctrine-orm/en/latest/cookbook/entities-in-session.html
    //TODO save only the entity's ID
    //IF the entity manager would be injected,and this method were on a superclass and if the method were something like 
    //storeEntityInSession($key,$entity) it could be a good idea, but the problem is that you need the entity manager and that 
    //would not work with a service layer
    protected function serializeEntityIntoTheSession($session,$key,$em,$entity)
    {
        $em->detach($entity);
        $session->set($key,$entity);
    }
    //http://doctrine-orm.readthedocs.org/projects/doctrine-orm/en/latest/cookbook/entities-in-session.html
     //TODO save only the entity's ID
    protected function deserializeEntityIntoTheSession($session,$key,$em)
    {
        $entity = $session->get($key);
        $entity = $em->merge($entity);
        return $entity;
    }
}