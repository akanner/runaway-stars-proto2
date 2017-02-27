<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Image
 *
 * @ORM\Table(name="image")
 * @ORM\Entity(repositoryClass="AppBundle\Repositories\ImageRepository")
 */
class Image
{
    /**
     * @var string
     *
     * @ORM\Column(name="file_path", type="string", length=255, nullable=false)
     */
    private $filePath;

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_correct", type="boolean", nullable=false)
     */
    private $isCorrect;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;


     /**
     * @var string
     *
     * @ORM\Column(name="marked_bowshock_image", type="string", length=255, nullable=false)
     */
     /*
      * this value holds a reference to an image that has the bowshock marked up, this image will be used to show the bowshock to the user
      * if this image is a false image (does not contains a bowshock) this will be null
      */
    private $markedBowshockImage;

    /**
     * Set markedBowshockImage
     *
     * @param string $markedBowshockImage
     * @return Image
     */
    public function setMarkedBowshockImage($markedBowshockImage)
    {
        $this->markedBowshockImage = $markedBowshockImage;

        return $this;
    }

    /**
     * Get markedBowshockImage
     *
     * @return string 
     */
    public function getMarkedBowshockImage()
    {
        return $this->markedBowshockImage;
    }

    /**
     * Set filePath
     *
     * @param string $filePath
     * @return Image
     */
    public function setFilePath($filePath)
    {
        $this->filePath = $filePath;

        return $this;
    }

    /**
     * Get filePath
     *
     * @return string 
     */
    public function getFilePath()
    {
        return $this->filePath;
    }

    /**
     * Set isCorrect
     *
     * @param boolean $isCorrect
     * @return Image
     */
    public function setIsCorrect($isCorrect)
    {
        $this->isCorrect = $isCorrect;

        return $this;
    }

    /**
     * Get isCorrect
     *
     * @return boolean 
     */
    public function getIsCorrect()
    {
        return $this->isCorrect;
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
}
