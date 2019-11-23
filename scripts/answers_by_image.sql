SELECT i.rgb_image_path,
	(SELECT count(*) FROM participant_response pr 
	WHERE  pr.type = 'real' AND pr.image_served_id = i.id AND pr.correct_answer = pr.participant_answer) AS correct_answers,
    (SELECT count(*) FROM participant_response pr 
	WHERE  pr.type = 'real' AND pr.image_served_id = i.id AND pr.correct_answer != pr.participant_answer) AS incorrect_answers
FROM  image i