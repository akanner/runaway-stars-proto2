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
}
