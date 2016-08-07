<?php

namespace AppBundle\ViewObjects;

/**
* this class is used to serialize a ParticipantResponse into the session
*/
class ParticipantResponseSerialized
{
	public $sessionId;
	public $correctImage;
	public $thirdImageServed;
	public $secondImageServed;
	public $firstImageServed;

	function __construct($participantResponse)
	{
		$this->sessionId 		= $participantResponse->getSession()->getId();
		$this->correctImage		= $participantResponse->getCorrectImage()->getId();
		$this->thirdImageServed	= $participantResponse->getThirdImageServed()->getId();
		$this->secondImageServed= $participantResponse->getSecondImageServed()->getId();
		$this->firstImageServed	= $participantResponse->getFirstImageServed()->getId();
	}
}