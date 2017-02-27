<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TrainingTask
 *
 * @ORM\Entity(repositoryClass="AppBundle\Repositories\TrainingRepository")
 * @ORM\Table(name="training_task", indexes={@ORM\Index(name="fk_training_task_image1_idx", columns={"first_image"}),@ORM\Index(name="fk_training_task_image2_idx", columns={"second_image"}),@ORM\Index(name="fk_training_task_image3_idx", columns={"third_image"}),
 })
 */
class TrainingTask
{
    /**
     * @var integer
     *
     * @ORM\Column(name="training_step", type="integer", nullable=false)
     */
    private $trainingStep;

    /**
     * @var string
     *
     * @ORM\Column(name="help_text", type="text", length=65535, nullable=false)
     */
    private $helpText;

    /**
     * @var integer
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
     *   @ORM\JoinColumn(name="third_image", referencedColumnName="id")
     * })
     */
    private $thirdImage;

    /**
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Image")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="second_image", referencedColumnName="id")
     * })
     */
    private $secondImage;

    /**
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Image")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="first_image", referencedColumnName="id")
     * })
     */
    private $firstImage;


    /**
     * Set trainingStep
     *
     * @param integer $trainingStep
     * @return TrainingTask
     */
    public function setTrainingStep($trainingStep)
    {
        $this->trainingStep = $trainingStep;

        return $this;
    }

    /**
     * Get trainingStep
     *
     * @return integer 
     */
    public function getTrainingStep()
    {
        return $this->trainingStep;
    }

    /**
     * Set helpText
     *
     * @param string $helpText
     * @return TrainingTask
     */
    public function setHelpText($helpText)
    {
        $this->helpText = $helpText;

        return $this;
    }

    /**
     * Get helpText
     *
     * @return string 
     */
    public function getHelpText()
    {
        return $this->helpText;
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
     * Set thirdImage
     *
     * @param \AppBundle\Entity\Image $thirdImage
     * @return TrainingTask
     */
    public function setThirdImage(\AppBundle\Entity\Image $thirdImage = null)
    {
        $this->thirdImage = $thirdImage;

        return $this;
    }

    /**
     * Get thirdImage
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getThirdImage()
    {
        return $this->thirdImage;
    }

    /**
     * Set secondImage
     *
     * @param \AppBundle\Entity\Image $secondImage
     * @return TrainingTask
     */
    public function setSecondImage(\AppBundle\Entity\Image $secondImage = null)
    {
        $this->secondImage = $secondImage;

        return $this;
    }

    /**
     * Get secondImage
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getSecondImage()
    {
        return $this->secondImage;
    }

    /**
     * Set firstImage
     *
     * @param \AppBundle\Entity\Image $firstImage
     * @return TrainingTask
     */
    public function setFirstImage(\AppBundle\Entity\Image $firstImage = null)
    {
        $this->firstImage = $firstImage;

        return $this;
    }

    /**
     * Get firstImage
     *
     * @return \AppBundle\Entity\Image 
     */
    public function getFirstImage()
    {
        return $this->firstImage;
    }
}
