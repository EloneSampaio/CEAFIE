-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 31/01/2015 às 16h46min
-- Versão do Servidor: 5.5.16
-- Versão do PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `db_ceafie`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tabela_aluno`
--

CREATE TABLE IF NOT EXISTS `tabela_aluno` (
  `id_aluno` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nome_aluno` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `genero` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nacionalidade` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telefone` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `graduacao` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `universidade` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `unidade_organica` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `categoria_docente` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `funcao` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `categoria_cientifica` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_aluno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tabela_aluno`
--

INSERT INTO `tabela_aluno` (`id_aluno`, `nome_aluno`, `genero`, `nacionalidade`, `telefone`, `email`, `graduacao`, `universidade`, `unidade_organica`, `categoria_docente`, `funcao`, `categoria_cientifica`) VALUES
('000678', 'Jose Marques', 'Masculino', 'Angola', '912346578', 'jose@marques', 'CC', 'A.Neto', 'Fac. Ciências', 'Titular', 'tt', 'Investigador'),
('000777', 'Maria Paulo', 'Femenino', 'Portugal', '923567890', 'maria@hotmail.com', 'Psicologia', 'Lisboa', 'Fac. Ciências Sociais', 'Titular', 'xx', 'Investigador'),
('000u272727', 'Eduardo Coche', 'Masculino', 'Angola', '992200290', 'ewqdwqdwq', 'wefwefwe', 'ewfwefewfwe', 'efefefefe', 'Titular', 'xx', 'Investigador'),
('23', 'Faustina de Brito', 'Femenino', 'Angola', '976655', 'scwscwscwsw', 'hhwhhhhwh', 'hbhbdqhbdqhb', 'bqbdqjbdqbd', 'Titular', 'xx', 'Investigador'),
('1223444', 'Evanildo miranda', 'Masculino', 'Angola', '6373929', 'scmscsmc', 'hudqwidjq', 'csoqchqichq', 'jcndcnwqicdwqi', '0', 'tt', 'Investigador'),
('MDWKÇMDWÇMD', 'Maria Bastos', 'Femenino', 'Angola', 'NMKÇDNMKÇDKÇ', 'DKNDCMWKçdmnk', 'epfjqeifjqeifj', 'wdkinfvwpifvpiwv', 'dpiwncpndcp', 'Titular', 'tt', 'Investigador'),
('hshsjjsj', 'Joaquim Cadia Lubuato', 'Masculino', 'Angola', '924864817', 'khadhyalubuato@gmail.com', 'Filosofia', 'agostinho neto', 'Letras', 'Titular', 'tt', 'Investigador'),
('A', 'A', 'Femenino', 'Angola', 'A', 'A', 'A', 'A', 'A', 'Titular', 'tt', 'Investigador'),
('000804502LA031', 'Dário Germano', 'Masculino', 'Angola', '923097529', 'dariogermano7@hotmail.com', 'Ciência da Computação', 'Agostinho Neto', 'Faculdade de Ciência', 'Titular', '0', 'Investigador'),
('000346034LA032', 'Maria Bastos', '0', 'Angola', '923006655', 'maria@hotmail.com', 'Ciência da Computação', 'Universidade Agostinho Neto', 'Faculdade de Ciência', '0', 'Tecnica', '0'),
('000720555LA032', 'Antonieta Ramos', 'Femenino', 'Angola', '923795744', 'antonietauan@gmail.com', 'Comunicação Social', 'Agostinho Neto', 'Fac. Ciências Sociais', '0', 'Chefe de Seccao', '0'),
('0003310595UE03', 'Lídia Teuma S. D. Miala', '0', '0', '927961596', 'sanitelma@hotmail.com', 'Ciências Politicas', 'Agostinho Neto', 'Fac. Ciências Sociais', 'Nenhuma', 'Chefe de Seccao', 'Nenhuma'),
('0004321LA031', 'Reginaldo Mendes', 'Masculino', '0', '924664263', 'reginaldo@hotmail.com', 'Licenciado', 'Agostinho Neto', 'Faculdade de Ciência', '0', 'Tecnica', 'Investigador'),
('00042562LA031', 'Neusa Katya', '0', 'Angola', '986652436', 'neusa@hotmail.com', 'licenciada', 'UNAM', 'Fac. Ciências', 'Associado', 'Tecnica', 'Investigador'),
('0092098LA039', 'americo abilio', 'Masculino', 'Angola', '923367819', 'americo.abilio@mirex.gov.ao', 'Eng. Informatica', 'unisan', 'unisan', 'Assistente', 'Chefe de Seccao', 'Investigador'),
('0008765la09a', 'Jose Dembo', 'Femenino', 'Angola', '923097654', 'josedembo@hotmail.com', 'computacao', 'Agostinho Neto', 'Fac. Ciências', 'Nenhuma', 'chefe de Departamento', 'Investigador'),
('0004593la021', 'Elone Sampaio', '0', 'Angola', '923992365646', 'elonesampaio@hotmail.com', 'informatica', 'oscar ribas', 'Fac. Ciências', 'Assistente', 'Chefe de Seccao', 'Investigador');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
