<?php
namespace AppBundle\Services;

use Doctrine\ORM\EntityManager;

use AppBundle\repositories\ImageRepository;
use AppBundle\Repositories\ParticipantResponseRepository;

use AppBundle\Entity\ParticipantResponse;

class TasksService{
    /**
     * @var ResponseRepository;
     */
    private $responseRepository;
    /**
     * @var ImageRepository $imageRepository
     */
    private $imageRepository;
    /**
     * @var EntityManager
     */
    private $em;

    public function __construct(EntityManager $entityManager,ImageRepository $imageRepository,
    ParticipantResponseRepository $participantResponseRepository){
        $this->imageRepository = $imageRepository;
        $this->responseRepository = $participantResponseRepository;
        $this->em = $entityManager;
    }

    public function createNewTaskForSession($userSession)
    {
        $taskImage = $this->getRandomImage();
        $participantResponse = ParticipantResponse::createFromSessionAndImages($userSession, $taskImage);
        $this->em->persist($participantResponse);
        $this->em->flush();

        return $participantResponse;
    }

    public function saveTaskWithId($userResponseId,$userSubmission,$userRelevantImages)
    {
        $response = $this->responseRepository->findOneById($userResponseId);
        //sets the user's actual response and saves it in the database
        $response->setParticipantAnswer($userSubmission);
        if (isset($userRelevantImages)) {
            $response->setImagesUsedToRespond(implode(",", $userRelevantImages));
        }

        $this->em->persist($response);
        $this->em->flush();
    }

    public function deleteTaskWithId($responseId)
    {
        $response = $this->responseRepository->findOneById($responseId);
        $this->em->remove($response);
        $this->em->flush();
    }

    private function getRandomImage(){
        return $this->imageRepository->findRandomImage();
    }


    
}