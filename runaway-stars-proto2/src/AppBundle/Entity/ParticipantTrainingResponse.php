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

}
