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

--!!!!!! kdekoliv je zmíněn jakýkoliv atribut tak je myšleno jeho ID !!!!!!--

--zobraz vlastněné brawlery pro uživatele
SELECT players.name, brawlers.name FROM `players` 
LEFT JOIN ownedbrawlers ON ownedbrawlers.playerId = players.id
LEFT JOIN brawlers ON ownedbrawlers.brawlerId = brawlers.id;

--zobraz celkové trofeje jednoho hráče (math + where + agr)
SELECT players.name, SUM(matchplayers.winner*gamemodes.winReward) AS trophies FROM `players`
JOIN matchplayers ON players.id = matchplayers.playerId
JOIN matches ON matchplayers.matchId = matches.id
JOIN maps ON maps.id = matches.mapId
JOIN gamemodes ON maps.gamemodeId = gamemodes.id
WHERE players.id = 1 
GROUP BY players.id

--zobraz počet odehraných zápasů hráčů 
SELECT players.name, COUNT(*) FROM players
LEFT JOIN matchplayers ON players.id = matchplayers.playerId
WHERE players.id = 1
GROUP BY players.name

--zobraz top 3 brawlerů dávajících nejvíce damage určitého hráče
SELECT players.name, brawlers.name, IF(ownedbrawlers.gadget = 1, (brawlers.damage+gadgets.extraDamage), brawlers.damage) AS damage FROM players
JOIN ownedbrawlers ON players.id = ownedbrawlers.playerId
JOIN brawlers ON ownedbrawlers.brawlerId = brawlers.id
LEFT JOIN gadgets ON gadgets.id = brawlers.gadgetId
WHERE players.id = 2
ORDER BY damage DESC
LIMIT 3

--zobraz statistiky určitého hráče s určitým brawlerem
SELECT players.name AS username, brawlers.name AS brawler, COUNT(*) AS matches_played FROM players 
LEFT JOIN matchplayers ON matchplayers.playerId = players.id
RIGHT JOIN brawlers ON matchplayers.brawlerId = brawlers.id
WHERE players.id = 2 AND brawlers.id = 6
GROUP BY brawlers.name

--zobraz seznam uživatelů z určitého klanu
SELECT players.name FROM `clans`
JOIN players ON clans.id = players.clanId
WHERE clans.id = 1

--zobraz top 3 uživatele podle trofejí
SELECT players.name, SUM(matchplayers.winner*gamemodes.winReward) AS trophies FROM `players`
LEFT JOIN matchplayers ON players.id = matchplayers.playerId
LEFT JOIN matches ON matches.id = matchplayers.matchId
LEFT JOIN maps ON maps.id = matches.mapId
LEFT JOIN gamemodes ON gamemodes.id = maps.gamemodeId
GROUP BY players.name
ORDER BY trophies DESC
LIMIT 3

--zobraz klany v určitém regionu
SELECT name FROM clans
WHERE countryId = 1

--vypočítej winrate určitého uživatele
SELECT players.name, ((SUM(matchplayers.winner)/COUNT(matchplayers.playerId))*100) AS winrate FROM `matchplayers`
LEFT JOIN players ON players.id = matchplayers.playerId
WHERE matchplayers.playerId = 1
GROUP BY matchplayers.playerId

--zobraz všechny mapy lidlu
SELECT name, description FROM `maps`
WHERE name LIKE "%Lidl%"

--zobraz všechny brawlery jejichž jméno začíná na e
SELECT name FROM `brawlers`
WHERE name LIKE "e%"

--zobraz všechny oficiální klany
SELECT name FROM `clans`
WHERE name LIKE "%OFICIAL%"

--zobraz klany s více členy než jen zakladatele
SELECT clans.name, COUNT(*) as player_count FROM `clans`
JOIN players ON players.clanId = clans.id
GROUP BY clans.name
HAVING (COUNT(*)>1)

--zobraz evropské klany
SELECT clans.* FROM `clans`
JOIN countries ON clans.countryId = countries.id
WHERE isEuropean = 1