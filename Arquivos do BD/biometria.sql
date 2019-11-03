-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27-Set-2019 às 21:25
-- Versão do servidor: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biometria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `alunos` int(11) NOT NULL,
  `matricula` varchar(45) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `biometria` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`alunos`, `matricula`, `nome`, `biometria`) VALUES
(1, '21553601', 'ADELYANE LOBATO OSSAME', 'true'),
(2, '21553602', 'ADRIANO LIMA DE SOUZA', 'true'),
(3, '21553603', 'ANGELA MARIA FRAZAO DE ANDRADE', 'true'),
(4, '21553604', 'ANTONIO CARLOS SOLANO MARTINS', 'true'),
(5, '21553605', 'CLAUDETE LOPES DA SILVA', 'true'),
(6, '21553606', 'DIEGO LIMA DOS SANTOS', 'true'),
(7, '21553607', 'CLAUDETE LOPES DA SILVA', 'true'),
(8, '21553608', 'EDMILSON DOS SANTOS LIMA', 'true'),
(9, '21553609', 'ENI DIAS DE CARVALHO DELFINO', 'true'),
(10, '21553610', 'FRANCISLANE DE SA BARBOSA DA SILVA', 'true');

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `iddisciplinas` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `professores_idprofessores` int(11) NOT NULL,
  `alunos_alunos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `disciplinas`
--

INSERT INTO `disciplinas` (`iddisciplinas`, `nome`, `professores_idprofessores`, `alunos_alunos`) VALUES
(1, 'Engenharia de Software II', 1, 1),
(2, 'Engenharia de Software II', 1, 2),
(3, 'Engenharia de Software II', 1, 3),
(4, 'Engenharia de Software II', 1, 4),
(5, 'Engenharia de Software II', 1, 5),
(6, 'Engenharia de Software II', 1, 6),
(7, 'Engenharia de Software II', 1, 7),
(8, 'Engenharia de Software II', 1, 8),
(9, 'Engenharia de Software II', 1, 9),
(10, 'Engenharia de Software II', 1, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `listapresentes`
--

CREATE TABLE `listapresentes` (
  `idlistaPresentes` int(11) NOT NULL,
  `observacao` varchar(45) DEFAULT NULL,
  `disciplinas_iddisciplinas` int(11) NOT NULL,
  `alunos_alunos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professores`
--

CREATE TABLE `professores` (
  `idprofessores` int(11) NOT NULL,
  `nomeProfessor` varchar(45) DEFAULT NULL,
  `biometria` varchar(45) DEFAULT NULL,
  `usuario_idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `professores`
--

INSERT INTO `professores` (`idprofessores`, `nomeProfessor`, `biometria`, `usuario_idusuario`) VALUES
(1, 'Daniela Costa Pereira', 'true', 1),
(2, 'Vandermir Silva Souza', 'true', 2),
(3, 'Antonio da Costa Barata', 'true', 3),
(4, 'Odette Mestrinho Passos', 'true', 4),
(5, 'Alternei da Costa Miranda', 'true', 5),
(6, 'Bruno Passos Bonifacio', 'true', 6),
(7, 'Christopher Xavier', 'true', 7),
(8, 'Aurelio Junior', 'true', 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `usuario`, `senha`) VALUES
(1, 'daniela', '123456'),
(2, 'vandermir', '123456'),
(3, 'barata', '123456'),
(4, 'odette', '123456'),
(5, 'alternei', '123456'),
(6, 'bruno', '123456'),
(7, 'christopher', '123456'),
(8, 'aurelio', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`alunos`);

--
-- Indexes for table `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`iddisciplinas`,`professores_idprofessores`,`alunos_alunos`),
  ADD KEY `fk_disciplinas_professores1_idx` (`professores_idprofessores`),
  ADD KEY `fk_disciplinas_alunos1_idx` (`alunos_alunos`);

--
-- Indexes for table `listapresentes`
--
ALTER TABLE `listapresentes`
  ADD PRIMARY KEY (`idlistaPresentes`,`disciplinas_iddisciplinas`,`alunos_alunos`),
  ADD KEY `fk_listaPresentes_disciplinas1_idx` (`disciplinas_iddisciplinas`),
  ADD KEY `fk_listaPresentes_alunos1_idx` (`alunos_alunos`);

--
-- Indexes for table `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`idprofessores`,`usuario_idusuario`),
  ADD KEY `fk_professores_usuario_idx` (`usuario_idusuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alunos`
--
ALTER TABLE `alunos`
  MODIFY `alunos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `iddisciplinas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `listapresentes`
--
ALTER TABLE `listapresentes`
  MODIFY `idlistaPresentes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `professores`
--
ALTER TABLE `professores`
  MODIFY `idprofessores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD CONSTRAINT `fk_disciplinas_alunos1` FOREIGN KEY (`alunos_alunos`) REFERENCES `alunos` (`alunos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_disciplinas_professores1` FOREIGN KEY (`professores_idprofessores`) REFERENCES `professores` (`idprofessores`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `listapresentes`
--
ALTER TABLE `listapresentes`
  ADD CONSTRAINT `fk_listaPresentes_alunos1` FOREIGN KEY (`alunos_alunos`) REFERENCES `alunos` (`alunos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_listaPresentes_disciplinas1` FOREIGN KEY (`disciplinas_iddisciplinas`) REFERENCES `disciplinas` (`iddisciplinas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `professores`
--
ALTER TABLE `professores`
  ADD CONSTRAINT `fk_professores_usuario` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
