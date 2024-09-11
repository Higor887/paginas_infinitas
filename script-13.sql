-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_paginas_infinitas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_paginas_infinitas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_paginas_infinitas` DEFAULT CHARACTER SET utf8 ;
USE `db_paginas_infinitas` ;

-- -----------------------------------------------------
-- Table `db_paginas_infinitas`.`tb_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_paginas_infinitas`.`tb_tipo` (
  `id_tipo` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_paginas_infinitas`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_paginas_infinitas`.`tb_usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NOT NULL,
  `sobrenome` VARCHAR(20) NOT NULL,
  `email` VARCHAR(70) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  `ativo` BINARY NOT NULL DEFAULT 1,
  `id_tipo` INT NOT NULL,
  `dt_nascimento` DATE NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_tb_usuario_tb_tipo1_idx` (`id_tipo` ASC) ,
  CONSTRAINT `fk_tb_usuario_tb_tipo1`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `db_paginas_infinitas`.`tb_tipo` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_paginas_infinitas`.`tb_autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_paginas_infinitas`.`tb_autor` (
  `id_autor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_paginas_infinitas`.`tb_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_paginas_infinitas`.`tb_produtos` (
  `id_produtos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `valor` DECIMAL(3,3) NOT NULL,
  `autor` VARCHAR(45) NOT NULL,
  `descricao` TEXT NOT NULL,
  `editora` VARCHAR(45) NOT NULL,
  `id_autor` INT NOT NULL,
  `id_tipo` INT NOT NULL,
  PRIMARY KEY (`id_produtos`),
  UNIQUE INDEX `descricao_UNIQUE` (`descricao` ASC) ,
  INDEX `fk_tb_produtos_tb_autor1_idx` (`id_autor` ASC) ,
  INDEX `fk_tb_produtos_tb_tipo1_idx` (`id_tipo` ASC) ,
  CONSTRAINT `fk_tb_produtos_tb_autor1`
    FOREIGN KEY (`id_autor`)
    REFERENCES `db_paginas_infinitas`.`tb_autor` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produtos_tb_tipo1`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `db_paginas_infinitas`.`tb_tipo` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_paginas_infinitas`.`tb_movimentacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_paginas_infinitas`.`tb_movimentacao` (
  `id_movimentacao` INT NOT NULL AUTO_INCREMENT,
  `dt_movimentacao` DATETIME NOT NULL DEFAULT current_timestamp,
  `id_tipo` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_movimentacao`),
  INDEX `fk_tb_movimentacao_tb_tipo1_idx` (`id_tipo` ASC) ,
  INDEX `fk_tb_movimentacao_tb_usuario1_idx` (`id_usuario` ASC) ,
  CONSTRAINT `fk_tb_movimentacao_tb_tipo1`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `db_paginas_infinitas`.`tb_tipo` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_movimentacao_tb_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `db_paginas_infinitas`.`tb_usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_paginas_infinitas`.`fk_mov_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_paginas_infinitas`.`fk_mov_produto` (
  `quantidade` VARCHAR(45) NOT NULL,
  `id_movimentacao` INT NOT NULL,
  `id_produtos` INT NOT NULL,
  INDEX `fk_fk_mov_produto_tb_movimentacao_idx` (`id_movimentacao` ASC) ,
  INDEX `fk_fk_mov_produto_tb_produtos1_idx` (`id_produtos` ASC) ,
  CONSTRAINT `fk_fk_mov_produto_tb_movimentacao`
    FOREIGN KEY (`id_movimentacao`)
    REFERENCES `db_paginas_infinitas`.`tb_movimentacao` (`id_movimentacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fk_mov_produto_tb_produtos1`
    FOREIGN KEY (`id_produtos`)
    REFERENCES `db_paginas_infinitas`.`tb_produtos` (`id_produtos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
