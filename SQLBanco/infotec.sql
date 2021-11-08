-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Nov-2021 às 12:48
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `infotec`
--
CREATE DATABASE IF NOT EXISTS `infotec` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `infotec`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(200) NOT NULL,
  `DataNascimento` date NOT NULL,
  `Endereco` varchar(250) NOT NULL,
  `DataCadastro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`ID`, `Nome`, `DataNascimento`, `Endereco`, `DataCadastro`) VALUES
(1, 'Renato Ferreira', '2000-01-01', 'Rua BS 14, QD 21, Araguaína/TO', '2021-10-31'),
(2, 'Marcos da Silva', '2002-01-01', 'Rua BS16, Araguaína/TO', '2021-10-31'),
(3, 'Maria Rosa Farias', '1990-01-01', 'Rua Caja, 319 - Colinas/TO', '2021-10-31'),
(4, 'Cliente Venda Final', '2000-01-01', 'Rua das Camélias, 293 - Araguaína Sul - Araguaína/TO', '2021-10-31'),
(5, 'Cliente Venda Final', '2000-01-01', 'Rua das Camélias, 293 - Araguaína Sul - Araguaína/TO', '2021-10-31'),
(6, 'Cliente Venda Final', '2000-01-01', 'Rua das Camélias, 293 - Araguaína Sul - Araguaína/TO', '2021-10-31'),
(7, 'Cliente Venda Final', '2000-01-01', 'Rua das Camélias, 293 - Araguaína Sul - Araguaína/TO', '2021-10-31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemvenda`
--

CREATE TABLE `itemvenda` (
  `ID` int(11) NOT NULL,
  `IDVenda` int(11) NOT NULL,
  `IDProduto` int(11) NOT NULL,
  `Quantidade` double NOT NULL,
  `ValorUnitario` double NOT NULL,
  `ValorTotalItem` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `itemvenda`
--

INSERT INTO `itemvenda` (`ID`, `IDVenda`, `IDProduto`, `Quantidade`, `ValorUnitario`, `ValorTotalItem`) VALUES
(2, 9, 1, 2, 1, 2),
(4, 9, 1, 2, 1, 2),
(5, 9, 1, 3, 1, 3),
(6, 9, 1, 3, 1, 3),
(7, 9, 2, 1, 2, 2),
(8, 9, 3, 3, 3, 9),
(9, 9, 4, 2, 4, 8),
(10, 9, 4, 2, 4, 8),
(11, 9, 2, 1, 2, 2),
(12, 9, 1, 1, 1, 1),
(13, 9, 1, 1, 1, 1),
(14, 9, 1, 1, 1, 1),
(15, 9, 2, 1, 2, 2),
(16, 9, 2, 2, 2, 4),
(17, 9, 2, 1, 2, 2),
(18, 9, 4, 1, 4, 4),
(19, 9, 2, 1, 2, 2),
(20, 9, 1, 1, 1, 1),
(21, 9, 1, 1, 1, 1),
(22, 9, 2, 1, 2, 2),
(23, 9, 4, 1, 4, 4),
(24, 9, 4, 1, 4, 4),
(25, 9, 4, 1.39, 4, 6),
(26, 9, 2, 1, 2, 22),
(27, 9, 3, 1.34, 3, 12.0466),
(28, 9, 3, 1.99, 3, 17.89),
(29, 9, 3, 1.931, 3, 17.36),
(30, 9, 2, 1, 2, 21.99),
(31, 9, 3, 1, 3, 8.99),
(32, 9, 4, 1, 4, 8.99),
(33, 9, 3, 1.99, 3, 17.89),
(34, 9, 3, 1, 3, 8.99),
(35, 10, 4, 1, 4, 8.99),
(36, 11, 4, 1, 4, 8.99),
(37, 11, 2, 1, 2, 21.99),
(38, 11, 2, 1, 2, 21.99),
(39, 11, 3, 1, 3, 8.99),
(40, 12, 2, 1, 2, 21.99),
(41, 13, 2, 1, 2, 21.99),
(42, 14, 2, 1, 22, 21.99),
(43, 14, 1, 1, 4, 3.99),
(44, 14, 2, 1, 22, 21.99),
(45, 14, 1, 1, 4, 3.99),
(46, 14, 2, 1, 22, 21.99),
(47, 15, 3, 1, 9, 8.99),
(48, 16, 2, 1, 22, 21.99),
(49, 17, 2, 1, 22, 21.99),
(50, 18, 2, 1, 22, 21.99),
(51, 18, 2, 1, 22, 21.99),
(52, 19, 2, 1, 22, 21.99),
(53, 19, 2, 1, 22, 21.99),
(54, 20, 2, 1, 22, 21.99),
(55, 20, 2, 1, 22, 21.99),
(56, 21, 2, 1, 22, 21.99),
(57, 21, 2, 1, 22, 21.99),
(58, 21, 2, 1, 22, 21.99),
(59, 24, 2, 1, 22, 21.99),
(60, 24, 2, 1, 22, 21.99),
(61, 27, 2, 1, 22, 21.99),
(62, 29, 2, 1, 22, 21.99),
(63, 31, 2, 1, 22, 21.99),
(64, 34, 2, 1, 22, 21.99),
(65, 36, 2, 1, 22, 21.99),
(66, 37, 2, 1, 22, 21.99),
(67, 37, 3, 1, 9, 8.99),
(68, 37, 2, 1, 22, 21.99),
(69, 37, 2, 1, 22, 21.99),
(70, 41, 2, 1, 22, 21.99),
(71, 43, 2, 1, 22, 21.99),
(72, 44, 2, 1, 22, 21.99),
(73, 45, 2, 1, 22, 21.99),
(74, 46, 2, 1, 22, 21.99),
(75, 47, 2, 1, 22, 21.99),
(76, 49, 2, 1, 22, 21.99),
(77, 49, 1, 1, 4, 3.99),
(78, 49, 3, 1, 9, 8.99),
(79, 52, 2, 1, 22, 21.99),
(80, 56, 2, 1, 22, 21.99),
(81, 57, 2, 1, 22, 21.99),
(82, 58, 2, 1, 22, 21.99),
(83, 60, 2, 1, 22, 21.99),
(84, 62, 2, 1, 22, 21.99),
(85, 64, 2, 1, 22, 21.99),
(86, 65, 2, 1, 22, 21.99),
(87, 66, 2, 1, 22, 21.99),
(88, 67, 2, 1, 22, 21.99),
(89, 69, 2, 1, 22, 21.99),
(90, 72, 2, 1, 22, 21.99),
(91, 75, 2, 1, 22, 21.99),
(92, 75, 1, 1, 4, 3.99),
(93, 78, 2, 1, 22, 21.99),
(94, 78, 1, 1, 4, 3.99),
(95, 81, 1, 1, 4, 3.99),
(96, 81, 2, 1, 22, 21.99),
(97, 81, 3, 1, 9, 8.99),
(98, 85, 2, 1, 22, 21.99),
(99, 85, 3, 1, 9, 8.99),
(100, 88, 2, 1, 22, 21.99),
(101, 88, 4, 1, 9, 8.99),
(102, 91, 2, 1, 22, 21.99),
(103, 91, 4, 1, 9, 8.99),
(104, 94, 2, 1, 22, 21.99),
(105, 94, 3, 1, 9, 8.99),
(106, 97, 2, 1, 22, 21.99),
(107, 97, 3, 1, 9, 8.99),
(108, 97, 4, 1, 9, 8.99),
(109, 106, 2, 1, 22, 21.99),
(110, 108, 2, 1, 22, 21.99),
(111, 113, 2, 1, 22, 21.99),
(112, 114, 2, 1, 22, 21.99),
(113, 118, 2, 1, 22, 21.99),
(114, 120, 2, 1, 22, 21.99),
(115, 126, 2, 1, 22, 21.99),
(116, 127, 2, 1, 22, 21.99),
(117, 128, 2, 1, 22, 21.99),
(118, 129, 2, 1, 22, 21.99),
(119, 129, 3, 1, 9, 8.99),
(120, 129, 1, 1, 4, 3.99),
(121, 130, 2, 1, 22, 21.99),
(122, 131, 2, 1, 22, 21.99),
(123, 132, 2, 1, 22, 21.99),
(124, 132, 1, 1, 4, 3.99),
(125, 132, 1, 1, 4, 3.99),
(126, 133, 2, 1, 22, 21.99),
(127, 133, 1, 1, 4, 3.99),
(128, 133, 3, 1, 9, 8.99),
(129, 135, 2, 1, 22, 21.99),
(130, 135, 1, 1, 4, 3.99),
(131, 136, 2, 1, 22, 21.99),
(132, 136, 1, 1, 4, 3.99),
(133, 136, 4, 1, 9, 8.99),
(134, 137, 2, 1, 22, 21.99),
(135, 138, 1, 2, 3.99, 7.98),
(136, 139, 1, 1, 3.99, 3.99),
(137, 139, 2, 1, 21.99, 21.99),
(138, 140, 1, 1, 3.99, 3.99),
(139, 141, 2, 1, 22, 21.99),
(140, 141, 1, 1, 3.99, 3.99),
(141, 142, 2, 1, 22, 21.99),
(142, 142, 1, 1, 4, 3.99),
(143, 142, 1, 1, 3.99, 3.99),
(144, 142, 2, 1, 21.99, 21.99),
(145, 142, 1, 1, 4, 3.99),
(146, 143, 3, 1, 9, 8.99),
(147, 143, 1, 1, 3.99, 3.99),
(148, 143, 2, 1, 22, 21.99),
(149, 144, 1, 1, 3.99, 3.99),
(150, 145, 5, 1.99, 32.99, 65.65),
(151, 146, 2, 1, 22, 21.99),
(152, 146, 3, 1, 9, 8.99),
(153, 146, 1, 1, 3.99, 3.99),
(154, 147, 1, 1, 3.99, 3.99),
(155, 148, 2, 1, 22, 21.99),
(156, 149, 2, 1, 22, 21.99),
(157, 149, 1, 10, 3.99, 39.9),
(158, 150, 1, 1, 3.99, 3.99),
(159, 151, 2, 1, 22, 21.99),
(160, 152, 1, 1, 3.99, 3.99),
(161, 152, 2, 1, 22, 21.99),
(162, 152, 1, 1, 4, 3.99),
(163, 152, 3, 1, 8.99, 8.99),
(164, 153, 1, 1, 3.99, 3.99),
(165, 154, 1, 1, 3.99, 3.99),
(166, 155, 2, 1, 22, 21.99),
(167, 156, 3, 1, 9, 8.99),
(168, 157, 2, 1, 22, 21.99),
(169, 158, 2, 1, 22, 21.99),
(170, 159, 2, 1, 22, 21.99),
(171, 160, 3, 1, 9, 8.99),
(172, 160, 4, 1, 9, 8.99),
(173, 161, 1, 1, 3.99, 3.99),
(174, 161, 2, 1, 21.99, 21.99),
(175, 162, 2, 1, 22, 21.99),
(176, 164, 2, 1, 22, 21.99),
(177, 164, 1, 1, 4, 3.99),
(178, 168, 2, 1, 22, 21.99),
(179, 168, 3, 1, 9, 8.99),
(180, 169, 2, 1, 22, 21.99),
(181, 169, 1, 1, 4, 3.99),
(182, 169, 4, 1, 9, 8.99),
(183, 169, 3, 1, 9, 8.99),
(184, 170, 2, 1, 21.99, 21.99),
(185, 171, 2, 1, 22, 21.99),
(186, 1, 1, 1.35, 4, 0),
(187, 1, 2, 2, 22, 0),
(188, 1, 1, 1.35, 4, 0),
(189, 1, 2, 2, 22, 0),
(190, 1, 1, 4, 3.19, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `ID` int(11) NOT NULL,
  `NomeProduto` varchar(200) NOT NULL,
  `DataCadastro` date NOT NULL,
  `PrecoUnitario` double NOT NULL,
  `DataAtualizacao` date DEFAULT NULL,
  `ValCompra` double DEFAULT NULL,
  `CodBarras` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`ID`, `NomeProduto`, `DataCadastro`, `PrecoUnitario`, `DataAtualizacao`, `ValCompra`, `CodBarras`) VALUES
(1, 'Macarrão', '2021-10-29', 3.99, '2021-10-29', 2.09, 1),
(2, 'Arroz Painho 5kg', '2021-10-29', 21.99, '2021-10-29', 16.31, 2),
(3, 'Feijão Tio Jorge 1Kg', '2021-10-29', 8.99, '2021-10-29', 6.97, 3),
(4, 'Óleo de Soja Soya 900ml', '2021-10-29', 8.99, '2021-10-29', 7.19, 4),
(5, 'Carne Patinho Kg', '2021-10-30', 32.99, '2021-10-30', 27.99, 28),
(6, 'Produto teste ', '2021-10-31', 5.39, '2021-10-31', 3.09, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `ID` int(11) NOT NULL,
  `DataVenda` date NOT NULL,
  `ValorTotal` float NOT NULL,
  `IDCliente` int(11) DEFAULT NULL,
  `DataEntrega` date DEFAULT NULL,
  `QuantidadeItens` int(11) NOT NULL,
  `StatusVenda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`ID`, `DataVenda`, `ValorTotal`, `IDCliente`, `DataEntrega`, `QuantidadeItens`, `StatusVenda`) VALUES
(1, '2021-11-02', 0, 1, '2021-11-12', 5, 2),
(2, '2021-11-03', 0, NULL, NULL, 0, 3),
(3, '2021-10-29', 0, NULL, NULL, 0, 2),
(4, '2021-10-29', 0, NULL, NULL, 0, 3),
(5, '2021-10-30', 0, NULL, NULL, 0, 3),
(6, '2021-10-30', 0, NULL, NULL, 0, 3),
(7, '2021-10-30', 0, NULL, NULL, 0, 3),
(8, '2021-10-30', 0, NULL, NULL, 0, 3),
(9, '2021-10-30', 201.157, NULL, NULL, 31, 2),
(10, '2021-10-30', 8.99, NULL, NULL, 1, 2),
(11, '2021-10-30', 61.96, NULL, NULL, 4, 2),
(12, '2021-10-30', 0, NULL, NULL, 0, 2),
(13, '2021-10-30', 0, NULL, NULL, 0, 3),
(14, '2021-10-30', 51.96, NULL, NULL, 4, 2),
(15, '2021-10-30', 0, NULL, NULL, 0, 2),
(16, '2021-10-30', 0, NULL, NULL, 0, 3),
(17, '2021-10-30', 0, NULL, NULL, 0, 3),
(18, '2021-10-30', 0, NULL, NULL, 0, 2),
(19, '2021-10-30', 0, NULL, NULL, 0, 2),
(20, '2021-10-30', 0, NULL, NULL, 0, 2),
(21, '2021-10-30', 0, NULL, NULL, 0, 2),
(22, '2021-10-30', 43.98, NULL, NULL, 2, 2),
(23, '2021-10-30', 65.97, NULL, NULL, 3, 2),
(24, '2021-10-30', 0, NULL, NULL, 0, 2),
(25, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(26, '2021-10-30', 43.98, NULL, NULL, 2, 2),
(27, '2021-10-30', 0, NULL, NULL, 0, 2),
(28, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(29, '2021-10-30', 0, NULL, NULL, 0, 2),
(30, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(31, '2021-10-30', 0, NULL, NULL, 0, 3),
(32, '2021-10-30', 21.99, NULL, NULL, 1, 3),
(33, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(34, '2021-10-30', 0, NULL, NULL, 0, 3),
(35, '2021-10-30', 21.99, NULL, NULL, 1, 3),
(36, '2021-10-30', 0, NULL, NULL, 0, 3),
(37, '2021-10-30', 74.96, NULL, NULL, 4, 2),
(38, '2021-10-30', 21.99, NULL, NULL, 1, 3),
(39, '2021-10-30', 30.98, NULL, NULL, 2, 3),
(40, '2021-10-30', 52.97, NULL, NULL, 3, 3),
(41, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(42, '2021-10-30', 21.99, NULL, NULL, 1, 3),
(43, '2021-10-30', 0, NULL, NULL, 0, 3),
(44, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(45, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(46, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(47, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(48, '2021-10-30', 21.99, NULL, NULL, 1, 3),
(49, '2021-10-30', 0, NULL, NULL, 0, 3),
(50, '2021-10-30', 21.99, NULL, NULL, 1, 3),
(51, '2021-10-30', 25.98, NULL, NULL, 2, 3),
(52, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(53, '2021-10-30', 21.99, NULL, NULL, 1, 3),
(54, '2021-10-30', 0, NULL, NULL, 0, 3),
(55, '2021-10-30', 0, NULL, NULL, 0, 3),
(56, '2021-10-30', 0, NULL, NULL, 0, 3),
(57, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(58, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(59, '2021-10-30', 21.99, NULL, NULL, 1, 3),
(60, '2021-10-30', 0, NULL, NULL, 0, 3),
(61, '2021-10-30', 21.99, NULL, NULL, 1, 3),
(62, '2021-10-30', 0, NULL, NULL, 0, 3),
(63, '2021-10-30', 21.99, NULL, NULL, 1, 3),
(64, '2021-10-30', 0, NULL, NULL, 0, 3),
(65, '2021-10-30', 21.99, NULL, '2021-11-09', 1, 2),
(66, '2021-10-30', 21.99, NULL, '2021-11-09', 1, 2),
(67, '2021-10-30', 21.99, NULL, '2021-11-09', 1, 3),
(68, '2021-10-30', 21.99, NULL, '2021-11-09', 1, 3),
(69, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(70, '2021-10-30', 21.99, NULL, '2021-11-09', 1, 3),
(71, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(72, '2021-10-30', 0, NULL, NULL, 0, 3),
(73, '2021-10-30', 21.99, NULL, '2021-11-09', 1, 3),
(74, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(75, '2021-10-30', 25.98, NULL, '2021-11-09', 2, 2),
(76, '2021-10-30', 0, NULL, NULL, 0, 2),
(77, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(78, '2021-10-30', 25.98, NULL, '2021-11-09', 2, 2),
(79, '2021-10-30', 0, NULL, NULL, 0, 2),
(80, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(81, '2021-10-30', 34.97, NULL, '2021-11-09', 3, 2),
(82, '2021-10-30', 0, NULL, NULL, 0, 2),
(83, '2021-10-30', 3.99, NULL, NULL, 1, 2),
(84, '2021-10-30', 25.98, NULL, NULL, 2, 2),
(85, '2021-10-30', 30.98, NULL, '2021-11-09', 2, 2),
(86, '2021-10-30', 0, NULL, NULL, 0, 2),
(87, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(88, '2021-10-30', 30.98, NULL, '2021-11-09', 2, 2),
(89, '2021-10-30', 0, NULL, NULL, 0, 3),
(90, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(91, '2021-10-30', 30.98, NULL, '2021-11-09', 2, 2),
(92, '2021-10-30', 0, NULL, NULL, 0, 3),
(93, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(94, '2021-10-30', 30.98, NULL, '2021-11-09', 2, 2),
(95, '2021-10-30', 0, NULL, NULL, 0, 3),
(96, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(97, '2021-10-30', 39.97, NULL, '2021-11-09', 3, 2),
(98, '2021-10-30', 0, NULL, NULL, 0, 3),
(99, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(100, '2021-10-30', 30.98, NULL, NULL, 2, 2),
(101, '2021-10-30', 39.97, NULL, NULL, 3, 2),
(102, '2021-10-30', 0, NULL, NULL, 0, 2),
(103, '2021-10-30', 0, NULL, NULL, 0, 3),
(104, '2021-10-30', 0, NULL, NULL, 0, 3),
(105, '2021-10-30', 0, NULL, NULL, 0, 2),
(106, '2021-10-30', 0, NULL, NULL, 0, 3),
(107, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(108, '2021-10-30', 0, NULL, NULL, 0, 3),
(109, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(110, '2021-10-30', 0, NULL, NULL, 0, 3),
(111, '2021-10-30', 0, NULL, NULL, 0, 3),
(112, '2021-10-30', 0, NULL, NULL, 0, 3),
(113, '2021-10-30', 0, NULL, NULL, 0, 3),
(114, '2021-10-30', 21.99, NULL, '2021-11-09', 1, 2),
(115, '2021-10-30', 0, NULL, NULL, 0, 2),
(116, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(117, '2021-10-30', 0, NULL, NULL, 0, 2),
(118, '2021-10-30', 0, NULL, NULL, 0, 2),
(119, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(120, '2021-10-30', 0, NULL, NULL, 0, 2),
(121, '2021-10-30', 21.99, NULL, NULL, 1, 2),
(122, '2021-10-30', 0, NULL, NULL, 0, 2),
(126, '2021-10-30', 0, NULL, NULL, 0, 2),
(127, '2021-10-30', 0, NULL, NULL, 0, 2),
(128, '2021-10-30', 0, NULL, NULL, 0, 2),
(129, '2021-10-30', 34.97, NULL, NULL, 3, 2),
(130, '2021-10-30', 21.99, NULL, '2021-11-09', 1, 2),
(131, '2021-10-30', 21.99, NULL, '2021-11-09', 1, 2),
(132, '2021-10-30', 29.97, NULL, '2021-11-09', 3, 2),
(133, '2021-10-30', 34.97, NULL, '2021-11-09', 3, 2),
(134, '2021-10-30', 0, NULL, NULL, 0, 3),
(135, '2021-10-30', 25.98, NULL, '2021-11-09', 2, 2),
(136, '2021-10-30', 34.97, NULL, '2021-11-09', 3, 2),
(137, '2021-10-30', 21.99, NULL, '2021-11-09', 1, 2),
(138, '2021-10-30', 7.98, NULL, '2021-11-09', 1, 2),
(139, '2021-10-30', 25.98, NULL, '2021-11-09', 2, 2),
(140, '2021-10-30', 3.99, NULL, '2021-11-09', 1, 2),
(141, '2021-10-30', 25.98, NULL, '2021-11-09', 2, 2),
(142, '2021-10-30', 55.95, NULL, '2021-11-09', 5, 2),
(143, '2021-10-30', 34.97, NULL, '2021-11-09', 3, 2),
(144, '2021-10-30', 3.99, NULL, '2021-11-09', 1, 2),
(145, '2021-10-30', 65.65, NULL, '2021-11-09', 1, 2),
(146, '2021-10-30', 34.97, NULL, '2021-11-09', 3, 2),
(147, '2021-10-30', 3.99, NULL, '2021-11-09', 1, 2),
(148, '2021-10-30', 21.99, NULL, '2021-11-09', 1, 2),
(149, '2021-10-30', 61.89, NULL, '2021-11-09', 2, 2),
(150, '2021-10-30', 3.99, NULL, '2021-11-09', 1, 2),
(151, '2021-10-30', 21.99, NULL, '2021-11-09', 1, 2),
(152, '2021-10-30', 38.96, NULL, '2021-11-09', 4, 2),
(153, '2021-10-30', 3.99, NULL, '2021-11-09', 1, 2),
(154, '2021-10-31', 3.99, NULL, '2021-11-10', 1, 2),
(155, '2021-10-31', 21.99, NULL, '2021-11-10', 1, 2),
(156, '2021-10-31', 8.99, 3, '2021-11-10', 1, 2),
(157, '2021-10-31', 21.99, NULL, '2021-11-10', 1, 2),
(158, '2021-10-31', 21.99, NULL, '2021-11-10', 1, 2),
(159, '2021-10-31', 21.99, NULL, '2021-11-10', 1, 2),
(160, '2021-10-31', 17.98, 2, '2021-11-10', 2, 2),
(161, '2021-11-01', 25.98, 1, '2021-11-11', 2, 2),
(162, '2021-11-01', 21.99, 1, '2021-11-11', 1, 2),
(163, '2021-11-01', 0, 1, '2021-11-11', 0, 2),
(164, '2021-11-01', 25.98, NULL, '2021-11-11', 2, 2),
(165, '2021-11-02', 0, NULL, NULL, 0, 1),
(166, '2021-11-02', 0, NULL, NULL, 0, 1),
(167, '2021-11-02', 0, NULL, NULL, 0, 1),
(168, '2021-11-02', 30.98, NULL, '2021-11-12', 2, 2),
(169, '2021-11-02', 43.96, 1, '2021-11-12', 4, 2),
(170, '2021-11-02', 21.99, NULL, '2021-11-12', 1, 2),
(171, '2021-11-02', 21.99, 1, '2021-11-12', 1, 2),
(172, '2021-11-02', 0, NULL, NULL, 0, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_venda` (`IDVenda`),
  ADD KEY `fk_Produto` (`IDProduto`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_cliente` (`IDCliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `itemvenda`
--
ALTER TABLE `itemvenda`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD CONSTRAINT `fk_Produto` FOREIGN KEY (`IDProduto`) REFERENCES `produto` (`ID`),
  ADD CONSTRAINT `fk_venda` FOREIGN KEY (`IDVenda`) REFERENCES `venda` (`ID`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`IDCliente`) REFERENCES `cliente` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
