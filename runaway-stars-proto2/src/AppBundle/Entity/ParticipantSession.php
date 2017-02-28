<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ParticipantSession
 *
 * @ORM\Table(name="participant_session", indexes={@ORM\Index(name="fk_session_participant_participant_idx", columns={"participant_id"}),@ORM\Index(name="fk_participant_session_participant_session_idx", columns={"next_session_id"})})
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
     * @ORM\Column(name="total_points", type="integer", nullable=false)
     */
    private $totalPoints;

    /**
     * @var integer
     *
     * @ORM\Column(name="participant_confidence", type="integer", nullable=true)
     */
    private $participantConfidence;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

     /**
     * @var float
     *
     * @ORM\Column(name="percentile", type="integer", nullable=true)
     */
    private $percentile;

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
     * @var \AppBundle\Entity\GamificationType
     *
     * @ORM\OneToOne(targetEntity="AppBundle\Entity\GamificationType")
     * @ORM\JoinColumn(name="gamification_type_id", referencedColumnName="id")
     */
    private $gamification_type;

    /**
     * @var  \AppBundle\Entity\ParticipantSession it is used to know if a participant repeated the training, if it is <> null it means that the participant decided to repeat the training before doing real questions
     *
     * @ORM\OneToOne(targetEntity="AppBundle\Entity\ParticipantSession")
     * @ORM\JoinColumn(name="next_session_id", referencedColumnName="id")
     */
    private $nextSession;

    /**
     * Constructor
     */
    public static function createWith($httpSessionId,$startedAt,$participant,$gamificationType)
    {
        $session = new ParticipantSession();
        $session->setHttpSession($httpSessionId);
        $session->setStartedAt($startedAt);
        $session->setParticipant($participant);
        $session->setGamificationType($gamificationType);
        $session->setTotalPoints(0);

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
     * Set totalPoints
     *
     * @param integer $points
     * @return ParticipantSession
     */
    public function setTotalPoints($points)
    {
        $this->totalPoints = $points;

        return $this;
    }
     /**
     * Get totalPoints
     *
     * @return integer 
     */
    public function getTotalPoints()
    {
        return $this->totalPoints;
    }

     /**
     * Set participantConfidence
     *
     * @param integer $participantConfidence
     * @return ParticipantSession
     */
    public function setParticipantConfidence($participantConfidence)
    {
        $this->participantConfidence = $participantConfidence;

        return $this;
    }
     /**
     * Get totalPoints
     *
     * @return integer 
     */
    public function getParticipantConfidence()
    {
        return $this->participantConfidence;
    }

     /**
     * Set percentile
     *
     * @param float $percentile
     * @return ParticipantSession
     */
    public function setPercentile($percentile)
    {
        $this->percentile = $percentile;

        return $this;
    }
     /**
     * Get percentile
     *
     * @return float 
     */
    public function getPercentile()
    {
        return $this->percentile;
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
     * Set gamification_type
     *
     * @param \AppBundle\Entity\GamificationType $gamificationType
     * @return ParticipantSession
     */
    public function setGamificationType(\AppBundle\Entity\GamificationType $gamificationType = null)
    {
        $this->gamification_type = $gamificationType;

        return $this;
    }

    /**
     * Get gamification_type
     *
     * @return \AppBundle\Entity\GamificationType 
     */
    public function getGamificationType()
    {
        return $this->gamification_type;
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

    /**
     * Set nextSession
     *
     * @param \AppBundle\Entity\ParticipantSession $participantSession
     * @return ParticipantSession
     */
    public function setNextSession(\AppBundle\Entity\ParticipantSession $participantSession = null)
    {
        $this->nextSession = $participantSession;

        return $this;
    }

    /**
     * Get nextSession
     *
     * @return \AppBundle\Entity\ParticipantSession 
     */
    public function getNextSession()
    {
        return $this->nextSession;
    }

    public function sumPoints($points)
    {
        $this->totalPoints= $this->totalPoints + $points;
    }


    public function getNumberOfResponses()
    {
        return $this->responses->count();
    }

    public function getNumberOfCorrectResponses()
    {
        $correctResponses = $this->responses->filter(function($response){return $response->isCorrect();});
        return count($correctResponses);
    }

    public function getPercentageOfCorrectTasks()
    {
        return $this->getNumberOfCorrectResponses() * 100 / $this->getNumberOfResponses();
    }
   
}
