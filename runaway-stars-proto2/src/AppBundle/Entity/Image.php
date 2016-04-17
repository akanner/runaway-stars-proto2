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
