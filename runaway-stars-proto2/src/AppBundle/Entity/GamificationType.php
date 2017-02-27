<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use AppBundle\Utils\GamificationTypes;
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

    /**
     * Gets the path to the stadistics view corresponding to each gamification type
     *
     * TODO: subclassify GamificationType???
     *
     */
    public function getStadisticsView()
    {
        switch ($this->name) 
        {
            case GamificationTypes::GAMIFICATION_BADGES:
                return "logout/badges.html.twig";
            case GamificationTypes::GAMIFICATION_LEVEL:
                return "logout/levels.html.twig";
            case GamificationTypes::GAMIFICATION_NONE:
                return "logout/no-gamification.html.twig";
            case GamificationTypes::GAMIFICATION_POINTS:
                return "logout/points.html.twig";
            default:
                throw new \Exception("unknown gamification type:  $this->name");
        }
    }

    public function getPointsView()
    {
        switch ($this->name) 
        {
            case GamificationTypes::GAMIFICATION_POINTS:
                return "training/points.html.twig";
            default:
                return "training/no-points.html.twig";
        }
    }
}
