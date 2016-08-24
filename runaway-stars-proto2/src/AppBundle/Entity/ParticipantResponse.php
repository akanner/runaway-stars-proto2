<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * ParticipantResponse
 *
 * @ORM\Table(name="participant_response", indexes={@ORM\Index(name="fk_participant_response_session_participant_idx", columns={"session_id"}), @ORM\Index(name="fk_participant_response_image1_idx", columns={"first_image_served_id"}), @ORM\Index(name="fk_participant_response_image2_idx", columns={"second_image_served_id"}), @ORM\Index(name="fk_participant_response_image3_idx", columns={"third_image_served_id"}), @ORM\Index(name="fk_participant_response_image4_idx", columns={"correct_image_id"}), @ORM\Index(name="fk_participant_response_image5_idx", columns={"selected_image_id"})})
 * @ORM\Entity(repositoryClass="AppBundle\Repositories\ParticipantResponseRepository")
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
     *   @ORM\JoinColumn(name="selected_image_id", referencedColumnName="id")
     * })
     */
    private $selectedImage;

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
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Image")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="correct_image_id", referencedColumnName="id")
     * })
     */
    private $correctImage;

    /**
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Image")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="third_image_served_id", referencedColumnName="id")
     * })
     */
    private $thirdImageServed;

    /**
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Image")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="second_image_served_id", referencedColumnName="id")
     * })
     */
    private $secondImageServed;

    /**
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Image")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="first_image_served_id", referencedColumnName="id")
     * })
     */
    private $firstImageServed;

    /**
     * @var integer
     *
     */
    private $pointsEarned;
    /**
     * @var \DateTime
     * @ORM\Column(name="answered_at", type="datetime")
     * @Gedmo\Timestampable(on="create")
     */
    private $answeredAt;


    public static function createFromSessionAndImages($userSession,$images)
    {
        $response = new ParticipantResponse();

        $response->setSession($userSession);
        $response->setFirstImageServed($images[0]);
        $response->setSecondImageServed($images[1]);
        $response->setThirdImageServed($images[2]);
        //array_filter will filter $images to get the correct one, but it will leave it will the image's original key in the array
        $correctResponses = array_filter($images,function($img){return $img->getIsCorrect();});
        //array_values will create a new array with new keys, that means that the correct image will always be in the first position
        $correctResponses = array_values($correctResponses);
        $correctResponse = $correctResponses[0];

        $response->setCorrectImage($correctResponse);

        return $response;
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


    public function isCorrect()
    {
        return $this->getCorrectImage() == $this->getSelectedImage();
    }
    /**
     * Set points
     *
     * @param integer $pointsEarned
     * @return ParticipantResponse
     */
    public function setPointsEarned($points)
    {
        $this->pointsEarned = $points;

        return $this;
    }

    /**
     * Get pointsEarned
     *
     * @return integer 
     */
    public function getPointsEarned()
    {
        return $this->pointsEarned;
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
}
