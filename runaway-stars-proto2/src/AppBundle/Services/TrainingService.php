<?php

namespace AppBundle\Services;
//repositories
use AppBundle\Repositories\TrainingRepository;

class TrainingService{

    /**
     * @var TrainingRepository
     */
    private $trainingRepository;

    public function __construct(TrainingRepository $trainingRepository)
    {
        $this->trainingRepository = $trainingRepository;
    }

    public function getMaxNumberOfTrainingQuestions()
    {
        $numberOfTrainingTasks = $this->trainingRepository->getMaxNumberOfQuestions();
        return $numberOfTrainingTasks;
    }

}