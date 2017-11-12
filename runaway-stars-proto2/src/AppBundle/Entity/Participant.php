<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Participant
 *
 * @ORM\Table(name="participant")
 * @ORM\Entity(repositoryClass="AppBundle\Repositories\ParticipantRepository")
 */
class Participant
{
    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=false)
     */
    private $name;

    /**
     * @var integer
     *
     * @ORM\Column(name="age", type="integer", nullable=true)
     */
    private $age;

    /**
     * @var string
     *
     * @ORM\Column(name="ocupation", type="string", length=45, nullable=true)
     */
    private $ocupation;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \AppBundle\Entity\ParticipantSession
     *
     * @ORM\OneToOne(targetEntity="AppBundle\Entity\ParticipantSession", mappedBy="participant")
     */
    private $session;



    public static function createWithNameAgeAndOcupation($username, $age, $ocupation)
    {
            $participant = new Participant();
            $participant->setName($username);
            $participant->setAge($age);
            $participant->setOcupation($ocupation);

            return $participant;
    }

    public static function createWithName($username)
    {
        $participant = new Participant();
        $participant->setName($username);

        return $participant;
    }

    /**
     * Set name
     *
     * @param string $name
     * @return Participant
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
     * Set age
     *
     * @param integer $age
     * @return Participant
     */
    public function setAge($age)
    {
        $this->age = $age;

        return $this;
    }

    /**
     * Get age
     *
     * @return integer
     */
    public function getAge()
    {
        return $this->age;
    }

    /**
     * Set ocupation
     *
     * @param string $ocupation
     * @return Participant
     */
    public function setOcupation($ocupation)
    {
        $this->ocupation = $ocupation;

        return $this;
    }

    /**
     * Get ocupation
     *
     * @return string
     */
    public function getOcupation()
    {
        return $this->ocupation;
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
     * Set session
     *
     * @param \AppBundle\Entity\ParticipantSession $session
     * @return Participant
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
     * @var string
     */
    private $zooniverseUsername;


    /**
     * Set zooniverseUsername
     *
     * @param string $zooniverseUsername
     *
     * @return Participant
     */
    public function setZooniverseUsername($zooniverseUsername)
    {
        $this->zooniverseUsername = $zooniverseUsername;

        return $this;
    }

    /**
     * Get zooniverseUsername
     *
     * @return string
     */
    public function getZooniverseUsername()
    {
        return $this->zooniverseUsername;
    }
}
