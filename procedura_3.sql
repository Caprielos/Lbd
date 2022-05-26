DROP PROCEDURE IF EXISTS `query_3`;

DELIMITER $

CREATE PROCEDURE `query_3` ( IN nome_canale_param VARCHAR(64), OUT result BOOLEAN)

BEGIN
	
    DECLARE x INTEGER UNSIGNED;
    SET x =  (SELECT c.id FROM canale c WHERE nome_canale_param = c.nome); -- HO L' ID DEL CANALE
    
    -- SELECT * FROM programma prog JOIN palinsesto pal ON prog.id = pal.id_programma JOIN canale can ON can.id = pal.id_canale WHERE pal.giorno = curdate()
 
    
     SELECT * FROM programma prog JOIN palinsesto pal ON prog.id = pal.id_programma JOIN canale can ON can.id = pal.id_canale
     JOIN possiede aa ON aa.id_programma = pal.id_programma JOIN genere gen ON gen.id = aa.id_programma WHERE pal.giorno = curdate() ;
    
	SET result = true;
    
END $

DELIMITER $

CALL `query_3` ("Rai 1", @res);
SELECT @res


-- SELECT * FROM canale c JOIN palinsesto p  ON p.id_canale = c.id JOIN programma pr ON pr.id = p.id;

-- SELECT c.id FROM canale c WHERE "Rai 1" = c.nome -- CON QUESTA MI PRENDO IL CANALE
    
-- SELECT c.nome FROM canale c JOIN palinsesto p  ON p.id_canale = x;
    
-- SELECT pr.titolo FROM canale c JOIN palinsesto p ON p.id_canale = x JOIN programma pr ON p.id_programma = pr.id; 