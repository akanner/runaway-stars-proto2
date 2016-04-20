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
	public $cssClass;

	function __construct($id,$path,$correct)
	{
		$this->id 		= $id;
		$this->path 	= $path;
		if($correct)
		{
			$this->correctText	= "Correcta";
			$this->correct		= "true";
			$this->cssClass		= "bg-success";
		}
		else
		{
			$this->correctText 	= "Incorrecta";
			$this->correct		= "false";
			$this->cssClass		= "bg-danger";
		}
		
	}
}