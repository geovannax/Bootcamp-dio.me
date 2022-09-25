-- MySQL Script generated by MySQL Workbench
-- Sat Sep 24 23:33:27 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clientes` (
  `id_clientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `cpf_cnpj` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_clientes`),
  UNIQUE INDEX `CPF_UNIQUE` (`cpf_cnpj` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`endereco` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(10) NOT NULL,
  `numero` VARCHAR(10) NOT NULL COMMENT 'Caso seja sem número, preencher SN \n',
  `complemento` VARCHAR(45) NULL,
  `referencia` VARCHAR(45) NULL,
  `clientes_id_clientes` INT NOT NULL,
  PRIMARY KEY (`id_endereco`),
  INDEX `fk_endereco_clientes_idx` (`clientes_id_clientes` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_clientes`
    FOREIGN KEY (`clientes_id_clientes`)
    REFERENCES `mydb`.`clientes` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefone` (
  `id_telefone` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(20) NOT NULL,
  `endereco_id_endereco` INT NOT NULL,
  PRIMARY KEY (`id_telefone`),
  INDEX `fk_telefone_endereco1_idx` (`endereco_id_endereco` ASC) VISIBLE,
  CONSTRAINT `fk_telefone_endereco1`
    FOREIGN KEY (`endereco_id_endereco`)
    REFERENCES `mydb`.`endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`combustivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`combustivel` (
  `id_combustivel` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_combustivel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`carro` (
  `id_carro` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `ano` VARCHAR(45) NOT NULL,
  `endereco_id_endereco` INT NOT NULL,
  `combustivel_id_combustivel` INT NOT NULL,
  PRIMARY KEY (`id_carro`),
  UNIQUE INDEX `placa_UNIQUE` (`placa` ASC) VISIBLE,
  INDEX `fk_carro_endereco1_idx` (`endereco_id_endereco` ASC) VISIBLE,
  INDEX `fk_carro_combustivel1_idx` (`combustivel_id_combustivel` ASC) VISIBLE,
  CONSTRAINT `fk_carro_endereco1`
    FOREIGN KEY (`endereco_id_endereco`)
    REFERENCES `mydb`.`endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carro_combustivel1`
    FOREIGN KEY (`combustivel_id_combustivel`)
    REFERENCES `mydb`.`combustivel` (`id_combustivel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`status_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`status_servico` (
  `id_status_servico` INT NOT NULL AUTO_INCREMENT,
  `situacao` VARCHAR(45) NULL,
  PRIMARY KEY (`id_status_servico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`servicos` (
  `id_servicos` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `status_servico_id_status_servico` INT NOT NULL,
  PRIMARY KEY (`id_servicos`),
  INDEX `fk_servicos_status_servico1_idx` (`status_servico_id_status_servico` ASC) VISIBLE,
  CONSTRAINT `fk_servicos_status_servico1`
    FOREIGN KEY (`status_servico_id_status_servico`)
    REFERENCES `mydb`.`status_servico` (`id_status_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`status_os`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`status_os` (
  `id_status_os` INT NOT NULL AUTO_INCREMENT,
  `situacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_status_os`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`equipe` (
  `id_equipe` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_equipe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ordem_de_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ordem_de_servico` (
  `id_ordem_de_servico` INT NOT NULL,
  `data_emissao` DATE NOT NULL,
  `data_entrega` DATE NOT NULL,
  `valor_servico` FLOAT NOT NULL,
  `carro_id_carro` INT NOT NULL,
  `servicos_id_servicos` INT NOT NULL,
  `status_os_id_status_os` INT NOT NULL,
  `equipe_id_equipe` INT NOT NULL,
  PRIMARY KEY (`id_ordem_de_servico`),
  INDEX `fk_ordem_de_servico_carro1_idx` (`carro_id_carro` ASC) VISIBLE,
  INDEX `fk_ordem_de_servico_servicos1_idx` (`servicos_id_servicos` ASC) VISIBLE,
  INDEX `fk_ordem_de_servico_status_os1_idx` (`status_os_id_status_os` ASC) VISIBLE,
  INDEX `fk_ordem_de_servico_equipe1_idx` (`equipe_id_equipe` ASC) VISIBLE,
  CONSTRAINT `fk_ordem_de_servico_carro1`
    FOREIGN KEY (`carro_id_carro`)
    REFERENCES `mydb`.`carro` (`id_carro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_de_servico_servicos1`
    FOREIGN KEY (`servicos_id_servicos`)
    REFERENCES `mydb`.`servicos` (`id_servicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_de_servico_status_os1`
    FOREIGN KEY (`status_os_id_status_os`)
    REFERENCES `mydb`.`status_os` (`id_status_os`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_de_servico_equipe1`
    FOREIGN KEY (`equipe_id_equipe`)
    REFERENCES `mydb`.`equipe` (`id_equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mecanico` (
  `id_mecanico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  `cep` VARCHAR(10) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `equipe_id_equipe` INT NOT NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_mecanico`),
  UNIQUE INDEX `CPF_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `fk_mecanico_equipe1_idx` (`equipe_id_equipe` ASC) VISIBLE,
  CONSTRAINT `fk_mecanico_equipe1`
    FOREIGN KEY (`equipe_id_equipe`)
    REFERENCES `mydb`.`equipe` (`id_equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mao_de_obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mao_de_obra` (
  `id_mao_de_obra` INT NOT NULL AUTO_INCREMENT,
  `nome_do_servico` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  `ordem_de_servico_id_ordem_de_servico` INT NOT NULL,
  PRIMARY KEY (`id_mao_de_obra`),
  INDEX `fk_mao_de_obra_ordem_de_servico1_idx` (`ordem_de_servico_id_ordem_de_servico` ASC) VISIBLE,
  CONSTRAINT `fk_mao_de_obra_ordem_de_servico1`
    FOREIGN KEY (`ordem_de_servico_id_ordem_de_servico`)
    REFERENCES `mydb`.`ordem_de_servico` (`id_ordem_de_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pecas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pecas` (
  `id_pecas` INT NOT NULL,
  `valor` FLOAT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `ordem_de_servico_id_ordem_de_servico` INT NOT NULL,
  PRIMARY KEY (`id_pecas`),
  INDEX `fk_pecas_ordem_de_servico1_idx` (`ordem_de_servico_id_ordem_de_servico` ASC) VISIBLE,
  CONSTRAINT `fk_pecas_ordem_de_servico1`
    FOREIGN KEY (`ordem_de_servico_id_ordem_de_servico`)
    REFERENCES `mydb`.`ordem_de_servico` (`id_ordem_de_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;