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
            return $this->redirectToTasks();
        }

        $session = $request->getSession();
        //this should be injected, to do this, this controller should be declared as a service
        $userSession = $this->deserializeParticipantSessionEntityFromHttpSession($session);
        //sets the user session as finished
        $userSession->setEndedAt(new \Datetime('now'));
        $em = $this->getEntityManager();
        $em->persist($userSession);
        $em->flush();

        $viewParams = [];
        $gamificationType = $this->getGamificationType($session);
        $gamificationResult = $this->getResultForGamificationStatusAndPercentajeOfCorrectness($gamificationType,$userSession->getPercentageOfCorrectTasks());


        
        $viewParams["back_url"]      = $this->generateUrl('logInUser', array("gamification" => $gamificationType), true);
        $viewParams["gamType"]       = $gamificationType;   
        $viewParams["level"]         = $gamificationResult["level"];
        $viewParams["legend"]        = $gamificationResult["legend"];

        //closes the session
        $session->clear();
        //redirects the user to the end
        $viewName = $this->getGamificationTypeView($gamificationType);
        return $this->render($viewName,$viewParams);

    }

    private function getGamificationTypeView($gamificationType)
    {
        switch ($gamificationType) 
        {
            case GamificationTypes::GAMIFICATION_BADGES:
                return "logout/badges.html.twig";
            case GamificationTypes::GAMIFICATION_LEVEL:
                return "logout/levels.html.twig";
            default:
                return "logout/no-gamification.html.twig";
        }
    }


    private function getGamificationType($session)
    {
        return $session->get(static::GAMIFICATION_KEY);
    }

    private function getResultForGamificationStatusAndPercentajeOfCorrectness($gamificationType,$percentajeOfCorrectness)
    {
        $paramRepository    = $this->get(static::PARAM_REPO);
        $gamificationResult = [];
        if(GamificationTypes::GAMIFICATION_BADGES == $gamificationType)
        {
            $gamificationResult = $this->getBadgesResult($percentajeOfCorrectness,$paramRepository);
        }
        else
        {
            $gamificationResult = $this->getLevelsResult($percentajeOfCorrectness,$paramRepository);
        }

        return $gamificationResult;
    }

    private function getLevelsResult($percentajeOfCorrectness,$paramRepository)
    {
        //migrate this to DATABASE!!!
        $gamificationResult = [];
        $gamificationResult["level"] = $paramRepository->getLevelsBeginnerText();
        $gamificationResult["legend"]= $paramRepository->getLevelsBeginnerLegend();
        if($percentajeOfCorrectness >= 33)
        {
            $gamificationResult["level"] = $paramRepository->getLevelsIntermediateText();
            $gamificationResult["legend"]= $paramRepository->getLevelsIntermediateLegend();
        }
        if($percentajeOfCorrectness >= 66)
        {
            $gamificationResult["level"] = $paramRepository->getLevelsExpertText();
            $gamificationResult["legend"]= $paramRepository->getLevelsExpertLegend();
        }

        return $gamificationResult;

    }

    private function getBadgesResult($percentajeOfCorrectness,$paramRepository)
    {
        //migrate this to DATABASE!!!
        $gamificationResult = [];
        //gets the values for the first level
        $badge = $paramRepository->getBadgesBeginnerBadge();
        $gamificationResult["level"] = $this->getImageUrl($badge);
        $gamificationResult["legend"]= $paramRepository->getBadgesBeginnerLegend();
        //gets the values for the second level
        if($percentajeOfCorrectness >= 33)
        {
            $badge = $paramRepository->getBadgesIntermediateBadge();
            $gamificationResult["level"] = $this->getImageUrl($badge);
            $gamificationResult["legend"]= $paramRepository->getBadgesIntermediateLegend();
        }
        //gets the values for the third level
        if($percentajeOfCorrectness >= 66)
        {
            $badge = $paramRepository->getBadgesExpertBadge();
            $gamificationResult["level"] = $this->getImageUrl($badge);
            $gamificationResult["legend"]= $paramRepository->getBadgesExpertLegend();
        }

        return $gamificationResult;

    }

    


}