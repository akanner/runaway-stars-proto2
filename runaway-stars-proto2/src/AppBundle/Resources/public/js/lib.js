

    function addPointsFor(starContainer)
    {
        currentScore = getCurrentScore();
        points       = getPointsForStarImage(starContainer);

        currentScore = parseInt(currentScore);
        points       = parseInt(points);
        setCurrentScore(currentScore + points);

    }

    function getCurrentScore()
    {
        return $("#score").text();
    }

    function setCurrentScore(points)
    {
        $("#score").text(points);
    }

    function getPointsFor(reqPoints)
    {
        pointsDiv       = $("#div-points");
        selector        = "#" + reqPoints;
        requiredPoints  = pointsDiv.children(selector);

        return requiredPoints.text();
    }

    function getPointsForValidResponse()
    {
        return getPointsFor("correct-points");
    }

    function getPointsForInvalidResponse()
    {
        return getPointsFor("incorrect-points");
    }

    function isStarContainerCorrect(starContainer)
    {
        answerContainer = $(starContainer).find(".answer")[0];
        isCorrect = $($(answerContainer).find(".answerValue")[0]).text();
        isCorrect = "true" == isCorrect;

        return isCorrect;
    }

    function getPointsForStarImage(starContainer)
    {
        isCorrect = isStarContainerCorrect(starContainer)
        if(isCorrect)
        {
            return getPointsForValidResponse();
        }
        else
        {
            return getPointsForInvalidResponse();
        }
    }

    function showResponse(starContainer,trainingMode)
    {
	  
      //will show all the answers texts
      if(trainingMode)
      {
        //this will show the text of the three images
      	starContainer = starContainer.parent().children();
      }
      
      starContainer.each(
      	function(i,starContainer)
      		{
                //shows the text under the image
      			$(starContainer).find(".answer").removeClass("hidden");
                //shows the bow in the image
                isCorrect = isStarContainerCorrect(starContainer);
                if(isCorrect)
                {
                    //chage the src of the image to the marked up one
                    newSrc = $(starContainer).find(".marked-image").prop("src");
                    $(starContainer).find(".star-image").prop("src",newSrc)
                }
                
      		});
    }

    function isInTrainingMode()
    {
    	return $("#tmode").text();
    }