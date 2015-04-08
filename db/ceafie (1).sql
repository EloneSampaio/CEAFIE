SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ceafie` DEFAULT CHARACTER SET utf8 ;
USE `ceafie` ;

-- -----------------------------------------------------
-- Table `ceafie`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceafie`.`pessoa` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `genero` SET('masculino','femenino') NOT NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `imagem` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `bi` VARCHAR(45) NOT NULL,
  `documento` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 48
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ceafie`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceafie`.`aluno` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `graduacao` VARCHAR(45) NULL DEFAULT NULL,
  `universidade` VARCHAR(45) NULL DEFAULT NULL,
  `unidade_organica` VARCHAR(45) NULL DEFAULT NULL,
  `categoria_docente` VARCHAR(45) NULL DEFAULT NULL,
  `funcao` VARCHAR(45) NULL DEFAULT NULL,
  `categoria_cientifica` VARCHAR(45) NULL DEFAULT NULL,
  `pessoa_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_aluno_pessoa_idx` (`pessoa_id` ASC),
  CONSTRAINT `fk_aluno_pessoa`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `ceafie`.`pessoa` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ceafie`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceafie`.`curso` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ceafie`.`docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceafie`.`docente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `grau` VARCHAR(45) NOT NULL,
  `pessoa_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_docente_pessoa1_idx` (`pessoa_id` ASC),
  CONSTRAINT `fk_docente_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `ceafie`.`pessoa` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ceafie`.`modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceafie`.`modulo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `curso_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_modulo_curso1_idx` (`curso_id` ASC),
  CONSTRAINT `fk_modulo_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `ceafie`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ceafie`.`materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceafie`.`materia` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `data` VARCHAR(45) NOT NULL,
  `curso_id` INT(11) NOT NULL,
  `modulo_id` INT(11) NOT NULL,
  `docente_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_materia_curso1_idx` (`curso_id` ASC),
  INDEX `fk_materia_modulo1_idx` (`modulo_id` ASC),
  INDEX `fk_materia_docente1_idx` (`docente_id` ASC),
  CONSTRAINT `fk_materia_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `ceafie`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_materia_modulo1`
    FOREIGN KEY (`modulo_id`)
    REFERENCES `ceafie`.`modulo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_materia_docente1`
    FOREIGN KEY (`docente_id`)
    REFERENCES `ceafie`.`docente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ceafie`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceafie`.`matricula` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `data` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `aluno_id` INT(11) NOT NULL,
  `curso_id` INT(11) NOT NULL,
  `modulo_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `modulo_id`),
  INDEX `fk_matricula_aluno1_idx` (`aluno_id` ASC),
  INDEX `fk_matricula_curso1_idx` (`curso_id` ASC),
  INDEX `fk_matricula_modulo1_idx` (`modulo_id` ASC),
  CONSTRAINT `fk_matricula_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `ceafie`.`aluno` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `ceafie`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_modulo1`
    FOREIGN KEY (`modulo_id`)
    REFERENCES `ceafie`.`modulo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ceafie`.`nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceafie`.`nota` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nota` SET('Excelente','Suficiente','Bom','') NULL DEFAULT NULL,
  `data` VARCHAR(45) NOT NULL,
  `aluno_id` INT(11) NOT NULL,
  `modulo_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nota_aluno1_idx` (`aluno_id` ASC),
  INDEX `fk_nota_modulo1_idx` (`modulo_id` ASC),
  CONSTRAINT `fk_nota_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `ceafie`.`aluno` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_modulo1`
    FOREIGN KEY (`modulo_id`)
    REFERENCES `ceafie`.`modulo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ceafie`.`programa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceafie`.`programa` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `local` VARCHAR(45) NULL DEFAULT NULL,
  `modulo_id` INT(11) NOT NULL,
  `docente_id` INT(11) NOT NULL,
  `curso_id` INT(11) NOT NULL,
  `hora` VARCHAR(250) NULL DEFAULT NULL,
  `datafinal` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_programa_modulo1_idx` (`modulo_id` ASC),
  INDEX `fk_programa_docente1_idx` (`docente_id` ASC),
  INDEX `fk_programa_curso1_idx` (`curso_id` ASC),
  CONSTRAINT `fk_programa_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `ceafie`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_programa_docente1`
    FOREIGN KEY (`docente_id`)
    REFERENCES `ceafie`.`docente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_programa_modulo1`
    FOREIGN KEY (`modulo_id`)
    REFERENCES `ceafie`.`modulo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ceafie`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ceafie`.`usuario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `nivel` SET('administrador','aluno','docente','gestor') NOT NULL,
  `pessoa_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_pessoa1_idx` (`pessoa_id` ASC),
  CONSTRAINT `fk_usuario_pessoa1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `ceafie`.`pessoa` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
