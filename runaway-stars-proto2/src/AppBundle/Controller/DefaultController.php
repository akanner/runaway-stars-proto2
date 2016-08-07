<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;



class DefaultController extends BaseController
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        //balance the quantity of games using the different gamification types
		//---------------------------------------------------------------------
		//gets total games played
		$participantSessionRepo = $this->get(static::PARTICIPANT_SESSION_REPO);
		$totalGamesPlayed		= $participantSessionRepo->getTotalRows();
		//gets al gamification types
		$gTypesRepo				= $this->get(static::GAMIFICATION_REPO);
		$gamTypes				= $gTypesRepo->findAll();
		//filters those gamification types with less percentage of games played than the required by "balance"
		$filteredGamTypes = 
		array_filter($gamTypes,
			function($gamType) use ($participantSessionRepo,$totalGamesPlayed)
			{
				//gets total games played with the current gamification type
				$gamesPlayedUsingGamificationType = $participantSessionRepo->getTotalSessionsUsingGamificationType($gamType);
				//gets the percentage of games played with the current gamificatoin type
				$percentajeOfPlayedGamesUsingGamificationType = 0;
				if($totalGamesPlayed > 0)
				{
					$percentajeOfPlayedGamesUsingGamificationType = $gamesPlayedUsingGamificationType * 100 / $totalGamesPlayed;
				}
				$requiredPercentage = $gamType->getGamificationTypeBalance();
				$gamificationTypeNeedsToBeBalanced = $percentajeOfPlayedGamesUsingGamificationType <= $requiredPercentage && $requiredPercentage > 0;
				
				return $gamificationTypeNeedsToBeBalanced;

			});

		//shuffles the filtered array to have some degree of randomness
		shuffle($filteredGamTypes);
		//pick the gamification type to be used in this game
		$gamificationType = $filteredGamTypes[0];
		//redirects to intro
		$gamificationTypeName = $gamificationType->getName();
		return $this->redirectToLogin(array("gamification"=>$gamificationTypeName));
        
    }
}