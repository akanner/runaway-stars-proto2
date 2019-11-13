<?php

namespace AppBundle\Services;
//repositories
use AppBundle\Repositories\TrainingRepository;
use AppBundle\Repositories\ParticipantResponseRepository;
use AppBundle\Repositories\AnswerPointsRepository;
use AppBundle\Repositories\AppParameterRepository;

use AppBundle\Entity\ParticipantSession;
use AppBundle\Entity\TrainingTask;
use AppBundle\Entity\ParticipantTrainingResponse;

use Doctrine\ORM\EntityManager;

class TrainingService{

    /**
     * @var ResponseRepository;
     */
    private $responseRepository;
    /**
     * @var TrainingRepository
     */
    private $trainingRepository;

    /**
     * @var AnswerPointsRepository
     */
    private $pointsRepository;
    /**
     * @var AppParameterRepository
     */
    private $parametersRepository;
    /**
     * @var EntityManager
     */
    private $em;

    public function __construct(EntityManager $entityManager,TrainingRepository $trainingRepository,
    ParticipantResponseRepository $participantResponseRepository, 
    AnswerPointsRepository $pointsRepository,AppParameterRepository $appParameterRepository)
    {
        $this->trainingRepository = $trainingRepository;
        $this->responseRepository = $participantResponseRepository;
        $this->pointsRepository = $pointsRepository;
        $this->parametersRepository = $appParameterRepository;
        $this->em = $entityManager;
    }

     /**
     * assigns points to the user's response
     *
     * @param
     *
     * @return int points given to the user
     *
     */
    public function assignPoints($userResponse,$userSession)
    {
        $points = $this->pointsRepository->getPointsForIncorrectAnswer();
        if ($userResponse->isCorrect()) {
            $points = $this->pointsRepository->getPointsForCorrectAnswer();
        }

        $userResponse->setPointsEarned($points);
        $this->em->persist($userResponse);
        $userSession->sumPoints($points);
        $this->em->persist($userSession);
        $this->em->flush();
        return $points;
    }
    /**
     * @return int
     */
    public function getPointsForIncorrectAnswer()
    {
        return $this->pointsRepository->getPointsForIncorrectAnswer();
    }

    public function getPointsForCorrectAnswer()
    {
        return $this->pointsRepository->getPointsForCorrectAnswer();
    }

    public function getShowDebugUserSession(){
        return $this->parametersRepository->getShowDebugUserSession();
    }

    public function getMaxNumberOfTrainingQuestions()
    {
        $numberOfTrainingTasks = $this->trainingRepository->getMaxNumberOfQuestions();
        return $numberOfTrainingTasks;
    }
    /**
     * @return TrainingTask
     */
    public function getTrainingTask($trainingStepNumber)
    {
        return $this->trainingRepository->findOneByTrainingStep($trainingStepNumber);
    }

    /**
     * @return ParticipantTrainingResponse
     */
    public function createAndPersistNewTrainingResponse(ParticipantSession $userSession,TrainingTask $trainingTask)
    {
        $participantResponse = ParticipantTrainingResponse::createFromSessionAndTrainingTask($userSession, $trainingTask);
        $this->em->persist($participantResponse);
        $this->em->flush();

        return $participantResponse;
    }
    public function getTrainingResponseById($responseId)
    {
        return $this->responseRepository->findOneById($responseId);
    }
}