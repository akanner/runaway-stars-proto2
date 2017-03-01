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

}