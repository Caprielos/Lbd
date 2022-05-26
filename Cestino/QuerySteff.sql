SELECT pr.titolo, pr.descizione 
FROM canale c inner JOIN palinsesto p 
ON p.id_canale = c.id and c.nome = "rai1"
inner join comprende co 
on co.id_palinsesto = p.id
INNER join programma pr
on co.id_programma = pr.id
ORDER BY c.nome ASC;