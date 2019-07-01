-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Máquina: 127.0.0.1
-- Data de Criação: 02-Jul-2019 às 01:02
-- Versão do servidor: 5.6.14
-- versão do PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `salao_beleza`
--
CREATE DATABASE IF NOT EXISTS `salao_beleza` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `salao_beleza`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `painel`
--

DROP TABLE IF EXISTS `painel`;
CREATE TABLE IF NOT EXISTS `painel` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(12) NOT NULL,
  `horario_marcado` varchar(10) NOT NULL,
  `tipo_servico` varchar(30) NOT NULL,
  `valor` varchar(10) NOT NULL,
  `situacao` varchar(30) NOT NULL,
  `data` varchar(10) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `painel`
--

INSERT INTO `painel` (`cod`, `nome`, `telefone`, `horario_marcado`, `tipo_servico`, `valor`, `situacao`, `data`) VALUES
(1, 'teste', '196549', '16:59', 'Corte de Cabelo', '161', 'Debito', '1321-06-21');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
