<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

//entities

use AppBundle\Entity\Participant;
use AppBundle\Entity\ParticipantResponse;
use AppBundle\Entity\ParticipantSession;
use AppBundle\Utils\TrainingResultsHelper;

//view objects 
use AppBundle\ViewObjects\ViewImage;

use AppBundle\Utils\GamificationTypes;

class StadisticsController extends BaseController
{

	 /**
     * @Route("stadistics/", name="stadistics")
     */
    public function indexAction(Request $request)
    {
        //TODO use a interceptor,filter or something to check session ending
        $isUserLogged = $this->isUserLogged($request);

        if(!$isUserLogged)
        {
            return $this->redirectToDefault();
        }

        //this should be injected, to do this, this controller should be declared as a service
        $participantSessionRepo = $this->get(static::PARTICIPANT_SESSION_REPO);
        $paramRepo = $this->get(static::PARAM_REPO);
        //calculates percentile TODO: this could be a lot faster if it is calculated using a stored procedure

        $session = $request->getSession();
        $userSession = $this->deserializeParticipantSessionEntityFromHttpSession($session);
        $userPercentile = TrainingResultsHelper::calculatePercentile($userSession,$participantSessionRepo);


        $userSession->setPercentile($userPercentile);

        $em = $this->getEntityManager();
        $em->persist($userSession);


        $em->flush();

        //gets the stadistics of the training
        $gamificationType = $this->getGamificationType($session); 
        $gamificationResult = $this->getResultForGamificationStatusAndPercentajeOfCorrectness($gamificationType,$userSession->getPercentageOfCorrectTasks(),$paramRepo);
        $viewName = $this->getGamificationTypeView($gamificationType);
        $leaderboard = TrainingResultsHelper::getLeadersboard($participantSessionRepo->findAll(),$userSession);

        $viewParams = [];
        $viewParams["back_url"]      = $this->generateUrl('logInUser', array("gamification" => $gamificationType), true);
        $viewParams["post_url"]      = $this->generateUrl('endTraining', array(), true);
        $viewParams["points"]        = $userSession->getTotalPoints();
        $viewParams["gamType"]       = $gamificationType;   
        $viewParams["level"]         = $gamificationResult["level"];
        $viewParams["legend"]        = $gamificationResult["legend"];
        $viewParams["leadersboard"]   = $leaderboard;
        $viewParams["percentile"]    = round($userPercentile,2);
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
        $em->flush();
        //redirect to the training or to the real tasks
        $userChoice = $request->request->get("user_choice");
        if($userChoice=="true")
        {
            return $this->beginRealTasks($httpSession);
        }
        else
        {
            return $this->repeatTraining($httpSession);
        }

     }

     /**
      * gets the template for the selected gamification type
      *
      * @param string Gamification type name
      *
      */
    private function getGamificationTypeView($gamificationType)
    {
        $gTypeRepo = $this->get(static::GAMIFICATION_REPO);

        //gets the gamification type
        $gType = $gTypeRepo->findOneByName($gamificationType);

        return $gType->getStadisticsView();
    }

    /**
     * Gets the gamification type from the http session
     *
     * @return string Name of the gamification type
     *
     */
    private function getGamificationType($session)
    {
        return $session->get(static::GAMIFICATION_KEY);
    }

    private function beginRealTasks($httpSession)
    {
        //sets the max number of tasks in the session
        $httpSession->set(static::STEP,1);
        $httpSession->set(static::MAX_STEPS,$this->getMaxNumberOfQuestions());

        return $this->redirectToURL("taskIndex");
    }
    /**
     * repeats the training course
     *
     */
    private function repeatTraining($httpSession)
    {
        //gets the participant session from the http session
        $participantSessionEntity = $this->deserializeParticipantSessionEntityFromHttpSession($httpSession);
        //creates a new participant session
        $newUserSession = $this->createParticipantSession($httpSession->getId(),$participantSessionEntity->getParticipant(),$participantSessionEntity->getGamificationType());
        //links the old session to the new session
        $participantSessionEntity->setNextSession($newUserSession);
        //saves the entities to the database
        $entityManager = $this->getEntityManager();
        $entityManager->persist($newUserSession);
        $entityManager->persist($participantSessionEntity);
        $entityManager->flush();
        //flush it before serializing it!!!
        //sets the new session in the http session
        $this->serializeParticipantSessionIntoHttpSession($httpSession,$newUserSession);
        //resets the training 
        $httpSession->set(static::TRAINING_STEP,1);
        //redirects
        return $this->redirectToTrainingTasks();
    }


    private function getMaxNumberOfQuestions()
    {
        $paramRepo = $this->get(static::PARAM_REPO);
        return $paramRepo->getMaxNumberOfQuestions();
    }

    

    private function getResultForGamificationStatusAndPercentajeOfCorrectness($gamificationType,$percentajeOfCorrectness,$paramRepo)
    {
        $gamificationResult = [];
        if(GamificationTypes::GAMIFICATION_BADGES == $gamificationType)
        {
            $gamificationResult = $this->getBadgesResult($percentajeOfCorrectness,$paramRepo);
        }
        else
        {
            $gamificationResult = $this->getLevelsResult($percentajeOfCorrectness,$paramRepo);
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