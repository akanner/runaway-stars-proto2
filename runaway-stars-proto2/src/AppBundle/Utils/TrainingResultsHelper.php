<?php

namespace AppBundle\Utils;

/**
 * Defines methods to give feedback to the user about its achivements in the training
 *
 */
class TrainingResultsHelper
{

    /**
     * Calculates the percentile of the participant's score
     *
     * @param UserSession Participant's session
     *
     * @return Integer Percentile of the participant
     *
     */
    public static function calculatePercentile($userSession,$userSessionRepo)
    {
        $currentUserScore = $userSession->getTotalPoints();

        //gets all users's scores
        $participantsScores = $userSessionRepo->getAllScores();
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

    public static function getLeadersboard($participantSessions,$currentSession)
    {
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
            $userInfo["timeSpent"] = end($trainAnswers)->getAnsweredAt()->getTimestamp() - $trainAnswers[0]->getAnsweredAt()->getTimestamp();
            //stores the current user information
            if($session == $currentSession){
                $userInfo["current_user"] = true;
                $currentUser = $userInfo;

            }
            $leadersboard[] = $userInfo;
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