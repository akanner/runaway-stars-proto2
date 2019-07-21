<?php
namespace AppBundle\Services;
use Doctrine\ORM\EntityManager;

//entities
use AppBundle\Entity\ParticipantSession;
use AppBundle\Entity\Participant;
//repositories
use AppBundle\Repositories\ParticipantRepository;
use AppBundle\Repositories\ParticipantSessionRepository;

class SessionService{
    /**
     * @var EntityManager
     */
    private $em;
    /**
     * @var ParticipantRepository
     */
    private $participantRepository;
    /**
     * @var ParticipantSessionRepository
     */
    private $sessionRepository;

    public function __construct(EntityManager $entityManager,ParticipantRepository $participantRepository,
        ParticipantSessionRepository $participantSessionRepository)
    {
        $this->em = $entityManager;
        $this->participantRepository = $participantRepository;
        $this->sessionRepository = $participantSessionRepository;
    }
    /**
     * @return ParticipantSession
     */
    public function createAndPersistParticipantAndSession($username,$httpSessionId,$gamificationType)
    {
        //if the username is null we assign a generic name to they
        if($username == null){
            $username = $this->participantRepository->getNextParticipantName();
        }

        $participant = Participant::createWithName($username);
        $userSession = $this->createParticipantSession($httpSessionId, $participant, $gamificationType);

        $this->em->persist($participant);
        $this->em->persist($userSession);
        $this->em->flush();

        return $userSession;
    }

    public function getById($entityId)
    {
        return $this->sessionRepository->findOneById($entityId);
    }

    private function createParticipantSession($httpSessionId, $participantEntity, $gamificationTypEntity)
    {

        $participantSession = ParticipantSession::createWith($httpSessionId, new \Datetime("now"), $participantEntity, $gamificationTypEntity);
        $participantEntity->setSession($participantSession);
        return $participantSession;
    }

}