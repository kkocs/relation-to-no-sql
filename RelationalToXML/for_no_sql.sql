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
(3, 'TSM');

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
(3, 'Las Vegas');

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
('1941126055116', 2);

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
(2, 1),
(2, 2),
(2, 3),
(3, 3);

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
('1951103055106', '1995-01-03', 22, 'Mark');

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
('1951103055106', 3);

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
(2, 2, '2018-03-01', '2018-03-05'),
(3, 3, '2019-09-01', '2018-09-05');

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
