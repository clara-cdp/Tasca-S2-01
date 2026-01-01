-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PizzaPlanet
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PizzaPlanet
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PizzaPlanet` DEFAULT CHARACTER SET utf8 ;
USE `PizzaPlanet` ;

-- -----------------------------------------------------
-- Table `PizzaPlanet`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`CUSTOMER` (
  `idCUSTOMER` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `surname` VARCHAR(20) NOT NULL,
  `phone_number` VARCHAR(15) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(5) NOT NULL,
  `city` VARCHAR(15) NOT NULL,
  `province` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`idCUSTOMER`),
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`STORE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`STORE` (
  `idSTORE` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(5) NOT NULL,
  `city` VARCHAR(15) NOT NULL,
  `province` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`idSTORE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`EMPLOYEE` (
  `idEMPLOYEE` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `surname` VARCHAR(20) NOT NULL,
  `NIF` VARCHAR(9) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  `STORE_idSTORE` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idEMPLOYEE`),
  INDEX `fk_EMPLOYEE_STORE1_idx` (`STORE_idSTORE` ASC) ,
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC) ,
  CONSTRAINT `fk_EMPLOYEE_STORE1`
    FOREIGN KEY (`STORE_idSTORE`)
    REFERENCES `PizzaPlanet`.`STORE` (`idSTORE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`DRIVER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`DRIVER` (
  `EMPLOYEE_idEMPLOYEE` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`EMPLOYEE_idEMPLOYEE`),
  CONSTRAINT `fk_DRIVER_EMPLOYEE1`
    FOREIGN KEY (`EMPLOYEE_idEMPLOYEE`)
    REFERENCES `PizzaPlanet`.`EMPLOYEE` (`idEMPLOYEE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`ORDER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`ORDER` (
  `idORDER` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_type` ENUM('delivery', 'pickup') NOT NULL,
  `date_time` DATETIME NOT NULL,
  `CUSTOMER_idCUSTOMER` INT UNSIGNED NOT NULL,
  `STORE_idSTORE` INT UNSIGNED NOT NULL,
  `DRIVER_EMPLOYEE_idEMPLOYEE` INT UNSIGNED NULL,
  PRIMARY KEY (`idORDER`),
  INDEX `fk_ORDER_CUSTOMER1_idx` (`CUSTOMER_idCUSTOMER` ASC) ,
  INDEX `fk_ORDER_STORE1_idx` (`STORE_idSTORE` ASC) ,
  INDEX `fk_ORDER_DRIVER1_idx` (`DRIVER_EMPLOYEE_idEMPLOYEE` ASC) ,
  CONSTRAINT `fk_ORDER_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_idCUSTOMER`)
    REFERENCES `PizzaPlanet`.`CUSTOMER` (`idCUSTOMER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDER_STORE1`
    FOREIGN KEY (`STORE_idSTORE`)
    REFERENCES `PizzaPlanet`.`STORE` (`idSTORE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDER_DRIVER1`
    FOREIGN KEY (`DRIVER_EMPLOYEE_idEMPLOYEE`)
    REFERENCES `PizzaPlanet`.`DRIVER` (`EMPLOYEE_idEMPLOYEE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`PIZZA_TYPE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`PIZZA_TYPE` (
  `idPIZZA_TYPE` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPIZZA_TYPE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`PRODUCT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`PRODUCT` (
  `idPRODUCT` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `image_url` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`idPRODUCT`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`PIZZA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`PIZZA` (
  `PIZZA_TYPE_idPIZZA_TYPE` INT UNSIGNED NOT NULL,
  `PRODUCT_idPRODUCT` INT UNSIGNED NOT NULL,
  INDEX `fk_PIZZA_PIZZA_TYPE1_idx` (`PIZZA_TYPE_idPIZZA_TYPE` ASC) ,
  PRIMARY KEY (`PIZZA_TYPE_idPIZZA_TYPE`, `PRODUCT_idPRODUCT`),
  INDEX `fk_PIZZA_PRODUCT1_idx` (`PRODUCT_idPRODUCT` ASC) ,
  CONSTRAINT `fk_PIZZA_PIZZA_TYPE1`
    FOREIGN KEY (`PIZZA_TYPE_idPIZZA_TYPE`)
    REFERENCES `PizzaPlanet`.`PIZZA_TYPE` (`idPIZZA_TYPE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PIZZA_PRODUCT1`
    FOREIGN KEY (`PRODUCT_idPRODUCT`)
    REFERENCES `PizzaPlanet`.`PRODUCT` (`idPRODUCT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`BURGER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`BURGER` (
  `PRODUCT_idPRODUCT` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`PRODUCT_idPRODUCT`),
  CONSTRAINT `fk_BURGUER_PRODUCT1`
    FOREIGN KEY (`PRODUCT_idPRODUCT`)
    REFERENCES `PizzaPlanet`.`PRODUCT` (`idPRODUCT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`DRINK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`DRINK` (
  `PRODUCT_idPRODUCT` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`PRODUCT_idPRODUCT`),
  CONSTRAINT `fk_DRINK_PRODUCT1`
    FOREIGN KEY (`PRODUCT_idPRODUCT`)
    REFERENCES `PizzaPlanet`.`PRODUCT` (`idPRODUCT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`CHEF`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`CHEF` (
  `EMPLOYEE_idEMPLOYEE` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`EMPLOYEE_idEMPLOYEE`),
  CONSTRAINT `fk_CHEF_EMPLOYEE1`
    FOREIGN KEY (`EMPLOYEE_idEMPLOYEE`)
    REFERENCES `PizzaPlanet`.`EMPLOYEE` (`idEMPLOYEE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`ORDER_DETAILS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`ORDER_DETAILS` (
  `product_quanity` INT NOT NULL,
  `total_price` DECIMAL(6,2) NOT NULL,
  `PRODUCT_idPRODUCT` INT UNSIGNED NOT NULL,
  `ORDER_idORDER` INT UNSIGNED NOT NULL,
  INDEX `fk_ORDER_DETAILS_PRODUCT1_idx` (`PRODUCT_idPRODUCT` ASC) ,
  PRIMARY KEY (`ORDER_idORDER`, `PRODUCT_idPRODUCT`),
  CONSTRAINT `fk_ORDER_DETAILS_PRODUCT1`
    FOREIGN KEY (`PRODUCT_idPRODUCT`)
    REFERENCES `PizzaPlanet`.`PRODUCT` (`idPRODUCT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDER_DETAILS_ORDER1`
    FOREIGN KEY (`ORDER_idORDER`)
    REFERENCES `PizzaPlanet`.`ORDER` (`idORDER`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-------------------------------------------------------------------------------
-- UPDATE FOR PRICES
-------------------------------------------------------------------------------
-- MySQL Workbench Synchronization
-- Generated: 2026-01-01 12:12
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Clara

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `pizzaplanet`.`ORDER` 
ADD COLUMN `order_total_amount` DECIMAL(6,2) NOT NULL AFTER `date_time`;

ALTER TABLE `pizzaplanet`.`ORDER_DETAILS` 
ADD COLUMN `line_total` DECIMAL(6,2) NOT NULL AFTER `unit_price`,
CHANGE COLUMN `total_price` `unit_price` DECIMAL(6,2) NOT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`PRODUCT_idPRODUCT`, `ORDER_idORDER`);
;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;