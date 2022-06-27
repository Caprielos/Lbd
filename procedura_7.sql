DROP PROCEDURE IF EXISTS `guida_tv`.`query_7`;

DELIMITER $

-- 7 > [Ricerca dei film di un certo genere in programma nei prossimi sette giorni.] < --
CREATE PROCEDURE `guida_tv`.`query_7` ( IN genere_param VARCHAR(64) )

BEGIN
	
	SELECT DISTINCT	pal.giorno,
					prog.titolo,
					prog.durata,
					prog.descizione,
					prog.anno_uscita,
					prog.stagione,
					prog.episodio,
					prog.produttore,
					prog.descrizione_episodio
                    
	FROM `guida_tv`.programma prog 
	JOIN `guida_tv`.palinsesto pal ON pal.id_programma = prog.id
	JOIN `guida_tv`.possiede aa ON aa.id_programma = prog.id
	JOIN `guida_tv`.genere gen ON gen.id = aa.id_genere 
	WHERE gen.id = (SELECT g.id FROM `guida_tv`.genere g WHERE g.nome = genere_param)
    AND pal.giorno >= curdate() AND pal.giorno <= date_add(curdate(), INTERVAL 7 DAY);
         
END $

DELIMITER $
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Animazione');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Avventura');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Biografico');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Comico');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Commedia');

INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Drammatico');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Fantascienza');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Fantasy');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Giallo');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Guerra');

INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Horror');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Spionaggio');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Storico');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Western');
INSERT INTO `guida_tv`.`genere` (`nome`) VALUES ('Erotico');
CALL `query_7` ("Guerra");