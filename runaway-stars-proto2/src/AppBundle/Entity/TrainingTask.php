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
     *   @ORM\JoinColumn(name="image_served_id", referencedColumnName="id")
     * })
     */
    private $imageServed;

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

}
