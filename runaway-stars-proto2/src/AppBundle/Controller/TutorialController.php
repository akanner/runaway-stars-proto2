<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class TutorialController extends Controller
{
	 /**
     * @Route("tutorial/", name="tutorial-01")
     */
    public function indexAction(Request $request)
    {
    	$viewParams = array();

    	$viewParams["post_url"]= $this->generateUrl('tutorial-02', array(), true);;
        $viewParams["show_help"] = false;
    	return $this->render("tutorial/tutorial-first.html.twig",$viewParams);
    }

     /**
     * @Route("tutorial/2", name="tutorial-02")
     */
    public function step2(Request $request)
    {
       $viewParams["post_url"]= $this->generateUrl('tutorial-03', array(), true);;
        $viewParams["show_help"] = false;
        return $this->render("tutorial/tutorial-second.html.twig",$viewParams);
    }

     /**
     * @Route("tutorial/3", name="tutorial-03")
     */
    public function step3(Request $request)
    {
        $viewParams["post_url"]= $this->generateUrl('tutorial-04', array(), true);;
        $viewParams["show_help"] = false;
        return $this->render("tutorial/tutorial-third.html.twig",$viewParams);
    }

      /**
     * @Route("tutorial/4", name="tutorial-04")
     */
    public function step4(Request $request)
    {
        $viewParams["post_url"]= $this->generateUrl('tutorial-05', array(), true);;
        $viewParams["show_help"] = false;
        return $this->render("tutorial/tutorial-fourth.html.twig",$viewParams);
        }

    /**
     * @Route("tutorial/5", name="tutorial-05")
     */
    public function step5(Request $request)
    {
        $viewParams["post_url"]= $this->generateUrl('tutorial-06', array(), true);;
        $viewParams["show_help"] = false;
        return $this->render("tutorial/tutorial-fifth.html.twig",$viewParams);
    }

     /**
     * @Route("tutorial/6", name="tutorial-06")
     */
    public function step6(Request $request)
    {
        $viewParams["post_url"]= $this->generateUrl('trainingIndex', array(), true);;
        return $this->render("tutorial/tutorial-palettes.html.twig",$viewParams);
    }
}