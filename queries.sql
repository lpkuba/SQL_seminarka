/*
Požadavky:

Minimálně 13 dotazů s WHERE
Minimálně 2 dotazy s ORDER BY
Minimálně 2 dotazy s LIMIT
Minimálně 3 dotazy s LIKE
Minimálně 6 dotazy s JOIN ON
Minimálně 2 dotaz s LEFT|RIGHT JOIN
Minimálně 1 dotaz s agregačními funkcemi
Minimálně 1 dotaz s GROUP BY + HAVING
Minimálně 1 dotaz, který bude obsahovat nějaký výpočet
*/
--zobrazení vlastněných brawlerů uživatelů podle jejich ID
SELECT players.name, brawlers.name FROM `players` 
LEFT JOIN ownedbrawlers ON ownedbrawlers.playerId = players.id
LEFT JOIN brawlers ON ownedbrawlers.brawlerId = brawlers.id;

--zobrazení celkových trofejí jednoho hráče (math + where)
SELECT players.name, SUM(matchplayers.winner*gamemodes.winReward) AS trophies FROM `players`
RIGHT JOIN matchplayers ON players.id = matchplayers.playerId
LEFT JOIN matches ON matchplayers.matchId = matches.id
LEFT JOIN maps ON maps.id = matches.mapId
LEFT JOIN gamemodes ON maps.gamemodeId = gamemodes.id
WHERE players.id = 1 --zde přepsat ID hráče
GROUP BY players.id