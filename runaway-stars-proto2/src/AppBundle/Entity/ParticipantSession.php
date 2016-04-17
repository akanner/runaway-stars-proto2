<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ParticipantSession
 *
 * @ORM\Table(name="participant-session", indexes={@ORM\Index(name="fk_session-participant_participant_idx", columns={"participant-id"})})
 * @ORM\Entity
 */
class ParticipantSession
{
    /**
     * @var string
     *
     * @ORM\Column(name="http-session", type="string", length=1024, nullable=false)
     */
    private $httpSession;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="started-at", type="datetime", nullable=false)
     */
    private $startedAt;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="ended-at", type="datetime", nullable=false)
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
     * @var \AppBundle\Entity\Participant
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Participant")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="participant-id", referencedColumnName="id")
     * })
     */
    private $participantId;



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
     * Set participantId
     *
     * @param \AppBundle\Entity\Participant $participantId
     * @return ParticipantSession
     */
    public function setParticipantId(\AppBundle\Entity\Participant $participantId = null)
    {
        $this->participantId = $participantId;

        return $this;
    }

    /**
     * Get participantId
     *
     * @return \AppBundle\Entity\Participant 
     */
    public function getParticipantId()
    {
        return $this->participantId;
    }
    /**
     * @var \Doctrine\Common\Collections\Collection
     */
    private $responses;

    /**
     * @var \AppBundle\Entity\Participant
     */
    private $participant;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->responses = new \Doctrine\Common\Collections\ArrayCollection();
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
