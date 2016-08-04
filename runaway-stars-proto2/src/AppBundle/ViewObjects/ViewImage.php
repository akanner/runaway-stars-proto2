<?php

namespace AppBundle\ViewObjects;
/**
* represents an image inside a view(DTO), this object not only will have the paths to the image it self but also the css properties of the html object
*/
class ViewImage
{
	public $id;
	public $path;
	public $text;
	public $correct;
	public $cssClass;
	public $markedBowshockImage;

	function __construct($id,$path,$correct,$correctText="Correcta",$incorrectText="Incorrecta",$markedBowshockImage=null)
	{
		$this->id 					= $id;
		$this->path 				= $path;
		$this->markedBowshockImage  = $markedBowshockImage;
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