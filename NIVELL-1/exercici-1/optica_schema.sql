-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CUL_DAMPOLLA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CUL_DAMPOLLA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CUL_DAMPOLLA` DEFAULT CHARACTER SET utf8 ;
USE `CUL_DAMPOLLA` ;

-- -----------------------------------------------------
-- Table `CUL_DAMPOLLA`.`SUPPLIER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CUL_DAMPOLLA`.`SUPPLIER` (
  `ID` INT(15) NOT NULL AUTO_INCREMENT,
  `NIF` VARCHAR(9) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(11) NOT NULL,
  `Street` VARCHAR(45) NULL,
  `Number` VARCHAR(10) NULL,
  `Postal Code` VARCHAR(5) NULL,
  `Country` VARCHAR(20) NULL,
  `Fax` VARCHAR(11) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CUL_DAMPOLLA`.`BRAND`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CUL_DAMPOLLA`.`BRAND` (
  `ID BRAND` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(25) NOT NULL,
  `SUPPLIER_ID` INT(15) NOT NULL,
  PRIMARY KEY (`ID BRAND`),
  INDEX `fk_BRAND_SUPPLIER1_idx` (`SUPPLIER_ID` ASC),
  CONSTRAINT `fk_BRAND_SUPPLIER1`
    FOREIGN KEY (`SUPPLIER_ID`)
    REFERENCES `CUL_DAMPOLLA`.`SUPPLIER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CUL_DAMPOLLA`.`GLASSES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CUL_DAMPOLLA`.`GLASSES` (
  `ID Glasses` INT(15) NOT NULL,
  `PRICE` DECIMAL(6,2) NOT NULL,
  `frame_type` ENUM('F', 'P', 'M') NOT NULL,
  `frame_colour` VARCHAR(10) NOT NULL,
  `left_graduation` DECIMAL(4,2) NOT NULL,
  `right_graduation` DECIMAL(4,2) NOT NULL,
  `left_colour_glass` VARCHAR(10) NULL,
  `right_colour_glass` VARCHAR(10) NULL,
  `BRAND_ID BRAND` INT NOT NULL,
  PRIMARY KEY (`ID Glasses`),
  INDEX `fk_GLASSES_BRAND1_idx` (`BRAND_ID BRAND` ASC) ,
  CONSTRAINT `fk_GLASSES_BRAND1`
    FOREIGN KEY (`BRAND_ID BRAND`)
    REFERENCES `CUL_DAMPOLLA`.`BRAND` (`ID BRAND`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CUL_DAMPOLLA`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CUL_DAMPOLLA`.`CLIENT` (
  `ID CLIENT` INT(10) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(11) NOT NULL,
  `Register_date` DATE NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Postal Code` VARCHAR(5) NULL,
  `SALES_ASSITANTcol` VARCHAR(45) NULL,
  `recomended_by_ID CLIENT` INT(10) NOT NULL,
  PRIMARY KEY (`ID CLIENT`),
  INDEX `fk_CLIENT_CLIENT1_idx` (`recomended_by_ID CLIENT` ASC) ,
  CONSTRAINT `fk_CLIENT_CLIENT1`
    FOREIGN KEY (`recomended_by_ID CLIENT`)
    REFERENCES `CUL_DAMPOLLA`.`CLIENT` (`ID CLIENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CUL_DAMPOLLA`.`SALES_ASSITANT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CUL_DAMPOLLA`.`SALES_ASSITANT` (
  `Employer ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Employer ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CUL_DAMPOLLA`.`SALE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CUL_DAMPOLLA`.`SALE` (
  ` ID SALE` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `GLASSES_GLASSES ID` INT(15) NOT NULL,
  `CLIENT_ID_CLIENT` INT(10) NOT NULL,
  `SALES_ASSITANT_Employer ID` INT NOT NULL,
  PRIMARY KEY (` ID SALE`),
  INDEX `fk_SALE_GLASSES1_idx` (`GLASSES_GLASSES ID` ASC),
  INDEX `fk_SALE_CLIENT1_idx` (`CLIENT_ID_CLIENT` ASC) ,
  INDEX `fk_SALE_SALES_ASSITANT1_idx` (`SALES_ASSITANT_Employer ID` ASC) ,
  CONSTRAINT `fk_SALE_GLASSES1`
    FOREIGN KEY (`GLASSES_GLASSES ID`)
    REFERENCES `CUL_DAMPOLLA`.`GLASSES` (`ID Glasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SALE_CLIENT1`
    FOREIGN KEY (`CLIENT_ID_CLIENT`)
    REFERENCES `CUL_DAMPOLLA`.`CLIENT` (`ID CLIENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SALE_SALES_ASSITANT1`
    FOREIGN KEY (`SALES_ASSITANT_Employer ID`)
    REFERENCES `CUL_DAMPOLLA`.`SALES_ASSITANT` (`Employer ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
