-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 29-Jul-2015 às 23:10
-- Versão do servidor: 5.5.40-0ubuntu0.14.04.1
-- versão do PHP: 5.5.27-1+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `ceafie`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE IF NOT EXISTS `aluno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `graduacao` varchar(45) NOT NULL,
  `universidade` varchar(45) NOT NULL,
  `unidade_organica` varchar(45) NOT NULL,
  `categoria_docente` varchar(45) NOT NULL,
  `funcao` varchar(45) NOT NULL,
  `categoria_cientifica` varchar(45) NOT NULL,
  `pessoa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aluno_pessoa_idx` (`pessoa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`id`, `graduacao`, `universidade`, `unidade_organica`, `categoria_docente`, `funcao`, `categoria_cientifica`, `pessoa_id`) VALUES
(49, 'AUDS', 'SSSSS', 'Sammm', 'Nenhum', 'Chefe de departamento', 'Investigador', 235),
(50, 'ASSSD', 'ASSSS', 'AAAAA', 'Titular', 'Chefe de departamento', 'Nenhuma', 256),
(54, 'ASSSD', 'sddfff', 'ADDaa', 'Assistente', 'Chefe de departamento', 'Nenhuma', 266),
(55, 'sssaa', 'ssaaaa', 'ASDFaa', 'Associado', 'Chefe de departamento', 'Investigador', 267),
(56, 'TEC TELECOMUNICAÇÕES', 'assdaaa', 'ADDaaa', 'Assistente', 'Chefe de departamento', 'Nenhuma', 268),
(58, 'ASSSDaaa', 'ssaaaaaaaaaaaa', 'ADDaaaaa', 'Associado', 'Chefe de departamento', 'Nenhuma', 270),
(59, 'AUDaaa', 'assdaaa', 'ADDaaaa', 'Assistente', 'Chefe de departamento', 'Investigador', 276);

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`id`, `descricao`, `nome`) VALUES
(14, 'Curso de AgregaÃ§Ã£o Pedagogica', 'CAP'),
(15, 'Curso de Elaboracao de Projectos de Investiga', 'CEPID'),
(17, 'Curso de Elaboracao e Publicacao de Artigos C', 'CEPAC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `docente`
--

CREATE TABLE IF NOT EXISTS `docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grau` varchar(45) NOT NULL,
  `pessoa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_docente_pessoa1_idx` (`pessoa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `docente`
--

INSERT INTO `docente` (`id`, `grau`, `pessoa_id`) VALUES
(4, 'Licenciado', 259),
(5, '000', 260),
(6, 'Licenciado', 261);

-- --------------------------------------------------------

--
-- Estrutura da tabela `docentmodulo`
--

CREATE TABLE IF NOT EXISTS `docentmodulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_docentmodulo_modulo1_idx` (`modulo_id`),
  KEY `fk_docentmodulo_docente1_idx` (`docente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_maquina` varchar(45) DEFAULT NULL,
  `acao` varchar(45) NOT NULL,
  `data` varchar(45) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Extraindo dados da tabela `log`
--

INSERT INTO `log` (`id`, `ip_maquina`, `acao`, `data`, `usuario_id`, `status`) VALUES
(1, '127.0.0.1', 'Adicionado novo curso asdDD', '27-07-2015 05:07:45', 36, 1),
(2, '127.0.0.1', 'Alterado o curso parasapp', '27-07-2015 05:07:04', 36, 2),
(3, '127.0.0.1', 'Alterado o curso parasap', '27-07-2015 05:07:33', 36, 2),
(4, '127.0.0.1', 'Adicionado novo curso sam sassdda', '27-07-2015 05:07:38', 36, 1),
(5, '127.0.0.1', 'Alterado o curso para  saasas', '27-07-2015 05:07:46', 36, 2),
(6, '127.0.0.1', 'Alterado o curso para saa', '27-07-2015 05:07:24', 36, 2),
(22, '127.0.0.1', 'Foi removido um  docente do sistema', '27-07-2015 05:07:58', 36, 0),
(24, '127.0.0.1', 'Foi criado um novo docente com o nome de : sa', '27-07-2015 05:07:37', 36, 1),
(25, '127.0.0.1', 'Foi Editado  informações do docente Com o nom', '27-07-2015 05:07:02', 36, 2),
(31, '127.0.0.1', 'Foi criado um novo docente com o nome de : sa', '27-07-2015 05:07:38', 36, 1),
(53, '127.0.0.1', 'Foi removido um  docente do sistema', '27-07-2015 05:07:06', 36, 0),
(54, '127.0.0.1', 'Foi removido um  docente do sistema', '27-07-2015 05:07:06', 36, 0),
(55, '127.0.0.1', 'Foi removido um  docente do sistema', '27-07-2015 05:07:06', 36, 0),
(56, '127.0.0.1', 'Foi removido um  docente do sistema', '27-07-2015 05:07:09', 36, 0),
(57, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdd', '27-07-2015 05:07:12', 36, 1),
(58, '127.0.0.1', 'Foi Editado  informações do aluno', '27-07-2015 05:07:37', 36, 2),
(59, '127.0.0.1', 'Removido um aluno', '27-07-2015 05:07:09', 36, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `materia`
--

CREATE TABLE IF NOT EXISTS `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(45) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  KEY `fk_materia_curso1_idx` (`curso_id`),
  KEY `fk_materia_modulo1_idx` (`modulo_id`),
  KEY `fk_materia_docente1_idx` (`docente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula`
--

CREATE TABLE IF NOT EXISTS `matricula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_matricula_aluno1_idx` (`aluno_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Extraindo dados da tabela `matricula`
--

INSERT INTO `matricula` (`id`, `data`, `estado`, `aluno_id`) VALUES
(44, '03-06-2015', 'FECHADO', 49),
(45, '07-07-2015', 'FECHADO', 50),
(49, '18-07-2015', 'FECHADO', 54),
(50, '25-07-2015', 'FECHADO', 55),
(51, '25-07-2015', 'FECHADO', 56),
(53, '23-07-2015', 'FECHADO', 58),
(54, '30-07-2015', 'ABERTO', 59);

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula_modulo`
--

CREATE TABLE IF NOT EXISTS `matricula_modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `data` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_matricula_modulo_matricula1_idx` (`matricula_id`),
  KEY `fk_matricula_modulo_modulo1_idx` (`modulo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Extraindo dados da tabela `matricula_modulo`
--

INSERT INTO `matricula_modulo` (`id`, `matricula_id`, `modulo_id`, `data`) VALUES
(15, 44, 7, '03-06-2015'),
(25, 44, 8, '18-06-2015'),
(26, 44, 9, '03-06-2015'),
(27, 45, 8, '07-07-2015'),
(28, 44, 8, '15-07-2015'),
(29, 45, 14, '09-07-2015'),
(33, 49, 7, '18-07-2015'),
(34, 50, 8, '25-07-2015'),
(35, 51, 14, '25-07-2015'),
(37, 53, 8, '23-07-2015'),
(38, 54, 7, '30-07-2015');

-- --------------------------------------------------------

--
-- Estrutura da tabela `modulo`
--

CREATE TABLE IF NOT EXISTS `modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  KEY `fk_modulo_curso1_idx` (`curso_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Extraindo dados da tabela `modulo`
--

INSERT INTO `modulo` (`id`, `nome`, `curso_id`) VALUES
(7, 'COMPUTAÇÃO', 14),
(8, 'Tecnicas e Linguagem de Programação', 15),
(9, 'Elaboração de projecto', 17),
(14, 'Tecnologia de Rede', 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nota`
--

CREATE TABLE IF NOT EXISTS `nota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota` set('Excelente','Suficiente','Bom','') DEFAULT NULL,
  `data` varchar(45) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nota_aluno1_idx` (`aluno_id`),
  KEY `fk_nota_modulo1_idx` (`modulo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Extraindo dados da tabela `nota`
--

INSERT INTO `nota` (`id`, `nota`, `data`, `aluno_id`, `modulo_id`) VALUES
(15, 'Suficiente', '2015-06-18', 49, 7),
(17, 'Bom', '2015-06-18', 49, 8),
(19, 'Suficiente', '2015-07-03', 50, 8),
(20, 'Excelente', '2015-07-20', 56, 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE IF NOT EXISTS `pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `genero` set('masculino','femenino') DEFAULT NULL,
  `nacionalidade` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `imagem` varchar(5000) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `bi` varchar(45) DEFAULT NULL,
  `documento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bi_UNIQUE` (`bi`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone`),
  UNIQUE KEY `unique_index` (`bi`,`documento`,`email`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=277 ;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`id`, `nome`, `genero`, `nacionalidade`, `telefone`, `imagem`, `email`, `bi`, `documento`) VALUES
(128, 'Admin', 'masculino', 'ANGOLANA', '934895543', NULL, 'forksystem@gmail.com', '874567823LA032', NULL),
(235, 'Dario Germano', 'masculino', 'ANGOLANA', '344443339', 'upload/1902749_519278058210397_3315582850152740192_n.jpg', 'samp3aioelon@hotmail.com', '347593420LA035', NULL),
(250, 'ADMINISTRADOR', 'masculino', 'ANGOLANA', '222', 's33', 'sdd', 'eee', 'ee'),
(256, ' JOÃO ANTONIO QUIFUTA', 'masculino', 'ANGOLANA', '983445566', NULL, 'joao@homail.com', '234209341LA039', NULL),
(259, 'ess asd', 'masculino', 'angola', '222222222', NULL, 'sampaio@gmal.com', '347593410LA030', NULL),
(260, '2222 22222', 'femenino', 'ANGOLANA', '236987653', NULL, 'sa33332ewmdd@gmail.com', '234209345LA035', NULL),
(261, 'eeeeee     sam', 'femenino', 'angola', '236987351', NULL, 'sassmp3aioelon@hotmail.com', '234209345LA032', NULL),
(266, 'elone samssss', 'femenino', 'ANGOLANA', '236987659', NULL, 'sa3332332e222wmdd@gmail.com', '234209385LA039', NULL),
(267, 'asdsam asdwedf', 'femenino', 'ANGOLANA', '344443341', NULL, 'sa333332332e222wmdd@gmail.com', '234201345LA037', NULL),
(268, '  saasas asdwedf', 'masculino', 'ANGOLANA', '236987654', NULL, 'sa3332332e222222wmdd@gmail.com', '234109345LA036', NULL),
(270, '   aaaaaaww eeeeeeeeeeeee', 'femenino', 'ANGOLANA', '923456743', NULL, 'samdhd@gh.com', '234202345LA032', NULL),
(276, ' sdddkd asdwedf', 'masculino', 'ANGOLANA', '236987611', NULL, 'sa2mdhd@gh.com', '134209345LA032', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `programa`
--

CREATE TABLE IF NOT EXISTS `programa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(50) NOT NULL,
  `local` varchar(45) DEFAULT NULL,
  `modulo_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `hora` varchar(250) DEFAULT NULL,
  `datafinal` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_programa_modulo1_idx` (`modulo_id`),
  KEY `fk_programa_docente1_idx` (`docente_id`),
  KEY `fk_programa_curso1_idx` (`curso_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `programa`
--

INSERT INTO `programa` (`id`, `data`, `local`, `modulo_id`, `docente_id`, `curso_id`, `hora`, `datafinal`) VALUES
(7, '25/07/2015', 'kkkkkkkkkk ', 7, 5, 14, '20h', '25/07/2015'),
(8, '25/07/2015', 'luanda ', 7, 5, 14, '20h', '31/07/2015'),
(9, '24/07/2015', ' ddddd', 7, 6, 14, '40h', '25/07/2015'),
(10, '24/07/2015', 'llllllllll', 14, 6, 14, '20h', '31/07/2015');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `nivel` set('administrador','aluno','docente','gestor') NOT NULL,
  `pessoa_id` int(11) NOT NULL,
  `tema` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_pessoa1_idx` (`pessoa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `login`, `senha`, `nivel`, `pessoa_id`, `tema`) VALUES
(36, 'admin', '9d32bccb306f7e1b3e737cecb07f8fc7', 'gestor', 128, 'metro'),
(62, 'Samuel6', '9d0f572d371c1f6d6115a77d316cb807', 'aluno', 235, NULL),
(78, 'administrador', '9d32bccb306f7e1b3e737cecb07f8fc7', 'administrador', 250, NULL),
(84, '234209341LA039', 'bbad6acb15c68e940530ef63db462801', 'aluno', 256, NULL),
(91, '234209385LA039', '834872bea91e64036629ec9990c59d36', 'aluno', 266, NULL),
(92, '234201345LA037', '00a0beb82f0d701bcf44bff0ff07f7a5', 'aluno', 267, NULL),
(93, '234109345LA036', '7acf6bade6c55992559dfe65a1c36c83', 'aluno', 268, NULL),
(95, '234202345LA032', '38545b2a6a3ab088e99e00a954e551c1', 'aluno', 270, NULL),
(101, '134209345LA032', '90305e3cc9b88ed519ac7a188069e2a5', 'aluno', 276, NULL);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_aluno_pessoa` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `fk_docente_pessoa1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `docentmodulo`
--
ALTER TABLE `docentmodulo`
  ADD CONSTRAINT `fk_docentmodulo_docente1` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_docentmodulo_modulo1` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_log_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `fk_materia_curso1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materia_docente1` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materia_modulo1` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `fk_matricula_aluno1` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `matricula_modulo`
--
ALTER TABLE `matricula_modulo`
  ADD CONSTRAINT `fk_matricula_modulo_matricula1` FOREIGN KEY (`matricula_id`) REFERENCES `matricula` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_matricula_modulo_modulo1` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `modulo`
--
ALTER TABLE `modulo`
  ADD CONSTRAINT `fk_modulo_curso1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `fk_nota_aluno1` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nota_modulo1` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `programa`
--
ALTER TABLE `programa`
  ADD CONSTRAINT `fk_programa_curso1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_programa_docente1` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_programa_modulo1` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_pessoa1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
