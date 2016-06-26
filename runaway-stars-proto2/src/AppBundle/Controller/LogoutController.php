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

class LogoutController extends BaseController
{

	 /**
     * @Route("logout/", name="logout")
     */
    public function logout(Request $request)
    {
          //TODO use a interceptor,filter or something to check session ending
        $isUserLogged = $this->isUserLogged($request);

        if(!$isUserLogged)
        {
            return $this->redirect("/");
        }

        $session = $request->getSession();
        //this should be injected, to do this, this controller should be declared as a service
        $em = $this->getEntityManager();
        $userSession = $this->deserializeEntityIntoTheSession($session,static::USER_SESSION_SESSION_KEY,$em);
        //sets the user session as finished
        $userSession->setEndedAt(new \Datetime('now'));
        $em->persist($userSession);
        $em->flush();
        //closes the session
        $session->clear();
        //redirects the user to the end
        return $this->render("logout/index.html.twig");

    }

    


}