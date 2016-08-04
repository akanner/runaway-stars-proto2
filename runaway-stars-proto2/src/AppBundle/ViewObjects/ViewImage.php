<?php

namespace AppBundle\ViewObjects;
/**
* represents an image inside a view
*/
class ViewImage
{
	public $id;
	public $path;
	public $text;
	public $correct;
	public $cssClass;

	function __construct($id,$path,$correct,$correctText="Correcta",$incorrectText="Incorrecta")
	{
		$this->id 		= $id;
		$this->path 	= $path;
		if($correct)
		{
			$this->text			= $correctText;
			$this->correct		= "true";
			$this->cssClass		= "bg-success";
		}
		else
		{
			$this->text 		= $incorrectText;
			$this->correct		= "false";
			$this->cssClass		= "bg-danger";
		}
		
	}
}