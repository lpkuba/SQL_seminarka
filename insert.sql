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