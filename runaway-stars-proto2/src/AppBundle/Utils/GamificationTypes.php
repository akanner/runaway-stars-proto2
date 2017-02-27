<?php

namespace AppBundle\Utils;


class GamificationTypes
{
	const GAMIFICATION_LEVEL = "levels";
	const GAMIFICATION_BADGES = "badges";
	const GAMIFICATION_NONE	  = "none";
	const GAMIFICATION_POINTS = "points";


	public static function isAValidGamificationType($gamificationType)
	{
		$validTypes =  array(static::GAMIFICATION_LEVEL,static::GAMIFICATION_BADGES,static::GAMIFICATION_NONE,static::GAMIFICATION_POINTS);

		return in_array($gamificationType, $validTypes);
	}
}