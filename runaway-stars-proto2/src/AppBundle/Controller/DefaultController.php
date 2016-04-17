<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

//entities

use AppBundle\Entity\Participant;
use AppBundle\Entity\ParticipantResponse;
use AppBundle\Entity\ParticipantSession;

//view objects 
use AppBundle\ViewObjects\ViewImage;

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

    private function getViewImages($images)
    {
        $viewImages = array();
        foreach ($images as $img) 
        {
            $viewImages[] = new \AppBundle\ViewObjects\ViewImage($img->getId(),$this->getImageUrl($img->getFilePath()));
        }


        return $viewImages;
    }

    /**
     * checks if the participant is logged
     */
    private function isUserLogged($request)
    {

        $session = $request->getSession();
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
        $isUserLogged = $this->isUserLogged($request);
        if(!$isUserLogged)
        {
            return $this->render('default/login.html.twig');
        }

        //get the images
        //it would be better if this controller is defined as a service as well
        //gets the image repository from the IoC container
        $imageRepository = $this->get("imagesRepository");
        $randomImages = $imageRepository->getRandomImages();
        //builds view's parameters
        $viewParams = array();
        //gets the images's paths and passes them to the view
        $viewParams["images"] = $this->getViewImages($randomImages);
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
        $isUserLogged = $this->isUserLogged($request);
        if(!$isUserLogged)
        {

            //stores user's name in the session
            $session = $request->getSession();
            $username = $request->request->get("username");
            $session->set("username",$username);
            $session->set("logged",true);

            //creates user and session in the database
            $participant        = Participant::createWithName($username);
            $participantSession = ParticipantSession::createWith($session->getId(),new \Datetime("now"),$participant);
            $participant->setSession($participantSession);
            //it would be better if this controller is defined as a service as well
            //gets the em from the IoC container
            //doctrine.orm.default_entity_manager
            $em = $this->get("doctrine.orm.default_entity_manager");
            $em->persist($participant);
            $em->persist($participantSession);
            $em->flush();

            $session->set("user-session",$participantSession);
        }
        //-------------------------------------------------------------------

       

        //redirects to the home
        return $this->redirect("/");
    }
}
