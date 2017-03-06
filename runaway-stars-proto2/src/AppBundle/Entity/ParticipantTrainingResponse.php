<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
/**
 * @ORM\Entity
 */
class ParticipantTrainingResponse extends ParticipantResponse
{

    /**
     * @var \AppBundle\Entity\Image
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\TrainingTask")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="training_task_id", referencedColumnName="id")
     * })
     */
	private $trainingTask; 

    /**
     * @var integer
     *
     * @ORM\Column(name="pointsEarned", type="integer")
     */
    private $pointsEarned;

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

    /**
     * Set selectedImage
     *
     * @param \AppBundle\Entity\TrainingTask $trainingTask
     * @return ParticipantTrainingResponse
     */
    public function setTrainingTask(\AppBundle\Entity\TrainingTask $trainingTask = null)
    {
        $this->trainingTask = $trainingTask;

        return $this;
    }

    /**
     * Get selectedImage
     *
     * @return \AppBundle\Entity\TrainingTask 
     */
    public function getTrainingTask()
    {
        return $this->trainingTask;
    }

    public static function createFromSessionAndTrainingTask($userSession,$trainingTask){
    	//gets the images of the training task
    	$images = [$trainingTask->getFirstImage(),$trainingTask->getSecondImage(),$trainingTask->getThirdImage()];
    	//creates a new ParticipantTrainingResponse
    	$trainingResponse = static::createFromSessionAndImages($userSession,$images);
    	//assings the trainingTask
    	$trainingResponse->setTrainingTask($trainingTask);

    	return $trainingResponse;
    }

    
    public function isTrainingResponse()
    {
        return true;
    }

}
