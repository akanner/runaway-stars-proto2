<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ParticipantSession
 *
 * @ORM\Table(name="participant_session", indexes={@ORM\Index(name="fk_session_participant_participant_idx", columns={"participant_id"})})
 * @ORM\Entity(repositoryClass="AppBundle\Repositories\ParticipantSessionRepository")
 */
class ParticipantSession
{
    /**
     * @var string
     *
     * @ORM\Column(name="http_session", type="string", length=1024, nullable=false)
     */
    private $httpSession;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="started_at", type="datetime", nullable=false)
     */
    private $startedAt;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="ended_at", type="datetime", nullable=true)
     */
    private $endedAt;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\ParticipantResponse", mappedBy="session")
     */
    private $responses;

    /**
     * @var \AppBundle\Entity\Participant
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Participant", inversedBy="session")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="participant_id", referencedColumnName="id")
     * })
     */
    private $participant;

    /**
     * Constructor
     */
    public static function createWith($httpSessionId,$startedAt,$participant)
    {
        $session = new ParticipantSession();
        $session->setHttpSession($httpSessionId);
        $session->setStartedAt($startedAt);
        $session->setParticipant($participant);

        return $session;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->responses = new \Doctrine\Common\Collections\ArrayCollection();
    }


    /**
     * Set httpSession
     *
     * @param string $httpSession
     * @return ParticipantSession
     */
    public function setHttpSession($httpSession)
    {
        $this->httpSession = $httpSession;

        return $this;
    }

    /**
     * Get httpSession
     *
     * @return string 
     */
    public function getHttpSession()
    {
        return $this->httpSession;
    }

    /**
     * Set startedAt
     *
     * @param \DateTime $startedAt
     * @return ParticipantSession
     */
    public function setStartedAt($startedAt)
    {
        $this->startedAt = $startedAt;

        return $this;
    }

    /**
     * Get startedAt
     *
     * @return \DateTime 
     */
    public function getStartedAt()
    {
        return $this->startedAt;
    }

    /**
     * Set endedAt
     *
     * @param \DateTime $endedAt
     * @return ParticipantSession
     */
    public function setEndedAt($endedAt)
    {
        $this->endedAt = $endedAt;

        return $this;
    }

    /**
     * Get endedAt
     *
     * @return \DateTime 
     */
    public function getEndedAt()
    {
        return $this->endedAt;
    }

    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Add responses
     *
     * @param \AppBundle\Entity\ParticipantResponse $responses
     * @return ParticipantSession
     */
    public function addResponse(\AppBundle\Entity\ParticipantResponse $responses)
    {
        $this->responses[] = $responses;

        return $this;
    }

    /**
     * Remove responses
     *
     * @param \AppBundle\Entity\ParticipantResponse $responses
     */
    public function removeResponse(\AppBundle\Entity\ParticipantResponse $responses)
    {
        $this->responses->removeElement($responses);
    }

    /**
     * Get responses
     *
     * @return \Doctrine\Common\Collections\Collection 
     */
    public function getResponses()
    {
        return $this->responses;
    }

    /**
     * Set participant
     *
     * @param \AppBundle\Entity\Participant $participant
     * @return ParticipantSession
     */
    public function setParticipant(\AppBundle\Entity\Participant $participant = null)
    {
        $this->participant = $participant;

        return $this;
    }

    /**
     * Get participant
     *
     * @return \AppBundle\Entity\Participant 
     */
    public function getParticipant()
    {
        return $this->participant;
    }
}
