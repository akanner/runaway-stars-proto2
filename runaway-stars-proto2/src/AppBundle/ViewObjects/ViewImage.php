<?php

namespace AppBundle\ViewObjects;
/**
* represents an image inside a view
*/
class ViewImage
{
	public $id;
	public $path;
	function __construct($id,$path)
	{
		$this->id = $id;
		$this->path = $path;
	}
}