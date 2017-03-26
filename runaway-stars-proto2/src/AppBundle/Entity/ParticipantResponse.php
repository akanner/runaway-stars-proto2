<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * ParticipantResponse
 *
 * @ORM\Table(name="participant_response", indexes={@ORM\Index(name="fk_participant_response_session_participant_idx", columns={"session_id"}), @ORM\Index(name="fk_participant_response_image1_idx", columns={"first_image_served_id"}), @ORM\Index(name="fk_participant_response_image2_idx", columns={"second_image_served_id"}), @ORM\Index(name="fk_participant_response_image3_idx", columns={"third_image_served_id"}), @ORM\Index(name="fk_participant_response_image4_idx", columns={"correct_image_id"}), @ORM\Index(name="fk_participant_response_image5_idx", columns={"selected_image_id"}),
  @ORM\Index(name="fk_participant_training_task_idx", columns={"training_task_id"})})
 * @ORM\Entity(repositoryClass="AppBundle\Repositories\ParticipantResponseRepository")
 * @ORM\InheritanceType("SINGLE_TABLE")
 * @ORM\DiscriminatorColumn(name="type", type="string")
 * @ORM\DiscriminatorMap({"real" = "ParticipantResponse", "training" = "ParticipantTrainingResponse"})
 */
class ParticipantResponse
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \AppBundle\Entity\ParticipantSession
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\ParticipantSession", inversedBy="responses")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="session_id", referencedColumnName="id")
     * })
     */
    private $session;

    /**
     * @var \int
     * @ORM\Column(name="correct_answer", type="integer")
     */
    private $correctAnswer;

    /**
     * @var \int
     * @ORM\Column(name="participant_answer", type="integer")
     */
    private $participantAnswer;

    /**
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Image")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="image_served_id", referencedColumnName="id")
     * })
     */
    private $imageServed;

    /**
     * @var \DateTime
     * @ORM\Column(name="answered_at", type="datetime")
     * @Gedmo\Timestampable(on="create")
     */
    private $answeredAt;
    /**
     * @var string
     * @ORM\Column(name="images_used_to_respond", type="string", length=255, nullable=false)
     */
    private $imagesUsedToRespond;



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
     * Set session
     *
     * @param \AppBundle\Entity\ParticipantSession $session
     * @return ParticipantResponse
     */
    public function setSession(\AppBundle\Entity\ParticipantSession $session = null)
    {
        $this->session = $session;

        return $this;
    }

    /**
     * Get session
     *
     * @return \AppBundle\Entity\ParticipantSession 
     */
    public function getSession()
    {
        return $this->session;
    }

    /**
     * Set imageServed
     *
     * @param \AppBundle\Entity\Image $firstImageServed
     * @return ParticipantResponse
     */
    public function setImageServed(\AppBundle\Entity\Image $imageServed = null)
    {
        $this->imageServed = $imageServed;

        return $this;
    }

    /**
     * Get imageServed
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getImageServed()
    {
        return $this->imageServed;
    }

    /**
     * Set correctAnswer
     *
     * @param boolean $correctAnswer
     * @return ParticipantResponse
     */
    public function setCorrectAnswer($correctAnswer = null)
    {
        $this->correctAnswer = $correctAnswer;

        return $this;
    }

    /**
     * Get correctAnswer
     *
     * @return boolean
     */
    public function getCorrectAnswer()
    {
        return $this->correctAnswer;
    }

    /**
     * Set participantAnswer
     *
     * @param boolean $participantAnswer
     * @return ParticipantResponse
     */
    public function setParticipantAnswer($participantAnswer = null)
    {
        $this->participantAnswer = $participantAnswer;

        return $this;
    }

    /**
     * Get participantAnswer
     *
     * @return boolean
     */
    public function getParticipantAnswer()
    {
        return $this->participantAnswer;
    }



    public function isCorrect()
    {
        return $this->getCorrectAnswer() == $this->getParticipantAnswer();
    }


    public function getAnsweredAt()
    {
        return $this->answeredAt;
    }


    /**
     * Set answeredAt
     *
     * @param \DateTime $answeredAt
     *
     * @return ParticipantResponse
     */
    public function setAnsweredAt($answeredAt)
    {
        $this->answeredAt = $answeredAt;

        return $this;
    }

    public function getImagesUsedToRespond()
    {
        return $this->imagesUsedToRespond;
    }

    public function setImagesUsedToRespond($imagesUsedToRespond)
    {
        $this->imagesUsedToRespond = $imagesUsedToRespond;

        return $this;
    }


    public static function createFromSessionAndImages($userSession,$image)
    {
        $response = new static();

        $response->setSession($userSession);
        $response->setImageServed($image);
        $response->setCorrectAnswer($image->getIsCorrect());

        return $response;
    }

    public function isTrainingResponse()
    {
        return false;
    }
}
