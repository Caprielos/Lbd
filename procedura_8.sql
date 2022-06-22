DROP PROCEDURE IF EXISTS `guida_tv`.`query_8`;

DELIMITER $

-- 8 > [Ricerca dei programmi a cui partecipa a qualsiasi titolo (o con un titolo specificato) una certa persona.] < --
CREATE PROCEDURE `guida_tv`.`query_8` ( IN nome_persona_param  VARCHAR(64), IN cognome_persona_param VARCHAR(64), IN titolo_programma_param VARCHAR(64))
       
BEGIN
		            
	IF (titolo_programma_param != "")
		THEN
			-- Trovo i film con nome, cognome e titolo
			SELECT prog.titolo FROM  `guida_tv`.programma prog
			JOIN  `guida_tv`.partecipa part ON part.id_programma = prog.id
			JOIN  `guida_tv`.persona pers ON part.id_persona = pers.id
			WHERE pers.id = (SELECT DISTINCT p.id FROM `guida_tv`.persona p WHERE p.nome = nome_persona_param AND p.cognome = cognome_persona_param)
			AND prog.titolo = titolo_programma_param;

		ELSE
			-- Trovo i film solo con nome e cognome
			SELECT prog.titolo FROM  `guida_tv`.programma prog
			JOIN  `guida_tv`.partecipa part ON part.id_programma = prog.id
			JOIN  `guida_tv`.persona pers ON part.id_persona = pers.id
			WHERE pers.id = (SELECT DISTINCT p.id FROM `guida_tv`.persona p WHERE p.nome = nome_persona_param AND p.cognome = cognome_persona_param);

		END IF;

END $

DELIMITER $

CALL `query_8` ("Amleto", "Di Salle", "Signore Degli Anelli");

