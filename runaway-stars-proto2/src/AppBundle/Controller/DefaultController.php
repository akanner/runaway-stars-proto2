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
     * session key that holds the user's session object
     */
    const USER_SESSION_SESSION_KEY  = "user-session";

    const USER_RESPONSE_SESSION_KEY = "user-response";

    /**
     * TODO inject it into a variable
     */
    const IMAGES_REPO               = "imagesRepository";

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
        $imageRepository = $this->get(static::IMAGES_REPO);
        $randomImages = $imageRepository->getRandomImages();
        //creates and saves the user response in the session, when the user answer us, it will be save in the db
        $session = $request->getSession();
        //this should be injected, to do this, this controller should be declared as a service
        $em = $this->get("doctrine.orm.default_entity_manager");

        $userSession = $this->deserializeEntityIntoTheSession($session,static::USER_SESSION_SESSION_KEY,$em);
        $participantResponse = ParticipantResponse::createFromSessionAndImages($userSession,$randomImages);
        $this->serializeEntityIntoTheSession($session,static::USER_RESPONSE_SESSION_KEY,$em,$participantResponse);








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
        //TODO server-side validations
        
        $userSubmission = $request->request->get("answer");
        $imageRepository =$this->get(static::IMAGES_REPO);
        //this should be injected, to do this, this controller should be declared as a service
        $em = $this->get("doctrine.orm.default_entity_manager");
        $imageSelected = $imageRepository->findOneById($userSubmission);

        //gets the user response previously stored in the session, remember, this user response was not really answered yet
        $session = $request->getSession();
        $userResponse = $this->deserializeEntityIntoTheSession($session,static::USER_RESPONSE_SESSION_KEY,$em);
        //sets the user's actual response and saves it in the database
        $userResponse->setSelectedImage($imageSelected);
        
        $em->persist($userResponse);
        $em->flush($userResponse);

        //redirects the user to another question
        return $this->redirect("/");
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

            $this->serializeEntityIntoTheSession($session,static::USER_SESSION_SESSION_KEY,$em,$participantSession);
        }
        //-------------------------------------------------------------------

       

        //redirects to the home
        return $this->redirect("/");
    }

    //http://doctrine-orm.readthedocs.org/projects/doctrine-orm/en/latest/cookbook/entities-in-session.html
    private function serializeEntityIntoTheSession($session,$key,$em,$entity)
    {
        $em->detach($entity);
        $session->set($key,$entity);
    }
    //http://doctrine-orm.readthedocs.org/projects/doctrine-orm/en/latest/cookbook/entities-in-session.html
    private function deserializeEntityIntoTheSession($session,$key,$em)
    {
        $entity = $session->get($key);
        $entity = $em->merge($entity);
        return $entity;
    }
}
