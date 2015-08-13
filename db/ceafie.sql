-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 13/08/2015 às 02:55
-- Versão do servidor: 5.6.25-0ubuntu0.15.04.1
-- Versão do PHP: 5.6.4-4ubuntu6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `ceafie`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE IF NOT EXISTS `aluno` (
`id` int(11) NOT NULL,
  `graduacao` varchar(45) NOT NULL,
  `universidade` varchar(45) NOT NULL,
  `unidade_organica` varchar(45) NOT NULL,
  `categoria_docente` varchar(45) NOT NULL,
  `funcao` varchar(45) NOT NULL,
  `categoria_cientifica` varchar(45) NOT NULL,
  `pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `aluno`
--

INSERT INTO `aluno` (`id`, `graduacao`, `universidade`, `unidade_organica`, `categoria_docente`, `funcao`, `categoria_cientifica`, `pessoa_id`) VALUES
(49, 'AUDS', 'SSSSS', 'Sammm', 'Nenhum', 'Chefe de departamento', 'Investigador', 235),
(50, 'ASSSD', 'ASSSS', 'AAAAA', 'Titular', 'Chefe de departamento', 'Nenhuma', 256),
(54, 'ASSSD', 'sddfff', 'ADDaa', 'Assistente', 'Chefe de departamento', 'Nenhuma', 266),
(56, 'TEC TELECOMUNICAÇÕES', 'assdaaa', 'ADDaaa', 'Assistente', 'Chefe de departamento', 'Nenhuma', 268),
(61, 'Doutoramento', 'UCAN', 'ADDaaaaa', 'Associado', 'Chefe de departamento', 'Investigador', 278),
(65, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'ssddff', 'mmmmmmmmmmmmmm', 282),
(68, 'asssdddf', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'mmmmmmmmmmmmmm', 'mmmmmmmmmmmmmm', 285),
(69, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'mmmmmmmmmmmmmm', 'mmmmmmmmmmmmmm', 286),
(70, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'mmmmmmmmmmmmmm', 'mmmmmmmmmmmmmm', 287),
(71, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'mmmmmmmmmmmmmm', 'mmmmmmmmmmmmmm', 288),
(72, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'mmmmmmmmmmmmmm', 'mmmmmmmmmmmmmm', 289),
(73, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'mmmmmmmmmmmmmm', 'mmmmmmmmmmmmmm', 290),
(74, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'mmmmmmmmmmmmmm', 'mmmmmmmmmmmmmm', 291),
(75, 'asssdddf', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'mmmmmmmmmmmmmm', 'mmmmmmmmmmmmmm', 292),
(76, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'asssdddf', 'mmmmmmmmmmmmmm', 293),
(77, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'asssdddf', 'mmmmmmmmmmmmmm', 294),
(78, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'ssddff', 'mmmmmmmmmmmmmm', 295),
(81, 'asssdddf', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'mmmmmmmmmmmmmm', 'mmmmmmmmmmmmmm', 298),
(83, 'asssdddf', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'ssddff', 'mmmmmxxxxssssssssss', 300),
(84, 'asssdddf', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'ssddff', 'mmmmmmmmmmmmmm', 301),
(85, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'ssddff', 'mmmmmxxxxssssssssss', 309),
(86, 'sam sassdda', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'ssddff', 'mmmmmxxxxssssssssss', 310),
(87, 'asssdddf', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'mmmmmmmmmmmmmm', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 312),
(89, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'mmmmmmmmmmmmmm', 'mmmmmxxxxssssssssss', 315),
(90, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'mmmmmmmmmmmmmm', 'mmmmmxxxxssssssssss', 316),
(91, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'mmmmmmmmmmmmmm', 'mmmmmxxxxssssssssss', 317),
(92, 'mmmmmmmmmmmmmmmmm', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'yyyyyyyyyyyy', 'mmmmmxxxxssssssssssqqqazzz', 318),
(93, 'asssdddf', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'asssdddf', 'mmmmmxxxxssssssssss', 319),
(94, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'yyyyyyyyyyyy', 'mmmmmxxxxssssssssss', 320),
(95, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'yyyyyyyyyyyy', 'mmmmmxxxxssssssssss', 321),
(96, 'sam sassdda', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'mmmmmmmmmmmmmm', 'mmmmmxxxxssssssssss', 322),
(97, 'asssdddf', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'ssddff', 'mmmmmxxxxssssssssss', 323),
(98, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'ssddff', 'mmmmmxxxxssssssssss', 324),
(99, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'yyyyyyyyyyyy', 'mmmmmxxxxssssssssss', 325),
(100, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'asssdddf', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 326),
(101, 'sam sassdda', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'yyyyyyyyyyyy', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 327),
(102, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'qqqqqqqqqqqqq', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 328),
(104, 'mmmmmmmmmmmmmmmm', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'asssdddf', 'mmmmmxxxxssssssssss', 330),
(105, 'mmmmmmmmmmmmmmmm', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'asssdddf', 'mmmmmxxxxssssssssss', 331),
(106, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'yyyyyyyyyyyy', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 332),
(107, 'mmmmmmmmmmmmmmmmm', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'asssdddf', 'mmmmmxxxxssssssssss', 333),
(108, 'mmmmmmmmmmmmmmmm', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'asssdddf', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 334),
(109, 'sam sassdda', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'asssdddf', 'mmmmmxxxxssssssssss', 335),
(111, 'sam sassdda', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'yyyyyyyyyyyy', 'mmmmmxxxxssssssssss', 340),
(112, 'sam sassdda', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'ssddff', 'mmmmmxxxxssssssssss', 341),
(113, 'asssdddf', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'ssddff', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 342),
(114, 'sam sassdda', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'asssdddf', 'mmmmmxxxxssssssssss', 343),
(116, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'asssdddf', 'mmmmmxxxxssssssssss', 346),
(118, 'mmmmmmmmmmmmmmmm', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'ssddff', 'mmmmmxxxxssssssssss', 348),
(119, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'mmmmmmmmmmmmmm', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 349),
(121, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'asssdddf', 'mmmmmxxxxssssssssss', 351),
(122, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'ssddff', 'mmmmmxxxxssssssssss', 352),
(123, 'mmmmmmmmmmmmmmmm', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'mmmmmmmmmmmmmm', 'mmmmmxxxxssssssssss', 353),
(124, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'mmmmmmmmmmmmmm', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 354),
(125, 'sam sassdda', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'jjjjjkk', 'mmmmmmmmmmmmmm', 'mmmmmxxxxssssssssss', 355),
(126, 'xxxxxxxxxxxxx', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'ssddff', 'mmmmmxxxxssssssssss', 356),
(127, 'asssdddf', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'mmmmmmmmmmmmmm', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 357),
(129, 'asssdddf', 'hshhshsh', 'aaaaaaaaaaaaaaaa', 'hhhhhh', 'ssddff', 'mmmmmxxxxssssssssss', 359),
(130, 'asssdddf', 'hshhshsh', 'vvvvvvvvvvvvvvvvvvvvvxxxxxxxxxxxx', 'jjjjjkk', 'zzzz', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 364),
(131, 'sam sassdda', 'hshhshsh', 'xxxxxxxxxxxxxxxx111', 'hhhhhh', 'asssdddf', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 365),
(132, 'mmmmmmmmmmmmmmmm', 'hshhshsh', 'wqaddsxcccx', 'hhhhhh', 'asssdddf', 'mmmmmxxxxssssssssssqqqazzz', 366),
(133, 'sam sassdda', 'hshhshsh', 'wqaddsxcccx', 'hhhhhh', 'asssdddf', 'ksdkskkdkdsfxxxxxxxxxxxxxxx', 367);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_cientifica`
--

CREATE TABLE IF NOT EXISTS `categoria_cientifica` (
`id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `categoria_cientifica`
--

INSERT INTO `categoria_cientifica` (`id`, `nome`) VALUES
(1, 'mmmmmxxxxssssssssssqqqazzz'),
(7, 'ksdkskkdkdsfxxxxxxxxxxxxxxx');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria_docente`
--

CREATE TABLE IF NOT EXISTS `categoria_docente` (
`id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `categoria_docente`
--

INSERT INTO `categoria_docente` (`id`, `nome`) VALUES
(1, 'hhhhhh'),
(2, 'jjjjjkk'),
(5, 'eeeeeeeeeeeeeeeeeeeeee'),
(6, 'wwwwwwwwwwwwwwwwwwww'),
(7, 'ASSSSqqq');

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
`id` int(11) NOT NULL,
  `descricao` varchar(225) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `curso`
--

INSERT INTO `curso` (`id`, `descricao`, `nome`) VALUES
(14, 'Curso de Agregação Pedagogica', 'CAP'),
(15, 'Curso de Elaboracao de Projectos de Investigação', 'CEPID'),
(17, 'Curso de Elaboracao e Publicacao de Artigos', 'CEPAC');

-- --------------------------------------------------------

--
-- Estrutura para tabela `docente`
--

CREATE TABLE IF NOT EXISTS `docente` (
`id` int(11) NOT NULL,
  `grau` varchar(45) NOT NULL,
  `pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `docente`
--

INSERT INTO `docente` (`id`, `grau`, `pessoa_id`) VALUES
(4, 'Licenciado', 259),
(5, '000', 260),
(6, 'Licenciado', 261),
(7, 'Licenciado', 302),
(8, 'Licenciado', 303),
(11, 'Licenciado', 306),
(12, 'Mestre', 307),
(13, 'Licenciado', 308),
(14, 'Licenciado', 313),
(15, 'Doctor', 337),
(17, 'Doctor', 339),
(18, 'Doctor', 360),
(19, 'Mestre', 361);

-- --------------------------------------------------------

--
-- Estrutura para tabela `docentmodulo`
--

CREATE TABLE IF NOT EXISTS `docentmodulo` (
`id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `docentmodulo`
--

INSERT INTO `docentmodulo` (`id`, `modulo_id`, `docente_id`) VALUES
(1, 8, 7),
(2, 9, 8),
(3, 15, 8),
(8, 9, 11),
(9, 15, 11),
(10, 8, 12),
(11, 8, 13),
(12, 8, 14),
(13, 17, 14),
(14, 8, 15),
(17, 8, 17),
(18, 7, 18),
(19, 9, 19),
(20, 17, 8),
(21, 17, 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcao`
--

CREATE TABLE IF NOT EXISTS `funcao` (
`id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `funcao`
--

INSERT INTO `funcao` (`id`, `nome`) VALUES
(1, 'mmmmmmmmmmmmmm'),
(2, 'ssddff'),
(3, 'asssdddf'),
(4, 'yyyyyyyyyyyy'),
(10, 'zzzz');

-- --------------------------------------------------------

--
-- Estrutura para tabela `graduacao`
--

CREATE TABLE IF NOT EXISTS `graduacao` (
`id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `graduacao`
--

INSERT INTO `graduacao` (`id`, `nome`) VALUES
(1, 'asssdddf'),
(2, 'xxxxxxxxxxxxx'),
(3, 'sam sassdda'),
(4, 'mmmmmmmmmmmmmmmm'),
(5, 'mmmmmmmmmmmmmmmmm'),
(6, 'Marcio');

-- --------------------------------------------------------

--
-- Estrutura para tabela `log`
--

CREATE TABLE IF NOT EXISTS `log` (
`id` int(11) NOT NULL,
  `ip_maquina` varchar(45) DEFAULT NULL,
  `acao` varchar(245) NOT NULL,
  `data` varchar(45) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=868 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `log`
--

INSERT INTO `log` (`id`, `ip_maquina`, `acao`, `data`, `usuario_id`, `status`) VALUES
(67, '127.0.0.1', 'Foi feito um login', '30-07-2015 01:55:26', 78, NULL),
(68, '127.0.0.1', 'Foi feito um login  ', '30-07-2015', 36, NULL),
(69, '127.0.0.1', 'Removido um aluno ', '30-07-2015 01:07:23', 36, NULL),
(70, '127.0.0.1', 'Removido um aluno ', '30-07-2015 01:07:31', 36, NULL),
(71, '127.0.0.1', 'Foi feito um login', '30-07-2015 01:56:43', 78, NULL),
(72, '127.0.0.1', 'Foi feito um login  ', '30-07-2015', 36, NULL),
(73, '127.0.0.1', 'Adicionado novo modúlo ASSSSSSS', '30-07-2015 02:08:40', 36, NULL),
(74, '127.0.0.1', 'Adicionado novo modúlo qwqqqqqqqa', '30-07-2015 02:13:10', 36, NULL),
(75, '127.0.0.1', 'Adicionado novo modúlo wekewwe', '30-07-2015 02:14:08', 36, NULL),
(76, '127.0.0.1', 'Alterado o curso para wekewwesdd', '30-07-2015 02:14:42', 36, NULL),
(77, '127.0.0.1', 'Alterado o curso para wekewwesdd12', '30-07-2015 02:14:53', 36, NULL),
(78, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:14:55', 36, NULL),
(79, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:14:55', 36, NULL),
(80, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:14:55', 36, NULL),
(81, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:14:55', 36, NULL),
(82, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:14:58', 36, NULL),
(83, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:15:02', 36, NULL),
(84, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:15:06', 36, NULL),
(85, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:15:10', 36, NULL),
(86, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:15:14', 36, NULL),
(87, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:15:19', 36, NULL),
(88, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:15:24', 36, NULL),
(89, '127.0.0.1', 'Alterado o modúlo para qwqqqqqqqa23', '30-07-2015 02:15:37', 36, NULL),
(90, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:15:42', 36, NULL),
(91, '127.0.0.1', 'Foi criado um novo aluno com o nome de : saas', '30-07-2015 02:16:34', 36, NULL),
(92, '127.0.0.1', 'Foi feito um login  ', '30-07-2015', 36, NULL),
(93, '127.0.0.1', 'Foi feito um login', '30-07-2015 02:28:42', 78, NULL),
(94, '127.0.0.1', 'Criado um novo usuario ', '30-07-2015 02:29:25', 78, NULL),
(95, '127.0.0.1', 'Removido um usuario ', '30-07-2015 02:07:57', 78, NULL),
(96, '127.0.0.1', 'Removido um usuario ', '30-07-2015 02:07:57', 78, NULL),
(97, '127.0.0.1', 'Foi feito um login  ', '30-07-2015', 36, NULL),
(98, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:30:50', 36, NULL),
(99, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:30:51', 36, NULL),
(100, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:30:51', 36, NULL),
(101, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:30:51', 36, NULL),
(102, '127.0.0.1', 'Removido o curso ', '30-07-2015 02:30:54', 36, NULL),
(103, '127.0.0.1', 'Foi criado um novo docente com o nome de : as', '30-07-2015 02:31:31', 36, NULL),
(104, '127.0.0.1', 'Foi Editado  informações do docente Com o nom', '30-07-2015 02:32:01', 36, NULL),
(105, '127.0.0.1', 'Foi Editado  informações do docente Com o nom', '30-07-2015 02:32:08', 36, NULL),
(106, '127.0.0.1', 'Foi Editado  informações do docente Com o nom', '30-07-2015 02:32:14', 36, NULL),
(107, '127.0.0.1', 'Foi Editado  informações do docente Com o nom', '30-07-2015 02:32:18', 36, NULL),
(108, '127.0.0.1', 'Foi removido um  docente do sistema', '30-07-2015 02:32:25', 36, NULL),
(109, '127.0.0.1', 'Foi removido um  docente do sistema', '30-07-2015 02:32:29', 36, NULL),
(110, '127.0.0.1', 'Foi removido um  docente do sistema', '30-07-2015 02:32:29', 36, NULL),
(111, '127.0.0.1', 'Foi removido um  docente do sistema', '30-07-2015 02:32:29', 36, NULL),
(112, '127.0.0.1', 'Foi removido um  docente do sistema', '30-07-2015 02:32:31', 36, NULL),
(113, '127.0.0.1', 'Foi removido um  docente do sistema', '30-07-2015 02:32:31', 36, NULL),
(114, '127.0.0.1', 'Foi removido um  docente do sistema', '30-07-2015 02:32:31', 36, NULL),
(115, '127.0.0.1', 'Foi removido um  docente do sistema', '30-07-2015 02:32:34', 36, NULL),
(116, '127.0.0.1', 'Foi Lançada a Nota do aluno elone samssss', '30-07-2015 02:33:00', 36, NULL),
(117, '127.0.0.1', 'Foi Apagada a Nota ', '30-07-2015 02:33:18', 36, NULL),
(118, '127.0.0.1', 'Foi Apagada a Nota ', '30-07-2015 02:33:23', 36, NULL),
(119, '127.0.0.1', 'Criado um novo programa ', '30-07-2015 02:34:32', 36, NULL),
(120, '127.0.0.1', 'Alterado um  programa ', '30-07-2015 02:34:51', 36, NULL),
(121, '127.0.0.1', 'Apagado um  programa ', '30-07-2015 02:35:05', 36, NULL),
(122, '127.0.0.1', 'Foi gerado o diploma  do  alunoelone samssss', '30-07-2015 02:35:27', 36, NULL),
(123, '127.0.0.1', 'Foi gerado o diploma  do  alunoelone samssss', '30-07-2015 02:35:35', 36, NULL),
(124, '127.0.0.1', 'Foi feito um login', '30-07-2015 02:36:12', 78, NULL),
(125, '127.0.0.1', 'Foi feito um login  ', '30-07-2015', 36, NULL),
(126, '127.0.0.1', 'Foi feito um login  ', '31-07-2015', 36, NULL),
(127, '127.0.0.1', 'Adicionado novo curso 12444444', '02-08-2015 01:08:09', 36, NULL),
(128, '127.0.0.1', 'Foi gerado o diploma  do  alunoelone samssss', '02-08-2015 01:08:38', 36, NULL),
(129, '127.0.0.1', 'Foi feito um login  ', '02-08-2015', 36, NULL),
(130, '127.0.0.1', 'Adicionado novo modúlo mmmmmmmmmmmmmm', '02-08-2015 08:44:33', 36, NULL),
(131, '127.0.0.1', 'Adicionado novo modúlo ssddff', '02-08-2015 08:46:56', 36, NULL),
(132, '127.0.0.1', 'Adicionado novo modúlo asssdddf', '02-08-2015 08:56:35', 36, NULL),
(133, '127.0.0.1', 'Adicionado novo modúlo asssdddf', '02-08-2015 09:07:42', 36, NULL),
(134, '127.0.0.1', 'Adicionado novo modúlo xxxxxxxxxxxxx', '02-08-2015 09:12:25', 36, NULL),
(135, '127.0.0.1', 'Adicionado novo modúlo sam sassdda', '02-08-2015 09:13:14', 36, NULL),
(136, '127.0.0.1', 'Adicionado novo modúlo mmmmmmmmmmmmmmmm', '02-08-2015 09:14:01', 36, NULL),
(137, '127.0.0.1', 'Adicionado novo modúlo mmmmmmmmmmmmmmmmm', '02-08-2015 09:15:45', 36, NULL),
(138, '127.0.0.1', 'Adicionado novo modúlo Marcio', '02-08-2015 09:16:00', 36, NULL),
(139, '127.0.0.1', 'Adicionado novo modúlo yyyyyyyyyyyy', '02-08-2015 09:16:11', 36, NULL),
(140, '127.0.0.1', 'Adicionado novo modúlo wwwwwwwwwww', '02-08-2015 09:16:16', 36, NULL),
(141, '127.0.0.1', 'Adicionado novo modúlo mmmmmmmmmmmmmm', '02-08-2015 09:26:08', 36, NULL),
(142, '127.0.0.1', 'Adicionado novo modúlo hhhhhh', '02-08-2015 09:26:54', 36, NULL),
(143, '127.0.0.1', 'Adicionado novo modúlo aaaaaaaaaaaaaaaa', '02-08-2015 09:27:15', 36, NULL),
(144, '127.0.0.1', 'Adicionado novo modúlo hshhshsh', '02-08-2015 09:27:41', 36, NULL),
(145, '127.0.0.1', 'Foi criado um novo aluno com o nome de :    hshdhddhdhd djdddsdjdjd', '02-08-2015 11:27:38', 36, NULL),
(146, '127.0.0.1', 'Foi feito um login  ', '03-08-2015', 36, NULL),
(147, '127.0.0.1', 'Foi feito um login  ', '03-08-2015', 36, NULL),
(148, '127.0.0.1', 'Foi feito um login  ', '03-08-2015', 36, NULL),
(149, '127.0.0.1', 'Foi feito um login  ', '03-08-2015', 36, NULL),
(150, '127.0.0.1', 'Foi feito um login  ', '03-08-2015', 36, NULL),
(151, '127.0.0.1', 'Foi removido um  docente do sistema', '03-08-2015 03:52:22', 36, NULL),
(152, '127.0.0.1', 'Foi feito um login  ', '03-08-2015', 36, NULL),
(153, '127.0.0.1', 'Removido o curso ', '03-08-2015 03:56:52', 36, NULL),
(154, '127.0.0.1', 'Removido o curso ', '03-08-2015 03:56:53', 36, NULL),
(155, '127.0.0.1', 'Removido o curso ', '03-08-2015 03:56:53', 36, NULL),
(156, '127.0.0.1', 'Removido o curso ', '03-08-2015 03:56:53', 36, NULL),
(157, '127.0.0.1', 'Removido o curso ', '03-08-2015 03:56:58', 36, NULL),
(158, '127.0.0.1', 'Removido o curso ', '03-08-2015 03:56:58', 36, NULL),
(159, '127.0.0.1', 'Removido o curso ', '03-08-2015 03:56:58', 36, NULL),
(160, '127.0.0.1', 'Removido o curso ', '03-08-2015 03:56:58', 36, NULL),
(161, '127.0.0.1', 'Foi feito um login  ', '03-08-2015', 36, NULL),
(162, '127.0.0.1', 'Foi criado um novo aluno com o nome de :   sdddddddddddd aaaaaaaaaaaaaa', '03-08-2015 06:26:16', 36, NULL),
(163, '127.0.0.1', 'Foi feito um login  ', '03-08-2015', 36, NULL),
(164, '127.0.0.1', 'Foi feito um login  ', '03-08-2015', 36, NULL),
(165, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(166, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(167, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  wdfffg  sdfffffffffffff', '04-08-2015 02:58:30', 36, NULL),
(168, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(169, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(170, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(171, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(172, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(173, '127.0.0.1', 'Foi criado um novo aluno com o nome de :    eshdhsdd skdjkdskd', '04-08-2015 05:53:48', 36, NULL),
(174, '127.0.0.1', 'Foi criado um novo aluno com o nome de : eskdlkd  wddff', '04-08-2015 06:01:29', 36, NULL),
(175, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdjsjkdkj sdlslkfklf', '04-08-2015 06:03:16', 36, NULL),
(176, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdslkdk sdjjdsfk', '04-08-2015 06:16:14', 36, NULL),
(177, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdslkdkdf sdjjdsfk', '04-08-2015 06:17:58', 36, NULL),
(178, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdslkdkdfas sdjjdsfk', '04-08-2015 06:20:03', 36, NULL),
(179, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdslkdkdfassdf sdjjdsfk', '04-08-2015 06:21:01', 36, NULL),
(180, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdslkdkdfassdfaddd sdjjdsfk', '04-08-2015 06:22:44', 36, NULL),
(181, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  wejjejer wejje', '04-08-2015 06:25:30', 36, NULL),
(182, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  ljeewe sddsd', '04-08-2015 06:26:47', 36, NULL),
(183, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdkdkkfkf sdklkflkdlkf', '04-08-2015 06:28:09', 36, NULL),
(184, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  wassddf addfff', '04-08-2015 06:30:24', 36, NULL),
(185, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  skdklskfkf jdjsjdjf', '04-08-2015 06:31:23', 36, NULL),
(186, '127.0.0.1', 'Foi criado um novo aluno com o nome de : ekewkkrer ekwklekllke', '04-08-2015 06:43:29', 36, NULL),
(187, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(188, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  wsdfff sfjdjkfj', '04-08-2015 07:00:11', 36, NULL),
(189, '127.0.0.1', 'Foi criado um novo aluno com o nome de : kskdkld  sdkdkd', '04-08-2015 07:01:01', 36, NULL),
(190, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sddskdf ssdjfjfjf', '04-08-2015 07:16:54', 36, NULL),
(191, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(192, '127.0.0.1', 'Foi criado um novo aluno com o nome de : weeeeee  weeeeee', '04-08-2015 08:10:37', 36, NULL),
(193, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sjldjdjsff skdkfkkf', '04-08-2015 08:11:28', 36, NULL),
(194, '127.0.0.1', 'Removido um aluno ', '04-08-2015 08:12:14', 36, NULL),
(195, '127.0.0.1', 'Removido um aluno ', '04-08-2015 08:12:15', 36, NULL),
(196, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(197, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(198, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(199, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:12:36', 36, NULL),
(200, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:13:53', 36, NULL),
(201, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:14:04', 36, NULL),
(202, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:15:16', 36, NULL),
(203, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:15:30', 36, NULL),
(204, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:16:21', 36, NULL),
(205, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:20:42', 36, NULL),
(206, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:20:56', 36, NULL),
(207, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:21:11', 36, NULL),
(208, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:21:56', 36, NULL),
(209, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:23:17', 36, NULL),
(210, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:23:31', 36, NULL),
(211, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:26:24', 36, NULL),
(212, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:26:51', 36, NULL),
(213, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:27:36', 36, NULL),
(214, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:27:51', 36, NULL),
(215, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:30:16', 36, NULL),
(216, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:31:26', 36, NULL),
(217, '127.0.0.1', 'Foi feito um login  ', '04-08-2015', 36, NULL),
(218, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:32:00', 36, NULL),
(219, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:32:15', 36, NULL),
(220, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:32:27', 36, NULL),
(221, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:32:38', 36, NULL),
(222, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:32:50', 36, NULL),
(223, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:33:15', 36, NULL),
(224, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:33:28', 36, NULL),
(225, '127.0.0.1', 'Foi Editado  informações do aluno', '04-08-2015 11:46:07', 36, NULL),
(226, '127.0.0.1', 'Removido um aluno ', '04-08-2015 11:46:38', 36, NULL),
(227, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(228, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(229, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 12:37:49', 36, NULL),
(230, '127.0.0.1', 'Foi criado um novo docente com o nome de :  sjjksjk kdsjskjdf', '05-08-2015 01:24:25', 36, NULL),
(231, '127.0.0.1', 'Foi criado um novo docente com o nome de :  adkslkdkldk sdjsjkjd', '05-08-2015 01:37:35', 36, NULL),
(232, '127.0.0.1', 'Foi criado um novo docente com o nome de :  adkslkdkldk sdjsjkjdssdff', '05-08-2015 01:38:58', 36, NULL),
(233, '127.0.0.1', 'Foi criado um novo docente com o nome de :  adkslkdkldk sdjsjkjdssdffhjhjh', '05-08-2015 01:39:35', 36, NULL),
(234, '127.0.0.1', 'Foi criado um novo docente com o nome de :  jsdjdjkj shddd', '05-08-2015 01:40:08', 36, NULL),
(235, '127.0.0.1', 'Foi criado um novo docente com o nome de :  sddjjkfjd sndjsjfjff', '05-08-2015 01:42:31', 36, NULL),
(236, '127.0.0.1', 'Foi criado um novo docente com o nome de :  sdksdklsd sadhdyyff', '05-08-2015 01:43:43', 36, NULL),
(237, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:13:50', 36, NULL),
(238, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:13:52', 36, NULL),
(239, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:13:52', 36, NULL),
(240, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:13:52', 36, NULL),
(241, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:14:25', 36, NULL),
(242, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:14:27', 36, NULL),
(243, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:14:27', 36, NULL),
(244, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:14:27', 36, NULL),
(245, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:14:53', 36, NULL),
(246, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:14:55', 36, NULL),
(247, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:14:55', 36, NULL),
(248, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:14:55', 36, NULL),
(249, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:10', 36, NULL),
(250, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:12', 36, NULL),
(251, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:12', 36, NULL),
(252, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:12', 36, NULL),
(253, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:14', 36, NULL),
(254, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:14', 36, NULL),
(255, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:14', 36, NULL),
(256, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:22', 36, NULL),
(257, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:22', 36, NULL),
(258, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:22', 36, NULL),
(259, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:24', 36, NULL),
(260, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:24', 36, NULL),
(261, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:15:24', 36, NULL),
(262, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:35:54', 36, NULL),
(263, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:36:12', 36, NULL),
(264, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:36:14', 36, NULL),
(265, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:36:15', 36, NULL),
(266, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:36:16', 36, NULL),
(267, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:36:16', 36, NULL),
(268, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:51:10', 36, NULL),
(269, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:52:13', 36, NULL),
(270, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:52:25', 36, NULL),
(271, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:52:51', 36, NULL),
(272, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:52:57', 36, NULL),
(273, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:53:53', 36, NULL),
(274, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:53:59', 36, NULL),
(275, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:54:05', 36, NULL),
(276, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '05-08-2015 02:54:13', 36, NULL),
(277, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:54:28', 36, NULL),
(278, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:54:31', 36, NULL),
(279, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:54:31', 36, NULL),
(280, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:54:31', 36, NULL),
(281, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:54:35', 36, NULL),
(282, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:54:46', 36, NULL),
(283, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:55:16', 36, NULL),
(284, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:55:18', 36, NULL),
(285, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:55:18', 36, NULL),
(286, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:55:18', 36, NULL),
(287, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:55:21', 36, NULL),
(288, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:56:11', 36, NULL),
(289, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:56:12', 36, NULL),
(290, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:56:12', 36, NULL),
(291, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 02:56:12', 36, NULL),
(292, '127.0.0.1', 'Foi Lançada a Nota do aluno Dario Germano', '05-08-2015 03:21:24', 36, NULL),
(293, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 03:30:23', 36, NULL),
(294, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 03:30:25', 36, NULL),
(295, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 03:30:25', 36, NULL),
(296, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 03:30:25', 36, NULL),
(297, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:30:41', 36, NULL),
(298, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:30:41', 36, NULL),
(299, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:30:41', 36, NULL),
(300, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:30:41', 36, NULL),
(301, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:36:01', 36, NULL),
(302, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:36:02', 36, NULL),
(303, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:36:02', 36, NULL),
(304, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:36:02', 36, NULL),
(305, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:36:32', 36, NULL),
(306, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:36:33', 36, NULL),
(307, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:36:33', 36, NULL),
(308, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:36:33', 36, NULL),
(309, '127.0.0.1', 'Adicionado novo modúlo 111111', '05-08-2015 03:44:46', 36, NULL),
(310, '127.0.0.1', 'Adicionado novo modúlo 11111111111', '05-08-2015 03:48:59', 36, NULL),
(311, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(312, '127.0.0.1', 'Adicionado novo modúlo sdnsddm', '05-08-2015 03:51:59', 36, NULL),
(313, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:52:04', 36, NULL),
(314, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:52:05', 36, NULL),
(315, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:52:05', 36, NULL),
(316, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:52:05', 36, NULL),
(317, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:52:09', 36, NULL),
(318, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:52:13', 36, NULL),
(319, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:52:20', 36, NULL),
(320, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:52:24', 36, NULL),
(321, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:52:29', 36, NULL),
(322, '127.0.0.1', 'Alterado o curso para CAP', '05-08-2015 03:57:27', 36, NULL),
(323, '127.0.0.1', 'Alterado o curso para CEPAC', '05-08-2015 03:57:44', 36, NULL),
(324, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:57:55', 36, NULL),
(325, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:57:56', 36, NULL),
(326, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:57:56', 36, NULL),
(327, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:57:56', 36, NULL),
(328, '127.0.0.1', 'Adicionado novo modúlo sdjsjkd', '05-08-2015 03:58:13', 36, NULL),
(329, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:58:19', 36, NULL),
(330, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:58:19', 36, NULL),
(331, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:58:19', 36, NULL),
(332, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:58:19', 36, NULL),
(333, '127.0.0.1', 'Removido o curso ', '05-08-2015 03:58:23', 36, NULL),
(334, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(335, '127.0.0.1', 'Adicionado novo modúlo ssdddddd', '05-08-2015 04:09:30', 36, NULL),
(336, '127.0.0.1', 'Alterado o modúlo para xxxxxxxxxxxxx', '05-08-2015 04:17:16', 36, NULL),
(337, '127.0.0.1', 'Removido o curso ', '05-08-2015 04:19:28', 36, NULL),
(338, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(339, '127.0.0.1', 'Criado um novo programa ', '05-08-2015 05:55:24', 36, NULL),
(340, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(341, '127.0.0.1', 'Criado um novo programa ', '05-08-2015 06:27:41', 36, NULL),
(342, '127.0.0.1', 'Criado um novo programa ', '05-08-2015 06:28:21', 36, NULL),
(343, '127.0.0.1', 'Criado um novo programa ', '05-08-2015 06:41:15', 36, NULL),
(344, '127.0.0.1', 'Foi gerado o diploma  do  alunoDario Germano', '05-08-2015 06:53:05', 36, NULL),
(345, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(346, '127.0.0.1', 'Removido o curso ', '05-08-2015 07:13:15', 36, NULL),
(347, '127.0.0.1', 'Removido o curso ', '05-08-2015 07:13:16', 36, NULL),
(348, '127.0.0.1', 'Removido o curso ', '05-08-2015 07:13:16', 36, NULL),
(349, '127.0.0.1', 'Removido o curso ', '05-08-2015 07:13:16', 36, NULL),
(350, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 07:13:50', 36, NULL),
(351, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 07:13:52', 36, NULL),
(352, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 07:13:52', 36, NULL),
(353, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 07:13:52', 36, NULL),
(354, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(355, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(356, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(357, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(358, '127.0.0.1', 'Foi feito um login', '05-08-2015 08:13:45', 78, NULL),
(359, '127.0.0.1', 'Foi feito um login  ', '05-08-2015 08:14:49', 132, NULL),
(360, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(361, '127.0.0.1', 'Alterado um  programa ', '05-08-2015 04:10:12', 36, NULL),
(362, '127.0.0.1', 'Alterado um  programa ', '05-08-2015 04:10:56', 36, NULL),
(363, '127.0.0.1', 'Alterado um  programa ', '05-08-2015 04:12:31', 36, NULL),
(364, '127.0.0.1', 'Alterado um  programa ', '05-08-2015 04:12:59', 36, NULL),
(365, '127.0.0.1', 'Alterado um  programa ', '05-08-2015 04:14:21', 36, NULL),
(366, '127.0.0.1', 'Alterado um  programa ', '05-08-2015 04:18:39', 36, NULL),
(367, '127.0.0.1', 'Alterado um  programa ', '05-08-2015 04:18:53', 36, NULL),
(368, '127.0.0.1', 'Alterado um  programa ', '05-08-2015 04:20:36', 36, NULL),
(369, '127.0.0.1', 'Foi removido um  docente do sistema', '05-08-2015 04:21:48', 36, NULL),
(370, '127.0.0.1', 'Foi Lançada a Nota do aluno     adkdkdaaa aaaaaaaa', '05-08-2015 04:22:16', 36, NULL),
(371, '127.0.0.1', 'Foi feito um login', '05-08-2015 04:23:56', 78, NULL),
(372, '127.0.0.1', 'Adicionado novo modúlo hshdjjsdd', '05-08-2015 04:48:44', 78, NULL),
(373, '127.0.0.1', 'Adicionado novo modúlo jlbjlbjljl', '05-08-2015 04:49:57', 78, NULL),
(374, '127.0.0.1', 'Foi feito um login', '05-08-2015 06:15:59', 78, NULL),
(375, '127.0.0.1', 'Adicionado novo modúlo skldkllkfd', '05-08-2015 06:20:53', 78, NULL),
(376, '127.0.0.1', 'Adicionado novo modúlo sdkskf', '05-08-2015 06:21:04', 78, NULL),
(377, '127.0.0.1', 'Adicionado novo modúlo jjjjjkk', '05-08-2015 06:21:33', 78, NULL),
(378, '127.0.0.1', 'Removido categoriaCientifica', '05-08-2015 06:39:28', 78, NULL),
(379, '127.0.0.1', 'Removido categoriaCientifica', '05-08-2015 06:42:05', 78, NULL),
(380, '127.0.0.1', 'Removido categoriaCientifica', '05-08-2015 06:42:07', 78, NULL),
(381, '127.0.0.1', 'Removido categoriaCientifica', '05-08-2015 06:42:09', 78, NULL),
(382, '127.0.0.1', 'Removido categoriaCientifica', '05-08-2015 06:43:02', 78, NULL),
(383, '127.0.0.1', 'Adicionado novo modúlo hkkkkkkkkk', '05-08-2015 06:43:24', 78, NULL),
(384, '127.0.0.1', 'Removido categoriaCientifica', '05-08-2015 06:43:36', 78, NULL),
(385, '127.0.0.1', 'Alterado xxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '05-08-2015 07:00:12', 78, NULL),
(386, '127.0.0.1', 'Alterado xxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '05-08-2015 07:01:18', 78, NULL),
(387, '127.0.0.1', 'Alterado sffffffffffffsd', '05-08-2015 07:01:43', 78, NULL),
(388, '127.0.0.1', 'Alterado sdddddddddddddddd', '05-08-2015 07:02:58', 78, NULL),
(389, '127.0.0.1', 'Alterado sddddddddddddddddxxx', '05-08-2015 07:03:26', 78, NULL),
(390, '127.0.0.1', 'Alterado sddddddddddwww', '05-08-2015 07:04:39', 78, NULL),
(391, '127.0.0.1', 'Alterado mmmmmxxxx', '05-08-2015 07:04:45', 78, NULL),
(392, '127.0.0.1', 'Removido categoriaCientifica', '05-08-2015 07:04:58', 78, NULL),
(393, '127.0.0.1', 'Adicionado novo modúlo ksdkskkdkdsf', '05-08-2015 07:05:06', 78, NULL),
(394, '127.0.0.1', 'Alterado ksdkskkdkdsfxxxxxxxxxxxxxxx', '05-08-2015 07:05:21', 78, NULL),
(395, '127.0.0.1', 'Alterado mmmmmxxxx', '05-08-2015 07:05:28', 78, NULL),
(396, '127.0.0.1', 'Alterado mmmmmxxxxssssssssss', '05-08-2015 07:05:35', 78, NULL),
(397, '127.0.0.1', 'Adicionado novo modúlo sljslfkf', '05-08-2015 07:35:32', 78, NULL),
(398, '127.0.0.1', 'Alterado sljslfkfxxxx', '05-08-2015 07:35:43', 78, NULL),
(399, '127.0.0.1', 'Alterado sljslfkfxxxxxxxxx', '05-08-2015 07:36:00', 78, NULL),
(400, '127.0.0.1', 'Alterado sljslfkfxxxxxxxxxsdddd', '05-08-2015 07:37:25', 78, NULL),
(401, '127.0.0.1', 'Alterado sljslfkfxxxxxxxxxsddddaaa', '05-08-2015 07:38:24', 78, NULL),
(402, '127.0.0.1', 'Removido funcao', '05-08-2015 07:38:30', 78, NULL),
(403, '127.0.0.1', 'Adicionado novo modúlo sdklsdlkslkkfdf', '05-08-2015 07:38:43', 78, NULL),
(404, '127.0.0.1', 'Alterado sdklsdlkslkkfdfqqqqq', '05-08-2015 07:38:53', 78, NULL),
(405, '127.0.0.1', 'Removido categoriaDocente', '05-08-2015 07:38:56', 78, NULL),
(406, '127.0.0.1', 'Adicionado novo modúlo vvvvvvvvvvvvvvvvvvvvv', '05-08-2015 07:39:07', 78, NULL),
(407, '127.0.0.1', 'Alterado vvvvvvvvvvvvvvvvvvvvvxxxxxxxxxxxx', '05-08-2015 07:39:15', 78, NULL),
(408, '127.0.0.1', 'Removido categoriaCientifica', '05-08-2015 07:39:19', 78, NULL),
(409, '127.0.0.1', 'Adicionado novo modúlo sdddddddddddddddddddddddddddd', '05-08-2015 07:39:43', 78, NULL),
(410, '127.0.0.1', 'Alterado sddddddddddddddddddddddddddddxxxxxxxxxxxxx', '05-08-2015 07:39:51', 78, NULL),
(411, '127.0.0.1', 'Removido unidadeOrganica', '05-08-2015 07:39:58', 78, NULL),
(412, '127.0.0.1', 'Adicionado novo modúlo oscar', '05-08-2015 07:40:11', 78, NULL),
(413, '127.0.0.1', 'Alterado oscar ribas', '05-08-2015 07:40:21', 78, NULL),
(414, '127.0.0.1', 'Removido universidade', '05-08-2015 07:40:24', 78, NULL),
(415, '127.0.0.1', 'Adicionado novo modúlo administrador', '05-08-2015 07:40:39', 78, NULL),
(416, '127.0.0.1', 'Alterado administradorxxxx', '05-08-2015 07:40:48', 78, NULL),
(417, '127.0.0.1', 'Removido funcao', '05-08-2015 07:40:51', 78, NULL),
(418, '127.0.0.1', 'Foi feito um login', '05-08-2015 07:55:11', 78, NULL),
(419, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(420, '127.0.0.1', 'Foi feito um login', '05-08-2015 07:59:34', 78, NULL),
(421, '127.0.0.1', 'Foi feito um login', '05-08-2015 08:01:00', 78, NULL),
(422, '127.0.0.1', 'Foi feito um login', '05-08-2015 08:04:45', 78, NULL),
(423, '127.0.0.1', 'Foi feito um login', '05-08-2015 08:12:31', 78, NULL),
(424, '127.0.0.1', 'Foi feito um login', '05-08-2015 08:33:19', 78, NULL),
(425, '127.0.0.1', 'Foi feito um login  ', '05-08-2015 08:33:50', 127, NULL),
(426, '127.0.0.1', 'Foi Lançada a Nota do aluno  wdfffg  sdfffffffffffff', '05-08-2015 08:53:43', 127, NULL),
(427, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(428, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(429, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(430, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(431, '127.0.0.1', 'Foi feito um login', '05-08-2015 11:25:21', 78, NULL),
(432, '127.0.0.1', 'Foi feito um login', '05-08-2015 11:26:09', 78, NULL),
(433, '127.0.0.1', 'Foi feito um login  ', '05-08-2015 11:26:26', 131, NULL),
(434, '127.0.0.1', 'Foi feito um login', '05-08-2015 11:26:38', 78, NULL),
(435, '127.0.0.1', 'Foi feito um login  ', '05-08-2015', 36, NULL),
(436, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 36, NULL),
(437, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 36, NULL),
(438, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 36, NULL),
(439, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 36, NULL),
(440, '127.0.0.1', 'Foi feito um login', '06-08-2015 12:16:48', 78, NULL),
(441, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 36, NULL),
(442, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 36, NULL),
(443, '127.0.0.1', 'Foi feito um login', '06-08-2015 01:55:12', 78, NULL),
(444, '127.0.0.1', 'Criado um novo usuario ', '06-08-2015 02:09:08', 78, NULL),
(445, '127.0.0.1', 'Adicionado novo modúlo qqqqqqqqqqqqq', '06-08-2015 02:20:13', 78, NULL),
(446, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 36, NULL),
(447, '127.0.0.1', 'Foi removido um  docente do sistema', '06-08-2015 02:29:27', 36, NULL),
(448, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 136, NULL),
(449, '127.0.0.1', 'Alterado o curso para CEPID', '06-08-2015 02:45:08', 136, NULL),
(450, '127.0.0.1', 'Alterado o modúlo para ASSSSSSSxx', '06-08-2015 02:45:36', 136, NULL),
(451, '127.0.0.1', 'Alterado o modúlo para ASSSSSSSxxxx', '06-08-2015 02:46:00', 136, NULL),
(452, '127.0.0.1', 'Alterado o modúlo para ASSSSSSSxxxxttt', '06-08-2015 02:47:18', 136, NULL),
(453, '127.0.0.1', 'Adicionado novo modúlo hhkhbhv', '06-08-2015 02:47:39', 136, NULL),
(454, '127.0.0.1', 'Alterado o curso para CEPID', '06-08-2015 02:48:06', 136, NULL),
(455, '127.0.0.1', 'Alterado o curso para CEPID', '06-08-2015 02:54:26', 136, NULL),
(456, '127.0.0.1', 'Alterado o curso para CEPID', '06-08-2015 02:55:22', 136, NULL),
(457, '127.0.0.1', 'Alterado o curso para CEPID', '06-08-2015 02:55:34', 136, NULL),
(458, '127.0.0.1', 'Foi criado um novo aluno com o nome de : skdklskd  sdnsdjdjdsd', '06-08-2015 02:57:05', 136, NULL),
(459, '127.0.0.1', 'Foi Editado  informações do aluno', '06-08-2015 02:59:12', 136, NULL),
(460, '127.0.0.1', 'Foi criado um novo docente com o nome de :  sdjsjdjd sdsjjfd', '06-08-2015 03:00:19', 136, NULL),
(461, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '06-08-2015 03:00:48', 136, NULL),
(462, '127.0.0.1', 'Criado um novo programa ', '06-08-2015 03:06:10', 136, NULL),
(463, '127.0.0.1', 'Alterado um  programa ', '06-08-2015 03:06:45', 136, NULL),
(464, '127.0.0.1', 'Alterado um  programa ', '06-08-2015 03:06:55', 136, NULL),
(465, '127.0.0.1', 'Alterado um  programa ', '06-08-2015 03:11:34', 136, NULL),
(466, '127.0.0.1', 'Foi gerado o diploma  do  alunoDario Germano', '06-08-2015 03:13:01', 136, NULL),
(467, '127.0.0.1', 'Foi gerado o diploma  do  alunoDario Germano', '06-08-2015 03:13:26', 136, NULL),
(468, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 36, NULL),
(469, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  adkdkk sdsdjdj', '06-08-2015 03:15:03', 36, NULL),
(470, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 36, NULL),
(471, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  jejjwejej sdjsjjdjse', '06-08-2015 03:36:01', 36, NULL),
(472, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  jejjwejej sdjsjjdjse', '06-08-2015 03:36:30', 36, NULL),
(473, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdjdjsjdj adjsjdjd', '06-08-2015 03:43:42', 36, NULL),
(474, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  akdkdkdk sdjljsdljljfs', '06-08-2015 03:45:17', 36, NULL),
(475, '127.0.0.1', 'Apagado um  programa ', '06-08-2015 03:47:19', 36, NULL),
(476, '127.0.0.1', 'Foi gerado o diploma  do  alunoDario Germano', '06-08-2015 03:56:14', 36, NULL),
(477, '127.0.0.1', 'Foi feito um login', '06-08-2015 03:56:45', 78, NULL),
(478, '127.0.0.1', 'Removido um usuario ', '06-08-2015 03:08:03', 78, NULL),
(479, '127.0.0.1', 'Removido um usuario ', '06-08-2015 03:08:03', 78, NULL),
(480, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 36, NULL),
(481, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 36, NULL),
(482, '127.0.0.1', 'Foi feito um login', '06-08-2015 04:07:42', 78, NULL),
(483, '127.0.0.1', 'Foi feito um login  ', '06-08-2015', 36, NULL),
(484, '127.0.0.1', 'Foi feito um login', '06-08-2015 04:10:53', 78, NULL),
(485, '127.0.0.1', 'Foi feito um login', '06-08-2015 04:13:30', 78, NULL),
(486, '127.0.0.1', 'Foi feito um login  ', '06-08-2015 04:13:55', 132, NULL),
(487, '127.0.0.1', 'Foi feito um login  ', '08-08-2015', 36, NULL),
(488, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(489, '127.0.0.1', 'Removido o curso ', '09-08-2015 12:49:26', 36, NULL),
(490, '127.0.0.1', 'Removido o curso ', '09-08-2015 12:49:27', 36, NULL),
(491, '127.0.0.1', 'Removido o curso ', '09-08-2015 12:49:27', 36, NULL),
(492, '127.0.0.1', 'Removido o curso ', '09-08-2015 12:49:27', 36, NULL),
(493, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(494, '127.0.0.1', 'Foi removido um  docente do sistema', '09-08-2015 01:45:46', 36, NULL),
(495, '127.0.0.1', 'Foi removido um  docente do sistema', '09-08-2015 01:46:00', 36, NULL),
(496, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(497, '127.0.0.1', 'Removido o curso ', '09-08-2015 01:53:03', 36, NULL),
(498, '127.0.0.1', 'Removido o curso ', '09-08-2015 01:53:11', 36, NULL),
(499, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(500, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(501, '127.0.0.1', 'Foi Lançada a Nota do aluno         eskdlkd ', '09-08-2015 02:13:35', 36, NULL),
(502, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(503, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(504, '127.0.0.1', 'Foi Lançada a Nota do aluno       marcosx', '09-08-2015 02:47:37', 36, NULL),
(505, '127.0.0.1', 'Foi Apagada a Nota ', '09-08-2015 02:47:59', 36, NULL),
(506, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(507, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(508, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(509, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(510, '127.0.0.1', 'Removido o curso ', '09-08-2015 03:06:07', 36, NULL),
(511, '127.0.0.1', 'Foi removido um  docente do sistema', '09-08-2015 03:06:24', 36, NULL),
(512, '127.0.0.1', 'Foi removido um  docente do sistema', '09-08-2015 03:06:32', 36, NULL),
(513, '127.0.0.1', 'Foi removido um  docente do sistema', '09-08-2015 03:06:54', 36, NULL),
(514, '127.0.0.1', 'Foi removido um  docente do sistema', '09-08-2015 03:08:25', 36, NULL),
(515, '127.0.0.1', 'Foi removido um  docente do sistema', '09-08-2015 03:10:09', 36, NULL),
(516, '127.0.0.1', 'Foi removido um  docente do sistema', '09-08-2015 03:10:58', 36, NULL),
(517, '127.0.0.1', 'Foi removido um  docente do sistema', '09-08-2015 03:12:46', 36, NULL),
(518, '127.0.0.1', 'Foi removido um  docente do sistema', '09-08-2015 03:13:14', 36, NULL),
(519, '127.0.0.1', 'Foi feito um login', '09-08-2015 03:13:54', 78, NULL),
(520, '127.0.0.1', 'Foi feito um login', '09-08-2015 03:14:57', 78, NULL),
(521, '127.0.0.1', 'Foi feito um login', '09-08-2015 03:15:58', 78, NULL),
(522, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(523, '127.0.0.1', 'Removido um aluno ', '09-08-2015 10:15:37', 36, NULL),
(524, '127.0.0.1', 'Removido um aluno ', '09-08-2015 10:15:40', 36, NULL),
(525, '127.0.0.1', 'Removido um aluno ', '09-08-2015 10:15:49', 36, NULL),
(526, '127.0.0.1', 'Removido um aluno ', '09-08-2015 10:15:51', 36, NULL),
(527, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(528, '127.0.0.1', 'Removido um aluno ', '09-08-2015 10:56:33', 36, NULL),
(529, '127.0.0.1', 'Removido um aluno ', '09-08-2015 10:56:39', 36, NULL),
(530, '127.0.0.1', 'Removido um aluno ', '09-08-2015 10:57:18', 36, NULL),
(531, '127.0.0.1', 'Removido um aluno ', '09-08-2015 10:57:25', 36, NULL),
(532, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(533, '127.0.0.1', 'Removido um aluno ', '09-08-2015 11:12:28', 36, NULL),
(534, '127.0.0.1', 'Foi Editado  informações do aluno', '09-08-2015 11:15:22', 36, NULL),
(535, '127.0.0.1', 'Foi Editado  informações do aluno', '09-08-2015 11:56:49', 36, NULL),
(536, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(537, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(538, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(539, '127.0.0.1', 'Removido o curso ', '09-08-2015 12:48:33', 36, NULL),
(540, '127.0.0.1', 'Alterado um  programa ', '09-08-2015 12:49:50', 36, NULL),
(541, '127.0.0.1', 'Apagado um  programa ', '09-08-2015 12:51:03', 36, NULL),
(542, '127.0.0.1', 'Foi gerado o diploma  do  aluno      marcosx', '09-08-2015 05:13:49', 36, NULL),
(543, '127.0.0.1', 'Foi gerado o diploma  do  aluno      marcosxsampaio', '09-08-2015 05:19:00', 36, NULL),
(544, '127.0.0.1', 'Foi gerado o diploma  do  aluno      marcosxsampaio', '09-08-2015 05:19:35', 36, NULL),
(545, '127.0.0.1', 'Foi gerado o diploma  do  aluno      marcosxsampaio', '09-08-2015 05:23:31', 36, NULL),
(546, '127.0.0.1', 'Foi gerado o diploma  do  aluno      marcosxsampaio', '09-08-2015 05:23:51', 36, NULL),
(547, '127.0.0.1', 'Foi removido um  docente do sistema', '09-08-2015 01:24:26', 36, NULL),
(548, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(549, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(550, '127.0.0.1', 'Foi feito um login', '09-08-2015 01:35:57', 78, NULL),
(551, '127.0.0.1', 'Foi feito um login  ', '09-08-2015 01:42:36', 128, NULL),
(552, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(553, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(554, '127.0.0.1', 'Foi criado um novo aluno com o nome de : sdfff  sdddddddddd', '09-08-2015 04:25:51', 36, NULL),
(555, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(556, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  adjdjjdjd ksddkkdkkd', '09-08-2015 04:34:17', 36, NULL),
(557, '127.0.0.1', 'Foi criado um novo aluno com o nome de : ldldld  sjdjdjdjjdd', '09-08-2015 04:36:49', 36, NULL),
(558, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  dkdkweiesdmdm dmdmmd', '09-08-2015 04:40:54', 36, NULL),
(559, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  ekeekeke jddjdjjdd', '09-08-2015 04:43:06', 36, NULL),
(560, '127.0.0.1', 'Foi criado um novo aluno com o nome de : sdkdkdk  dkdjjff', '09-08-2015 04:44:06', 36, NULL),
(561, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  kdkkdkd kddkdkd', '09-08-2015 04:45:15', 36, NULL),
(562, '127.0.0.1', 'Foi criado um novo aluno com o nome de : smdddmdmd dddkdkd', '09-08-2015 04:46:19', 36, NULL),
(563, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  dkdkdkhs jdjdjddd', '09-08-2015 04:49:31', 36, NULL),
(564, '127.0.0.1', 'Foi criado um novo docente com o nome de : skdkdkk sdkkkffff', '09-08-2015 04:51:12', 36, NULL),
(565, '127.0.0.1', 'Foi criado um novo docente com o nome de :  jhdhdh mdmdmdd', '09-08-2015 04:54:04', 36, NULL),
(566, '127.0.0.1', 'Foi criado um novo docente com o nome de :  sdkdkdksd sdkdkkdd', '09-08-2015 04:54:40', 36, NULL),
(567, '127.0.0.1', 'Foi feito um login  ', '09-08-2015', 36, NULL),
(568, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(569, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  asdkskkdk shdhshff', '10-08-2015 01:11:17', 36, NULL),
(570, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdkskdkkskd djsjjdjdjss', '10-08-2015 01:13:16', 36, NULL),
(571, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdksdkkd sndnsndnd', '10-08-2015 01:14:42', 36, NULL),
(572, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(573, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdkkwww dmmwewww', '10-08-2015 01:26:38', 36, NULL),
(574, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  wwejje sdssmss', '10-08-2015 01:32:04', 36, NULL),
(575, '127.0.0.1', 'Foi feito um login', '10-08-2015 01:40:01', 78, NULL),
(576, '127.0.0.1', 'Foi feito um login  ', '10-08-2015 01:40:18', 128, NULL),
(577, '127.0.0.1', 'Foi feito um login  ', '10-08-2015 01:40:54', 128, NULL),
(578, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  aslala skasddjjdd', '10-08-2015 01:50:54', 128, NULL),
(579, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(580, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(581, '127.0.0.1', 'Foi Editado  informações do aluno', '10-08-2015 02:01:09', 36, NULL),
(582, '127.0.0.1', 'Foi Editado  informações do aluno', '10-08-2015 02:01:41', 36, NULL),
(583, '127.0.0.1', 'Removido um aluno ', '10-08-2015 02:02:10', 36, NULL),
(584, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(585, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(586, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(587, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(588, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(589, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(590, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdksdkdkdkkd esdjdjjd', '10-08-2015 03:02:00', 36, NULL),
(591, '127.0.0.1', 'Foi Editado  informações do aluno', '10-08-2015 03:04:36', 36, NULL),
(592, '127.0.0.1', 'Removido um aluno ', '10-08-2015 03:04:58', 36, NULL),
(593, '127.0.0.1', 'Foi feito um login', '10-08-2015 11:42:33', 78, NULL),
(594, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(595, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(596, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(597, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(598, '127.0.0.1', 'Foi feito um login  ', '10-08-2015', 36, NULL),
(599, '127.0.0.1', 'Removido um aluno ', '10-08-2015 11:57:22', 36, NULL),
(600, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(601, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(602, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(603, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(604, '127.0.0.1', 'Removido um aluno ', '11-08-2015 02:18:44', 36, NULL),
(605, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(606, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(607, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(608, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(609, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(610, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(611, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(612, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(613, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(614, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(615, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(616, '127.0.0.1', 'Removido um aluno ', '11-08-2015 03:42:11', 36, NULL),
(617, '127.0.0.1', 'Removido um aluno ', '11-08-2015 03:42:22', 36, NULL),
(618, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(619, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(620, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(621, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(622, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(623, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(624, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(625, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(626, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(627, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(628, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(629, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(630, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(631, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(632, '127.0.0.1', 'Foi criado um novo aluno com o nome de : ASSSSSSSxx ssssssssdddddddd', '11-08-2015 06:00:35', 36, NULL),
(633, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(634, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(635, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(636, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(637, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(638, '127.0.0.1', 'Foi criado um novo aluno com o nome de : sasndndndn elone', '11-08-2015 06:40:51', 36, NULL),
(639, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 06:54:32', 36, NULL),
(640, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:07:24', 36, NULL),
(641, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:15:24', 36, NULL),
(642, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:15:54', 36, NULL),
(643, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:16:06', 36, NULL),
(644, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:16:26', 36, NULL),
(645, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:16:52', 36, NULL),
(646, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:17:00', 36, NULL),
(647, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:17:56', 36, NULL),
(648, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:18:18', 36, NULL),
(649, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:18:52', 36, NULL),
(650, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:19:15', 36, NULL),
(651, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:19:56', 36, NULL),
(652, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:20:42', 36, NULL),
(653, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:20:46', 36, NULL),
(654, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:21:53', 36, NULL),
(655, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:22:10', 36, NULL),
(656, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:22:13', 36, NULL),
(657, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(658, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:22:53', 36, NULL),
(659, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:23:23', 36, NULL),
(660, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:24:01', 36, NULL),
(661, '127.0.0.1', 'Removido um aluno ', '11-08-2015 07:24:40', 36, NULL),
(662, '127.0.0.1', 'Removido um aluno ', '11-08-2015 07:24:47', 36, NULL),
(663, '127.0.0.1', 'Removido um aluno ', '11-08-2015 07:24:56', 36, NULL);
INSERT INTO `log` (`id`, `ip_maquina`, `acao`, `data`, `usuario_id`, `status`) VALUES
(664, '127.0.0.1', 'Foi Editado  informações do aluno', '11-08-2015 07:47:58', 36, NULL),
(665, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(666, '127.0.0.1', 'Foi removido um  docente do sistema', '11-08-2015 08:58:38', 36, NULL),
(667, '127.0.0.1', 'Foi removido um  docente do sistema', '11-08-2015 08:59:42', 36, NULL),
(668, '127.0.0.1', 'Foi removido um  docente do sistema', '11-08-2015 09:00:07', 36, NULL),
(669, '127.0.0.1', 'Foi removido um  docente do sistema', '11-08-2015 09:01:11', 36, NULL),
(670, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(671, '127.0.0.1', 'Foi criado um novo docente com o nome de : wwwww wwwwwww', '11-08-2015 09:09:59', 36, NULL),
(672, '127.0.0.1', 'Foi criado um novo docente com o nome de :  qweaaa ewdxzz', '11-08-2015 09:11:19', 36, NULL),
(673, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '11-08-2015 09:16:01', 36, NULL),
(674, '127.0.0.1', 'Foi Lançada a Nota do aluno  jejjwejej', '11-08-2015 09:27:02', 36, NULL),
(675, '127.0.0.1', 'Foi Lançada a Nota do aluno  asdkskkdk', '11-08-2015 09:55:13', 36, NULL),
(676, '127.0.0.1', 'Foi Lançada a Nota do aluno  sdksdkkd', '11-08-2015 09:55:50', 36, NULL),
(677, '127.0.0.1', 'Foi Lançada a Nota do aluno   wwejje', '11-08-2015 09:57:22', 36, NULL),
(678, '127.0.0.1', 'Foi Lançada a Nota do aluno  akdkdkdk', '11-08-2015 10:09:47', 36, NULL),
(679, '127.0.0.1', 'Foi Lançada a Nota do aluno  aslala', '11-08-2015 10:10:27', 36, NULL),
(680, '127.0.0.1', 'Foi Lançada a Nota do aluno   dkdkkd', '11-08-2015 10:10:40', 36, NULL),
(681, '127.0.0.1', 'Foi Lançada a Nota do aluno  dkdkweiesdmdm', '11-08-2015 10:10:44', 36, NULL),
(682, '127.0.0.1', 'Foi Lançada a Nota do aluno  dkskkkka', '11-08-2015 10:10:49', 36, NULL),
(683, '127.0.0.1', 'Foi Lançada a Nota do aluno  sdkskdkkskd', '11-08-2015 10:10:57', 36, NULL),
(684, '127.0.0.1', 'Foi Lançada a Nota do aluno  skdjdjdjd', '11-08-2015 10:30:26', 36, NULL),
(685, '127.0.0.1', 'Foi Lançada a Nota do aluno  skdjdjdjd', '11-08-2015 10:32:00', 36, NULL),
(686, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(687, '127.0.0.1', 'Removido um aluno ', '11-08-2015 10:59:51', 36, NULL),
(688, '127.0.0.1', 'Removido um aluno ', '11-08-2015 11:00:27', 36, NULL),
(689, '127.0.0.1', 'Removido um aluno ', '11-08-2015 11:04:58', 36, NULL),
(690, '127.0.0.1', 'Foi Lançada a Nota do aluno saasasaaaaaaa 2wwwwwwww', '11-08-2015 11:11:02', 36, NULL),
(691, '127.0.0.1', 'Foi Lançada a Nota do aluno  sdkkwww', '11-08-2015 11:11:11', 36, NULL),
(692, '127.0.0.1', 'Foi Lançada a Nota do aluno  sdkkwww', '11-08-2015 11:11:37', 36, NULL),
(693, '127.0.0.1', 'Foi Lançada a Nota do aluno  sdkkwww', '11-08-2015 11:11:50', 36, NULL),
(694, '127.0.0.1', 'Foi Lançada a Nota do aluno  sdkkwww', '11-08-2015 11:12:15', 36, NULL),
(695, '127.0.0.1', 'Foi Lançada a Nota do aluno  sdkkwww', '11-08-2015 11:12:34', 36, NULL),
(696, '127.0.0.1', 'Foi Lançada a Nota do aluno  skdkdkdk', '11-08-2015 11:24:15', 36, NULL),
(697, '127.0.0.1', 'Foi feito um login  ', '11-08-2015', 36, NULL),
(698, '127.0.0.1', 'Foi Lançada a Nota do aluno skdklskd ', '11-08-2015 11:53:29', 36, NULL),
(699, '127.0.0.1', 'Removido um aluno ', '11-08-2015 11:53:38', 36, NULL),
(700, '127.0.0.1', 'Removido um aluno ', '11-08-2015 11:53:47', 36, NULL),
(701, '127.0.0.1', 'Removido um aluno ', '11-08-2015 11:53:56', 36, NULL),
(702, '127.0.0.1', 'Foi Apagada a Nota ', '11-08-2015 11:54:53', 36, NULL),
(703, '127.0.0.1', 'Foi Apagada a Nota ', '11-08-2015 11:55:00', 36, NULL),
(704, '127.0.0.1', 'Foi Apagada a Nota ', '11-08-2015 11:55:09', 36, NULL),
(705, '127.0.0.1', 'Foi Apagada a Nota ', '11-08-2015 11:57:09', 36, NULL),
(706, '127.0.0.1', 'Foi Apagada a Nota ', '11-08-2015 11:57:14', 36, NULL),
(707, '127.0.0.1', 'Foi Apagada a Nota ', '11-08-2015 11:57:22', 36, NULL),
(708, '127.0.0.1', 'Foi Lançada a Nota do aluno skdklskd ', '11-08-2015 11:57:34', 36, NULL),
(709, '127.0.0.1', 'Foi Lançada a Nota do aluno skdklskd ', '11-08-2015 11:58:47', 36, NULL),
(710, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:13:05', 36, NULL),
(711, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:13:22', 36, NULL),
(712, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:15:43', 36, NULL),
(713, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:15:49', 36, NULL),
(714, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:15:54', 36, NULL),
(715, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:16:01', 36, NULL),
(716, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:16:07', 36, NULL),
(717, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:16:14', 36, NULL),
(718, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:16:20', 36, NULL),
(719, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:16:26', 36, NULL),
(720, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:16:32', 36, NULL),
(721, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:16:37', 36, NULL),
(722, '127.0.0.1', 'Foi Lançada a Nota do aluno Dario Germano', '12-08-2015 12:17:20', 36, NULL),
(723, '127.0.0.1', 'Foi Lançada a Nota do aluno elone samssss', '12-08-2015 12:17:32', 36, NULL),
(724, '127.0.0.1', 'Foi Lançada a Nota do aluno skdklskd ', '12-08-2015 12:17:36', 36, NULL),
(725, '127.0.0.1', 'Foi Lançada a Nota do aluno  skdjdjdjd', '12-08-2015 12:17:40', 36, NULL),
(726, '127.0.0.1', 'Foi Lançada a Nota do aluno  dkdkweiesdmdm', '12-08-2015 12:17:43', 36, NULL),
(727, '127.0.0.1', 'Foi Lançada a Nota do aluno  asdkskkdk', '12-08-2015 12:17:47', 36, NULL),
(728, '127.0.0.1', 'Foi Lançada a Nota do aluno  aslala', '12-08-2015 12:17:50', 36, NULL),
(729, '127.0.0.1', 'Foi Lançada a Nota do aluno  JOÃO ANTONIO QUIFUTA', '12-08-2015 12:30:06', 36, NULL),
(730, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:32:40', 36, NULL),
(731, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:33:06', 36, NULL),
(732, '127.0.0.1', 'Foi Lançada a Nota do aluno saasasaaaaaaa 2wwwwwwww', '12-08-2015 12:33:12', 36, NULL),
(733, '127.0.0.1', 'Foi Lançada a Nota do aluno elone samssss', '12-08-2015 12:33:17', 36, NULL),
(734, '127.0.0.1', 'Foi Lançada a Nota do aluno  skdjdjdjd', '12-08-2015 12:33:20', 36, NULL),
(735, '127.0.0.1', 'Foi Lançada a Nota do aluno  jejjwejej', '12-08-2015 01:19:31', 36, NULL),
(736, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 01:38:33', 36, NULL),
(737, '127.0.0.1', 'Foi Lançada a Nota do aluno elone samssss', '12-08-2015 01:38:39', 36, NULL),
(738, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 01:39:23', 36, NULL),
(739, '127.0.0.1', 'Foi feito um login', '12-08-2015 01:40:02', 78, NULL),
(740, '127.0.0.1', 'Foi feito um login  ', '12-08-2015 01:40:31', 128, NULL),
(741, '127.0.0.1', 'Foi feito um login  ', '12-08-2015', 36, NULL),
(742, '127.0.0.1', 'Adicionado novo modúlo ASSSSSSSxx', '12-08-2015 02:29:39', 36, NULL),
(743, '127.0.0.1', 'Adicionado novo modúlo ASSSx', '12-08-2015 02:35:18', 36, NULL),
(744, '127.0.0.1', 'Alterado o curso para ASSSSqqq', '12-08-2015 02:40:44', 36, NULL),
(745, '127.0.0.1', 'Alterado o curso para ASSSSqqqyyyy', '12-08-2015 02:42:47', 36, NULL),
(746, '127.0.0.1', 'Alterado o curso para ASSSSqqqyyyy', '12-08-2015 02:43:31', 36, NULL),
(747, '127.0.0.1', 'Removido o curso ', '12-08-2015 02:43:49', 36, NULL),
(748, '127.0.0.1', 'Alterado o curso para ASSSx', '12-08-2015 02:44:55', 36, NULL),
(749, '127.0.0.1', 'Removido o curso ', '12-08-2015 02:45:03', 36, NULL),
(750, '127.0.0.1', 'Adicionado novo modúlo  sdkdkdkd', '12-08-2015 02:46:06', 36, NULL),
(751, '127.0.0.1', 'Alterado o curso para  sdkdkdkdqqq', '12-08-2015 02:46:32', 36, NULL),
(752, '127.0.0.1', 'Removido o curso ', '12-08-2015 02:46:43', 36, NULL),
(753, '127.0.0.1', 'Adicionado novo modúlo  sdjjdjsd', '12-08-2015 02:56:43', 36, NULL),
(754, '127.0.0.1', 'Alterado o modúlo para ASSSSSSSxxxxtttqqqqqq', '12-08-2015 03:01:35', 36, NULL),
(755, '127.0.0.1', 'Alterado o modúlo para ASSSSSSSxxxxtttqqqqqqmddkdkdk', '12-08-2015 03:03:00', 36, NULL),
(756, '127.0.0.1', 'Removido o curso ', '12-08-2015 03:08:45', 36, NULL),
(757, '127.0.0.1', 'Removido o curso ', '12-08-2015 03:08:49', 36, NULL),
(758, '127.0.0.1', 'Removido o curso ', '12-08-2015 03:08:52', 36, NULL),
(759, '127.0.0.1', 'Removido um modulo', '12-08-2015 03:10:02', 36, NULL),
(760, '127.0.0.1', 'Removido um modulo', '12-08-2015 03:10:04', 36, NULL),
(761, '127.0.0.1', 'Removido um modulo', '12-08-2015 03:10:05', 36, NULL),
(762, '127.0.0.1', 'Removido um modulo', '12-08-2015 03:10:07', 36, NULL),
(763, '127.0.0.1', 'Alterado o modúlo para sam', '12-08-2015 03:16:16', 36, NULL),
(764, '127.0.0.1', 'Adicionado novo modúlo  teste', '12-08-2015 03:16:33', 36, NULL),
(765, '127.0.0.1', 'Foi feito um login  ', '12-08-2015', 36, NULL),
(766, '127.0.0.1', 'Foi feito um login  ', '12-08-2015', 36, NULL),
(767, '127.0.0.1', 'Criado um novo programa ', '12-08-2015 04:24:59', 36, NULL),
(768, '127.0.0.1', 'Alterado um  programa ', '12-08-2015 04:30:14', 36, NULL),
(769, '127.0.0.1', 'Alterado um  programa ', '12-08-2015 04:30:22', 36, NULL),
(770, '127.0.0.1', 'Alterado um  programa ', '12-08-2015 04:30:44', 36, NULL),
(771, '127.0.0.1', 'Criado um novo programa ', '12-08-2015 04:31:23', 36, NULL),
(772, '127.0.0.1', 'Apagado um  programa ', '12-08-2015 04:32:03', 36, NULL),
(773, '127.0.0.1', 'Apagado um  programa ', '12-08-2015 04:32:53', 36, NULL),
(774, '127.0.0.1', 'Apagado um  programa ', '12-08-2015 04:32:59', 36, NULL),
(775, '127.0.0.1', 'Foi feito um login', '12-08-2015 04:50:19', 78, NULL),
(776, '127.0.0.1', 'Foi feito um login  ', '12-08-2015', 36, NULL),
(777, '127.0.0.1', 'Foi feito um login  ', '12-08-2015', 36, NULL),
(778, '127.0.0.1', 'Removido um aluno ', '12-08-2015 11:10:05', 36, NULL),
(779, '127.0.0.1', 'Alterado o modúlo para sam xxxx', '12-08-2015 11:11:38', 36, NULL),
(780, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '12-08-2015 11:26:34', 36, NULL),
(781, '127.0.0.1', 'Foi Editado  informações do aluno', '12-08-2015 11:28:09', 36, NULL),
(782, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '12-08-2015 11:29:24', 36, NULL),
(783, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '12-08-2015 11:29:31', 36, NULL),
(784, '127.0.0.1', 'Foi removido um  docente do sistema', '12-08-2015 11:30:00', 36, NULL),
(785, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '12-08-2015 11:31:06', 36, NULL),
(786, '127.0.0.1', 'Foi Editado  informações do docente Com o nome de :  adkslkdkldk', '12-08-2015 11:31:14', 36, NULL),
(787, '127.0.0.1', 'Alterado o curso para CAP', '12-08-2015 11:42:41', 36, NULL),
(788, '127.0.0.1', 'Alterado o curso para CEPAC', '12-08-2015 11:42:59', 36, NULL),
(789, '127.0.0.1', 'Adicionado novo modúlo sddddddddddddddddxxxs', '12-08-2015 11:46:41', 36, NULL),
(790, '127.0.0.1', 'Removido o curso ', '12-08-2015 11:46:51', 36, NULL),
(791, '127.0.0.1', 'Adicionado novo modúlo  samms', '12-08-2015 11:49:30', 36, NULL),
(792, '127.0.0.1', 'Removido um modulo', '12-08-2015 11:49:52', 36, NULL),
(793, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 11:51:26', 36, NULL),
(794, '127.0.0.1', 'Foi Lançada a Nota do aluno elone samssss', '12-08-2015 11:52:19', 36, NULL),
(795, '127.0.0.1', 'Foi feito um login  ', '12-08-2015', 36, NULL),
(796, '127.0.0.1', 'Foi Lançada a Nota do aluno   akdkdkdk', '12-08-2015 12:00:20', 36, NULL),
(797, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:00:58', 36, NULL),
(798, '127.0.0.1', 'Foi Lançada a Nota do aluno   dkdkkd', '12-08-2015 12:05:33', 36, NULL),
(799, '127.0.0.1', 'Foi Apagada a Nota ', '12-08-2015 12:05:38', 36, NULL),
(800, '127.0.0.1', 'Foi Lançada a Nota do aluno   saasas asdwedf', '12-08-2015 12:07:45', 36, NULL),
(801, '127.0.0.1', 'Alterado um  programa ', '12-08-2015 12:11:10', 36, NULL),
(802, '127.0.0.1', 'Apagado um  programa ', '12-08-2015 12:11:38', 36, NULL),
(803, '127.0.0.1', 'Criado um novo programa ', '12-08-2015 12:12:07', 36, NULL),
(804, '127.0.0.1', 'Foi feito um login  ', '12-08-2015', 36, NULL),
(805, '127.0.0.1', 'Foi feito um login  ', '12-08-2015', 36, NULL),
(806, '127.0.0.1', 'Foi gerado o diploma  do  aluno dkdkweiesdmdmdmdmmd', '12-08-2015 04:20:18', 36, NULL),
(807, '127.0.0.1', 'Foi feito um login', '12-08-2015 12:28:55', 78, NULL),
(808, '127.0.0.1', 'Criado um novo usuario ', '12-08-2015 01:01:24', 78, NULL),
(809, '127.0.0.1', 'Removido um usuario ', '12-08-2015 13:08:59', 78, NULL),
(810, '127.0.0.1', 'Removido um usuario ', '12-08-2015 13:08:59', 78, NULL),
(811, '127.0.0.1', 'Foi feito um login  ', '12-08-2015', 36, NULL),
(812, '127.0.0.1', 'Foi feito um login', '12-08-2015 09:57:47', 78, NULL),
(813, '127.0.0.1', 'Adicionado novo modúlo kxckksdf', '12-08-2015 10:16:16', 78, NULL),
(814, '127.0.0.1', 'Adicionado novo modúlo sam sassdda', '12-08-2015 10:16:28', 78, NULL),
(815, '127.0.0.1', 'Adicionado novo modúlo Elone Funcionario', '12-08-2015 10:16:40', 78, NULL),
(816, '127.0.0.1', 'Adicionado novo modúlo wert', '12-08-2015 10:24:35', 78, NULL),
(817, '127.0.0.1', 'Adicionado novo modúlo wqasdd', '12-08-2015 10:25:16', 78, NULL),
(818, '127.0.0.1', 'Adicionado novo modúlo qrtyeeeeeeeeeeeeeeeeeeeeee', '12-08-2015 10:25:29', 78, NULL),
(819, '127.0.0.1', 'Alterado sam sassddaxxxzzz', '12-08-2015 10:28:06', 78, NULL),
(820, '127.0.0.1', 'Removido categoriaCientifica', '12-08-2015 10:30:12', 78, NULL),
(821, '127.0.0.1', 'Alterado mmmmmxxxxssssssssssqqqazzz', '12-08-2015 10:30:22', 78, NULL),
(822, '127.0.0.1', 'Alterado qqqqqqqqqqqqqqqqqqqqq', '12-08-2015 10:32:33', 78, NULL),
(823, '127.0.0.1', 'Removido categoriaDocente', '12-08-2015 10:32:50', 78, NULL),
(824, '127.0.0.1', 'Alterado eeeeeeeeeeeeeeeeeeeeee', '12-08-2015 10:32:58', 78, NULL),
(825, '127.0.0.1', 'Removido categoriaDocente', '12-08-2015 10:33:02', 78, NULL),
(826, '127.0.0.1', 'Adicionado novo modúlo wwwwwwwwwwwwwwwwwwww', '12-08-2015 10:33:12', 78, NULL),
(827, '127.0.0.1', 'Adicionado novo modúlo wqaddsxcccx', '12-08-2015 10:37:12', 78, NULL),
(828, '127.0.0.1', 'Adicionado novo modúlo xxxxxxxxxxxxxxxx111', '12-08-2015 10:41:15', 78, NULL),
(829, '127.0.0.1', 'Adicionado novo modúlo sampaio', '12-08-2015 10:41:32', 78, NULL),
(830, '127.0.0.1', 'Adicionado novo modúlo ASSSSqqq', '12-08-2015 10:41:52', 78, NULL),
(831, '127.0.0.1', 'Removido categoriaCientifica', '12-08-2015 10:42:41', 78, NULL),
(832, '127.0.0.1', 'Removido categoriaCientifica', '12-08-2015 10:42:59', 78, NULL),
(833, '127.0.0.1', 'Alterado sampaiomm', '12-08-2015 10:43:11', 78, NULL),
(834, '127.0.0.1', 'Removido unidadeOrganica', '12-08-2015 10:43:14', 78, NULL),
(835, '127.0.0.1', 'Adicionado novo modúlo vvvvvvvvvvvvvvvvvvvvvxxxxxxxxxxxx', '12-08-2015 10:43:21', 78, NULL),
(836, '127.0.0.1', 'Adicionado novo modúlo qqqqqqqqqqqqqqqqqqqqq', '12-08-2015 10:48:58', 78, NULL),
(837, '127.0.0.1', 'Alterado qqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrtttzzxxx', '12-08-2015 10:49:28', 78, NULL),
(838, '127.0.0.1', 'Adicionado novo modúlo sam sassdda', '12-08-2015 10:49:39', 78, NULL),
(839, '127.0.0.1', 'Removido universidade', '12-08-2015 10:49:45', 78, NULL),
(840, '127.0.0.1', 'Adicionado novo modúlo yyyyyyyyyyyy', '12-08-2015 10:54:17', 78, NULL),
(841, '127.0.0.1', 'Alterado yyyyyyyyyyyyqqaazz', '12-08-2015 10:54:31', 78, NULL),
(842, '127.0.0.1', 'Removido funcao', '12-08-2015 10:54:35', 78, NULL),
(843, '127.0.0.1', 'Removido funcao', '12-08-2015 10:54:38', 78, NULL),
(844, '127.0.0.1', 'Alterado qqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrtttzzxxxs', '12-08-2015 10:54:47', 78, NULL),
(845, '127.0.0.1', 'Removido funcao', '12-08-2015 10:54:49', 78, NULL),
(846, '127.0.0.1', 'Adicionado novo modúlo zzzz', '12-08-2015 10:54:56', 78, NULL),
(847, '127.0.0.1', 'Foi feito um login', '12-08-2015 11:07:13', 78, NULL),
(848, '127.0.0.1', 'Foi feito um login  ', '12-08-2015 11:07:35', 128, NULL),
(849, '127.0.0.1', 'Foi feito um login', '12-08-2015 11:47:37', 78, NULL),
(850, '127.0.0.1', 'Foi feito um login  ', '12-08-2015 11:47:50', 128, NULL),
(851, '127.0.0.1', 'Foi feito um login', '13-08-2015 12:30:00', 78, NULL),
(852, '127.0.0.1', 'Foi feito um login', '13-08-2015 12:45:09', 78, NULL),
(853, '127.0.0.1', 'Foi feito um login  ', '13-08-2015 12:45:22', 128, NULL),
(854, '127.0.0.1', 'Foi feito um login  ', '13-08-2015', 36, NULL),
(855, '127.0.0.1', 'Foi feito um login', '13-08-2015 01:40:17', 78, NULL),
(856, '127.0.0.1', 'Criado um novo usuario ', '13-08-2015 01:40:56', 78, NULL),
(857, '127.0.0.1', 'Foi feito um login', '13-08-2015 01:42:11', 78, NULL),
(858, '127.0.0.1', 'Criado um novo usuario ', '13-08-2015 01:42:40', 78, NULL),
(859, '127.0.0.1', 'Foi feito um login  ', '13-08-2015', 187, NULL),
(860, '127.0.0.1', 'Foi Editado  informações do aluno', '13-08-2015 01:56:42', 187, NULL),
(861, '127.0.0.1', 'Foi Editado  informações do aluno', '13-08-2015 02:00:07', 187, NULL),
(862, '127.0.0.1', 'Foi feito um login  ', '13-08-2015', 36, NULL),
(863, '127.0.0.1', 'Foi feito um login', '13-08-2015 02:02:29', 78, NULL),
(864, '127.0.0.1', 'Foi feito um login  ', '13-08-2015', 36, NULL),
(865, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  dkdkk dkswwa', '13-08-2015 02:37:18', 36, NULL),
(866, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  dksdfmm sdsmdmsd', '13-08-2015 02:45:50', 36, NULL),
(867, '127.0.0.1', 'Foi criado um novo aluno com o nome de :  sdjsmdm  asjamsda', '13-08-2015 02:47:17', 36, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `materia`
--

CREATE TABLE IF NOT EXISTS `materia` (
`id` int(11) NOT NULL,
  `data` varchar(45) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `materia`
--

INSERT INTO `materia` (`id`, `data`, `curso_id`, `modulo_id`, `nome`) VALUES
(7, '13/08/2015', 15, 17, 'upload/privkey.pem'),
(8, '13/08/2015', 15, 19, 'upload/Quanto vale o seu serviço.doc'),
(9, '13/08/2015', 15, 17, 'upload/sam.mwb');

-- --------------------------------------------------------

--
-- Estrutura para tabela `matricula`
--

CREATE TABLE IF NOT EXISTS `matricula` (
`id` int(11) NOT NULL,
  `data` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `aluno_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `matricula`
--

INSERT INTO `matricula` (`id`, `data`, `estado`, `aluno_id`) VALUES
(44, '03-06-2015', 'FECHADO', 49),
(45, '07-07-2015', 'FECHADO', 50),
(49, '18-07-2015', 'FECHADO', 54),
(51, '25-07-2015', 'FECHADO', 56),
(56, '30-07-2015', 'FECHADO', 61),
(60, '05-08-2015', 'FECHADO', 65),
(63, '06-08-2015', 'ABERTO', 68),
(64, '06-08-2015', 'ABERTO', 69),
(65, '06-08-2015', 'ABERTO', 70),
(66, '06-08-2015', 'ABERTO', 71),
(67, '06-08-2015', 'ABERTO', 72),
(68, '06-08-2015', 'ABERTO', 73),
(69, '06-08-2015', 'ABERTO', 74),
(70, '05-08-2015', 'ABERTO', 75),
(71, '07-08-2015', 'ABERTO', 76),
(72, '06-08-2015', 'ABERTO', 77),
(73, '07-08-2015', 'ABERTO', 78),
(76, '06-08-2015', 'ABERTO', 81),
(78, '06-08-2015', 'ABERTO', 83),
(79, '07-08-2015', 'ABERTO', 84),
(80, '14-08-2015', 'ABERTO', 85),
(81, '07-08-2015', 'ABERTO', 86),
(82, '07-08-2015', 'FECHADO', 87),
(84, '07-08-2015', 'FECHADO', 89),
(85, '07-08-2015', 'ABERTO', 90),
(86, '07-08-2015', 'ABERTO', 91),
(87, '07-08-2015', 'FECHADO', 92),
(88, '09/08/2015', 'FECHADO', 93),
(89, '09/08/2015', 'ABERTO', 94),
(90, '09/08/2015', 'ABERTO', 95),
(91, '09/08/2015', 'ABERTO', 96),
(92, '09/08/2015', 'ABERTO', 97),
(93, '09/08/2015', 'ABERTO', 98),
(94, '09/08/2015', 'FECHADO', 99),
(95, '09/08/2015', 'ABERTO', 100),
(96, '11-06-2015', 'ABERTO', 101),
(97, '09/08/2015', 'ABERTO', 102),
(99, '21/12/2015', 'ABERTO', 104),
(100, '09-08-2015', 'FECHADO', 105),
(101, '09/08/2015', 'ABERTO', 106),
(102, '09/08/2015', 'ABERTO', 107),
(103, '09-08-2015', 'ABERTO', 108),
(104, '25-07-2015', 'ABERTO', 109),
(106, '09/08/2015', 'ABERTO', 111),
(107, '09/08/2015', 'ABERTO', 112),
(108, '10/08/2015', 'ABERTO', 113),
(109, '10/08/2015', 'FECHADO', 114),
(111, '10/08/2015', 'ABERTO', 116),
(113, '10/08/2015', 'ABERTO', 118),
(114, '10/08/2015', 'FECHADO', 119),
(116, '10/08/2015', 'FECHADO', 121),
(117, '10/08/2015', 'FECHADO', 122),
(118, '10/08/2015', 'ABERTO', 123),
(119, '10-08-2015', 'FECHADO', 124),
(120, '10-08-2015', 'FECHADO', 125),
(121, '10-08-2015', 'ABERTO', 126),
(122, '10-08-2015', 'ABERTO', 127),
(124, '12-08-2015', 'ABERTO', 129),
(125, '13-08-2015', 'ABERTO', 130),
(126, '13-08-2015', 'ABERTO', 131),
(127, '13-08-2015', 'ABERTO', 132),
(128, '13-08-2015', 'ABERTO', 133);

-- --------------------------------------------------------

--
-- Estrutura para tabela `matricula_modulo`
--

CREATE TABLE IF NOT EXISTS `matricula_modulo` (
`id` int(11) NOT NULL,
  `matricula_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `data` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `matricula_modulo`
--

INSERT INTO `matricula_modulo` (`id`, `matricula_id`, `modulo_id`, `data`) VALUES
(15, 44, 7, '03-06-2015'),
(25, 44, 8, '18-06-2015'),
(26, 44, 9, '03-06-2015'),
(27, 45, 8, '07-07-2015'),
(28, 44, 8, '15-07-2015'),
(29, 45, 14, '09-07-2015'),
(33, 49, 7, '18-07-2015'),
(35, 51, 14, '25-07-2015'),
(40, 56, 9, '30-07-2015'),
(44, 60, 8, '05-08-2015'),
(47, 63, 7, '06-08-2015'),
(48, 64, 8, '06-08-2015'),
(49, 65, 8, '06-08-2015'),
(50, 66, 8, '06-08-2015'),
(51, 67, 8, '06-08-2015'),
(52, 68, 8, '06-08-2015'),
(53, 69, 7, '06-08-2015'),
(54, 70, 7, '05-08-2015'),
(55, 71, 8, '07-08-2015'),
(56, 72, 15, '06-08-2015'),
(57, 73, 7, '07-08-2015'),
(60, 76, 8, '06-08-2015'),
(62, 78, 7, '06-08-2015'),
(63, 79, 14, '07-08-2015'),
(64, 80, 14, '14-08-2015'),
(65, 81, 15, '07-08-2015'),
(66, 82, 15, '07-08-2015'),
(68, 84, 7, '07-08-2015'),
(69, 85, 7, '07-08-2015'),
(70, 86, 8, '07-08-2015'),
(71, 87, 8, '07-08-2015'),
(72, 88, 8, '09/08/2015'),
(73, 89, 8, '09/08/2015'),
(74, 90, 8, '09/08/2015'),
(75, 91, 9, '09/08/2015'),
(76, 92, 8, '09/08/2015'),
(77, 93, 8, '09/08/2015'),
(78, 94, 8, '09/08/2015'),
(79, 95, 8, '09/08/2015'),
(80, 96, 8, '11-06-2015'),
(81, 97, 9, '09/08/2015'),
(83, 99, 8, '21/12/2015'),
(84, 100, 8, '09-08-2015'),
(85, 101, 8, '09/08/2015'),
(86, 102, 7, '09/08/2015'),
(87, 103, 8, '09-08-2015'),
(88, 104, 8, '25-07-2015'),
(90, 106, 8, '09/08/2015'),
(91, 107, 8, '09/08/2015'),
(92, 108, 7, '10/08/2015'),
(93, 109, 8, '10/08/2015'),
(95, 111, 8, '10/08/2015'),
(97, 113, 7, '10/08/2015'),
(98, 114, 9, '10/08/2015'),
(100, 116, 8, '10/08/2015'),
(101, 117, 7, '10/08/2015'),
(102, 118, 7, '10-08-2015'),
(103, 119, 8, '10-08-2015'),
(104, 120, 7, '10-08-2015'),
(105, 121, 8, '10-08-2015'),
(106, 122, 7, '10-08-2015'),
(108, 124, 7, '12-08-2015'),
(109, 87, 8, '13-08-2015'),
(110, 87, 8, '13-08-2015'),
(111, 87, 9, '20-08-2015'),
(112, 87, 9, '20-08-2015'),
(113, 88, 15, '12-08-2015'),
(114, 87, 14, '14-08-2015'),
(115, 87, 7, '28-08-2015'),
(116, 125, 9, '13-08-2015'),
(117, 126, 7, '13-08-2015'),
(118, 127, 9, '13-08-2015'),
(119, 128, 8, '13-08-2015');

-- --------------------------------------------------------

--
-- Estrutura para tabela `modulo`
--

CREATE TABLE IF NOT EXISTS `modulo` (
`id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `curso_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `modulo`
--

INSERT INTO `modulo` (`id`, `nome`, `curso_id`) VALUES
(7, 'COMPUTAÇÃO', 14),
(8, 'Tecnicas e Linguagem de Programação', 15),
(9, 'Elaboração de projecto', 17),
(14, 'Tecnologia de Rede', 14),
(15, 'sam xxxx', 17),
(17, 'hhkhbhv', 15),
(19, ' teste', 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `nota`
--

CREATE TABLE IF NOT EXISTS `nota` (
`id` int(11) NOT NULL,
  `nota` set('Excelente','Suficiente','Bom','') DEFAULT NULL,
  `data` varchar(45) NOT NULL,
  `aluno_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `nota`
--

INSERT INTO `nota` (`id`, `nota`, `data`, `aluno_id`, `modulo_id`) VALUES
(24, 'Bom', '2015-08-05', 65, 8),
(27, 'Excelente', '2015-08-11', 122, 7),
(28, 'Suficiente', '2015-08-11', 125, 7),
(33, 'Suficiente', '2015-08-11', 119, 9),
(34, 'Suficiente', '2015-08-11', 121, 8),
(38, 'Suficiente', '2015-08-11', 124, 8),
(39, 'Suficiente', '2015-08-11', 124, 8),
(40, 'Suficiente', '2015-08-11', 124, 8),
(41, 'Suficiente', '2015-08-11', 124, 8),
(42, 'Suficiente', '2015-08-11', 124, 8),
(43, 'Suficiente', '2015-08-11', 114, 8),
(47, 'Suficiente', '2015-08-12', 49, 7),
(49, 'Excelente', '2015-08-12', 87, 15),
(51, 'Excelente', '2015-08-12', 105, 8),
(53, 'Bom', '2015-08-12', 126, 8),
(54, 'Suficiente', '2015-08-12', 50, 14),
(55, 'Suficiente', '2015-08-12', 61, 9),
(57, 'Suficiente', '2015-08-12', 99, 8),
(58, 'Suficiente', '2015-08-12', 89, 7),
(60, 'Bom', '2015-08-12', 54, 7),
(61, 'Suficiente', '2015-08-12', 92, 8),
(62, 'Suficiente', '2015-08-12', 93, 8),
(63, 'Suficiente', '2015-08-12', 56, 14);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE IF NOT EXISTS `pessoa` (
`id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `apelido` varchar(45) DEFAULT NULL,
  `genero` set('masculino','femenino') DEFAULT NULL,
  `nacionalidade` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `imagem` varchar(5000) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `bi` varchar(45) DEFAULT NULL,
  `documento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `pessoa`
--

INSERT INTO `pessoa` (`id`, `nome`, `apelido`, `genero`, `nacionalidade`, `telefone`, `imagem`, `email`, `bi`, `documento`) VALUES
(128, 'Admin', 'sdjsjd', 'masculino', 'ANGOLANA', '934895543', NULL, 'forksystem@gmail.com', '874567823LA032', NULL),
(235, 'Dario Germano', 'skdkdk', 'masculino', 'ANGOLANA', '344443339', 'upload/1902749_519278058210397_3315582850152740192_n.jpg', 'samp3aioelon@hotmail.com', '347593420LA035', NULL),
(250, 'ADMINISTRADOR', 'sdskd', 'masculino', 'ANGOLANA', '222', 's33', 'sdd', 'eee', 'ee'),
(256, ' JOÃO ANTONIO QUIFUTA', 'skdkdk', 'masculino', 'ANGOLANA', '983445566', 'upload/Captura de ecrã de 2015-07-02 14:38:15.png', 'joao@homail.com', '234209341LA039', NULL),
(259, 'ess asd', 'sdkkdkd', 'masculino', 'ANGOLANA', '222222222', NULL, 'sampaio@gmal.com', '347593410LA030', NULL),
(260, '2222 22222', 'sdf', 'femenino', 'ANGOLANA', '236987653', NULL, 'sa33332ewmdd@gmail.com', '234209345LA035', NULL),
(261, 'eeeeee     sam', 'sdff', 'femenino', 'ANGOLANA', '236987351', NULL, 'sassmp3aioelon@hotmail.com', '234209345LA032', NULL),
(266, 'elone samssss', 'sjdjf', 'femenino', 'ANGOLANA', '236987659', NULL, 'sa3332332e222wmdd@gmail.com', '234209385LA039', NULL),
(268, '  saasas asdwedf', 'sdjd', 'masculino', 'ANGOLANA', '236987654', NULL, 'sa3332332e222222wmdd@gmail.com', '234109345LA036', NULL),
(278, 'saasasaaaaaaa 2wwwwwwww', 'sdjjdf', 'masculino', 'ANGOLANA', '236917611', NULL, 'sa3332331112e222wmdd@gmail.com', '231209345LA037', NULL),
(282, ' wdfffg  sdfffffffffffff', 'sdff', 'masculino', 'ANGOLANA', '999999999', 'upload/1510919_729612147057396_723725579_n.jpg', 'elones2143ampaio@gmail.com', '234209345LA010', NULL),
(285, ' sdjsjkdkj', 'sdlslkfklf', 'masculino', 'ANGOLANA', '999999991', NULL, 'elonesampai1o@gmail.com', '234459827LD031', NULL),
(286, ' sdslkdk', 'sdjjdsfk', 'masculino', 'ANGOLANA', '233333333', NULL, 'xxxxx@gmail.com', '234459827LD039', NULL),
(287, ' sdslkdkdf', 'sdjjdsfk', 'masculino', 'ANGOLANA', '233333332', NULL, 'xxxxxx@gmail.com', '234459827LD034', NULL),
(288, ' sdslkdkdfas', 'sdjjdsfk', 'masculino', 'ANGOLANA', '233333334', NULL, 'xxxxxxx@gmail.com', '234459827LD035', NULL),
(289, ' sdslkdkdfassdf', 'sdjjdsfk', 'masculino', 'ANGOLANA', '233333335', NULL, 'xxxxxxxx@gmail.com', '234459827LD037', NULL),
(290, ' sdslkdkdfassdfaddd', 'sdjjdsfk', 'masculino', 'ANGOLANA', '233333336', NULL, 'xxxxxxxxx@gmail.com', '234459827LD038', NULL),
(291, ' wejjejer', 'wejje', 'masculino', 'ANGOLANA', '223333333', 'upload/1902749_519278058210397_3315582850152740192_n.jpg', 'sampaioelon@hotmail.com', '234459827LD033', NULL),
(292, ' ljeewe', 'sddsd', 'femenino', 'ANGOLANA', '211111111', NULL, 'sam121paioelon@hotmail.com', '234459827LD019', NULL),
(293, ' sdkdkkfkf', 'sdklkflkdlkf', 'femenino', 'ANGOLANA', '323444444', 'upload/images (2).jpg', 'Sa44m23paioelon@hotmail.com', '234452827LD032', NULL),
(294, ' wassddf', 'addfff', 'masculino', 'ANGOLANA', '234333333', NULL, 'Sa4114mpaioelon@hotmail.com', '234459827LD047', NULL),
(295, ' skdklskfkf', 'jdjsjdjf', 'masculino', 'ANGOLANA', '233222222', 'upload/10981798_644428605658288_7647654810219919233_n.jpg', 'sa12m11paioeon@hotmail.com', '234459827LD011', NULL),
(298, 'kskdkld ', 'sdkdkd', 'masculino', 'ANGOLANA', '344444444', NULL, 'sd@gmail.com', '234459827LD030', NULL),
(300, 'sammm', 'weeeeee', 'masculino', 'ANGOLANA', '222222224', NULL, 'fffffdd@hh.com', '234459827LD023', NULL),
(301, ' sjldjdjsff', 'skdkfkkf', 'masculino', 'Outro', '111111111', NULL, 'elo2334nesampaio@gmail.com', '3455555', NULL),
(302, ' sjjksjk', 'kdsjskjdf', 'masculino', 'ANGOLANA', '234444444', NULL, 'sa3332332e2221wmdd@gmail.com', '234209345LA011', NULL),
(303, ' adkslkdkldk', 'sdjsjkjd', 'masculino', 'Outro', '233444444', NULL, '2e2221w1mdd@gmail.com', '234219345LA010', NULL),
(306, ' jsdjdjkj', 'shddd', 'masculino', 'ANGOLANA', '212333333', NULL, 'saw2wmdhd@gh.com', '234209145LA011', NULL),
(307, ' sddjjkfjd', 'sndjsjfjff', 'femenino', 'ANGOLANA', '234444441', 'upload/8.jpg', 'sa3332332e2212wmdd@gmail.com', '234109345LA011', NULL),
(308, ' sdksdklsd', 'sadhdyyff', 'femenino', 'Outro', '341111111', NULL, 'sa331232332e222wmdd@gmail.com', '2333331', NULL),
(309, ' jjjjjjkkk', 'bmvhhhhchv', 'masculino', 'ANGOLANA', '222222228', NULL, 'sa331232332e66222wmdd@gmail.com', '234209345LA019', NULL),
(310, 'sjdjsdkj ', 'sjdjsdjk', 'femenino', 'ANGOLANA', '236987451', NULL, 'elon32esamp1io@gmail.com', '234209345LA018', NULL),
(311, 'Elone Funcionario', 'sdff', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(312, 'skdklskd ', 'sdnsdjdjdsd', 'femenino', 'ANGOLANA', '236987452', NULL, 'saw2w1mdhd@gh.com', '234209315LA010', NULL),
(313, ' sdjsjdjd', 'sdsjjfd', 'femenino', 'Outro', '222222211', NULL, '222sa331232332e222wmdd@gmail.com', '2333333', NULL),
(315, ' jejjwejej', 'sdjsjjdjse', 'masculino', 'Outro', '236987111', NULL, 'sa3332332222e222wmdd@gmail.com', '2333111', NULL),
(316, ' jejjwejej', 'sdjsjjdjse', 'masculino', 'ANGOLANA', '236112222', NULL, 'sa333233222222e222wmdd@gmail.com', '234209345LA111', NULL),
(317, ' sdjdjsjdj', 'adjsjdjd', 'femenino', 'ANGOLANA', '332444555', NULL, 'sa333233222e222wmdd@gmail.com', '234209345LA123', NULL),
(318, '    akdkdkdk', 'sdjljsdljljfs', 'masculino', 'Outro', '236982659', 'upload/1655432_593808957369316_1864583762_o.jpg', 'sa331232332e222222wmdd@gmail.com', '2333335', NULL),
(319, '  dkdkkd', 'sampaio', 'femenino', 'ANGOLANA', '236987454', NULL, 'sa3332332qqe222wmdd@gmail.com', '234209341LA011', NULL),
(320, ' sdkdkkfkf', 'fdfgjg', 'femenino', 'ANGOLANA', '222222221', NULL, 'sa331232332e11222wmdd@gmail.com', '234109345LA018', NULL),
(321, ' sdkdkkfkf', 'fdfgjg', 'femenino', 'ANGOLANA', '222222223', NULL, 'sa331232332e11222wmdd@gmail.com3', '234109345LA012', NULL),
(322, ' sdjdjjd', 'nfdfnn', 'masculino', 'ANGOLANA', '234566444', NULL, 'sa33123232232e222wmdd@gmail.com', '234209345LA014', NULL),
(323, ' skdkdkdkk', 'ddffkfkfkf', 'masculino', 'Outro', '216987651', NULL, 'sa3332332222e22222wmdd@gmail.com', '2333131', NULL),
(324, ' eeewe', 'weewee', 'femenino', 'Outro', '236987453', NULL, 'sa3332332222e222222wmdd@gmail.com', '2333334', NULL),
(325, ' skdjdjdjd', 'djjdjfjjff', 'femenino', 'Outro', '236987651', NULL, 'sa3332332e22222wmdd@gmail.com', '1333111', NULL),
(326, ' dskdkkk', 'kfkfkfkff', 'femenino', 'ANGOLANA', '236981651', NULL, 'sa33323322222222e222wmdd@gmail.com', '231209345LA011', NULL),
(327, 'sdfff ', 'sdddddddddd', 'femenino', 'Outro', '236187451', NULL, 'sa3332332222e22112wmdd@gmail.com', '2311333', NULL),
(328, ' sdjdjdjjdjdj', 'djdjdjjdjd', 'femenino', 'Outro', '216987111', NULL, 'sa331232332e1111222wmdd@gmail.com', '2311111', NULL),
(330, 'ldldld ', 'sjdjdjdjjdd', 'femenino', 'Outro', '236987183', NULL, 'sa3332332222eww22222wmdd@gmail.com', '2344555', NULL),
(331, ' dkdkweiesdmdm', 'dmdmmd', 'femenino', 'Outro', '236117653', NULL, 'sa331232332222e222wmdd@gmail.com', '123u336', NULL),
(332, ' ekeekeke', 'jddjdjjdd', 'femenino', 'ANGOLANA', '736636355', NULL, 'sa331232332e223222wmdd@gmail.com', '234119345LA032', NULL),
(333, 'sdkdkdk ', 'dkdjjff', 'femenino', 'Outro', '236982311', NULL, 'sa3312323322222e222wmdd@gmail.com', '3836464', NULL),
(334, ' kdkkdkd', 'kddkdkd', 'femenino', 'ANGOLANA', '236923833', NULL, '222sa3332332222e222wmdd@gmail.com', '231119345LA032', NULL),
(335, 'smdddmdmd', 'dddkdkd', 'masculino', 'Outro', '236987133', NULL, '111sa3332332222e222wmdd@gmail.com', '2333312', NULL),
(337, 'skdkdkk', 'sdkkkffff', 'femenino', 'Outro', '136987653', 'upload/1902749_519278058210397_3315582850152740192_n.jpg', 'sa3332332222e233222wmdd@gmail.com', '2333110', NULL),
(339, ' sdkdkdksd', 'sdkdkkdd', 'femenino', 'ANGOLANA', '267353646', NULL, 'sa331232332e222w12222mdd@gmail.com', '234209345LB111', NULL),
(340, ' dkdkfkfkfk', 'djjdjdjdjjd', 'femenino', 'ANGOLANA', '283744646', NULL, 'sa331232332e3222222wmdd@gmail.com', '234209345LC111', NULL),
(341, ' SDDJJDJD', 'jcjdjdjjd', 'femenino', 'Outro', '273544444', NULL, 'sa333233222sss2e222wmdd@gmail.com', '2311112', NULL),
(342, 'sdkkdkd ', 'dkkdkdkf', 'masculino', 'ANGOLANA', '116987653', 'upload/8.jpg', 'sa3332332e333222wmdd@gmail.com', '234201145LA010', NULL),
(343, ' skdkdkdk', 'kdkdkkff', 'masculino', 'ANGOLANA', '432344444', NULL, 'ws11dkdk@gmail.com', '135209345LA011', NULL),
(346, ' sdkkekdwe', 'ewhehhhr', 'femenino', 'ANGOLANA', '873544644', NULL, 'sa3332332222333e222wmdd@gmail.com', '234809345LA032', NULL),
(348, 'sdkskdkdk ', 'sjdjjdsjd', 'masculino', 'ANGOLANA', '353522111', NULL, 'sa331232332e111111222wmdd@gmail.com', '234209311LA011', NULL),
(349, ' dkskkkka', 'djsjjdjsjdd', 'femenino', 'ANGOLANA', '216211122', NULL, 'sa333233111111112e222wmdd@gmail.com', '211119345LA011', NULL),
(351, ' sdkskdkkskd', 'djsjjdjdjss', 'masculino', 'ANGOLANA', '211233331', NULL, 'sa3332332e2222222222wmdd@gmail.com', '211119345LA010', NULL),
(352, ' sdksdkkd', 'sndnsndnd', 'femenino', 'ANGOLANA', '221113122', NULL, 'ws122221dkdk@gmail.com', '231109145LA011', NULL),
(353, ' dkskdkskksks', 'sjdjjsdsjdjd', 'masculino', 'Outro', '223333337', NULL, 'sa3332332e222222222wmdd@gmail.com', '2335333', NULL),
(354, ' sdkkwww', 'dmmwewww', 'masculino', 'ANGOLANA', '772211122', NULL, 'sa22222w2wmdhd@gh.com', '234229745LA010', NULL),
(355, '  wwejje', 'sdssmss', 'masculino', 'ANGOLANA', '211133111', NULL, 'sa2222222w2wmdhd@gh.com', '231101115LA011', NULL),
(356, ' aslala', 'skasddjjdd', 'masculino', 'Outro', '231133222', NULL, 'sam222222paioelon@hotmail.com', '2227773', NULL),
(357, ' sdksdkdkdkkd', 'esdjdjjd', 'femenino', 'ANGOLANA', '334377444', NULL, 'saw222222222wmdhd@gh.com', '234202345LA011', NULL),
(359, 'sasndndndn', 'elone', 'masculino', 'ANGOLANA', '116987451', NULL, 'elone2samp1io@gmail.com', '231209345LA010', NULL),
(360, 'wwwww', 'wwwwwww', 'masculino', 'ANGOLANA', '921156761', 'upload/622_61f99150-1341-3181-9ebd-e9377c546ad6.jpg', 'elone2sa1122mp1io@gmail.com', '111119345LA032', NULL),
(361, ' qweaaa', 'ewdxzz', 'femenino', 'ANGOLANA', '136117653', NULL, 'wsd21kdk@gmail.com', '234201345LA011', NULL),
(362, 'funcionario', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(363, 'java', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(364, ' dwasnd', 'sndndnfnff', 'masculino', 'ANGOLANA', '946233323', NULL, '99sa3332332e222wmdd@gmail.com', '934209345LA010', NULL),
(365, ' dkdkk', 'dkswwa', 'masculino', 'Outro', '236987233', NULL, 'sa322zzxx332332e222wmdd@gmail.com', '2334b38', NULL),
(366, ' dksdfmm', 'sdsmdmsd', 'femenino', 'ANGOLANA', '863932333', NULL, 'sa91w2wmdhd@gh.com', '234809345LA010', NULL),
(367, ' sdjsmdm ', 'asjamsda', 'femenino', 'Outro', '231124444', NULL, 'sa111w2wmdhd@gh.com', '2111333', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `programa`
--

CREATE TABLE IF NOT EXISTS `programa` (
`id` int(11) NOT NULL,
  `data` varchar(50) NOT NULL,
  `local` varchar(45) DEFAULT NULL,
  `modulo_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `hora` varchar(250) DEFAULT NULL,
  `datafinal` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `programa`
--

INSERT INTO `programa` (`id`, `data`, `local`, `modulo_id`, `docente_id`, `curso_id`, `hora`, `datafinal`) VALUES
(7, '25/07/2015', 'kkkkkkkkkk ', 7, 5, 14, '20h', '25/07/2015'),
(9, '24/07/2015', ' ddddd', 7, 6, 14, '48H', '25/07/2015'),
(14, '14/08/2015', 'Cabinda', 9, 8, 17, '20H', '15/08/2015'),
(15, '20/08/2015', 'Luanda', 8, 15, 15, '40h', '29/08/2015'),
(16, '20/08/2015', ' sass', 19, 8, 15, '40h', '29/08/2015'),
(17, '21/08/2015', 'sassaqqqqq', 9, 15, 17, '40h', '29/08/2015');

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidade_organica`
--

CREATE TABLE IF NOT EXISTS `unidade_organica` (
`id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `unidade_organica`
--

INSERT INTO `unidade_organica` (`id`, `nome`) VALUES
(1, 'aaaaaaaaaaaaaaaa'),
(2, 'wqaddsxcccx'),
(3, 'xxxxxxxxxxxxxxxx111'),
(5, 'vvvvvvvvvvvvvvvvvvvvvxxxxxxxxxxxx');

-- --------------------------------------------------------

--
-- Estrutura para tabela `universidade`
--

CREATE TABLE IF NOT EXISTS `universidade` (
`id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `universidade`
--

INSERT INTO `universidade` (`id`, `nome`) VALUES
(1, 'hshhshsh'),
(2, 'qqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrtttzzxxx');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
`id` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `nivel` set('administrador','aluno','docente','gestor','funcionario') NOT NULL,
  `pessoa_id` int(11) NOT NULL,
  `tema` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `usuario`
--

INSERT INTO `usuario` (`id`, `login`, `senha`, `nivel`, `pessoa_id`, `tema`) VALUES
(36, 'admin', '9d32bccb306f7e1b3e737cecb07f8fc7', 'gestor', 128, 'metro'),
(62, 'Samuel6', '9d0f572d371c1f6d6115a77d316cb807', 'aluno', 235, NULL),
(78, 'administrador', '9d32bccb306f7e1b3e737cecb07f8fc7', 'administrador', 250, NULL),
(84, '234209341LA039', '94b0d83638274bd78acb1cabdd76b1d4', 'aluno', 256, NULL),
(91, '234209385LA039', '834872bea91e64036629ec9990c59d36', 'aluno', 266, NULL),
(93, '234109345LA036', '7acf6bade6c55992559dfe65a1c36c83', 'aluno', 268, NULL),
(103, '231209345LA037', '5c9be8dc7369c8755ff02b36dac081a3', 'aluno', 278, NULL),
(107, '234209345LA010', 'a3c871013817f170a10fa5f9a71c2575', 'aluno', 282, NULL),
(110, '234459827LD031', 'dd84fadaeef953b8ed82b727d2c6cfc2', 'aluno', 285, NULL),
(111, '234459827LD039', '9c0d6a8a5c8d910b068f4706ecd8c162', 'aluno', 286, NULL),
(112, '234459827LD034', '57f891fae333d10ce419d76b3c522e1a', 'aluno', 287, NULL),
(113, '234459827LD035', 'c26dfd7b949fcc05abd9da217430f1ab', 'aluno', 288, NULL),
(114, '234459827LD037', '82ef42643447430d4331c981d326d52b', 'aluno', 289, NULL),
(115, '234459827LD038', '22a32a8726bc35da337198949a9b9cec', 'aluno', 290, NULL),
(116, '234459827LD033', '3e17ed3d7f34aa101513d7471837bf86', 'aluno', 291, NULL),
(117, '234459827LD019', 'fada5bce2c9294dc01f2083d5f8de849', 'aluno', 292, NULL),
(118, '234452827LD032', '0becf0b750447de89e954fc8b9612e9d', 'aluno', 293, NULL),
(119, '234459827LD047', 'c0d5d175571fa100b09d55c16f4d0029', 'aluno', 294, NULL),
(120, '234459827LD011', '529714b8b50de95ea1a4a6dace55aa3f', 'aluno', 295, NULL),
(123, '234459827LD030', '869b62b7f4ba281d487d40e916dd473a', 'aluno', 298, NULL),
(125, '234459827LD023', '1e8384df2f960ed9ea480c99603190d3', 'aluno', 300, NULL),
(126, '', '40a32f00ed095c0849251537d87ef330', 'aluno', 301, NULL),
(127, '234209345LA011', '182e18869050023a38bd2187b4aaffb1', 'docente', 302, NULL),
(128, '234219345LA010', '94b0d83638274bd78acb1cabdd76b1d4', 'docente', 303, NULL),
(131, '234209145LA011', '1fcfd04e2342e3aa0b09fe2f6a4b0c75', 'docente', 306, NULL),
(132, '234109345LA011', 'a1819c2598be3c0a901c07423e4c4698', 'docente', 307, NULL),
(133, '', '40a32f00ed095c0849251537d87ef330', 'docente', 308, NULL),
(134, '234209345LA019', 'f1644bbc67cc23ccd25a4ed5e6f55041', 'aluno', 309, NULL),
(135, '234209345LA018', 'e084e85794a0c094d05164b07e114c5c', 'aluno', 310, NULL),
(136, 'adminx', '52bd31eabab1b1e1b74b69200ada7998', 'funcionario', 311, NULL),
(137, '234209315LA010', '9a941235282861f77c9b084ecfc3288d', 'aluno', 312, NULL),
(138, '', '40a32f00ed095c0849251537d87ef330', 'docente', 313, NULL),
(140, '', '40a32f00ed095c0849251537d87ef330', 'aluno', 315, NULL),
(141, '234209345LA111', 'e9e21f5631fb6c84f05fa040b9e6ac74', 'aluno', 316, NULL),
(142, '234209345LA123', '5240523bdf31c6a3f7d2e4dfafcc24f1', 'aluno', 317, NULL),
(143, '', '40a32f00ed095c0849251537d87ef330', 'aluno', 318, NULL),
(144, '234209341LA011', '5c5262e2a612ee66cc5c33b612f39935', 'aluno', 319, NULL),
(145, '234109345LA018', 'af2cd969ce49d5934cc587a0dc98106b', 'aluno', 320, NULL),
(146, '234109345LA012', '86169642ee44c805a57ce186bf4a585c', 'aluno', 321, NULL),
(147, '234209345LA014', 'f0ceb6f68e8041336a84a2fbff9faecd', 'aluno', 322, NULL),
(148, '', '40a32f00ed095c0849251537d87ef330', 'aluno', 323, NULL),
(149, '', '40a32f00ed095c0849251537d87ef330', 'aluno', 324, NULL),
(150, '', '40a32f00ed095c0849251537d87ef330', 'aluno', 325, NULL),
(151, '231209345LA011', 'ccb924decbc1f02e0e145a797d932e0f', 'aluno', 326, NULL),
(152, '', '40a32f00ed095c0849251537d87ef330', 'aluno', 327, NULL),
(153, '2311111', '40a32f00ed095c0849251537d87ef330', 'aluno', 328, NULL),
(155, '', '40a32f00ed095c0849251537d87ef330', 'aluno', 330, NULL),
(156, '', '40a32f00ed095c0849251537d87ef330', 'aluno', 331, NULL),
(157, '234119345LA032', '206f5c4bbdc48a4f0345eb719889da0a', 'aluno', 332, NULL),
(158, '3836464', 'e00f44b18439fc7f0dfb105a95d43e08', 'aluno', 333, NULL),
(159, '231119345LA032', 'cb3057568207a70999a17b7ac775791e', 'aluno', 334, NULL),
(160, '', '40a32f00ed095c0849251537d87ef330', 'aluno', 335, NULL),
(162, '', '40a32f00ed095c0849251537d87ef330', 'docente', 337, NULL),
(164, '234209345LB111', '422fa87f82c8e41583812fbc8ae40212', 'docente', 339, NULL),
(165, '234209345LC111', 'd0c862d355c904ee41f01d59bebfca00', 'aluno', 340, NULL),
(166, '2311112', '61653580645a01c0e52fa06485dca8ed', 'aluno', 341, NULL),
(167, '234201145LA010', 'ba5fbf54fffd457905e174c7d2724271', 'aluno', 342, NULL),
(168, '135209345LA011', '3c53ff887524f9e5de8dffd4ab78a3dc', 'aluno', 343, NULL),
(170, '234809345LA032', '9ae60928834fb6a27eefcb9aada316cf', 'aluno', 346, NULL),
(172, '234209311LA011', 'c2707d1cd78117620b3c7bfb32432a9e', 'aluno', 348, NULL),
(173, '211119345LA011', 'dbdd7671b73f6d4c981d8174ecb85bd0', 'aluno', 349, NULL),
(175, '211119345LA010', '69f12c371893768bd72129263656f517', 'aluno', 351, NULL),
(176, '231109145LA011', 'd9f94bb7832b4527f33d05a5487ebd9f', 'aluno', 352, NULL),
(177, '2335333', 'a7d1533685a1ead08b5511d2d0c48c33', 'aluno', 353, NULL),
(178, '234229745LA010', '8fded6adc0ec65c12c6601f72b7bed60', 'aluno', 354, NULL),
(179, '231101115LA011', 'a0f7059d77f90a411186f56660617134', 'aluno', 355, NULL),
(180, '2227773', '628380849f351e21276b6013a6c68921', 'aluno', 356, NULL),
(181, '234202345LA011', '0aeb7e3e0a3f973f832920eddb42e1fd', 'aluno', 357, NULL),
(183, '231209345LA010', '2c0b96a24e670ed2f7859a6f7d7f8ef7', 'aluno', 359, NULL),
(184, '111119345LA032', 'f1f3488e962fd497469e40bb5e0cd994', 'docente', 360, NULL),
(185, '234201345LA011', '06ab1d25cdf6bdae52109763e1a69773', 'docente', 361, NULL),
(186, 'funcionario', '40a32f00ed095c0849251537d87ef330', 'funcionario', 362, NULL),
(187, 'java', 'be6c8938f0c519da06c2f9809c001c7e', 'funcionario', 363, NULL),
(188, '934209345LA010', '2d2d7294a227d2b32c154e1496d1d15c', 'aluno', 364, NULL),
(189, '2334b38', '480a6954773150c859b00b177b24d41a', 'aluno', 365, NULL),
(190, '234809345LA010', '3256f219ef55feadbc9bea85657dcb0e', 'aluno', 366, NULL),
(191, '2111333', '51eac30828f66f927d317ab821a4402b', 'aluno', 367, NULL);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_aluno_pessoa_idx` (`pessoa_id`);

--
-- Índices de tabela `categoria_cientifica`
--
ALTER TABLE `categoria_cientifica`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categoria_docente`
--
ALTER TABLE `categoria_docente`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `curso`
--
ALTER TABLE `curso`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nome_UNIQUE` (`nome`);

--
-- Índices de tabela `docente`
--
ALTER TABLE `docente`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_docente_pessoa1_idx` (`pessoa_id`);

--
-- Índices de tabela `docentmodulo`
--
ALTER TABLE `docentmodulo`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_docentmodulo_modulo1_idx` (`modulo_id`), ADD KEY `fk_docentmodulo_docente1_idx` (`docente_id`);

--
-- Índices de tabela `funcao`
--
ALTER TABLE `funcao`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `graduacao`
--
ALTER TABLE `graduacao`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `log`
--
ALTER TABLE `log`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_log_usuario1_idx` (`usuario_id`);

--
-- Índices de tabela `materia`
--
ALTER TABLE `materia`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nome_UNIQUE` (`nome`), ADD KEY `fk_materia_curso1_idx` (`curso_id`), ADD KEY `fk_materia_modulo1_idx` (`modulo_id`);

--
-- Índices de tabela `matricula`
--
ALTER TABLE `matricula`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_matricula_aluno1_idx` (`aluno_id`);

--
-- Índices de tabela `matricula_modulo`
--
ALTER TABLE `matricula_modulo`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_matricula_modulo_matricula1_idx` (`matricula_id`), ADD KEY `fk_matricula_modulo_modulo1_idx` (`modulo_id`);

--
-- Índices de tabela `modulo`
--
ALTER TABLE `modulo`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nome_UNIQUE` (`nome`), ADD KEY `fk_modulo_curso1_idx` (`curso_id`);

--
-- Índices de tabela `nota`
--
ALTER TABLE `nota`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_nota_aluno1_idx` (`aluno_id`), ADD KEY `fk_nota_modulo1_idx` (`modulo_id`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `bi_UNIQUE` (`bi`), ADD UNIQUE KEY `telefone_UNIQUE` (`telefone`), ADD UNIQUE KEY `unique_index` (`bi`,`documento`,`email`), ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Índices de tabela `programa`
--
ALTER TABLE `programa`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_programa_modulo1_idx` (`modulo_id`), ADD KEY `fk_programa_docente1_idx` (`docente_id`), ADD KEY `fk_programa_curso1_idx` (`curso_id`);

--
-- Índices de tabela `unidade_organica`
--
ALTER TABLE `unidade_organica`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `universidade`
--
ALTER TABLE `universidade`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_usuario_pessoa1_idx` (`pessoa_id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=134;
--
-- AUTO_INCREMENT de tabela `categoria_cientifica`
--
ALTER TABLE `categoria_cientifica`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de tabela `categoria_docente`
--
ALTER TABLE `categoria_docente`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de tabela `docente`
--
ALTER TABLE `docente`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de tabela `docentmodulo`
--
ALTER TABLE `docentmodulo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de tabela `funcao`
--
ALTER TABLE `funcao`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de tabela `graduacao`
--
ALTER TABLE `graduacao`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de tabela `log`
--
ALTER TABLE `log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=868;
--
-- AUTO_INCREMENT de tabela `materia`
--
ALTER TABLE `materia`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de tabela `matricula`
--
ALTER TABLE `matricula`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT de tabela `matricula_modulo`
--
ALTER TABLE `matricula_modulo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT de tabela `modulo`
--
ALTER TABLE `modulo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de tabela `nota`
--
ALTER TABLE `nota`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=368;
--
-- AUTO_INCREMENT de tabela `programa`
--
ALTER TABLE `programa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de tabela `unidade_organica`
--
ALTER TABLE `unidade_organica`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `universidade`
--
ALTER TABLE `universidade`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=192;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `aluno`
--
ALTER TABLE `aluno`
ADD CONSTRAINT `fk_aluno_pessoa` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `docente`
--
ALTER TABLE `docente`
ADD CONSTRAINT `fk_docente_pessoa1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `docentmodulo`
--
ALTER TABLE `docentmodulo`
ADD CONSTRAINT `fk_docentmodulo_docente1` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_docentmodulo_modulo1` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `log`
--
ALTER TABLE `log`
ADD CONSTRAINT `fk_log_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `matricula`
--
ALTER TABLE `matricula`
ADD CONSTRAINT `fk_matricula_aluno1` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `matricula_modulo`
--
ALTER TABLE `matricula_modulo`
ADD CONSTRAINT `fk_matricula_modulo_matricula1` FOREIGN KEY (`matricula_id`) REFERENCES `matricula` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_matricula_modulo_modulo1` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `modulo`
--
ALTER TABLE `modulo`
ADD CONSTRAINT `fk_modulo_curso1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `nota`
--
ALTER TABLE `nota`
ADD CONSTRAINT `fk_nota_aluno1` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_nota_modulo1` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `programa`
--
ALTER TABLE `programa`
ADD CONSTRAINT `fk_programa_curso1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_programa_docente1` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_programa_modulo1` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
ADD CONSTRAINT `fk_usuario_pessoa1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
