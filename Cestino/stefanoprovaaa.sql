 DROP PROCEDURE IF EXISTS `gattino`;
 DROP TABLE IF EXISTS new_tbl;
 DELIMITER $
 
 CREATE PROCEDURE `gattino`() 
 BEGIN
		DECLARE pid INTEGER UNSIGNED;
		DECLARE curs CURSOR FOR SELECT * FROM new_tbl;       
        
		CREATE TEMPORARY TABLE new_tbl SELECT prog.id
			FROM `guida_tv`.`programma` prog
			JOIN `guida_tv`.`palinsesto` pal ON pal.id_programma = prog.id
			WHERE pal.giorno < DATE_SUB(curdate(), INTERVAL 1 WEEK);

		OPEN curs;
		LOOP
			FETCH curs INTO pid;
			DELETE FROM `guida_tv`.`programma` WHERE (`id` = pid);
		END LOOP; 
        CLOSE curs;
END $

DELIMITER $
