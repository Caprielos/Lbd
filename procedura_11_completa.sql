
DROP PROCEDURE IF EXISTS `guida_tv`.`query_111`;

DELIMITER $

-- 11 > [Generazione della email giornaliera per un utente in base alle sue preferenze] < --
CREATE PROCEDURE `guida_tv`.`query_111` (IN email_param VARCHAR(64), OUT result TEXT)

-- NO GESTISCO LA FASCIA ORARIA

BEGIN

	DECLARE canPref TEXT; -- QUERY
	DECLARE intro TEXT; -- "Le ricordiamo che oggi al canale : "
    DECLARE prima_parte TEXT; -- concat(intro,canPref)
    
	DECLARE prog TEXT;  -- QUERY
	DECLARE meta TEXT; -- " ci sarà in onda questo programma : "
    DECLARE seconda_parte TEXT; --  concat(meta,prog)
    
    DECLARE invece TEXT; -- " invece il suo programma preferito "
    DECLARE progPref TEXT;  -- QUERY
    DECLARE sara TEXT; -- " sarà in onda al canale : ";
    DECLARE terza_parte TEXT; 
    
    
    DECLARE r1 TEXT; -- concat(prima_parte, seconda_parte);
    DECLARE r2 TEXT; --  concat(invece,progPref)
    
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
    
    SET meta = " ci sarà in onda questo programma : ";
    SET prog = 
				(
				    SELECT prog.titolo FROM
                    `guida_tv`.`programma` prog
                    ORDER BY RAND() LIMIT 1 
				);
                
	SET seconda_parte =  concat(meta,prog);
    
    SET r1 = concat(prima_parte, seconda_parte); -- PRIMA PARTE DEL RISULTATO
    
	SET progPref = (	
					SELECT prog.titolo
					FROM `guida_tv`.`programma_preferito` progP
					JOIN `guida_tv`.`utente` u ON u.id = progP.id_utente
					JOIN `guida_tv`.`programma` prog ON progP.id_programma = prog.id
					WHERE u.id = (SELECT u.id FROM utente u WHERE u.email = email_param)
				   );
    
    IF (progPref != "") 
		THEN
			SET invece = " invece il suo programma preferito ";
			SET r2 = concat(invece,progPref);
            SET sara = " sarà in onda al canale : ";
            
            
                        
            
            SET result =concat(r1,r2);
            
		ELSE
			SET result = r1;
    END IF;       
		
END $

DELIMITER $

CALL `query_111` ("diegidiogabriele@gmail.com", @result);
SELECT @result;
















