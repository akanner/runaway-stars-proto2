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
}
