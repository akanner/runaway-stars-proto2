

    function addPointsFor(userAnswer)
    {
        currentScore = getCurrentScore();
        points       = getPointsForUserResponse(userAnswer);

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

    function isUserAnswerCorrect(starContainer,userAnswer)
    {
        var correctAnswer = isThereARunawayStarInTheImage(starContainer);
        var isCorrect = correctAnswer == userAnswer;

        return isCorrect;
    }

    function isThereARunawayStarInTheImage(starContainer)
    {
        var answerContainer = $(".answer");
        var isThereARunAwayStar = $($(answerContainer).find(".answerValue")[0]).text();
        return isThereARunAwayStar == "1";
    }

    function getPointsForUserResponse(userAnswer)
    {
        if(userAnswer)
        {
            return getPointsForValidResponse();
        }
        else
        {
            return getPointsForInvalidResponse();
        }
    }

    function showResponse(starContainer,userAnswer,trainingMode)
    {
        if(userAnswer=="2")
        {
            //the user answered "no estoy seguro"
            $("#answerTextDontKnow").removeClass("hidden");
        }
        else
        {
             var isCorrect = isUserAnswerCorrect(starContainer,userAnswer);
            if(isCorrect)
            {

                $("#answerTextRight").removeClass("hidden");
            }
            else
            {
                $("#answerTextWrong").removeClass("hidden");
            }
        }
       
        //chage the src of the image to the marked up one
        if(isThereARunawayStarInTheImage(starContainer))
        {
            $.each(starContainer,function(x,container){
                var newSrc = $(container).find(".marked-image").prop("src");
                $(container).find(".star-image").prop("src",newSrc);
            })
            
        }

        //adds points
        addPointsFor(isCorrect);
}

    function isInTrainingMode()
    {
    	return $("#tmode").text();
    }