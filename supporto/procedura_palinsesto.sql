DROP PROCEDURE IF EXISTS `guida_tv`.`genera_palinsesto`;
DROP PROCEDURE IF EXISTS `guida_tv`.`validate_palinsesto`;

DELIMITER $

-- > [Generazione del palinsesto.] < -- 
CREATE PROCEDURE `genera_palinsesto`(IN giorno_param DATE, IN ora_inizio_param TIME,  IN ora_fine_param TIME, IN id_canale_param INTEGER, IN id_programma_param INTEGER)
BEGIN
		INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`)
        VALUES (giorno_param, ora_inizio_param, ora_fine_param , id_canale_param, id_programma_param);
END $


-- > [Procedura per controllare se ci sono 2 palinsesti nello stesso momento nello stesso canale.] < --
-- > [Procedura per controllare se l'orario di fine è valido.] < --
-- > [Procedura per controllare se creo un palinsesto che ha data maggiore di oggi + 7.] < --
-- > [Procedura per controllare se creo un palinsesto che ha data minore di oggi.] < --
CREATE PROCEDURE `validate_palinsesto`(
	IN giorno_param DATE,
    IN ora_inizio_param TIME,
    IN ora_fine_param TIME,
    IN id_canale_param INTEGER,
    IN id_programma_param INTEGER
)

BEGIN

	IF EXISTS (SELECT * FROM `guida_tv`.`palinsesto` p WHERE p.giorno = giorno_param AND p.ora_inizio = ora_inizio_param 
																				   AND p.ora_fine = ora_fine_param AND p.id_canale = id_canale_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Questo orario è già occupato da un altro programma';
	END IF;
	
    IF (ora_inizio_param + (SELECT prog.durata FROM `guida_tv`.`programma` prog WHERE prog.id = id_canale_param) > ora_fine_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Hai sbagliato a inserire l\'orario di fine';
	END IF;
    
        IF ( (SELECT p.ora_fine FROM `guida_tv`.`palinsesto` p WHERE p.giorno = giorno_param AND p.id_canale = id_canale_param) > ora_inizio_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi inserire questo programma nell\' nello spazio di un altro';
	END IF;
    
	IF (giorno_param > (curdate() + 7) )
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi programmare un palinsesto così in avanti';
	END IF;
    
	IF (giorno_param < curdate() )
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi programmare un palinsesto per giorni precedenti a oggi';
	END IF;
    
    
END$



DELIMITER $


