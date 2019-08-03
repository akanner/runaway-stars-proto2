<?php
namespace AppBundle\Services;

use AppBundle\Repositories\ParticipantSessionRepository;
use \AppBundle\Repositories\GamificationTypeRepository;
class GamificationTypeService
{
 /**
  * @var \AppBundle\Repositories\ParticipantSessionRepository
  */
    private $participantSessionRepository;
  /**
   * @var \AppBundle\Repositories\GamificationTypeRepository
   */
    private $gamificationTypeRepository;


    public function __construct(ParticipantSessionRepository $participantSessionRepository, GamificationTypeRepository  $gamificationTypeRepository)
    {
        $this->participantSessionRepository = $participantSessionRepository;
        $this->gamificationTypeRepository = $gamificationTypeRepository;
    }

 /**
      * gets the template for the selected gamification type
      *
      * @param string Gamification type name
      *
      */
      public function getGamificationTypeView($gamificationType)
      {
          //gets the gamification type
          $gType = $this->gamificationTypeRepository->findOneByName($gamificationType);
  
          return $gType->getStadisticsView();
      }

    public function getGamificationTypeByNameOrRandom($gamificationTypeName)
    {
        if (isset($gamificationTypeName)) {
            return $this->gamificationTypeRepository->findOneByName($gamificationTypeName);
        } else {
            return $this->getRandomGamificationType();
        }
    }

    private function getRandomGamificationType()
    {
      //balance the quantity of games using the different gamification types
     //---------------------------------------------------------------------
     //gets total games played
        $totalGamesPlayed         = $this->participantSessionRepository->getTotalRows();
  //gets al gamification types
        $gamTypes                 = $this->gamificationTypeRepository->findAll();
  //filters those gamification types with less percentage of games played than the required by "balance"
        $filteredGamTypes =
        array_filter($gamTypes,
        function ($gamType) use ($totalGamesPlayed) {
              //gets total games played with the current gamification type
              $gamesPlayedUsingGamificationType = $this->participantSessionRepository->getTotalSessionsUsingGamificationType($gamType);
              //gets the percentage of games played with the current gamificatoin type
              $percentajeOfPlayedGamesUsingGamificationType = 0;
            if ($totalGamesPlayed > 0) {
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
        return $gamificationType;
    }
}
