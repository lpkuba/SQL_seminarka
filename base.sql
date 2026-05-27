-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vytvořeno: Sob 06. čen 2026, 14:24
-- Verze serveru: 5.7.11
-- Verze PHP: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `brawl_stars`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `brawlers`
--

CREATE TABLE `brawlers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) COLLATE utf8mb4_czech_ci NOT NULL,
  `gadgetId` int(11) DEFAULT NULL,
  `description` varchar(55) COLLATE utf8mb4_czech_ci NOT NULL DEFAULT 'Default description',
  `damage` int(11) NOT NULL,
  `healing` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `clans`
--

CREATE TABLE `clans` (
  `id` int(11) NOT NULL,
  `name` varchar(55) COLLATE utf8mb4_czech_ci NOT NULL,
  `minimalTrophies` int(11) DEFAULT NULL,
  `countryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(55) COLLATE utf8mb4_czech_ci NOT NULL,
  `isEuropean` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `gadgets`
--

CREATE TABLE `gadgets` (
  `id` int(11) NOT NULL,
  `name` varchar(55) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `extraDamage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `gamemodes`
--

CREATE TABLE `gamemodes` (
  `id` int(11) NOT NULL,
  `name` varchar(55) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_czech_ci NOT NULL,
  `usesGoals` tinyint(1) NOT NULL DEFAULT '0',
  `teamCount` int(11) NOT NULL,
  `teamSize` int(11) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '120',
  `overtime` tinyint(1) NOT NULL DEFAULT '1',
  `winReward` int(11) NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `maps`
--

CREATE TABLE `maps` (
  `id` int(11) NOT NULL,
  `name` varchar(55) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_czech_ci NOT NULL,
  `gamemodeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `playedAt` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `mapId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `matchplayers`
--

CREATE TABLE `matchplayers` (
  `matchId` int(11) NOT NULL,
  `playerId` int(11) NOT NULL,
  `deaths` int(11) NOT NULL DEFAULT '0',
  `kills` int(11) NOT NULL DEFAULT '0',
  `healing` int(11) NOT NULL DEFAULT '0',
  `goals` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `ownedbrawlers`
--

CREATE TABLE `ownedbrawlers` (
  `playerId` int(11) NOT NULL,
  `brawlerId` int(11) NOT NULL,
  `trophies` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '1',
  `gadget` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `registeredAt` datetime NOT NULL,
  `name` varchar(55) COLLATE utf8mb4_czech_ci NOT NULL,
  `trophies` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `clanId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `brawlers`
--
ALTER TABLE `brawlers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gadgetId` (`gadgetId`);

--
-- Klíče pro tabulku `clans`
--
ALTER TABLE `clans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countryId` (`countryId`);

--
-- Klíče pro tabulku `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `gadgets`
--
ALTER TABLE `gadgets`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `gamemodes`
--
ALTER TABLE `gamemodes`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gamemodeId` (`gamemodeId`);

--
-- Klíče pro tabulku `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mapId` (`mapId`);

--
-- Klíče pro tabulku `matchplayers`
--
ALTER TABLE `matchplayers`
  ADD PRIMARY KEY (`matchId`,`playerId`),
  ADD KEY `playerId` (`playerId`);

--
-- Klíče pro tabulku `ownedbrawlers`
--
ALTER TABLE `ownedbrawlers`
  ADD PRIMARY KEY (`playerId`,`brawlerId`),
  ADD KEY `ownedbrawlers_ibfk_2` (`brawlerId`);

--
-- Klíče pro tabulku `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clanId` (`clanId`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `brawlers`
--
ALTER TABLE `brawlers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `clans`
--
ALTER TABLE `clans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `gadgets`
--
ALTER TABLE `gadgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `gamemodes`
--
ALTER TABLE `gamemodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pro tabulku `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `brawlers`
--
ALTER TABLE `brawlers`
  ADD CONSTRAINT `brawlers_ibfk_1` FOREIGN KEY (`gadgetId`) REFERENCES `gadgets` (`id`);

--
-- Omezení pro tabulku `clans`
--
ALTER TABLE `clans`
  ADD CONSTRAINT `clans_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `countries` (`id`);

--
-- Omezení pro tabulku `maps`
--
ALTER TABLE `maps`
  ADD CONSTRAINT `maps_ibfk_1` FOREIGN KEY (`gamemodeId`) REFERENCES `gamemodes` (`id`);

--
-- Omezení pro tabulku `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`mapId`) REFERENCES `maps` (`id`);

--
-- Omezení pro tabulku `matchplayers`
--
ALTER TABLE `matchplayers`
  ADD CONSTRAINT `matchplayers_ibfk_1` FOREIGN KEY (`matchId`) REFERENCES `matches` (`id`),
  ADD CONSTRAINT `matchplayers_ibfk_2` FOREIGN KEY (`playerId`) REFERENCES `players` (`id`);

--
-- Omezení pro tabulku `ownedbrawlers`
--
ALTER TABLE `ownedbrawlers`
  ADD CONSTRAINT `ownedbrawlers_ibfk_1` FOREIGN KEY (`playerId`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ownedbrawlers_ibfk_2` FOREIGN KEY (`brawlerId`) REFERENCES `brawlers` (`id`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`clanId`) REFERENCES `clans` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
