<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * GamificationType
 *
 * @ORM\Table(name="gamification_type")
 * @ORM\Entity(repositoryClass="AppBundle\Repositories\GamificationTypeRepository")
 */
class GamificationType
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
     * @var string
     *
     * @ORM\Column(name="name", type="text", length=255, nullable=false)
     */
    private $name;

      /**
     * @var string
     *
     * @ORM\Column(name="description", type="text", length=255, nullable=true)
     */
    private $description;

     /**
     * @var integer
     *
     * @ORM\Column(name="gamification_type_balance", type="integer")
     */
    private $gamificationTypeBalance;

    /**
     * Set name
     *
     * @param string $name
     * @return GamificationType
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set description
     *
     * @param string $description
     * @return GamificationType
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
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
     * Set gamificationTypeBalance
     *
     * @param integer $gamificationTypeBalance
     * @return GamificationType
     */
    public function setGamificationTypeBalance($gamificationTypeBalance)
    {
        $this->gamificationTypeBalance = $gamificationTypeBalance;

        return $this;
    }

    /**
     * Get gamificationTypeBalance
     *
     * @return integer 
     */
    public function getGamificationTypeBalance()
    {
        return $this->gamificationTypeBalance;
    }
}
