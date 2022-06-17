
DROP PROCEDURE IF EXISTS `guida_tv`.`query_111`;

DELIMITER $

-- 11 > [Generazione della email giornaliera per un utente in base alle sue preferenze] < --
CREATE PROCEDURE `guida_tv`.`query_111` (IN email_param VARCHAR(64), OUT result TEXT)

-- NO GESTISCO LA FASCIA ORARIA

BEGIN

	DECLARE canPref TEXT;
	DECLARE intro TEXT;
    DECLARE prima_parte TEXT;
    
	DECLARE progPref TEXT;
	DECLARE meta TEXT;
    DECLARE seconda_parte TEXT;
    
    SET intro = "Le ricordiamo che oggi al canale : ";
    SET canPref =
				(
					SELECT can.nome
                    FROM `guida_tv`.`canale_preferito` canP
					JOIN `guida_tv`.`utente` u ON u.id = canP.id_utente 
                    JOIN `guida_tv`.`canale` can ON canP.id_canale = can.id
					WHERE u.id = (SELECT u.id FROM utente u WHERE u.email = email_param)
                
				);
                
    SET prima_parte =  concat(intro,canPref);
    
    SET meta = "ci sarà in onda questo programma : ";
    SET progPref = 
				(
					SELECT prog.titolo
					FROM `guida_tv`.`programma_preferito` progP
					JOIN `guida_tv`.`utente` u ON u.id = progP.id_utente
					JOIN `guida_tv`.`programma` prog ON progP.id_programma = prog.id
					WHERE u.id = (SELECT u.id FROM utente u WHERE u.email = email_param)
				);
                
	SET seconda_parte =  concat(meta,progPref);
    
    SET result = concat(prima_parte, seconda_parte);
    
END $

DELIMITER $

CALL `query_111` ("diegidiogabriele@gmail.com", @result);
SELECT @result;
















