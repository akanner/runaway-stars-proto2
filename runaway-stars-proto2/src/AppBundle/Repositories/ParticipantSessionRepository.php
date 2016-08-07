<?php

namespace AppBundle\Repositories;

use Doctrine\ORM\EntityRepository;

/**
 * ParticipantSessionRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class ParticipantSessionRepository extends EntityRepository
{
	public function getTotalRows()
	{
		$qb = $this->createQueryBuilder('session');
		$qb->select('COUNT(session)');

		$count = $qb->getQuery()->getSingleScalarResult();
		return $count;
	}

	public function getTotalSessionsUsingGamificationType($gamType)
	{
		$query = $this->createQueryBuilder('session')
			  ->select('COUNT(session)')
              ->where('session.gamification_type = :gType')
              ->setParameter('gType', $gamType)
              ->getQuery();
        $count = $query->getSingleScalarResult();
		return $count;
	}
}
