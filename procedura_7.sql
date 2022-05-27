DROP PROCEDURE IF EXISTS `query_7`;

DELIMITER $

CREATE PROCEDURE `query_7` ( IN genere_param VARCHAR(64) )

BEGIN
	
	SELECT prog.titolo,
		   prog.durata,
           prog.descizione,
           prog.anno_uscita,
           prog.stagione,
           prog.episodio,
           prog.produttore,
           prog.descrizione_episodio
    FROM programma prog 
		JOIN palinsesto pal ON pal.id_programma = prog.id
		JOIN possiede aa ON aa.id_programma = prog.id
		JOIN genere gen ON gen.id = aa.id_genere 
	WHERE gen.id = (SELECT g.id FROM genere g WHERE g.nome = genere_param) AND pal.giorno >= curdate() AND pal.giorno <= date_add(curdate(), INTERVAL 7 DAY);
         
END $

DELIMITER $


CALL `query_7` ("Giallo");