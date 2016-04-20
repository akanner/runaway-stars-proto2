<?php

namespace AppBundle\ViewObjects;
/**
* represents an image inside a view
*/
class ViewImage
{
	public $id;
	public $path;
	public $correctText;
	public $correct;

	function __construct($id,$path,$correct)
	{
		$this->id 		= $id;
		$this->path 	= $path;
		if($correct)
		{
			$this->correctText	= "Correcta";
			$this->correct		= "true";
		}
		else
		{
			$this->correctText 	= "Incorrecta";
			$this->correct		= "false";
		}
		
	}
}