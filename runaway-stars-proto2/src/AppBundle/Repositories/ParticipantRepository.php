<?php

namespace AppBundle\Repositories;

use Doctrine\ORM\EntityRepository;

/**
 * ParticipantRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class ParticipantRepository extends EntityRepository
{

    private function getParticipantNumber()
    {
            $query = $this->createQueryBuilder('participants')
              ->select('COUNT(participants)')
              ->getQuery();
        $count = $query->getSingleScalarResult();
        return $count+1;
    }

    public function getNextParticipantName()
    {
         $name = "usuario";
         $name = $name . $this->getParticipantNumber();

         return $name;
    }

    public function getNewParticipant()
    {
    }
}
