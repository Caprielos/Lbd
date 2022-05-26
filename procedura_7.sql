DROP PROCEDURE IF EXISTS `query_7`;

DELIMITER $

CREATE PROCEDURE `query_7` ( IN genere_param VARCHAR(64), OUT result BOOLEAN)

BEGIN
	
	 SELECT * FROM programma prog JOIN possiede aa ON aa.id_programma = prog.id
     JOIN genere gen ON gen.id = aa.id_programma WHERE gen.nome = genere_param;
         
	SET result = true;
    
END $

DELIMITER $


CALL `query_7` ("Montagna", @res);
SELECT @res