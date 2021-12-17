-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29-Nov-2021 às 18:03
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdda0swk`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_DeletarPedido` (IN `IdPed` INT)  BEGIN

DELETE from pedidosproduto WHERE NumeroPedido=IdPed;
DELETE FROM pedidosgeral WHERE NumeroPedido=Idped;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `Codigo` int(11) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Cidade` varchar(30) NOT NULL,
  `UF` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Cliente Tabela';

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`Codigo`, `Nome`, `Cidade`, `UF`) VALUES
(1, 'Sergio', 'Nova Iguaçu', 'RJ'),
(2, 'Missias', 'Rio de Janeiro', 'RJ'),
(3, 'Manuel', 'Caxias', 'RJ'),
(4, 'Dalva', 'Niteroi', 'RJ'),
(5, 'Patricia', 'São Goncalo', 'RJ'),
(6, 'Carlos', 'Caxias do sul', 'RJ'),
(7, 'Thaynara', 'Seropedidca', 'RJ'),
(8, 'Rayane', 'Nilopolis', 'RJ'),
(9, 'Felipe', 'Anchieta', 'RJ'),
(10, 'Marco', 'Campo Grande', 'RJ'),
(11, 'Ederson', 'Tingua', 'RJ'),
(12, 'Ricardo', 'Rio', 'RJ'),
(13, 'Jerson', 'São Paulo', 'SP'),
(14, 'Carlos Gomes', 'Bauru', 'SP'),
(15, 'Severina', 'Vassouras', 'RJ'),
(16, 'João', 'Paracambi', 'RJ'),
(17, 'Samuel', 'Japeri', 'RJ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidosgeral`
--

CREATE TABLE `pedidosgeral` (
  `NumeroPedido` int(11) NOT NULL,
  `DiaPedido` date NOT NULL,
  `CodCliente` int(11) NOT NULL,
  `ValorTotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidosgeral`
--

INSERT INTO `pedidosgeral` (`NumeroPedido`, `DiaPedido`, `CodCliente`, `ValorTotal`) VALUES
(1, '2021-11-28', 1, '1500.00'),
(2, '2021-11-28', 1, '2750.45'),
(3, '2021-11-28', 1, '4000.90'),
(6, '2021-11-28', 1, '29250.45'),
(7, '2021-11-29', 1, '2850.11'),
(12, '2021-11-29', 1, '16250.45'),
(13, '2021-11-29', 1, '4000.90'),
(14, '2021-11-29', 1, '3751.35'),
(15, '2021-11-29', 1, '3000.00'),
(16, '2021-11-29', 1, '1250.45'),
(17, '2021-11-29', 1, '5251.35'),
(18, '2021-11-29', 1, '3751.35'),
(19, '2021-11-29', 1, '6501.80'),
(20, '2021-11-29', 15, '2500.00'),
(21, '2021-11-29', 16, '3400.45'),
(22, '2021-11-29', 12, '7000.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidosproduto`
--

CREATE TABLE `pedidosproduto` (
  `Autoincrem` int(11) NOT NULL,
  `NumeroPedido` int(11) NOT NULL,
  `CodProduto` int(11) NOT NULL,
  `Quantidade` decimal(10,2) NOT NULL,
  `ValorUni` decimal(10,2) NOT NULL,
  `ValorTotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidosproduto`
--

INSERT INTO `pedidosproduto` (`Autoincrem`, `NumeroPedido`, `CodProduto`, `Quantidade`, `ValorUni`, `ValorTotal`) VALUES
(5, 6, 1, '10.00', '1250.45', '40504.50'),
(6, 6, 2, '10.00', '1500.00', '29250.45'),
(7, 6, 1, '10.00', '1300.00', '13000.00'),
(8, 7, 2, '1.00', '1500.00', '1500.00'),
(9, 7, 1, '1.00', '1350.11', '1350.11'),
(21, 12, 1, '1.00', '1250.45', '1250.45'),
(22, 12, 2, '10.00', '1500.00', '15000.00'),
(23, 13, 1, '2.00', '1250.45', '2500.90'),
(24, 13, 2, '1.00', '1500.00', '1500.00'),
(25, 14, 1, '3.00', '1250.45', '3751.35'),
(26, 15, 1, '2.00', '1500.00', '3000.00'),
(27, 16, 1, '1.00', '1250.45', '1250.45'),
(28, 17, 2, '1.00', '1500.00', '1500.00'),
(29, 17, 1, '3.00', '1250.45', '3751.35'),
(30, 18, 1, '3.00', '1250.45', '3751.35'),
(31, 19, 2, '1.00', '1500.00', '1500.00'),
(32, 19, 1, '2.00', '1250.45', '2500.90'),
(33, 19, 1, '2.00', '1250.45', '2500.90'),
(34, 20, 5, '1.00', '300.00', '300.00'),
(35, 20, 8, '2.00', '600.00', '1200.00'),
(36, 20, 6, '2.00', '200.00', '400.00'),
(37, 20, 5, '2.00', '300.00', '600.00'),
(38, 21, 13, '2.00', '200.00', '400.00'),
(39, 21, 14, '1.00', '1250.00', '1250.00'),
(40, 21, 6, '1.00', '200.00', '200.00'),
(41, 21, 7, '1.00', '300.00', '300.00'),
(42, 21, 1, '1.00', '1250.45', '1250.45'),
(43, 22, 12, '2.00', '2500.00', '5000.00'),
(44, 22, 15, '1.00', '1000.00', '1000.00'),
(45, 22, 15, '1.00', '1000.00', '1000.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `CodProduto` int(11) NOT NULL,
  `Descricao` varchar(30) NOT NULL,
  `PrecoUnitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`CodProduto`, `Descricao`, `PrecoUnitario`) VALUES
(1, 'Pneu 1000/20 radial', '1250.45'),
(2, 'Pneu 1100/22 radial', '1500.00'),
(3, 'Pneu de fusca', '1000.00'),
(4, 'Pneu de Agile', '500.00'),
(5, 'Pneu de gol', '300.00'),
(6, 'Pneu de carroça', '200.00'),
(7, 'Pneu de Corsa', '300.00'),
(8, 'Pneu de Cobalt', '600.00'),
(9, 'Pneu de Voyage', '300.00'),
(10, 'Pneu de Charrete', '150.00'),
(11, 'Pneu de Bicicleta', '30.85'),
(12, 'Pneu de Carreta', '2500.00'),
(13, 'Pneu de Brasilia', '200.00'),
(14, 'Pneu de Onibus', '1250.00'),
(15, 'Pneu de Focus', '1000.00'),
(16, 'Pneu de Retro', '5000.00'),
(17, 'Pneu de F1000', '750.00'),
(18, 'Pneu de Rangerl', '1500.00'),
(19, 'Pneu de S10', '1200.00'),
(20, 'Pneu de Montana', '300.00'),
(21, 'Pneu de F1', '60000.00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Codigo`);

--
-- Índices para tabela `pedidosgeral`
--
ALTER TABLE `pedidosgeral`
  ADD PRIMARY KEY (`NumeroPedido`),
  ADD KEY `idxCodCliente` (`CodCliente`);

--
-- Índices para tabela `pedidosproduto`
--
ALTER TABLE `pedidosproduto`
  ADD PRIMARY KEY (`Autoincrem`),
  ADD KEY `fkProdutoPedido_Pedido` (`NumeroPedido`),
  ADD KEY `idxCodProdPedidos` (`CodProduto`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`CodProduto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `pedidosgeral`
--
ALTER TABLE `pedidosgeral`
  MODIFY `NumeroPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `pedidosproduto`
--
ALTER TABLE `pedidosproduto`
  MODIFY `Autoincrem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `CodProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedidosgeral`
--
ALTER TABLE `pedidosgeral`
  ADD CONSTRAINT `fkPedidoCliente` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`Codigo`);

--
-- Limitadores para a tabela `pedidosproduto`
--
ALTER TABLE `pedidosproduto`
  ADD CONSTRAINT `fkProdutoPedido_Pedido` FOREIGN KEY (`NumeroPedido`) REFERENCES `pedidosgeral` (`NumeroPedido`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
