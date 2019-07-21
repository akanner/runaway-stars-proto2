<?php
namespace AppBundle\Services;
use Doctrine\ORM\EntityManager;

//entities
use AppBundle\Entity\ParticipantSession;
use AppBundle\Entity\Participant;
//repositories
use AppBundle\Repositories\ParticipantRepository;

class SessionService{
    /**
     * @var EntityManager
     */
    private $em;
    /**
     * @var ParticipantRepository
     */
    private $participantRepository;

    public function __construct(EntityManager $entityManager,ParticipantRepository $participantRepository)
    {
        $this->em = $entityManager;
        $this->participantRepository = $participantRepository;
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

    private function createParticipantSession($httpSessionId, $participantEntity, $gamificationTypEntity)
    {

        $participantSession = ParticipantSession::createWith($httpSessionId, new \Datetime("now"), $participantEntity, $gamificationTypEntity);
        $participantEntity->setSession($participantSession);
        return $participantSession;
    }

}