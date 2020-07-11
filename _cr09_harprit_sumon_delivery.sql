-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Jul 2020 um 10:59
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: ` cr09_harprit_sumon_delivery`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL,
  `b_city` varchar(55) NOT NULL,
  `b_zip` int(11) NOT NULL,
  `b_street` varchar(55) NOT NULL,
  `b_house_no` int(11) NOT NULL,
  `b_door_no` int(11) NOT NULL,
  `fk_package_posting` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `branch`
--

INSERT INTO `branch` (`branch_id`, `b_city`, `b_zip`, `b_street`, `b_house_no`, `b_door_no`, `fk_package_posting`) VALUES
(1, 'vienna', 1100, 'Troststraße', 52, 34, 0),
(2, 'salzburg', 2354, 'wertgasse', 234, 23, 0),
(3, 'tirol', 1050, 'Hollundersraße', 76, 6, 0),
(4, 'vienna', 1020, 'pragstraße', 34, 3, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `central`
--

CREATE TABLE `central` (
  `central_id` int(11) NOT NULL,
  `central_city` varchar(55) NOT NULL,
  `central_zip` int(11) NOT NULL,
  `central_street` varchar(55) NOT NULL,
  `central_street_no` int(11) NOT NULL,
  `central_house_no` int(11) NOT NULL,
  `fk_branch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `central`
--

INSERT INTO `central` (`central_id`, `central_city`, `central_zip`, `central_street`, `central_street_no`, `central_house_no`, `fk_branch`) VALUES
(1, 'vienna', 1030, 'Rochusplatz', 1, 1, 1),
(2, 'salzburg', 5071, 'Dr.-Hans-Lechner-Straße ', 17, 1, 3),
(3, 'tirol', 6060, ' Essacherstraße', 15, 5, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `c_first_name` varchar(55) NOT NULL,
  `c_last_name` varchar(55) NOT NULL,
  `c_city` varchar(55) NOT NULL,
  `c_zip` int(11) NOT NULL,
  `c_street` varchar(55) NOT NULL,
  `c_house_no` int(11) NOT NULL,
  `c_door_no` int(11) NOT NULL,
  `c_floor` int(11) NOT NULL,
  `fk_driver` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `c_first_name`, `c_last_name`, `c_city`, `c_zip`, `c_street`, `c_house_no`, `c_door_no`, `c_floor`, `fk_driver`) VALUES
(1, 'Philipp', 'Pink', 'münzzusschlag', 3454, 'münzstraße', 23, 5, 1, 2),
(2, 'Stefan', 'Schlosser', 'Vienna', 1100, 'laxenburgerstraße', 89, 6, 5, 1),
(3, 'Julia', 'Schwarz', 'krems', 4567, 'Ticketstraße', 46, 3, 1, 3),
(4, 'Nenad', 'Rikanovic', 'tuln', 5743, 'ballstraße', 3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `d_first_name` varchar(55) NOT NULL,
  `d_last_name` varchar(55) NOT NULL,
  `d_hire_date` date NOT NULL,
  `fk_handover` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `driver`
--

INSERT INTO `driver` (`driver_id`, `d_first_name`, `d_last_name`, `d_hire_date`, `fk_handover`) VALUES
(1, 'Lukas', 'Feichtinger', '2019-04-16', 2),
(2, 'Georg', 'Weiß', '2018-12-21', 1),
(3, 'Nikola', 'Badjevic', '2020-02-12', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `handover`
--

CREATE TABLE `handover` (
  `handover_id` int(11) NOT NULL,
  `h_date` date NOT NULL,
  `h_time` time NOT NULL,
  `fk_package` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `handover`
--

INSERT INTO `handover` (`handover_id`, `h_date`, `h_time`, `fk_package`) VALUES
(1, '2019-10-10', '06:15:59', 1),
(2, '2019-05-05', '11:16:00', 2),
(3, '2020-07-01', '17:30:00', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `package_no` int(11) NOT NULL,
  `fk_customer` int(11) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`package_no`, `fk_customer`, `weight`) VALUES
(1, 3, 250),
(2, 4, 300),
(5, 4, 400),
(6, 2, 450);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package_posting`
--

CREATE TABLE `package_posting` (
  `pp_number` int(11) NOT NULL,
  `pp_date` date NOT NULL,
  `pp_time` time NOT NULL,
  `pp_destination_city` varchar(55) NOT NULL,
  `pp_destination_zip` int(11) NOT NULL,
  `pp_destination_street` varchar(55) NOT NULL,
  `pp_destination_house_no` int(11) NOT NULL,
  `pp_destination_door_no` int(11) NOT NULL,
  `pp_destination_floor` int(11) NOT NULL,
  `fk_customer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `package_posting`
--

INSERT INTO `package_posting` (`pp_number`, `pp_date`, `pp_time`, `pp_destination_city`, `pp_destination_zip`, `pp_destination_street`, `pp_destination_house_no`, `pp_destination_door_no`, `pp_destination_floor`, `fk_customer`) VALUES
(1, '2020-06-10', '13:34:46', 'vienna', 1100, 'maxgasse', 45, 5, 2, 3),
(2, '2020-07-28', '12:34:46', 'St.pölten', 4039, 'pöltengasse', 234, 34, 7, 2),
(3, '2020-07-05', '15:15:46', 'tulln', 2348, 'hundegassse', 78, 4, 1, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indizes für die Tabelle `central`
--
ALTER TABLE `central`
  ADD PRIMARY KEY (`central_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indizes für die Tabelle `handover`
--
ALTER TABLE `handover`
  ADD PRIMARY KEY (`handover_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_no`);

--
-- Indizes für die Tabelle `package_posting`
--
ALTER TABLE `package_posting`
  ADD PRIMARY KEY (`pp_number`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `central`
--
ALTER TABLE `central`
  MODIFY `central_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `handover`
--
ALTER TABLE `handover`
  MODIFY `handover_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `package`
--
ALTER TABLE `package`
  MODIFY `package_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `package_posting`
--
ALTER TABLE `package_posting`
  MODIFY `pp_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
