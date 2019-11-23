SELECT i.rgb_image_path,count(*) 
FROM participant_response pr INNER JOIN image i ON (pr.image_served_id = i.id) and pr.type = 'real'
WHERE pr.correct_answer = pr.participant_answer 
GROUP BY pr.image_served_id