-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Mrz 2020 um 15:16
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `bookshelf`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `id_author` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `male_female` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`id_author`, `name`, `birth_date`, `male_female`) VALUES
(1, 'martin', '1950-12-12', 'male'),
(2, 'john', '2010-06-07', 'male'),
(3, 'j_k_rowling', '1970-10-10', 'female');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `id_book` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `start_reading` datetime DEFAULT NULL,
  `end_reading` datetime DEFAULT NULL,
  `fk_owner` int(11) DEFAULT NULL,
  `fk_shelf` int(11) DEFAULT NULL,
  `fk_author` int(11) DEFAULT NULL,
  `fk_publisher` int(11) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `book`
--

INSERT INTO `book` (`id_book`, `title`, `description`, `start_reading`, `end_reading`, `fk_owner`, `fk_shelf`, `fk_author`, `fk_publisher`, `pages`) VALUES
(1, 'Harry Potter', 'magical book', '2001-01-01 10:00:00', '2001-01-02 11:00:00', 1, 1, 2, 1, 300),
(2, 'b', 'ghj book', '2002-01-01 10:00:00', '2003-01-02 12:00:00', 2, 2, 2, 3, 100),
(3, 'c', 'mag book', '2003-01-01 10:10:00', '2004-01-02 13:00:00', 3, 1, 3, 2, 30),
(4, 'd', 'mal book', '2001-02-01 20:00:00', '2001-05-02 14:00:00', 1, 1, 1, 1, 3000),
(5, 'e', 'ical book', '2001-03-01 10:50:00', '2001-04-02 15:00:00', 3, 1, 3, 2, 150),
(6, 'f', 'ml book', '2001-01-04 10:50:00', '2001-04-02 16:00:00', 1, 3, 3, 1, 1),
(7, 'g', 'magi book', '2007-01-07 20:00:00', '2008-01-02 11:00:00', 2, 2, 3, 3, 300);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `owner`
--

CREATE TABLE `owner` (
  `id_owner` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `owner`
--

INSERT INTO `owner` (`id_owner`, `name`, `birth_date`, `address`) VALUES
(1, 'Florian', '0000-00-00', ' Stuterheimgasse 16'),
(2, 'Djo', '0000-00-00', 'Stuterheimgasse 20'),
(3, 'John', '2000-01-01', 'Stuterheimgasse 16');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `id_publisher` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `founding_year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`id_publisher`, `name`, `address`, `founding_year`) VALUES
(1, 'huber_verlag', 'schwarzestreße 15 wien', 1960),
(2, 'schneider_verlag', 'hellestraße 30 wien', 2000),
(3, 'mauerer_verlage', 'keinestraße 40 wien', 2001);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shelf`
--

CREATE TABLE `shelf` (
  `id_shelf` int(11) NOT NULL,
  `position` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `shelf`
--

INSERT INTO `shelf` (`id_shelf`, `position`) VALUES
(1, 'living_room'),
(2, 'sleeping_room_1'),
(3, 'sleeping_room_2');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_author`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `fk_owner` (`fk_owner`),
  ADD KEY `fk_shelf` (`fk_shelf`),
  ADD KEY `fk_author` (`fk_author`),
  ADD KEY `fk_publisher` (`fk_publisher`);

--
-- Indizes für die Tabelle `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id_owner`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id_publisher`);

--
-- Indizes für die Tabelle `shelf`
--
ALTER TABLE `shelf`
  ADD PRIMARY KEY (`id_shelf`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`fk_owner`) REFERENCES `owner` (`id_owner`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`fk_owner`) REFERENCES `owner` (`id_owner`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`fk_shelf`) REFERENCES `shelf` (`id_shelf`),
  ADD CONSTRAINT `book_ibfk_4` FOREIGN KEY (`fk_author`) REFERENCES `author` (`id_author`),
  ADD CONSTRAINT `book_ibfk_5` FOREIGN KEY (`fk_publisher`) REFERENCES `publisher` (`id_publisher`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
