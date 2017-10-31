-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 19-Maio-2016 às 20:33
-- Versão do servidor: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `meudindinajs`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nome`) VALUES
(1, 'Salário'),
(2, 'Moradia'),
(3, 'Empréstimo'),
(4, 'Aluguel'),
(5, 'Alimentação'),
(6, 'Diversão'),
(7, 'Transporte'),
(8, 'Saúde'),
(9, 'Vestuário'),
(10, 'Educação');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lancamento`
--

CREATE TABLE IF NOT EXISTS `lancamento` (
  `idlancamento` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo` int(11) NOT NULL COMMENT '0 Entrada / 1 Saída',
  `descricao` varchar(100) NOT NULL,
  `valor` float NOT NULL,
  `idcategoria` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `lancamento`
--

INSERT INTO `lancamento` (`idlancamento`, `data`, `tipo`, `descricao`, `valor`, `idcategoria`) VALUES
(1, '2016-05-05 12:55:23', 0, 'Recebimento do salário de Abril/2016', 12451, 1),
(2, '2016-05-05 12:55:23', 1, 'Conta de luz de Abril/2016', 135.85, 2),
(3, '2016-05-05 12:56:20', 1, 'Consulta médica e exame de raio x da coluna', 230, 8),
(4, '2016-05-05 12:57:34', 1, 'Mensalidade da universidade Abril/2016', 780.35, 10),
(5, '2016-05-05 12:58:32', 1, 'Ingresso para final do Campeonato Catarinense', 40, 6),
(6, '2016-05-05 19:06:54', 1, 'Lanche na cantina da Unoesc', 12, 5),
(7, '2016-05-05 19:18:28', 1, 'Ingresso para cinema', 24, 6),
(8, '2016-05-05 19:19:19', 1, 'Compra de livro AngularJS na prática', 100, 10),
(9, '2016-05-19 17:28:41', 1, 'Teste', 500, 4),
(10, '2016-05-19 17:30:13', 1, 'Mensalidade faculdade', 500, 10),
(11, '2016-05-19 17:30:26', 1, 'Mês de julho', 750, 4);

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indexes for table `lancamento`
--
ALTER TABLE `lancamento`
  ADD PRIMARY KEY (`idlancamento`),
  ADD KEY `fk_lancamento_categoria` (`idcategoria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `lancamento`
--
ALTER TABLE `lancamento`
  MODIFY `idlancamento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;

--
-- Limitadores para a tabela `lancamento`
--
ALTER TABLE `lancamento`
  ADD CONSTRAINT `fk_lancamento_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
