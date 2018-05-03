use expo_ludica_db;
SELECT COUNT(*) FROM participant;
#total preguntas entrenamiento
SELECT COUNT(*) 
FROM participant_response
WHERE type='training';
#ttal preguntas entrenamiento contestadas correctamente
SELECT count(*) 
FROM participant_response
WHERE type='training' AND correct_answer=participant_answer;
#total preguntas que no dimos respuesta
SELECT COUNT(*) 
FROM participant_response
WHERE type='real';
#total preguntas correctas que no dimos respuesta
SELECT COUNT(*) 
FROM participant_response
WHERE type='real' AND correct_answer=participant_answer;
#total confianza
SELECT SUM(participant_confidence) FROM participant_session;
#total sesiones con repeticiones
SELECT COUNT(*) FROM participant_session WHERE next_session_id IS NOT NULL;