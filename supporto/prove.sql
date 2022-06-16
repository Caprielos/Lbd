 -- INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-30', '01:59:00', '04:00:00', '1', '1');
 -- INSERT INTO `guida_tv`.`palinsesto` (`giorno`, `ora_inizio`, `ora_fine`, `id_canale`, `id_programma`) VALUES ('2022-06-30', '00:00:00', '00:00:00', '1', '1');

 -- CALL `guida_tv`.inserisci_film("Rambo 1", '01:15:00', "Rambo contro tutti", '2000-07-17', "Path esterno", "Produttore 2", NULL);
-- CALL `guida_tv`.inserisci_film("Rocky", '01:41:00', "Pugilato", '2000-08-17', "Path esterno", "Produttore 1", NULL, @res);
-- CALL `guida_tv`.inserisci_film("Aladino", '02:00:00', "Deserto", '2000-09-17', "Path esterno", "Produttore 2", NULL, @res);
-- CALL `guida_tv`.inserisci_film("Io sono leggenda", '02:50:00', "Uno contro zombie", '2000-010-17', "Path esterno", "Produttore 3", NULL, @res);   
-- CALL `guida_tv`.inserisci_film("Film 1", '01:00:00', "Descrizione 1", '2000-10-17', "Path esterno", "Produttore 4", NULL, @res);

-- CALL `guida_tv`.inserisci_canale("Rai 1","1");
       


DELETE FROM `guida_tv`.`programma` 
WHERE programma.id = ANY (
SELECT programma.id FROM programma
JOIN palinsesto ON palinsesto.id_programma = programma.id
WHERE palinsesto.giorno < DATE_SUB(curdate(), INTERVAL 1 WEEK)
);

	SELECT DISTINCT can.nome, COUNT(*)
                    
	FROM `guida_tv`.palinsesto pal 
    
	JOIN `guida_tv`.canale can ON pal.id_canale = can.id
	JOIN `guida_tv`.possiede pos ON pos.id_programma = pal.id_programma 
    JOIN `guida_tv`.programma prog ON prog.id = pal.id_programma
    WHERE pal.giorno = (giorno_param)
    GROUP BY can.nome;
    


