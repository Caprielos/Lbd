DROP PROCEDURE IF EXISTS `query_8`;

DELIMITER $

CREATE PROCEDURE `query_8` ( IN nome_persona_param  VARCHAR(64), IN cognome_persona_param VARCHAR(64), IN titolo_programma_param VARCHAR(64), OUT result BOOLEAN )
       
BEGIN
	IF (titolo_programma_param != "" )
		THEN
			-- TROVO I FILM CON NOME,COGNOME,TITOLO
            
			SELECT * FROM programma prog JOIN partecipa aa ON aa.id_programma = prog.id 
            JOIN persona peopl ON peopl.nome = nome_persona_param AND peopl.cognome = cognome_persona_param AND prog.titolo = titolo_programma_param;
            
            SET result = true;
		ELSE
			-- TROVO I FILM SOLO CON NOME, COGNOME
			
            SELECT prog.titolo FROM `guida_tv`.programma prog
            JOIN `guida_tv`.partecipa aa ON aa.id_programma = prog.id 
            JOIN `guida_tv`.persona peopl ON peopl.nome = nome_persona_param AND peopl.cognome = cognome_persona_param;
            SET result = false;
            
		END IF;
END $

DELIMITER $

CALL `query_8` ("Amleto", "Di Salle", "", @res);
SELECT @res