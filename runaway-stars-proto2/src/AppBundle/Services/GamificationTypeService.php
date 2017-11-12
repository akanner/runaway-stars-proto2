<?php
namespace AppBundle\Services;

class GamificationTypesService
{
 /**
  * @var \AppBundle\Repositories\ParticipantSessionRepository
  */
    private $participantSessionRepository;
  /**
   * @var \AppBundle\Repositories\GamificationTypeRepository
   */
    private $gamificationTypeRepository;


    function __construct(\AppBundle\Repositories\ParticipantSessionRepository $participantSessionRepository, \AppBundle\Repositories\GamificationTypeRepository $gamificationTypeRepository)
    {
        $this->setParticipantSessionRepository($participantSessionRepository);
        $this->setGamificationTypeRepository($gamificationTypeRepository);
    }

    /**
     * Get the value of Participant Session Repository
     *
     * @return ParticipantSessionRepository
     */
    public function getParticipantSessionRepository()
    {
        return $this->participantSessionRepository;
    }

    /**
     * Set the value of Participant Session Repository
     *
     * @param ParticipantSessionRepository participantSessionRepository
     *
     * @return self
     */
    public function setParticipantSessionRepository(\AppBundle\Repositories\ParticipantSessionRepository $participantSessionRepository)
    {
        $this->participantSessionRepository = $participantSessionRepository;

        return $this;
    }

    /**
     * Get the value of Gamification Type Repository
     *
     * @return GamificationTypeRepository
     */
    public function getGamificationTypeRepository()
    {
        return $this->gamificationTypeRepository;
    }

    /**
     * Set the value of Gamification Type Repository
     *
     * @param GamificationTypeRepository gamificationTypeRepository
     *
     * @return self
     */
    public function setGamificationTypeRepository(\AppBundle\Repositories\GamificationTypeRepository $gamificationTypeRepository)
    {
        $this->gamificationTypeRepository = $gamificationTypeRepository;

        return $this;
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
