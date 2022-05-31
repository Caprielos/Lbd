DROP PROCEDURE IF EXISTS `query_8`;

DELIMITER $

CREATE PROCEDURE `query_8` ( IN nome_persona_param  VARCHAR(64), IN cognome_persona_param VARCHAR(64), IN titolo_programma_param VARCHAR(64))
       
BEGIN
		            
	IF (titolo_programma_param != "")
		THEN
			-- TROVO I FILM CON NOME, COGNOME, TITOLO
			SELECT prog.titolo FROM  `guida_tv`.programma prog
			JOIN  `guida_tv`.partecipa part ON part.id_programma = prog.id
			JOIN  `guida_tv`.persona pers ON part.id_persona = pers.id
			WHERE pers.id = (SELECT DISTINCT p.id FROM `guida_tv`.persona p WHERE p.nome = nome_persona_param AND p.cognome = cognome_persona_param)
			AND prog.titolo = titolo_programma_param;

		ELSE
			-- TROVO I FILM SOLO CON NOME, COGNOME
			SELECT prog.titolo FROM  `guida_tv`.programma prog
			JOIN  `guida_tv`.partecipa part ON part.id_programma = prog.id
			JOIN  `guida_tv`.persona pers ON part.id_persona = pers.id
			WHERE pers.id = (SELECT DISTINCT p.id FROM `guida_tv`.persona p WHERE p.nome = nome_persona_param AND p.cognome = cognome_persona_param);

		END IF;


END $

DELIMITER $

CALL `query_8` ("Amleto", "Di Salle", "");


				
            	-- SELECT DISTINCT * FROM `guida_tv`.persona p WHERE p.nome = nome_persona_param AND p.cognome = cognome_persona_param;

				-- SELECT DISTINCT * FROM programma prog JOIN partecipa aa ON aa.id_programma = prog.id 
				-- JOIN persona peopl ON peopl.nome = nome_persona_param AND peopl.cognome = cognome_persona_param AND prog.titolo = titolo_programma_param;
                
