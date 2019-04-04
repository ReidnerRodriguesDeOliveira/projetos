-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 31-Mar-2019 às 17:18
-- Versão do servidor: 5.7.21
-- PHP Version: 5.6.35

create database blog;
use blog;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Mensagem` longtext NOT NULL,
  `Data_` datetime NOT NULL,
  `Usuario_ID` int(11) NOT NULL,
  `Tema_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Post_Usuario_idx` (`Usuario_ID`),
  KEY `fk_Post_Tema1_idx` (`Tema_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `post`
--

INSERT INTO `post` (`ID`, `Mensagem`, `Data_`, `Usuario_ID`, `Tema_ID`) VALUES
(1, 'auhsaushaushaush', '2019-03-31 17:08:00', 1, 1),
(2, 'aaaa', '2019-03-31 17:09:00', 1, 2),
(3, 'joooj', '2019-03-31 17:12:00', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tema`
--

DROP TABLE IF EXISTS `tema`;
CREATE TABLE IF NOT EXISTS `tema` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tema`
--

INSERT INTO `tema` (`ID`, `Nome`) VALUES
(1, 'post_felipe'),
(2, 'post_cesar'),
(3, 'post_henrique'),
(4, 'post_augusto'),
(5, 'post_reidner');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Senha` varchar(45) NOT NULL,
  `foto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID`, `Nome`, `Email`, `Senha`, `foto`) VALUES
(1, 'Felipe', 'felipe@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'foto.jpg'),
(2, 'jonas', 'jojo@queridinha.com', '81dc9bdb52d04dc20036dbd8313ed055', 'turismo.jpg'),
(3, 'vrau', 'v@v.com', '81dc9bdb52d04dc20036dbd8313ed055', 'turismo.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `_like`
--

DROP TABLE IF EXISTS `_like`;
CREATE TABLE IF NOT EXISTS `_like` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario_ID` int(11) NOT NULL,
  `Tema_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Like_Usuario1_idx` (`Usuario_ID`),
  KEY `fk_Like_Tema1_idx` (`Tema_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `_like`
--

INSERT INTO `_like` (`ID`, `Usuario_ID`, `Tema_ID`) VALUES
(23, 2, 1),
(68, 1, 3),
(69, 1, 1),
(70, 1, 2);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_Post_Tema1` FOREIGN KEY (`Tema_ID`) REFERENCES `tema` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Post_Usuario` FOREIGN KEY (`Usuario_ID`) REFERENCES `usuario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `_like`
--
ALTER TABLE `_like`
  ADD CONSTRAINT `fk_Like_Tema1` FOREIGN KEY (`Tema_ID`) REFERENCES `tema` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Like_Usuario1` FOREIGN KEY (`Usuario_ID`) REFERENCES `usuario` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
