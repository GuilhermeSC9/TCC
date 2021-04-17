-- MySQL Script generated by MySQL Workbench
-- Tue Apr 13 12:11:19 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tcc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tcc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tcc` DEFAULT CHARACTER SET utf8 ;
USE `tcc` ;

-- -----------------------------------------------------
-- Table `tcc`.`Tipo_usúario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Tipo_usúario` (
  `idTipo_usúario` INT NOT NULL AUTO_INCREMENT,
  `CLIENTE` VARCHAR(60) NOT NULL,
  `ADM` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idTipo_usúario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Usúario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Usúario` (
  `id_Usúario` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(60) NOT NULL,
  `E-MAIL` VARCHAR(60) NOT NULL,
  `SENHA` VARCHAR(255) NOT NULL,
  `Tipo_usúario_idTipo_usúario` INT NOT NULL,
  PRIMARY KEY (`id_Usúario`),
  INDEX `fk_Usúario_Tipo_usúario1_idx` (`Tipo_usúario_idTipo_usúario` ASC),
  CONSTRAINT `fk_Usúario_Tipo_usúario1`
    FOREIGN KEY (`Tipo_usúario_idTipo_usúario`)
    REFERENCES `tcc`.`Tipo_usúario` (`idTipo_usúario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Produto` (
  `id_Produto` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(60) NOT NULL,
  `VALOR` REAL NOT NULL,
  `PESO` REAL NOT NULL,
  `VALIDADE` DATE NOT NULL,
  `DESCRIÇÃO` LONGTEXT NULL,
  PRIMARY KEY (`id_Produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Pedido` (
  `id_Pedido` INT NOT NULL,
  `HORA_PEDIDO` DATETIME NOT NULL,
  `QNTD_ITENS` INT NOT NULL AUTO_INCREMENT,
  `Usúario_id_Usúario` INT NOT NULL,
  PRIMARY KEY (`id_Pedido`),
  INDEX `fk_Pedido_Usúario1_idx` (`Usúario_id_Usúario` ASC),
  CONSTRAINT `fk_Pedido_Usúario1`
    FOREIGN KEY (`Usúario_id_Usúario`)
    REFERENCES `tcc`.`Usúario` (`id_Usúario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Tipo_Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Tipo_Pagamento` (
  `id_Tipo_Pagamento` INT NOT NULL AUTO_INCREMENT,
  `À VISTA` INT NOT NULL,
  `À PRAZO` INT NOT NULL,
  PRIMARY KEY (`id_Tipo_Pagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Forma_Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Forma_Pagamento` (
  `id_Forma_Pagamento` INT NOT NULL AUTO_INCREMENT,
  `DINHEIRO` REAL NOT NULL,
  `CARTÃO_CRÉDITO` REAL NOT NULL,
  `CARTÃO_DÉBITO` REAL NOT NULL,
  `BOLETO` REAL NOT NULL,
  `Tipo_Pagamento_id_Tipo_Pagamento` INT NOT NULL,
  PRIMARY KEY (`id_Forma_Pagamento`),
  INDEX `fk_Forma_Pagamento_Tipo_Pagamento1_idx` (`Tipo_Pagamento_id_Tipo_Pagamento` ASC),
  CONSTRAINT `fk_Forma_Pagamento_Tipo_Pagamento1`
    FOREIGN KEY (`Tipo_Pagamento_id_Tipo_Pagamento`)
    REFERENCES `tcc`.`Tipo_Pagamento` (`id_Tipo_Pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Pedido_has_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Pedido_has_Produto` (
  `Pedido_id_Pedido` INT NOT NULL,
  `Produto_id_Produto` INT NOT NULL,
  PRIMARY KEY (`Pedido_id_Pedido`, `Produto_id_Produto`),
  INDEX `fk_Pedido_has_Produto_Produto1_idx` (`Produto_id_Produto` ASC),
  INDEX `fk_Pedido_has_Produto_Pedido1_idx` (`Pedido_id_Pedido` ASC),
  CONSTRAINT `fk_Pedido_has_Produto_Pedido1`
    FOREIGN KEY (`Pedido_id_Pedido`)
    REFERENCES `tcc`.`Pedido` (`id_Pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_has_Produto_Produto1`
    FOREIGN KEY (`Produto_id_Produto`)
    REFERENCES `tcc`.`Produto` (`id_Produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Itens_pedidos_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Itens_pedidos_copy1` (
  `idItens_pedidos` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idItens_pedidos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Pedido_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Pedido_copy1` (
  `id_Pedido` INT NOT NULL AUTO_INCREMENT,
  `HORA_PEDIDO` DATETIME NOT NULL,
  `QNTD_ITENS` INT NOT NULL,
  `ID_CLIENTE` INT NOT NULL,
  `Itens_pedidos_copy1_idItens_pedidos` INT NOT NULL,
  PRIMARY KEY (`id_Pedido`),
  INDEX `fk_Pedido_copy1_Itens_pedidos_copy11_idx` (`Itens_pedidos_copy1_idItens_pedidos` ASC),
  CONSTRAINT `fk_Pedido_copy1_Itens_pedidos_copy11`
    FOREIGN KEY (`Itens_pedidos_copy1_idItens_pedidos`)
    REFERENCES `tcc`.`Itens_pedidos_copy1` (`idItens_pedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Pedido_copy2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Pedido_copy2` (
  `id_Pedido` INT NOT NULL AUTO_INCREMENT,
  `HORA_PEDIDO` DATETIME NOT NULL,
  `QNTD_ITENS` INT NOT NULL,
  `ID_CLIENTE` INT NOT NULL,
  PRIMARY KEY (`id_Pedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Produto_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Produto_copy1` (
  `id_Produto` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(60) NOT NULL,
  `VALOR` REAL NOT NULL,
  `PESO` REAL NOT NULL,
  `VALIDADE` DATE NOT NULL,
  `DESCRIÇÃO` LONGTEXT NULL,
  `Itens_pedidos_copy1_idItens_pedidos` INT NOT NULL,
  PRIMARY KEY (`id_Produto`),
  INDEX `fk_Produto_copy1_Itens_pedidos_copy11_idx` (`Itens_pedidos_copy1_idItens_pedidos` ASC),
  CONSTRAINT `fk_Produto_copy1_Itens_pedidos_copy11`
    FOREIGN KEY (`Itens_pedidos_copy1_idItens_pedidos`)
    REFERENCES `tcc`.`Itens_pedidos_copy1` (`idItens_pedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Produto_copy1_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Produto_copy1_copy1` (
  `id_Produto` INT NOT NULL AUTO_INCREMENT,
  `NOME` VARCHAR(60) NOT NULL,
  `VALOR` REAL NOT NULL,
  `PESO` REAL NOT NULL,
  `VALIDADE` DATE NOT NULL,
  `DESCRIÇÃO` LONGTEXT NULL,
  PRIMARY KEY (`id_Produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Pedido_copy1_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Pedido_copy1_copy1` (
  `id_Pedido` INT NOT NULL AUTO_INCREMENT,
  `HORA_PEDIDO` DATETIME NOT NULL,
  `QNTD_ITENS` INT NOT NULL,
  `ID_CLIENTE` INT NOT NULL,
  PRIMARY KEY (`id_Pedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Produto_copy1_copy1_has_Pedido_copy1_copy1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Produto_copy1_copy1_has_Pedido_copy1_copy1` (
  `Produto_copy1_copy1_id_Produto` INT NOT NULL,
  `Pedido_copy1_copy1_id_Pedido` INT NOT NULL,
  PRIMARY KEY (`Produto_copy1_copy1_id_Produto`, `Pedido_copy1_copy1_id_Pedido`),
  INDEX `fk_Produto_copy1_copy1_has_Pedido_copy1_copy1_Pedido_copy1__idx` (`Pedido_copy1_copy1_id_Pedido` ASC),
  INDEX `fk_Produto_copy1_copy1_has_Pedido_copy1_copy1_Produto_copy1_idx` (`Produto_copy1_copy1_id_Produto` ASC),
  CONSTRAINT `fk_Produto_copy1_copy1_has_Pedido_copy1_copy1_Produto_copy1_c1`
    FOREIGN KEY (`Produto_copy1_copy1_id_Produto`)
    REFERENCES `tcc`.`Produto_copy1_copy1` (`id_Produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_copy1_copy1_has_Pedido_copy1_copy1_Pedido_copy1_co1`
    FOREIGN KEY (`Pedido_copy1_copy1_id_Pedido`)
    REFERENCES `tcc`.`Pedido_copy1_copy1` (`id_Pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tcc`.`Itens_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`Itens_produto` (
  `Pedido_id_Pedido` INT NOT NULL,
  `Produto_id_Produto` INT NOT NULL,
  `Forma_Pagamento_id_Forma_Pagamento` INT NOT NULL,
  PRIMARY KEY (`Pedido_id_Pedido`, `Produto_id_Produto`),
  INDEX `fk_Pedido_has_Produto1_Produto1_idx` (`Produto_id_Produto` ASC),
  INDEX `fk_Pedido_has_Produto1_Pedido1_idx` (`Pedido_id_Pedido` ASC),
  INDEX `fk_Pedido_has_Produto1_Forma_Pagamento1_idx` (`Forma_Pagamento_id_Forma_Pagamento` ASC),
  CONSTRAINT `fk_Pedido_has_Produto1_Pedido1`
    FOREIGN KEY (`Pedido_id_Pedido`)
    REFERENCES `tcc`.`Pedido` (`id_Pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_has_Produto1_Produto1`
    FOREIGN KEY (`Produto_id_Produto`)
    REFERENCES `tcc`.`Produto` (`id_Produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_has_Produto1_Forma_Pagamento1`
    FOREIGN KEY (`Forma_Pagamento_id_Forma_Pagamento`)
    REFERENCES `tcc`.`Forma_Pagamento` (`id_Forma_Pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `tcc` ;

-- -----------------------------------------------------
-- Placeholder table for view `tcc`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcc`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `tcc`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`view1`;
USE `tcc`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;