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
DROP TABLE IF EXISTS `PizzaPlanet`.`CUSTOMER` ;

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
DROP TABLE IF EXISTS `PizzaPlanet`.`STORE` ;

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
DROP TABLE IF EXISTS `PizzaPlanet`.`EMPLOYEE` ;

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
DROP TABLE IF EXISTS `PizzaPlanet`.`DRIVER` ;

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
-- Table `PizzaPlanet`.`CHEF`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PizzaPlanet`.`CHEF` ;

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
-- Table `PizzaPlanet`.`ORDER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PizzaPlanet`.`ORDER` ;

CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`ORDER` (
  `idORDER` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_type` ENUM('delivery', 'pickup') NOT NULL,
  `date_time` DATETIME NOT NULL,
  `order_total_amount` DECIMAL(6,2) NOT NULL,
  `delivery_time` DATETIME NOT NULL,
  `CUSTOMER_idCUSTOMER` INT UNSIGNED NOT NULL,
  `STORE_idSTORE` INT UNSIGNED NOT NULL,
  `DRIVER_EMPLOYEE_idEMPLOYEE` INT UNSIGNED NULL,
  `CHEF_EMPLOYEE_idEMPLOYEE` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idORDER`, `CHEF_EMPLOYEE_idEMPLOYEE`),
  INDEX `fk_ORDER_CUSTOMER1_idx` (`CUSTOMER_idCUSTOMER` ASC) ,
  INDEX `fk_ORDER_STORE1_idx` (`STORE_idSTORE` ASC) ,
  INDEX `fk_ORDER_DRIVER1_idx` (`DRIVER_EMPLOYEE_idEMPLOYEE` ASC) ,
  INDEX `fk_ORDER_CHEF1_idx` (`CHEF_EMPLOYEE_idEMPLOYEE` ASC) ,
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
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDER_CHEF1`
    FOREIGN KEY (`CHEF_EMPLOYEE_idEMPLOYEE`)
    REFERENCES `PizzaPlanet`.`CHEF` (`EMPLOYEE_idEMPLOYEE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`PRODUCT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PizzaPlanet`.`PRODUCT` ;

CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`PRODUCT` (
  `idPRODUCT` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `image_url` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `product_type` ENUM('pizza', 'burger', 'drink') NOT NULL,
  PRIMARY KEY (`idPRODUCT`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`PIZZA_TYPE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PizzaPlanet`.`PIZZA_TYPE` ;

CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`PIZZA_TYPE` (
  `idPIZZA_TYPE` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `PRODUCT_idPRODUCT` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idPIZZA_TYPE`, `PRODUCT_idPRODUCT`),
  INDEX `fk_PIZZA_TYPE_PRODUCT1_idx` (`PRODUCT_idPRODUCT` ASC) ,
  CONSTRAINT `fk_PIZZA_TYPE_PRODUCT1`
    FOREIGN KEY (`PRODUCT_idPRODUCT`)
    REFERENCES `PizzaPlanet`.`PRODUCT` (`idPRODUCT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PizzaPlanet`.`ORDER_DETAILS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PizzaPlanet`.`ORDER_DETAILS` ;

CREATE TABLE IF NOT EXISTS `PizzaPlanet`.`ORDER_DETAILS` (
  `product_quanity` INT NOT NULL,
  `unit_price` DECIMAL(6,2) NOT NULL,
  `line_total` DECIMAL(6,2) NOT NULL,
  `PRODUCT_idPRODUCT` INT UNSIGNED NOT NULL,
  `ORDER_idORDER` INT UNSIGNED NOT NULL,
  INDEX `fk_ORDER_DETAILS_PRODUCT1_idx` (`PRODUCT_idPRODUCT` ASC) ,
  PRIMARY KEY (`PRODUCT_idPRODUCT`, `ORDER_idORDER`),
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

USE `PizzaPlanet`;

DELIMITER $$

USE `PizzaPlanet`$$
DROP TRIGGER IF EXISTS `PizzaPlanet`.`PIZZA_TYPE_BEFORE_INSERT` $$
USE `PizzaPlanet`$$
CREATE TRIGGER `PizzaPlanet`.`PIZZA_TYPE_BEFORE_INSERT` 
BEFORE INSERT ON `PIZZA_TYPE` 
FOR EACH ROW
BEGIN
    DECLARE v_type VARCHAR(45);

    -- Obtenim el tipus de producte de la taula pare
    SELECT product_type INTO v_type 
    FROM PRODUCT 
    WHERE idPRODUCT = NEW.PRODUCT_idPRODUCT;

    -- Validem que el producte sigui realment una pizza
    IF v_type <> 'pizza' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: No es pot assignar una categoria de pizza a un producte que no sigui de tipus pizza.';
    END IF;
END$$


USE `PizzaPlanet`$$
DROP TRIGGER IF EXISTS `PizzaPlanet`.`ORDER_DETAILS_AFTER_INSERT_1` $$
USE `PizzaPlanet`$$
CREATE DEFINER = CURRENT_USER TRIGGER `PizzaPlanet`.`ORDER_DETAILS_AFTER_INSERT_1` AFTER INSERT ON `ORDER_DETAILS` FOR EACH ROW
BEGIN
    UPDATE `ORDER`
    SET order_total_amount = (
        SELECT SUM(line_total) 
        FROM ORDER_DETAILS 
        WHERE ORDER_idORDER = NEW.ORDER_idORDER
    )
    WHERE idORDER = NEW.ORDER_idORDER;
END$$


USE `PizzaPlanet`$$
DROP TRIGGER IF EXISTS `PizzaPlanet`.`ORDER_DETAILS_BEFORE_INSERT` $$
USE `PizzaPlanet`$$
CREATE DEFINER = CURRENT_USER TRIGGER `PizzaPlanet`.`ORDER_DETAILS_BEFORE_INSERT` BEFORE INSERT ON `ORDER_DETAILS` FOR EACH ROW
BEGIN
SET NEW.line_total = NEW.product_quanity * NEW.unit_price;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
