

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

    function getPointsForStarImage(starContainer)
    {
        answerContainer = $(starContainer).children(".answer")[0];
        isCorrect = $(answerContainer).children(".answerValue").text();
        if(isCorrect)
        {
            return getPointsForValidResponse();
        }
        else
        {
            return getPointsForInvalidResponse();
        }
    }