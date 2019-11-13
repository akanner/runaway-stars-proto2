<?php
namespace AppBundle\Services;

use AppBundle\Entity\ParticipantSession;
use AppBundle\Repositories\ParticipantSessionRepository;
use AppBundle\Repositories\AppParameterRepository;
use AppBundle\Utils\ImagesViewsHelper;

use AppBundle\Utils\GamificationTypes;
class StatisticsService{
    /**
     * @var ParticipantSessionRepository
     */
    private $sessionRepository;
    /**
     * @var AppParameterRepository
     */
    private $parametersRepository;
    /**
     * @var ImagesViewsHelper
     */
    private $imagesViewsHelper;

    public function __construct(ParticipantSessionRepository $participantSessionRepository,
    AppParameterRepository $parametersRepository, ImagesViewsHelper $imagesViewsHelper)
    {
        $this->sessionRepository = $participantSessionRepository;
        $this->parametersRepository = $parametersRepository;
        $this->imagesViewsHelper = $imagesViewsHelper;
    }
    /**
     * Calculates the percentile of the participant's score
     *
     * @param UserSession Participant's session
     *
     * @return Integer Percentile of the participant
     *
     */
    public function calculatePercentile($userSession)
    {
        $currentUserScore = $userSession->getTotalPoints();

        //gets all users's scores
        $participantsScores = $this->sessionRepository->getAllScores();
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
  
    /**
     * Gets the leaderboard for the session
     */
    public function getLeadersboard($currentSession)
    {
        $participantSessions = $this->sessionRepository->findAll();
        $leadersboard =array();
        $currentUser = null; //stores the actual user's information
        foreach ($participantSessions as $session) {
            $userInfo = array();
            $userInfo["username"] = $session->getParticipant()->getName();
            $userInfo["score"] = $session->getPercentageOfCorrectTasks();
            $userInfo["session_id"] = $session->getId();
            //gets the training answers
            $trainAnswers = array_filter(
                $session->getResponses()->toArray(),
                function($item){
                    return $item->isTrainingResponse();
                }
            );
            if(count($trainAnswers) > 0)
            {
                $startTimestamp = $trainAnswers[0]->getAnsweredAt()->getTimestamp();
                $endTimestamp = end($trainAnswers)->getAnsweredAt()->getTimestamp();
                $userInfo["timeSpent"] = $endTimestamp - $startTimestamp; 
                //stores the current user information
                if($session == $currentSession){
                    $userInfo["current_user"] = true;
                    $currentUser = $userInfo;

                }
                $leadersboard[] = $userInfo;
            }
           
        }
        //sorting 
        $leadersboard = static::array_orderby($leadersboard,"score",SORT_DESC,"timeSpent",SORT_ASC);
        $currentUserPos = array_search($currentUser, $leadersboard);

        //reducing leadersboard;
        $reducedLeaderBoard = array_slice ( $leadersboard , 0, 3);
        //attaches the positions
        foreach ($reducedLeaderBoard  as $key => $leader) {
            $reducedLeaderBoard[$key]["pos"] = $key+1;
        }
        //if the current user is not in the firsts three, i add it to the leadersboard
        if(array_search($currentUser["session_id"], array_column($reducedLeaderBoard, "session_id"))===false)
        {
            $currentUser["pos"] = $currentUserPos+1;
            $reducedLeaderBoard[] = $currentUser;
        }


        //print_r(json_encode($reducedLeaderBoard));exit;
        return $reducedLeaderBoard;
    }

    public function getResultForGamificationStatusAndPercentajeOfCorrectness($gamificationType, $percentajeOfCorrectness)
    {
        $gamificationResult = [];
        if (GamificationTypes::GAMIFICATION_BADGES == $gamificationType) {
            $gamificationResult = $this->getBadgesResult($percentajeOfCorrectness);
        } else {
            $gamificationResult = $this->getLevelsResult($percentajeOfCorrectness);
        }

        return $gamificationResult;
    }

    private function getLevelsResult($percentajeOfCorrectness)
    {
        $intermediatePercentajeOfCorrectness = $this->parametersRepository->getMinimumPercentageIntermediateLevel();
        $expertPercentajeOfCorrectness = $this->parametersRepository->getMinimumPercentageExpertLevel();
        $gamificationResult = [];
        $gamificationResult["level"] = $this->parametersRepository->getLevelsBeginnerText();
        $gamificationResult["legend"]= $this->parametersRepository->getLevelsBeginnerLegend();
        if ($percentajeOfCorrectness >= $intermediatePercentajeOfCorrectness) {
            $gamificationResult["level"] = $this->parametersRepository->getLevelsIntermediateText();
            $gamificationResult["legend"]= $this->parametersRepository->getLevelsIntermediateLegend();
        }
        if ($percentajeOfCorrectness >= $expertPercentajeOfCorrectness) {
            $gamificationResult["level"] = $this->parametersRepository->getLevelsExpertText();
            $gamificationResult["legend"]= $this->parametersRepository->getLevelsExpertLegend();
        }

        return $gamificationResult;
    }

    private function getBadgesResult($percentajeOfCorrectness)
    {
        //migrate this to DATABASE!!!
        $intermediatePercentajeOfCorrectness = $this->parametersRepository->getMinimumPercentageIntermediateLevel();
        $expertPercentajeOfCorrectness = $this->parametersRepository->getMinimumPercentageExpertLevel();

        $gamificationResult = [];
        //gets the values for the first level
        $badge = $this->parametersRepository->getBadgesBeginnerBadge();
        $gamificationResult["level"] = $this->imagesViewsHelper->getImageUrl($badge);
        $gamificationResult["legend"]= $this->parametersRepository->getBadgesBeginnerLegend();
        //gets the values for the second level
        if ($percentajeOfCorrectness >= $intermediatePercentajeOfCorrectness) {
            $badge = $this->parametersRepository->getBadgesIntermediateBadge();
            $gamificationResult["level"] = $this->imagesViewsHelper->getImageUrl($badge);
            $gamificationResult["legend"]= $this->parametersRepository->getBadgesIntermediateLegend();
        }
        //gets the values for the third level
        if ($percentajeOfCorrectness >= $expertPercentajeOfCorrectness) {
            $badge = $this->parametersRepository->getBadgesExpertBadge();
            $gamificationResult["level"] = $this->imagesViewsHelper->getImageUrl($badge);
            $gamificationResult["legend"]= $this->parametersRepository->getBadgesExpertLegend();
        }

        return $gamificationResult;
    }


    private static function array_orderby()
    {
        $args = func_get_args();
        $data = array_shift($args);
        foreach ($args as $n => $field) {
            if (is_string($field)) {
                $tmp = array();
                foreach ($data as $key => $row)
                    $tmp[$key] = $row[$field];
                $args[$n] = $tmp;
                }
        }
        $args[] = &$data;
        call_user_func_array('array_multisort', $args);
        return array_pop($args);
    }
}