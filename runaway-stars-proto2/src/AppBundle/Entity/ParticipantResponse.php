<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ParticipantResponse
 *
 * @ORM\Table(name="participant-response", indexes={@ORM\Index(name="fk_participant-response_session-participant_idx", columns={"session-id"}), @ORM\Index(name="fk_participant-response_image1_idx", columns={"first-image-served-id"}), @ORM\Index(name="fk_participant-response_image2_idx", columns={"second-image-served-id"}), @ORM\Index(name="fk_participant-response_image3_idx", columns={"third-image-served-id"}), @ORM\Index(name="fk_participant-response_image4_idx", columns={"correct-image-id"}), @ORM\Index(name="fk_participant-response_image5_idx", columns={"selected-image-id"})})
 * @ORM\Entity
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
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Image")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="selected-image-id", referencedColumnName="id")
     * })
     */
    private $selectedImageId;

    /**
     * @var \AppBundle\Entity\ParticipantSession
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\ParticipantSession")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="session-id", referencedColumnName="id")
     * })
     */
    private $sessionId;

    /**
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Image")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="correct-image-id", referencedColumnName="id")
     * })
     */
    private $correctImageId;

    /**
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Image")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="third-image-served-id", referencedColumnName="id")
     * })
     */
    private $thirdImageServedId;

    /**
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Image")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="second-image-served-id", referencedColumnName="id")
     * })
     */
    private $secondImageServedId;

    /**
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Image")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="first-image-served-id", referencedColumnName="id")
     * })
     */
    private $firstImageServedId;



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
     * Set selectedImageId
     *
     * @param \AppBundle\Entity\Image $selectedImageId
     * @return ParticipantResponse
     */
    public function setSelectedImageId(\AppBundle\Entity\Image $selectedImageId = null)
    {
        $this->selectedImageId = $selectedImageId;

        return $this;
    }

    /**
     * Get selectedImageId
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getSelectedImageId()
    {
        return $this->selectedImageId;
    }

    /**
     * Set sessionId
     *
     * @param \AppBundle\Entity\ParticipantSession $sessionId
     * @return ParticipantResponse
     */
    public function setSessionId(\AppBundle\Entity\ParticipantSession $sessionId = null)
    {
        $this->sessionId = $sessionId;

        return $this;
    }

    /**
     * Get sessionId
     *
     * @return \AppBundle\Entity\ParticipantSession 
     */
    public function getSessionId()
    {
        return $this->sessionId;
    }

    /**
     * Set correctImageId
     *
     * @param \AppBundle\Entity\Image $correctImageId
     * @return ParticipantResponse
     */
    public function setCorrectImageId(\AppBundle\Entity\Image $correctImageId = null)
    {
        $this->correctImageId = $correctImageId;

        return $this;
    }

    /**
     * Get correctImageId
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getCorrectImageId()
    {
        return $this->correctImageId;
    }

    /**
     * Set thirdImageServedId
     *
     * @param \AppBundle\Entity\Image $thirdImageServedId
     * @return ParticipantResponse
     */
    public function setThirdImageServedId(\AppBundle\Entity\Image $thirdImageServedId = null)
    {
        $this->thirdImageServedId = $thirdImageServedId;

        return $this;
    }

    /**
     * Get thirdImageServedId
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getThirdImageServedId()
    {
        return $this->thirdImageServedId;
    }

    /**
     * Set secondImageServedId
     *
     * @param \AppBundle\Entity\Image $secondImageServedId
     * @return ParticipantResponse
     */
    public function setSecondImageServedId(\AppBundle\Entity\Image $secondImageServedId = null)
    {
        $this->secondImageServedId = $secondImageServedId;

        return $this;
    }

    /**
     * Get secondImageServedId
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getSecondImageServedId()
    {
        return $this->secondImageServedId;
    }

    /**
     * Set firstImageServedId
     *
     * @param \AppBundle\Entity\Image $firstImageServedId
     * @return ParticipantResponse
     */
    public function setFirstImageServedId(\AppBundle\Entity\Image $firstImageServedId = null)
    {
        $this->firstImageServedId = $firstImageServedId;

        return $this;
    }

    /**
     * Get firstImageServedId
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getFirstImageServedId()
    {
        return $this->firstImageServedId;
    }
    /**
     * @var \AppBundle\Entity\Image
     */
    private $selectedImage;

    /**
     * @var \AppBundle\Entity\ParticipantSession
     */
    private $session;

    /**
     * @var \AppBundle\Entity\Image
     */
    private $correctImage;

    /**
     * @var \AppBundle\Entity\Image
     */
    private $thirdImageServed;

    /**
     * @var \AppBundle\Entity\Image
     */
    private $secondImageServed;

    /**
     * @var \AppBundle\Entity\Image
     */
    private $firstImageServed;


    /**
     * Set selectedImage
     *
     * @param \AppBundle\Entity\Image $selectedImage
     * @return ParticipantResponse
     */
    public function setSelectedImage(\AppBundle\Entity\Image $selectedImage = null)
    {
        $this->selectedImage = $selectedImage;

        return $this;
    }

    /**
     * Get selectedImage
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getSelectedImage()
    {
        return $this->selectedImage;
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
     * Set correctImage
     *
     * @param \AppBundle\Entity\Image $correctImage
     * @return ParticipantResponse
     */
    public function setCorrectImage(\AppBundle\Entity\Image $correctImage = null)
    {
        $this->correctImage = $correctImage;

        return $this;
    }

    /**
     * Get correctImage
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getCorrectImage()
    {
        return $this->correctImage;
    }

    /**
     * Set thirdImageServed
     *
     * @param \AppBundle\Entity\Image $thirdImageServed
     * @return ParticipantResponse
     */
    public function setThirdImageServed(\AppBundle\Entity\Image $thirdImageServed = null)
    {
        $this->thirdImageServed = $thirdImageServed;

        return $this;
    }

    /**
     * Get thirdImageServed
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getThirdImageServed()
    {
        return $this->thirdImageServed;
    }

    /**
     * Set secondImageServed
     *
     * @param \AppBundle\Entity\Image $secondImageServed
     * @return ParticipantResponse
     */
    public function setSecondImageServed(\AppBundle\Entity\Image $secondImageServed = null)
    {
        $this->secondImageServed = $secondImageServed;

        return $this;
    }

    /**
     * Get secondImageServed
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getSecondImageServed()
    {
        return $this->secondImageServed;
    }

    /**
     * Set firstImageServed
     *
     * @param \AppBundle\Entity\Image $firstImageServed
     * @return ParticipantResponse
     */
    public function setFirstImageServed(\AppBundle\Entity\Image $firstImageServed = null)
    {
        $this->firstImageServed = $firstImageServed;

        return $this;
    }

    /**
     * Get firstImageServed
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getFirstImageServed()
    {
        return $this->firstImageServed;
    }
}
