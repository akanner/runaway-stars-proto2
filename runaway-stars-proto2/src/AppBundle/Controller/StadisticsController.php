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

class StadisticsController extends BaseController
{

	 /**
     * @Route("stadistics/", name="logout")
     */
    public function logout(Request $request)
    {
      //TODO use a interceptor,filter or something to check session ending
        $isUserLogged = $this->isUserLogged($request);

        if(!$isUserLogged)
        {
            return $this->redirectToDefault();
        }

        $session = $request->getSession();
        //this should be injected, to do this, this controller should be declared as a service
        $userSession = $this->deserializeParticipantSessionEntityFromHttpSession($session);
        //sets the user session as finished
        $userSession->setEndedAt(new \Datetime('now'));
        $em = $this->getEntityManager();
        $em->persist($userSession);
        //calculates percentile TODO: this could be a lot faster if it is calculated using a stored procedure
        $userPercentile = $this->calculatePercentile($userSession);
        $userSession->setPercentile($userPercentile);
        $em->flush();
        $viewParams = [];
        $gamificationType = $this->getGamificationType($session); 
        $gamificationResult = $this->getResultForGamificationStatusAndPercentajeOfCorrectness($gamificationType,$userSession->getPercentageOfCorrectTasks());



        
        $viewParams["back_url"]      = $this->generateUrl('logInUser', array("gamification" => $gamificationType), true);
        $viewParams["post_url"]      = $this->generateUrl('endTraining', array(), true);
        $viewParams["gamType"]       = $gamificationType;   
        $viewParams["level"]         = $gamificationResult["level"];
        $viewParams["legend"]        = $gamificationResult["legend"];
        $viewParams["percentile"]    = round($userPercentile,2);

        //redirects the user to the end
        $viewName = $this->getGamificationTypeView($gamificationType);
        return $this->render($viewName,$viewParams);

    }

     /**
     * @Route("stadistics/submit", name="endTraining")
     */
     public function endTraining(Request $request)
     {
        //TODO use a interceptor,filter or something to check session ending
        $isUserLogged = $this->isUserLogged($request);

        if(!$isUserLogged)
        {
            return $this->redirectToDefault();
        }
        $httpSession = $request->getSession();
        $participantSessionEntity = $this->deserializeParticipantSessionEntityFromHttpSession($httpSession);

        //saves the user's confidence
        $confidence = $request->request->get("confidence");
        $participantSessionEntity->setParticipantConfidence($confidence);

        $em = $this->getEntityManager();
        $em->persist($participantSessionEntity);

        //redirect to the training or to the real tasks
        $userChoice = $request->request->get("userChoice");

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
    /**
     * Calculates the percentile of the participant's score
     *
     * @param UserSession Participant's session
     *
     * @return Integer Percentile of the participant
     *
     */
    private function calculatePercentile($userSession)
    {
        $currentUserScore = $userSession->getTotalPoints();

        //gets all users's scores
        $participantSessionRepo = $this->get(static::PARTICIPANT_SESSION_REPO);
        $participantsScores = $participantSessionRepo->getAllScores();
        //gets the array's legth
        $totalParticipantsScores = count($participantsScores);
        //calculates the amount of scores that are lower than the current user score
        $totalParticipantScoresLowerThanCurrentUserScore = array_reduce($participantsScores,
            function($carry,$score) use ($currentUserScore){
                if($score <= $currentUserScore)
                {
                    $carry++;
                }
                return $carry;
            },0);
        $percentile = ($totalParticipantScoresLowerThanCurrentUserScore / $totalParticipantsScores);
        //gets the percentile 
        $percentile = $percentile * 100; //transoforms the percentile into an actual percentage

        return $percentile;
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
        $intermediatePercentajeOfCorrectness = $paramRepository->getMinimumPercentageIntermediateLevel();
        $expertPercentajeOfCorrectness = $paramRepository->getMinimumPercentageExpertLevel();
        $gamificationResult = [];
        $gamificationResult["level"] = $paramRepository->getLevelsBeginnerText();
        $gamificationResult["legend"]= $paramRepository->getLevelsBeginnerLegend();
        if($percentajeOfCorrectness >= $intermediatePercentajeOfCorrectness)
        {
            $gamificationResult["level"] = $paramRepository->getLevelsIntermediateText();
            $gamificationResult["legend"]= $paramRepository->getLevelsIntermediateLegend();
        }
        if($percentajeOfCorrectness >= $expertPercentajeOfCorrectness)
        {
            $gamificationResult["level"] = $paramRepository->getLevelsExpertText();
            $gamificationResult["legend"]= $paramRepository->getLevelsExpertLegend();
        }

        return $gamificationResult;

    }

    private function getBadgesResult($percentajeOfCorrectness,$paramRepository)
    {
        //migrate this to DATABASE!!!
        $intermediatePercentajeOfCorrectness = $paramRepository->getMinimumPercentageIntermediateLevel();
        $expertPercentajeOfCorrectness = $paramRepository->getMinimumPercentageExpertLevel();

        $gamificationResult = [];
        //gets the values for the first level
        $badge = $paramRepository->getBadgesBeginnerBadge();
        $gamificationResult["level"] = $this->getImageUrl($badge);
        $gamificationResult["legend"]= $paramRepository->getBadgesBeginnerLegend();
        //gets the values for the second level
        if($percentajeOfCorrectness >= $intermediatePercentajeOfCorrectness)
        {
            $badge = $paramRepository->getBadgesIntermediateBadge();
            $gamificationResult["level"] = $this->getImageUrl($badge);
            $gamificationResult["legend"]= $paramRepository->getBadgesIntermediateLegend();
        }
        //gets the values for the third level
        if($percentajeOfCorrectness >= $expertPercentajeOfCorrectness)
        {
            $badge = $paramRepository->getBadgesExpertBadge();
            $gamificationResult["level"] = $this->getImageUrl($badge);
            $gamificationResult["legend"]= $paramRepository->getBadgesExpertLegend();
        }

        return $gamificationResult;

    }

    


}