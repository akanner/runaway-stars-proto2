<?php

namespace AppBundle\ViewObjects;
/**
* represents an image inside a view
*/
class ViewImage
{
	public $id;
	public $path;
	public $correct;
	function __construct($id,$path,$correct)
	{
		$this->id 		= $id;
		$this->path 	= $path;
		if($correct)
		{
			$this->correct	= "Correcta";
		}
		else
		{
			$this->correct = "Incorrecta";
		}
		
	}
}