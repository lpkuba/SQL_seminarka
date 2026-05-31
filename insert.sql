--GADGETY
INSERT INTO gadgets (name, description, extraDamage)
VALUES ("extra giga boost", "extrémní boost pro víc extrémní brawlery", 5000),
("nějaký celkem mid boost", "hodně mid boost nikoho nezajímá celkem", 50), 
("asi boost?", "stejnak nic nepřidává", 0),
("boost podpultový", "tajný boost", 12345),
("boost chucka norrise", "kop skrze obrazovku protihráče (efektivní)", 50000),
("útok ze zálohy", "nikdo neví kdy se ukáže ale někdy asi jo", 100),
("ozzákův pivní průkaz", "ano přísluší k němu i povinná výbava", 1000)

--BRAWLEŘI
INSERT INTO brawlers (name, gadgetId, description, damage, healing)
VALUES ("el šprímo", 3, "dělá si ze všeho srandu", 100, NULL),
("martin votava", 7, "natočí na tvrzi pivo (prý)", 20000, 2000),
("radim nesvoboda", NULL, "bamketbal", 20000, NULL),
("výtek heráček", 5, "má velmi oslňující vlasy", 25000, NULL),
("xyzeng", 2, "každý den nosí ke svým narozeninám čokoládu", 15000, 500),
("eva šefrnová", 6, "kótovat umí dobře ale i přesto je někde škola nakřivo", 12500, 500),
("odra škubala", NULL, "velmi matematika, velmi pí", 36100, NULL),
("pan céčko", 1, "tajemná postava kterou někteří označují za slováka s culíkem", 50000, 1000),
("květa z bufetu", NULL, "nejlepší období co třebešín zažil", 100, 500000)

--ZEMĚ
INSERT INTO countries (name, isEuropean)
VALUES ("Česká Republika", TRUE),
("Slovensko", TRUE),
("Rakousko", TRUE),
("Německo", TRUE),
("Polsko", TRUE),
("Indie", FALSE),
("Čína", FALSE)

--KLANY TÝMY NEBO NĚJAK TAK
INSERT INTO clans (name, minimalTrophies, countryId)
VALUES ("FaZe clan [OFICIAL]", 99999, 6),
("Epstein Island", NULL, 7),
("Souhradův kult proti Motion Smoothingu", 500, 1),
("Fronta v bufetu", 500, 1),
("vajco", 9000, 2),
("slovenská asociácia proti diakritike langoša", 1250, 2),
("deustche post", 300, 3),
("źabka gang", NULL, 5)

--HERNÍ REŽIMY
INSERT INTO gamemodes (name, description, usesGoals, teamCount, teamSize, duration, overtime, winReward)
VALUES ("vodní pólo", "no prostě pólo ve školním bazénu", TRUE, 2, 4, 600, TRUE, 100),
("pingpong alá tenis", "pingpong s přidaným elementem", TRUE, 2, 2, 300, FALSE, 50),
("vybíjená s bowlingovými koulemi", "tradiční vybíjená nikoho nebaví", FALSE, 30, 1, 300, FALSE, 500),
("1v1 pití nápojů na tvrzi", "na tvrzi prý jde všechno", FALSE, 2, 1, 86400, FALSE, 250),
("ideální pauza 5 min po TEV do 351", "říká se že nemožné je možné ale nutno znemožnit jej ostatním", FALSE, 15, 1, 300, FALSE, 300),
("zápas se seniory v lidlu", "k čemu potřebuje senior půl tuny pečiva?", FALSE, 2, 10, 60, FALSE, 100),
("obyčejný TDM pro 15 lidí", "nic extra, týmy po třech", FALSE, 5, 3, 180, FALSE, 50) 

--MAPY
INSERT INTO maps (name, description, gamemodeId)
VALUES ("Lidl Plaňanská", "prý klidné místo pro nákup o volné hodině", 6),
("plavecký bazén SPŠ třebešín", "posvátné místo, bareš included", 1),
("chodba k jídelně SPŠ třebešín", "někdy přezdívaná jako závodní dráha...", 7),
("hlavní schodiště SPŠ třebešín", "krásný den", 5),
("chodovská tvrz", "skoro jako ve 3.D", 4),
("Lidl Želivského", "ideální místo pro nákup po škole", 6),
("malešický park", "koule koule koule", 3),
("hřiště harvard u krbu", "...", 2)

--hráči
INSERT INTO players (registeredAt, name, trophies, level, clanId)
VALUES ("2026-01-13 23:16:21", "lpkuba", 100, 2, 3),
("1847-10-01 12:21:09", "evasefrnova", 90000, 50, 3), 
("2026-02-14 14:55:01", "cokotycinka1", 15000, 20, 4),
("2025-11-23 15:46:22", "cokotycinka2", 100, 1, NULL),
("2024-04-03 10:30:20", "sinezeng", 9150, 10, 5),
("2026-08-18 01:06:10", "janoslovelangos", 89500, 49, 6),
("2026-09-09 19:21:52", "zdendapulec", 10000, 12, 1),
("2022-05-31 06:32:58", "schnitzellove7", 0, 1, NULL),
("2025-11-13 23:31:41", "cokotycinka3", 450, 2, 8),
("2025-11-13 23:35:44", "cokotycinka5", 0, 1, 2),
("2026-01-13 06:16:21", "fbiagent007", 1000, 5, 2)

--zápasy
INSERT INTO matches(playedAt, duration, mapId) 
VALUES ("2026-06-07 07:00:00", 100, 1),
("2026-06-07 08:00:00", 217, 8),
("2026-06-07 09:00:00", 651, 2),
("2026-06-07 10:00:00", 300, 4),
("2026-06-07 11:00:00", 22, 6),
("2026-06-07 11:40:00", 10, 3),
("2026-06-07 12:00:00", 580, 2),
("2026-06-07 14:00:00", 25, 7)

--vlastnění brawleři (inv)
INSERT INTO `ownedbrawlers`(`playerId`, `brawlerId`, `trophies`, `level`, `gadget`) 
VALUES (1, 8, 150, 2, FALSE),
(2, 1, 5000, 20, TRUE),
(2, 2, 50, 1, TRUE),
(2, 3, 50, 1, FALSE),
(2, 4, 0, 1, TRUE),
(2, 5, 100, 1, TRUE),
(2, 6, 84000, 100, TRUE),
(2, 7, 150, 2, FALSE),
(2, 8, 550, 5, TRUE),
(2, 9, 100, 1, FALSE),
(3, 1, 15000, 50, FALSE),
(4, 4, 100, 1, FALSE),
(4, 9, 0, 1, FALSE),
(5, 2, 4500, 10, TRUE),
(5, 8, 4650, 10, FALSE),
(6, 3, 88000, 48, FALSE),
(6, 7, 1000, 5, FALSE),
(6, 4, 500, 2, TRUE),
(7, 6, 10000, 12, FALSE),
(8, 5, 0, 1, TRUE),
(9, 1, 50, 1, TRUE),
(9, 5, 400, 2, TRUE),
(10, 9, 0, 1, FALSE),
(11, 4, 1000, 5, TRUE),
(12, 8, 200, 1, FALSE)

--data zápasu ID 1
INSERT INTO matchplayers (matchId, playerId, deaths, kills, healing, goals, brawlerId, team)
VALUES 
(1, 1, 0, 2, 0, NULL, 8, 1),
(1, 2, 2, 1, 2000, NULL, 6, 2),
(1, 3, 0, 1, 0, NULL, 1, 1),
(1, 9, 4, 6, 0, NULL, 9, 1), 
(1, 5, 2, 1, 0, NULL, 2, 1),
(1, 10,2, 0, 0, NULL, 9, 2),
(1, 7, 0, 0, 0, NULL, 6, 2),
(1,11, 1, 0, 0, NULL, 1, 2)

--data zápasu ID 2
INSERT INTO matchplayers (matchId, playerId, deaths, kills, healing, goals, brawlerId, team)
VALUES 
(2, 1, 0, 0, 0, 4, 8, 1),
(2, 5, 0, 0, 0, 2, 8, 1),
(2, 2, 0, 0, 0, 5, 2, 2),
(2, 7, 0, 0, 0, 0, 6, 2)
