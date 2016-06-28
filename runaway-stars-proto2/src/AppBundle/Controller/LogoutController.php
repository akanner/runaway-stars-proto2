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

        $viewParams = [];
        $gamificationType = $this->getGamificationType($session);
        $gamificationResult = $this->getResultForGamificationStatusAndPercentajeOfCorrectness($gamificationType,$userSession->getPercentageOfCorrectTasks());
        $viewParams["back_url"]      = $this->generateUrl('logInUser', array(), true);
        $viewParams["gamType"]       = $gamificationType;   
        $viewParams["level"]         = $gamificationResult["level"];
        $viewParams["legend"]        = $gamificationResult["legend"];

        //closes the session
        $session->clear();
        //redirects the user to the end
        return $this->render("logout/levels.html.twig",$viewParams);

    }


    private function getGamificationType($session)
    {
        return $session->get(static::GAMIFICATION_KEY);
    }

    private function getResultForGamificationStatusAndPercentajeOfCorrectness($gamificationType,$percentajeOfCorrectness)
    {
        $gamificationResult = [];
        if(GamificationTypes::GAMIFICATION_BADGES == $gamificationType)
        {
            $gamificationResult = $this->getBadgesResult($percentajeOfCorrectness);
        }
        else
        {
            $gamificationResult = $this->getLevelsResult($percentajeOfCorrectness);
        }

        return $gamificationResult;
    }

    private function getLevelsResult($percentajeOfCorrectness)
    {
        //migrate to DATABASE!!!
        $gamificationResult = [];
        $gamificationResult["level"] = "Principiante";
        $gamificationResult["legend"]= 'Ten&eacute;s que seguir practicando!';
        if($percentajeOfCorrectness >= 33)
        {
            $gamificationResult["level"] = "Intermedio";
            $gamificationResult["legend"]= 'Buen Trabajo...pero pod$eacute;s mejorar!';
        }
        if($percentajeOfCorrectness >= 66)
        {
            $gamificationResult["level"] = "Experto";
            $gamificationResult["legend"]= 'Seguro qu&eacute; no sos un astr&oacute;nomo?';
        }

        return $gamificationResult;

    }

    


}