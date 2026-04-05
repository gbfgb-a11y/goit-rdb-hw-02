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
-- Table `mydb`.`Клієнти`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Клієнти` (
  `Імя` VARCHAR(45) NOT NULL,
  `Адресса` VARCHAR(45) NOT NULL,
  `ід-клієнта` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ід-клієнта`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Товари`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Товари` (
  `Назва_товару` VARCHAR(45) NOT NULL,
  `ід-товару` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ід-товару`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Деталі замовлення`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Деталі замовлення` (
  `ід-товару` INT NOT NULL,
  `кількість` INT NOT NULL,
  `ід-замовлення` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ід-замовлення`),
  CONSTRAINT `ід-товару`
    FOREIGN KEY (`ід-товару`)
    REFERENCES `mydb`.`Товари` (`ід-товару`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Замовлення`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Замовлення` (
  `ід_кліента` INT NOT NULL,
  `ід-замовлення` INT NOT NULL,
  `дата` DATETIME NOT NULL,
  PRIMARY KEY (`ід-замовлення`, `ід_кліента`),
  INDEX `ід_клієнта_idx` (`ід_кліента` ASC) VISIBLE,
  CONSTRAINT `ід_клієнта`
    FOREIGN KEY (`ід_кліента`)
    REFERENCES `mydb`.`Клієнти` (`ід-клієнта`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ід_замовлення`
    FOREIGN KEY (`ід-замовлення`)
    REFERENCES `mydb`.`Деталі замовлення` (`ід-замовлення`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
