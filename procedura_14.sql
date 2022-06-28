DROP PROCEDURE IF EXISTS `guida_tv`.`genera_palinsesto`;

DELIMITER $

-- > [Generazione del palinsesto.] < -- 
CREATE PROCEDURE `genera_palinsesto`(IN giorno_param DATE, IN ora_inizio_param TIME,  IN ora_fine_param TIME, IN id_canale_param INTEGER, IN id_programma_param INTEGER)
BEGIN

	DECLARE durata_programma TIME;
	DECLARE ultimate_ora_fine TIME;
    SET durata_programma = (SELECT prog.durata FROM `guida_tv`.`programma` prog WHERE prog.id = id_programma_param);
	SET ultimate_ora_fine = (SELECT p.ora_fine FROM `guida_tv`.`palinsesto` p WHERE p.id_canale = id_canale_param AND p.giorno = giorno_param ORDER BY p.ora_fine DESC LIMIT 1);
       
	IF (giorno_param > (curdate() + 7))
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi programmare un palinsesto così in avanti';    
	ELSEIF (giorno_param < curdate() )
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi programmare un palinsesto per giorni precedenti a oggi';
	ELSEIF (ora_inizio_param + durata_programma > ora_fine_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Hai sbagliato l\'orario di fine';
	ELSEIF (ultimate_ora_fine IS NOT NULL AND ultimate_ora_fine > ora_inizio_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi inserire un programma nello spazio di un altro';
	ELSEIF EXISTS 
		(SELECT DISTINCT p.id FROM `guida_tv`.`palinsesto` p WHERE p.giorno = giorno_param AND p.id_canale = id_canale_param 
														AND p.ora_inizio = ora_inizio_param AND p.ora_fine = ora_fine_param)
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi inserire un duplicato';
	END IF;
    
	INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`)
							VALUES (giorno_param, ora_inizio_param, ora_fine_param , id_canale_param, id_programma_param);
                            
END $

DELIMITER $

