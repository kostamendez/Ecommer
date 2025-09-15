-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecommers
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ecommers` ;

-- -----------------------------------------------------
-- Schema ecommers
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommers` DEFAULT CHARACTER SET utf8 ;
USE `ecommers` ;

-- -----------------------------------------------------
-- Table `ecommers`.`tipo_tercero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommers`.`tipo_tercero` ;

CREATE TABLE IF NOT EXISTS `ecommers`.`tipo_tercero` (
  `idtipo_tercero` INT NOT NULL,
  `denominacion` VARCHAR(60) NULL,
  `descripcion` LONGTEXT NULL,
  PRIMARY KEY (`idtipo_tercero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommers`.`tercero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommers`.`tercero` ;

CREATE TABLE IF NOT EXISTS `ecommers`.`tercero` (
  `idtercero` INT NOT NULL,
  `nombre1` VARCHAR(45) NULL,
  `nombre2` VARCHAR(45) NULL,
  `apellido1` VARCHAR(45) NULL,
  `apellido2` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `edad` INT NULL,
  `correo` VARCHAR(45) NULL,
  `fecha_nacimiento` VARCHAR(45) NULL,
  `tercerocol` VARCHAR(45) NULL,
  `tipo_tercero_idtipo_tercero` INT NOT NULL,
  PRIMARY KEY (`idtercero`))
ENGINE = InnoDB;

CREATE INDEX `fk_tercero_tipo_tercero_idx` ON `ecommers`.`tercero` (`tipo_tercero_idtipo_tercero` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ecommers`.`img`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommers`.`img` ;

CREATE TABLE IF NOT EXISTS `ecommers`.`img` (
  `idimg` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `url` VARCHAR(45) NULL,
  `imgcol` VARCHAR(45) NULL,
  PRIMARY KEY (`idimg`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommers`.`producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommers`.`producto` ;

CREATE TABLE IF NOT EXISTS `ecommers`.`producto` (
  `idproducto` INT NOT NULL,
  `nombre_producto` VARCHAR(90) NULL,
  `cantidad_minima` INT NULL,
  `cantidad_maxima` INT NULL,
  `color` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NULL,
  `material` VARCHAR(45) NULL,
  `dimenciones` VARCHAR(45) NULL,
  `img_idimg` INT NOT NULL,
  PRIMARY KEY (`idproducto`))
ENGINE = InnoDB;

CREATE INDEX `fk_producto_img1_idx` ON `ecommers`.`producto` (`img_idimg` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ecommers`.`bodega`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommers`.`bodega` ;

CREATE TABLE IF NOT EXISTS `ecommers`.`bodega` (
  `idbodega` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `bodegacol` VARCHAR(45) NULL,
  `capacidad` VARCHAR(45) NULL,
  PRIMARY KEY (`idbodega`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommers`.`tipo_movimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommers`.`tipo_movimiento` ;

CREATE TABLE IF NOT EXISTS `ecommers`.`tipo_movimiento` (
  `idtipo_movimiento` INT NOT NULL,
  `denominacion` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `tipo_movimientocol` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipo_movimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommers`.`inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommers`.`inventario` ;

CREATE TABLE IF NOT EXISTS `ecommers`.`inventario` (
  `idinventario` INT NOT NULL,
  `inventario_actual` INT NULL,
  `inventario_inicial` INT NULL,
  `unidad_medida` VARCHAR(45) NULL,
  `valor_compra` DECIMAL(20) NULL,
  `valor_venta` DECIMAL(20) NULL,
  `fecha_vencimiento` DATE NULL,
  `fecha_compra` DATE NULL,
  `unidad_compra` INT NULL,
  `inventariocol` VARCHAR(45) NULL,
  `producto_idproducto` INT NOT NULL,
  `bodega_idbodega` INT NOT NULL,
  `tipo_movimiento_idtipo_movimiento` INT NOT NULL,
  PRIMARY KEY (`idinventario`))
ENGINE = InnoDB;

CREATE INDEX `fk_inventario_producto1_idx` ON `ecommers`.`inventario` (`producto_idproducto` ASC) VISIBLE;

CREATE INDEX `fk_inventario_bodega1_idx` ON `ecommers`.`inventario` (`bodega_idbodega` ASC) VISIBLE;

CREATE INDEX `fk_inventario_tipo_movimiento1_idx` ON `ecommers`.`inventario` (`tipo_movimiento_idtipo_movimiento` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ecommers`.`cabeza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommers`.`cabeza` ;

CREATE TABLE IF NOT EXISTS `ecommers`.`cabeza` (
  `idcabeza` INT NOT NULL,
  `total` DECIMAL(20) NULL,
  `fecha_compra` DATE NULL,
  `vendedor` INT NOT NULL,
  `comprador` INT NOT NULL,
  PRIMARY KEY (`idcabeza`))
ENGINE = InnoDB;

CREATE INDEX `fk_cabeza_tercero1_idx` ON `ecommers`.`cabeza` (`vendedor` ASC) VISIBLE;

CREATE INDEX `fk_cabeza_tercero2_idx` ON `ecommers`.`cabeza` (`comprador` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ecommers`.`cuerpo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommers`.`cuerpo` ;

CREATE TABLE IF NOT EXISTS `ecommers`.`cuerpo` (
  `idcuerpo` INT NOT NULL,
  `cantidad` VARCHAR(45) NULL,
  `valorunitario` VARCHAR(45) NULL,
  `valortotal` VARCHAR(45) NULL,
  `cuerpocol` VARCHAR(45) NULL,
  `cabeza_idcabeza` INT NOT NULL,
  `inventario_idinventario` INT NOT NULL,
  PRIMARY KEY (`idcuerpo`))
ENGINE = InnoDB;

CREATE INDEX `fk_cuerpo_cabeza1_idx` ON `ecommers`.`cuerpo` (`cabeza_idcabeza` ASC) VISIBLE;

CREATE INDEX `fk_cuerpo_inventario1_idx` ON `ecommers`.`cuerpo` (`inventario_idinventario` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ecommers`.`transccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommers`.`transccion` ;

CREATE TABLE IF NOT EXISTS `ecommers`.`transccion` (
  `idtransccion` INT NOT NULL,
  `fecha` VARCHAR(45) NULL,
  `transccioncol` VARCHAR(45) NULL,
  `cabeza_idcabeza` INT NOT NULL,
  PRIMARY KEY (`idtransccion`))
ENGINE = InnoDB;

CREATE INDEX `fk_transccion_cabeza1_idx` ON `ecommers`.`transccion` (`cabeza_idcabeza` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `ecommers`.`metodo_pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommers`.`metodo_pago` ;

CREATE TABLE IF NOT EXISTS `ecommers`.`metodo_pago` (
  `idmetodo_pago` INT NOT NULL,
  `denominacion` VARCHAR(45) NULL,
  `detalle` VARCHAR(45) NULL,
  `metodo_pagocol` VARCHAR(45) NULL,
  `transccion_idtransccion` INT NOT NULL,
  PRIMARY KEY (`idmetodo_pago`))
ENGINE = InnoDB;

CREATE INDEX `fk_metodo_pago_transccion1_idx` ON `ecommers`.`metodo_pago` (`transccion_idtransccion` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
