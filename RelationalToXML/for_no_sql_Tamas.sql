-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2017 at 07:32 PM
-- Server version: 5.7.15-log
-- PHP Version: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `for_no_sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `csapatok`
--

CREATE TABLE `csapatok` (
  `csapat_kod` int(11) NOT NULL,
  `csapat_nev` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `csapatok`
--

INSERT INTO `csapatok` (`csapat_kod`, `csapat_nev`) VALUES
(1, 'CLG'),
(2, 'SKT'),
(3, 'TSM'),
(4, 'C9'),
(5, 'UOL'),
(6, 'MSF'),
(7, 'SSG'),
(8, 'FW'),
(9, 'EUW'),
(10, 'EUNE');

-- --------------------------------------------------------

--
-- Table structure for table `helyszinek`
--

CREATE TABLE `helyszinek` (
  `helyszin_kod` int(11) NOT NULL,
  `helyszin_nev` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `helyszinek`
--

INSERT INTO `helyszinek` (`helyszin_kod`, `helyszin_nev`) VALUES
(1, 'New York'),
(2, 'Washington'),
(3, 'Las Vegas'),
(4, 'Cluj-Napoca'),
(5, 'Seol'),
(6, 'Tokyo'),
(7, 'Yokohama'),
(8, 'Paris'),
(9, 'Berlin'),
(10, 'London');

-- --------------------------------------------------------

--
-- Table structure for table `managere`
--

CREATE TABLE `managere` (
  `szemelyi_szam` varchar(20) NOT NULL,
  `csapat_kod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `managere`
--

INSERT INTO `managere` (`szemelyi_szam`, `csapat_kod`) VALUES
('1941126055110', 3),
('1941126055114', 1),
('1941126055116', 2),
('2951103231284', 4),
('2951103231285', 5),
('2951103231276', 6),
('2951103231271', 7),
('2951103231262', 8),
('2951103231267', 9),
('2951103231268', 10);


-- --------------------------------------------------------

--
-- Table structure for table `resztvesz`
--

CREATE TABLE `resztvesz` (
  `verseny_kod` int(11) NOT NULL,
  `csapat_kod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resztvesz`
--

INSERT INTO `resztvesz` (`verseny_kod`, `csapat_kod`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 1),
(2, 2),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(5, 4),
(5, 5),
(6, 3),
(7, 1),
(7, 7),
(8, 8),
(8, 4),
(8, 9),
(9, 1),
(10, 1),
(10, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `szemelyek`
--

CREATE TABLE `szemelyek` (
  `szemelyi_szam` varchar(20) NOT NULL,
  `szuletesi_datum` date DEFAULT NULL,
  `kor` int(11) DEFAULT NULL,
  `nev` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `szemelyek`
--

INSERT INTO `szemelyek` (`szemelyi_szam`, `szuletesi_datum`, `kor`, `nev`) VALUES
('1941126055105', '1994-11-26', 22, 'Paul'),
('1941126055107', '1996-02-14', 21, 'John'),
('1941126055108', '1993-03-22', 24, 'Darius'),
('1941126055109', '1994-04-04', 23, 'Michael'),
('1941126055110', '1994-05-09', 23, 'Daniel'),
('1941126055111', '1993-06-13', 24, 'Edgard'),
('1941126055112', '1995-07-26', 22, 'Jeremy'),
('1941126055113', '1994-08-17', 23, 'Stephen'),
('1941126055114', '1996-09-22', 21, 'Roger'),
('1941126055115', '1994-10-07', 23, 'Valter'),
('1941126055116', '1994-11-01', 23, 'Louise'),
('1941126055117', '1993-12-25', 23, 'Peter'),
('1941126055118', '1996-01-18', 21, 'George'),
('1951103055105', '1995-11-03', 22, 'Krisztián'),
('1951103055106', '1995-01-03', 22, 'Mark'),
('2951103231202', '1995-11-03', 22, 'Aatrox'),
('2951103231203', '1995-11-03', 22, 'Ahri'),
('2951103231204', '1995-11-03', 22, 'Akali'),
('2951103231205', '1995-11-03', 22, 'Alistar'),
('2951103231206', '1995-11-03', 22, 'Amumu'),
('2951103231207', '1995-11-03', 22, 'Anivia'),
('2951103231208', '1995-11-03', 22, 'Annie'),
('2951103231209', '1995-11-03', 22, 'Ashi'),
('2951103231210', '1995-11-03', 22, 'Aurelion'),
('2951103231211', '1995-11-03', 22, 'Azir'),
('2951103231212', '1995-11-03', 22, 'Bard'),
('2951103231213', '1995-11-03', 22, 'Blitzcrank'),
('2951103231214', '1995-11-03', 22, 'Brand'),
('2951103231215', '1995-11-03', 22, 'Braum'),
('2951103231216', '1995-11-03', 22, 'Caitlyn'),
('2951103231217', '1995-11-03', 22, 'Camile'),
('2951103231218', '1995-11-03', 22, 'Cassiopea'),
('2951103231219', '1995-11-03', 22, 'ChoGath'),
('2951103231220', '1995-11-03', 22, 'Corki'),
('2951103231200', '1995-11-03', 22, 'Diana'),
('2951103231221', '1995-11-03', 22, 'Mundo'),
('2951103231222', '1995-11-03', 22, 'Draven'),
('2951103231223', '1995-11-03', 22, 'Ekko'),
('2951103231224', '1995-11-03', 22, 'Elise'),
('2951103231225', '1995-11-03', 22, 'Evelynn'),
('2951103231226', '1995-11-03', 22, 'Ezreal'),
('2951103231227', '1995-11-03', 22, 'Fiddlesticks'),
('2951103231228', '1995-11-03', 22, 'Fiora'),
('2951103231229', '1995-11-03', 22, 'Fizz'),
('2951103231230', '1995-11-03', 22, 'Galio'),
('2951103231231', '1995-11-03', 22, 'Gangplank'),
('2951103231232', '1995-11-03', 22, 'Garen'),
('2951103231233', '1995-11-03', 22, 'Gnar'),
('2951103231234', '1995-11-03', 22, 'Gragas'),
('2951103231235', '1995-11-03', 22, 'Graves'),
('2951103231236', '1995-11-03', 22, 'Hecarim'),
('2951103231237', '1995-11-03', 22, 'Heimerdinger'),
('2951103231238', '1995-11-03', 22, 'Illaoi'),
('2951103231239', '1995-11-03', 22, 'Irelia'),
('2951103231240', '1995-11-03', 22, 'Ivern'),
('2951103231241', '1995-11-03', 22, 'Janna'),
('2951103231242', '1995-11-03', 22, 'Jarvan'),
('2951103231243', '1995-11-03', 22, 'Jax'),
('2951103231244', '1995-11-03', 22, 'Jayce'),
('2951103231245', '1995-11-03', 22, 'Jhin'),
('2951103231246', '1995-11-03', 22, 'Jinx'),
('2951103231247', '1995-11-03', 22, 'Kalista'),
('2951103231248', '1995-11-03', 22, 'Karma'),
('2951103231249', '1995-11-03', 22, 'Karthus'),
('2951103231250', '1995-11-03', 22, 'Kassadin'),
('2951103231251', '1995-11-03', 22, 'Katarina'),
('2951103231252', '1995-11-03', 22, 'Kayle'),
('2951103231253', '1995-11-03', 22, 'Kayn'),
('2951103231254', '1995-11-03', 22, 'Kennen'),
('2951103231255', '1995-11-03', 22, 'KhaZix'),
('2951103231256', '1995-11-03', 22, 'Kindred'),
('2951103231257', '1995-11-03', 22, 'Kled'),
('2951103231258', '1995-11-03', 22, 'KogMaw'),
('2951103231259', '1995-11-03', 22, 'LeBlanc'),
('2951103231260', '1995-11-03', 22, 'LeeSin'),
('2951103231261', '1995-11-03', 22, 'Leona'),
('2951103231262', '1995-11-03', 22, 'Lissandra'),
('2951103231263', '1995-11-03', 22, 'Lucian'),
('2951103231264', '1995-11-03', 22, 'Lulu'),
('2951103231265', '1995-11-03', 22, 'Lux'),
('2951103231266', '1995-11-03', 22, 'Malphite'),
('2951103231267', '1995-11-03', 22, 'Malzahar'),
('2951103231268', '1995-11-03', 22, 'Maokai'),
('2951103231269', '1995-11-03', 22, 'MasterYi'),
('2951103231270', '1995-11-03', 22, 'MissFortune'),
('2951103231271', '1995-11-03', 22, 'Mordekaiser'),
('2951103231272', '1995-11-03', 22, 'Morgana'),
('2951103231273', '1995-11-03', 22, 'Nami'),
('2951103231274', '1995-11-03', 22, 'Nasus'),
('2951103231275', '1995-11-03', 22, 'Nautilus'),
('2951103231276', '1995-11-03', 22, 'Nidalee'),
('2951103231277', '1995-11-03', 22, 'Nocturne'),
('2951103231278', '1995-11-03', 22, 'Nunu'),
('2951103231279', '1995-11-03', 22, 'Olaf'),
('2951103231280', '1995-11-03', 22, 'Oriana'),
('2951103231281', '1995-11-03', 22, 'Orn'),
('2951103231282', '1995-11-03', 22, 'Pantheon'),
('2951103231283', '1995-11-03', 22, 'Poppy'),
('2951103231284', '1995-11-03', 22, 'Quinn'),
('2951103231285', '1995-11-03', 22, 'Rakan'),
('2951103231286', '1995-11-03', 22, 'Rammus');

-- --------------------------------------------------------

--
-- Table structure for table `tagja`
--

CREATE TABLE `tagja` (
  `szemelyi_szam` varchar(20) NOT NULL,
  `csapat_kod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tagja`
--

INSERT INTO `tagja` (`szemelyi_szam`, `csapat_kod`) VALUES
('1941126055105', 1),
('1941126055107', 1),
('1941126055108', 1),
('1941126055109', 1),
('1941126055110', 1),
('1941126055111', 2),
('1941126055112', 2),
('1941126055113', 2),
('1941126055114', 2),
('1941126055115', 2),
('1941126055116', 3),
('1941126055117', 3),
('1941126055118', 3),
('1951103055105', 3),
('1951103055106', 3),
('2951103231202', 4),
('2951103231203', 4),
('2951103231204', 4),
('2951103231205', 4),
('2951103231206', 4),
('2951103231207', 5),
('2951103231208', 5),
('2951103231209', 5),
('2951103231210', 5),
('2951103231211', 5),
('2951103231212', 6),
('2951103231213', 6),
('2951103231214', 6),
('2951103231215', 6),
('2951103231216', 6),
('2951103231217', 7),
('2951103231218', 7),
('2951103231219', 7),
('2951103231220', 7),
('2951103231221', 7),
('2951103231221', 8),
('2951103231222', 8),
('2951103231223', 8),
('2951103231224', 8),
('2951103231225', 8),
('2951103231226', 9),
('2951103231227', 9),
('2951103231228', 9),
('2951103231229', 9),
('2951103231230', 9),
('2951103231231', 10),
('2951103231232', 10),
('2951103231233', 10),
('2951103231234', 10),
('2951103231235', 10);


-- --------------------------------------------------------

--
-- Table structure for table `versenyek`
--

CREATE TABLE `versenyek` (
  `verseny_kod` int(11) NOT NULL,
  `helyszin_kod` int(11) NOT NULL,
  `kezdo_datum` date DEFAULT NULL,
  `donto_datum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versenyek`
--

INSERT INTO `versenyek` (`verseny_kod`, `helyszin_kod`, `kezdo_datum`, `donto_datum`) VALUES
(1, 1, '2018-01-03', '2018-01-06'),
(2, 2, '2018-02-01', '2018-02-05'),
(3, 3, '2018-03-01', '2018-03-05'),
(4, 4, '2018-04-01', '2018-04-05'),
(5, 5, '2018-05-01', '2018-05-05'),
(6, 6, '2018-06-01', '2018-06-05'),
(7, 7, '2018-07-01', '2018-07-05'),
(8, 8, '2018-08-01', '2018-08-05'),
(9, 9, '2018-09-01', '2018-09-05'),
(10, 10, '2018-10-01', '2018-10-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `csapatok`
--
ALTER TABLE `csapatok`
  ADD PRIMARY KEY (`csapat_kod`);

--
-- Indexes for table `helyszinek`
--
ALTER TABLE `helyszinek`
  ADD PRIMARY KEY (`helyszin_kod`);

--
-- Indexes for table `managere`
--
ALTER TABLE `managere`
  ADD PRIMARY KEY (`csapat_kod`,`szemelyi_szam`),
  ADD KEY `szemelyi_szam` (`szemelyi_szam`);

--
-- Indexes for table `resztvesz`
--
ALTER TABLE `resztvesz`
  ADD PRIMARY KEY (`csapat_kod`,`verseny_kod`),
  ADD KEY `verseny_kod` (`verseny_kod`);

--
-- Indexes for table `szemelyek`
--
ALTER TABLE `szemelyek`
  ADD PRIMARY KEY (`szemelyi_szam`);

--
-- Indexes for table `tagja`
--
ALTER TABLE `tagja`
  ADD PRIMARY KEY (`csapat_kod`,`szemelyi_szam`),
  ADD KEY `szemelyi_szam` (`szemelyi_szam`);

--
-- Indexes for table `versenyek`
--
ALTER TABLE `versenyek`
  ADD PRIMARY KEY (`verseny_kod`),
  ADD KEY `helyszin_kod` (`helyszin_kod`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `csapatok`
--
ALTER TABLE `csapatok`
  MODIFY `csapat_kod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `helyszinek`
--
ALTER TABLE `helyszinek`
  MODIFY `helyszin_kod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `versenyek`
--
ALTER TABLE `versenyek`
  MODIFY `verseny_kod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `managere`
--
ALTER TABLE `managere`
  ADD CONSTRAINT `managere_ibfk_1` FOREIGN KEY (`csapat_kod`) REFERENCES `csapatok` (`csapat_kod`),
  ADD CONSTRAINT `managere_ibfk_2` FOREIGN KEY (`szemelyi_szam`) REFERENCES `szemelyek` (`szemelyi_szam`);

--
-- Constraints for table `resztvesz`
--
ALTER TABLE `resztvesz`
  ADD CONSTRAINT `resztvesz_ibfk_1` FOREIGN KEY (`verseny_kod`) REFERENCES `versenyek` (`verseny_kod`),
  ADD CONSTRAINT `resztvesz_ibfk_2` FOREIGN KEY (`csapat_kod`) REFERENCES `csapatok` (`csapat_kod`);

--
-- Constraints for table `tagja`
--
ALTER TABLE `tagja`
  ADD CONSTRAINT `tagja_ibfk_1` FOREIGN KEY (`csapat_kod`) REFERENCES `csapatok` (`csapat_kod`),
  ADD CONSTRAINT `tagja_ibfk_2` FOREIGN KEY (`szemelyi_szam`) REFERENCES `szemelyek` (`szemelyi_szam`);

--
-- Constraints for table `versenyek`
--
ALTER TABLE `versenyek`
  ADD CONSTRAINT `versenyek_ibfk_1` FOREIGN KEY (`helyszin_kod`) REFERENCES `helyszinek` (`helyszin_kod`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
