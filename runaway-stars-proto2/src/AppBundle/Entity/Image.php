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
     * @ORM\Column(name="rgb_image_path", type="string", length=255, nullable=false)
     */
    private $rgbImagePath;

    /**
     * @var string
     *
     * @ORM\Column(name="heat_image_path", type="string", length=255, nullable=false)
     */
    private $heatImagePath;

    /**
     * @var string
     *
     * @ORM\Column(name="cool_image_path", type="string", length=255, nullable=false)
     */
    private $coolImagePath;

    /**
     * @var string
     *
     * @ORM\Column(name="hsv_image_path", type="string", length=255, nullable=false)
     */
    private $hsvImagePath;

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
     * @ORM\Column(name="marked_rgb_image_path", type="string", length=255, nullable=false)
     */
     /*
      * this value holds a reference to an image that has the bowshock marked up, this image will be used to show the bowshock to the user
      * if this image is a false image (does not contains a bowshock) this will be null
      */
    private $markedRgbImage;

     /**
     * @var string
     *
     * @ORM\Column(name="marked_cool_image_path", type="string", length=255, nullable=false)
     */
     /*
      * this value holds a reference to an image that has the bowshock marked up, this image will be used to show the bowshock to the user
      * if this image is a false image (does not contains a bowshock) this will be null
      */
    private $markedCoolImage;

     /**
     * @var string
     *
     * @ORM\Column(name="marked_heat_image_path", type="string", length=255, nullable=false)
     */
     /*
      * this value holds a reference to an image that has the bowshock marked up, this image will be used to show the bowshock to the user
      * if this image is a false image (does not contains a bowshock) this will be null
      */
    private $markedHeatImage;

     /**
     * @var string
     *
     * @ORM\Column(name="marked_hsv_image_path", type="string", length=255, nullable=false)
     */
     /*
      * this value holds a reference to an image that has the bowshock marked up, this image will be used to show the bowshock to the user
      * if this image is a false image (does not contains a bowshock) this will be null
      */
    private $markedHsvImage;

    /**
     * Set markedRgbImage
     *
     * @param string $markedRgbImage
     * @return Image
     */
    public function setMarkedRgbImage($markedRgbImage)
    {
        $this->markedRgbImage = $markedRgbImage;

        return $this;
    }

    /**
     * Get markedRgbImage
     *
     * @return string 
     */
    public function getMarkedRgbImage()
    {
        return $this->markedRgbImage;
    }

    /**
     * Set markedCoolImage
     *
     * @param string $markedCoolImage
     * @return Image
     */
    public function setMarkedCoolImage($markedCoolImage)
    {
        $this->markedCoolImage = $markedCoolImage;

        return $this;
    }

    /**
     * Get markedCoolImage
     *
     * @return string 
     */
    public function getMarkedCoolImage()
    {
        return $this->markedCoolImage;
    }

    /**
     * Set markedHeatImage
     *
     * @param string $markedHeatImage
     * @return Image
     */
    public function setMarkedHeatImage($markedHeatImage)
    {
        $this->markedHeatImage = $markedHeatImage;

        return $this;
    }

    /**
     * Get markedHeatImage
     *
     * @return string 
     */
    public function getMarkedHeatImage()
    {
        return $this->markedHeatImage;
    }

    /**
     * Set markedHsvImage
     *
     * @param string $markedHsvImage
     * @return Image
     */
    public function setMarkedHsvImage($markedHsvImage)
    {
        $this->markedHsvImage = $markedHsvImage;

        return $this;
    }

    /**
     * Get markedHsvImage
     *
     * @return string 
     */
    public function getMarkedHsvImage()
    {
        return $this->markedHsvImage;
    }

    /**
     * Set rgbImagePath
     *
     * @param string $rgbImagePath
     * @return Image
     */
    public function setRgbImagePath($rgbImagePath)
    {
        $this->filePath = $filePath;

        return $this;
    }

    /**
     * Get rgbImagePath
     *
     * @return string 
     */
    public function getRgbImagePath()
    {
        return $this->rgbImagePath;
    }
    /**
     * Get coolImagePath
     *
     * @return string 
     */
    public function getCoolImagePath(){
        return $this->coolImagePath;
    }
    /**
     * Set coolImagePath
     *
     * @param string $coolImagePath
     * @return Image
     */
    public function setCoolImagePath($coolImagePath){
        $this->coolImagePath = $coolImagePath;

        return $this;
    }
    /**
     * Get heatImagePath
     *
     * @return string 
     */
    public function getHeatImagePath(){
        return $this->heatImagePath;
    }
    /**
     * Set heatImagePath
     *
     * @param string $heatImagePath
     * @return Image
     */
    public function setHeatImagePath($heatImagePath){
        $this->heatImagePath = $heatImagePath;

        return $this;
    }
    /**
     * Get hsvImagePath
     *
     * @return string 
     */
    public function getHsvImagePath(){
        return $this->hsvImagePath;
    }
    /**
     * Set hsvImagePath
     *
     * @param string $hsvImagePath
     * @return Image
     */
    public function setHsvImagePath($hsvImagePath){
        $this->hsvImagePath = $hsvImagePath;

        return $this;
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
