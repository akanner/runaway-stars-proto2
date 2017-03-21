<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

use AppBundle\Entity\Participant;
use AppBundle\Entity\ParticipantResponse;
use AppBundle\Entity\ParticipantSession;

//view objects
use AppBundle\ViewObjects\ViewImage;

use AppBundle\Utils\GamificationTypes;
use AppBundle\Utils\UserAnswerEnum;

class TaskController extends BaseController
{
    const STEP                      = "task-number";

    const MAX_STEPS                 = "max-tasks";

     /**
     * @Route("task/", name="taskIndex")
     */
    public function indexAction(Request $request)
    {
        //checks if the user is logged
        //TODO use a interceptor,filter or something to check session ending
        //-------------------------------------------------------------------
        $isUserLogged = $this->isUserLogged($request);
        if(!$isUserLogged)
        {
            return $this->redirectToDefault();
        }
           //creates and saves the user response in the session, when the user answer us, it will be save in the db
        $session = $request->getSession();
        //this should be injected, to do this, that controller should be declared as a service
        $em = $this->getEntityManager();
        $userSession = $this->deserializeParticipantSessionEntityFromHttpSession($session);
        //gets the images's paths and passes them to the view
        $taskImage = $this->getTasksForQuestion($request);
        $participantResponse = ParticipantResponse::createFromSessionAndImages($userSession,$taskImage);
        $this->serializeResponseIntoHttpSession($session,$participantResponse);

        $currentStep = $session->get(static::STEP);
        //builds view's parameters
        $viewParams = array();
        //answer points

        $viewParams["images"] = $this->getViewImages($taskImage);
        //gets current and max steps
        $currentStep==1 ? $viewParams["show_help"]="true" : $viewParams["show_help"] = "";
        $viewParams["post_url"]      = $this->generateUrl('processResponse', array(), true);
        $viewParams["finish_url"]    = $this->generateUrl('endTasks', array(), true);

        //looks in the http session the view to show (with or without points)
        return $this->render("task/real-tasks-index.html.twig", $viewParams);
    }

    /**
     * @Route("task/processResponse", name="processResponse")
     */
    public function processResponse(Request $request)
    {
        //TODO use synfony's forms validations
        $userSubmission = $request->request->get("answer");
        $requestIsValid = isset($userSubmission) && UserAnswerEnum::isValidValue(intval($userSubmission));

        //if the session has ended
        //TODO use a interceptor,filter or something to check session ending
        $isUserLogged = $this->isUserLogged($request);

        if(!$isUserLogged || !$requestIsValid)
        {
            return $this->redirectToTasks();
        }

        $imageRepository =$this->get(static::IMAGES_REPO);
        $session = $request->getSession();
        $this->advanceNextStep($session);
        //this should be injected, to do this, this controller should be declared as a service
        $em = $this->getEntityManager();

        //gets the user response previously stored in the session, remember, this user response was not really answered yet
        $userResponse = $this->deserializeParticipantResponseFromHttpSession($session);
        //sets the user's actual response and saves it in the database
        $userResponse->setParticipantAnswer($userSubmission);

        $em->persist($userResponse);
        $em->flush();

        return $this->showNextTask($session);
    }
    /**
     * @Route("task/logout", name="endTasks")
     */
    public function logout(Request $request)
    {
    	$session = $request->getSession();
        //sets the user session as finished
        $userSession = $this->deserializeParticipantSessionEntityFromHttpSession($session);
        $userSession->setEndedAt(new \Datetime('now'));
        $em = $this->getEntityManager();
        $em->persist($userSession);
        $em->flush();
        //
        $session->clear();
        $viewParams = [];
        $viewParams["back_url"] = $this->generateUrl('homepage', array(), true);
        return $this->render("task/logout.html.twig",$viewParams);
    }

     private function getTasksForQuestion($request)
     {
     	//it would be better if this controller is defined as a service as well
        //gets the image repository from the IoC container
        $imageRepository = $this->get(static::IMAGES_REPO);
        return $imageRepository->findRandomImage();
     }

     private function advanceNextStep($session)
    {
        $currentStep = $session->get(static::STEP);
        $nextStep    = $currentStep + 1;
        $session->set(static::STEP,$nextStep);
    }


    /**
     * shows the next task or ends the questionaire depending of the number of task completed and the max of tasks defined
     *
     */
    private function showNextTask($session)
    {
        return $this->redirectToURL("taskIndex");
    }

    
}