<?php

namespace AppBundle\Repositories;

use Doctrine\ORM\EntityRepository;

/**
 * AnswerPointsRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */

const MAX_NUMBER_QUIESTION_PARAM = "MAX_QUESTIONS";
class AppParameterRepository extends EntityRepository
{

	/**
	 * Gets the max number of task per session
	 *
	 * @return int max number of questions
	 *
	 */
	public function getMaxNumberOfQuestions()
	{
		$maxQuestionsParam = $this->findOneByKey("MAX_QUESTIONS");
		//gets the parameter's value
		$maxQuestions = $maxQuestionsParam->getValue();
		return intval($maxQuestions);
	}

	public function getCorrectAnswerText()
	{
		$correctText = $this->findOneByKey("CORRECT_ANSWER_TEXT")->getValue();
		return $correctText;
	}

	public function getIncorrectAnswerText()
	{
		$incorrectText = $this->findOneByKey("INCORRECT_ANSWER_TEXT")->getValue();
		return $incorrectText;
	}

	public function getLevelsBeginnerText()
	{
		return $this->findOneByKey("LEVELS_BEGINNER_TEXT")->getValue();
	}

	public function getLevelsBeginnerLegend()
	{
		return $this->findOneByKey("LEVELS_BEGINNER_LEGEND")->getValue();
	}

	public function getLevelsIntermediateText()
	{
		return $this->findOneByKey("LEVELS_INTERMEDIATE_TEXT")->getValue();
	}

	public function getLevelsIntermediateLegend()
	{
		return $this->findOneByKey("LEVELS_INTERMEDIATE_LEGEND")->getValue();
	}

	public function getLevelsExpertText()
	{
		return $this->findOneByKey("LEVELS_EXPERT_TEXT")->getValue();
	}

	public function getLevelsExpertLegend()
	{
		return $this->findOneByKey("LEVELS_EXPERT_LEGEND")->getValue();
	}

	public function getBadgesBeginnerLegend()
	{
		return $this->findOneByKey("BADGES_BEGINNER_LEGEND")->getValue();
	}

	public function getBadgesIntermediateLegend()
	{
		return $this->findOneByKey("BADGES_INTERMEDIATE_LEGEND")->getValue();
	}

	public function getBadgesExpertLegend()
	{
		return $this->findOneByKey("BADGES_EXPERT_LEGEND")->getValue();
	}

	public function getBadgesBeginnerBadge()
	{
		return $this->findOneByKey("BADGES_BEGINNER_BADGE")->getValue();
	}

	public function getBadgesIntermediateBadge()
	{
		return $this->findOneByKey("BADGES_INTERMEDIATE_BADGE")->getValue();
	}

	public function getBadgesExpertBadge()
	{
		return $this->findOneByKey("BADGES_EXPERT_BADGE")->getValue();
	}

	public function findOneByKey($key)
	{
		$entity = parent::findOneByKey($key);
		if(!$entity)
		{
			throw new Exception("AppParameter '$key' NOT FOUND", 1);
		}

		return $entity;
	}
}
