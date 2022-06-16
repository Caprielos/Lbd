DROP EVENT `entity_update`;

DELIMITER $

CREATE 
    EVENT `entity_update` 
    ON SCHEDULE EVERY 7 DAY STARTS '2022-06-01 03:00:00'
    
    DO BEGIN    
		
		DECLARE id_programma_da_cancellare INTEGER UNSIGNED;
        DECLARE id_palinsesto_da_cancellare INTEGER UNSIGNED;
        
        -- QUERY GIUSTA
		SELECT prog.titolo, pal.id
		FROM `guida_tv`.`programma` prog
		JOIN `guida_tv`.`palinsesto` pal ON pal.id_programma =prog.id
		WHERE pal.giorno < DATE_SUB(curdate(), INTERVAL 1 WEEK);

        

	

        
        -- MI DEVO PRENDERE IL FILM DAL PALINSESTO PIU PICCOLO E POI VEDERE 
        -- SE LUI NON STA NEI PALINSESTI PER 7 GIORNI SUCCESSIVI E POI SE NON CI STA LO POSSO CANCELLARE
        
        
        
        	SELECT
    concat('[',
        GROUP_CONCAT(
            JSON_ARRAY(    
                'id', prog.id
                )
            SEPARATOR ',')
    ,']')
   FROM `guida_tv`.`programma` prog
   JOIN `guida_tv`.`palinsesto` pal ON pal.id_programma =prog.id
   WHERE pal.giorno < DATE_SUB(curdate(), INTERVAL 1 WEEK);
   
        
        
		

    END $
DELIMITER $;