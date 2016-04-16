<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{

    /**
     * gets gets the URL of an image
     *
     * @param string    $imageName     image's name
     *
     * @return string image's URL
     *
     */
    private function getImageUrl($imageName)
    {
     return $this
        ->get('templating.name_parser')
        ->parse("images/$imageName")
        ->getPath();
    }

    /**
     * checks if the participant is logged
     */
    private function isUserLogged()
    {
        $session = $this->getRequest()->getSession();
        $isUserLogged = $session->get("logged");

        return $isUserLogged;
    }

    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        //checks if the user is logged
        //needs to be moved to an interceptor, filter, or use a bundle
        //-------------------------------------------------------------------
        $isUserLogged = $this->isUserLogged();
        if(!$isUserLogged)
        {
            return $this->render('default/login.html.twig');
        }

        //get the images
        $firstImage  = $this->getImageUrl("1.jpg");
        $secondImage = $this->getImageUrl("2.jpg");
        $thirdImage  = $this->getImageUrl("3.jpg");
        //builds view's parameters
        $viewParams = array();
        $viewParams["images"] = array($firstImage,$secondImage,$thirdImage);
        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', $viewParams);
    }

    


    /**
     * @Route("/processResponse", name="processResponse")
     */
    public function processResponse(Request $request)
    {
        $userSubmission = $request->request->get("answer");
        var_dump($userSubmission);exit;
    }

    /**
     * registers user's information
     *
     */
     /**
     * @Route("/logInUser", name="logInUser")
     */
    public function logInUser(Request $request)
    {
        //needs to be moved to an interceptor, filter, or use a bundle
        //-------------------------------------------------------------------
       
        //if the user is already logged, we redirect it to the home page
        $isUserLogged = $this->isUserLogged();
        if(!$isUserLogged)
        {

            //stores user's name in the session
            $session = $this->getRequest()->getSession();
            $username = $request->request->get("name");
            $session->set("username",$username);
            $session->set("logged",true);

            //creates user and session in the database
            
        }
        //-------------------------------------------------------------------

       

        //redirects to the home
        return $this->redirect("/");
    }
}
