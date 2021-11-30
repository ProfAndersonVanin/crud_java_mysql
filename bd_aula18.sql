-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Nov-2021 às 18:48
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdlojaetec`
--
CREATE DATABASE IF NOT EXISTS `bdlojaetec` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bdlojaetec`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `idcli` int(11) NOT NULL,
  `nomecli` varchar(50) NOT NULL,
  `endcli` varchar(100) NOT NULL,
  `fonecli` varchar(15) NOT NULL,
  `emailcli` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`idcli`, `nomecli`, `endcli`, `fonecli`, `emailcli`) VALUES
(1, 'CANTINA ETEC MCM', 'RUA BÉLGICA, 88', '1148484848', 'cantinaetec@email.com'),
(2, 'PAPELARIA SEILA', 'RUA DO CENTRO, 1234', '11998956464', 'papelaria@email.com'),
(3, 'José da silva VANIN', 'Rua sei lá, 123', '99999-0000', 'jose@email.com'),
(4, 'João Ribeiro', 'Rua Amazonas, 1111', '8888-8888', 'joao@email.com'),
(5, 'Carlos Sampaio', 'Av principal, 4321', '5656-5656', 'carlos@email.com'),
(6, 'Cida da Silva', 'Rua tr~es, 123456', '7896-6532', 'cida@email.com'),
(7, 'Joana d\'Arc', 'Av 7 de setembro, 123', '3698-9512', 'joana@email.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordem_servico`
--

CREATE TABLE `ordem_servico` (
  `os` int(11) NOT NULL,
  `data_os` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo` varchar(15) NOT NULL,
  `situacao` varchar(50) NOT NULL,
  `equipamento` varchar(150) NOT NULL,
  `defeito` varchar(150) NOT NULL,
  `tecnico` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `servico` varchar(150) NOT NULL,
  `idcli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ordem_servico`
--

INSERT INTO `ordem_servico` (`os`, `data_os`, `tipo`, `situacao`, `equipamento`, `defeito`, `tecnico`, `valor`, `servico`, `idcli`) VALUES
(2, '2021-11-16 14:12:56', 'Orçamento', 'Aguardando Aprovação', 'Notebook Asus', 'Não Liga', 'Anderson', '150.00', 'Trocar bateria', 7),
(3, '2021-11-16 16:42:54', 'Orçamento', 'Aguardando Aprovação', 'Notebook ACer', 'Não Liga', 'Anderson', '150.00', 'Trocar a bateria', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `iduser` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `fone` varchar(15) NOT NULL,
  `login` varchar(15) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `perfil` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`iduser`, `usuario`, `fone`, `login`, `senha`, `perfil`) VALUES
(1, 'ANDERSON VANIN', '1199999-9999', 'anderson', '1234', 'admin'),
(2, 'FULANO DA SILVA', '1199999-9999', 'fulano', '1234', 'admin'),
(3, 'ZEZINHO DA SILVA', '1199999-9999', 'zezinho', '1234', 'user');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcli`);

--
-- Índices para tabela `ordem_servico`
--
ALTER TABLE `ordem_servico`
  ADD PRIMARY KEY (`os`),
  ADD KEY `idcli` (`idcli`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `ordem_servico`
--
ALTER TABLE `ordem_servico`
  MODIFY `os` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `ordem_servico`
--
ALTER TABLE `ordem_servico`
  ADD CONSTRAINT `ordem_servico_ibfk_1` FOREIGN KEY (`idcli`) REFERENCES `clientes` (`idcli`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
