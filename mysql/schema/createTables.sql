-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema backtests
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema backtests
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `backtests` DEFAULT CHARACTER SET utf8 ;
USE `backtests` ;

-- -----------------------------------------------------
-- Table `backtests`.`strategies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backtests`.`strategies` (
  `strategy_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`strategy_id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `backtests`.`assets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backtests`.`assets` (
  `asset_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`asset_id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `backtests`.`currencies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backtests`.`currencies` (
  `currency_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`currency_id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `backtests`.`runs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backtests`.`runs` (
  `run_id` INT NOT NULL AUTO_INCREMENT,
  `strategy_id` INT NOT NULL,
  `asset_id` INT NOT NULL,
  `currency_id` INT NOT NULL,
  `start_time` DATETIME NOT NULL,
  `end_time` DATETIME NOT NULL,
  PRIMARY KEY (`run_id`),
  INDEX `fk_row_1_idx` (`strategy_id` ASC),
  INDEX `fk_runs_2_idx` (`asset_id` ASC),
  INDEX `fk_runs_3_idx` (`currency_id` ASC),
  CONSTRAINT `fk_runs_1`
    FOREIGN KEY (`strategy_id`)
    REFERENCES `backtests`.`strategies` (`strategy_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_runs_2`
    FOREIGN KEY (`asset_id`)
    REFERENCES `backtests`.`assets` (`asset_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_runs_3`
    FOREIGN KEY (`currency_id`)
    REFERENCES `backtests`.`currencies` (`currency_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `backtests`.`trade_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backtests`.`trade_types` (
  `trade_type_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`trade_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `backtests`.`trades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backtests`.`trades` (
  `trade_id` INT NOT NULL AUTO_INCREMENT,
  `run_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `price` FLOAT NOT NULL,
  `balance` FLOAT NOT NULL,
  `time` DATETIME NOT NULL,
  PRIMARY KEY (`trade_id`),
  INDEX `fk_trades_1_idx` (`run_id` ASC),
  INDEX `fk_trades_2_idx` (`type_id` ASC),
  CONSTRAINT `fk_trades_1`
    FOREIGN KEY (`run_id`)
    REFERENCES `backtests`.`runs` (`run_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trades_2`
    FOREIGN KEY (`type_id`)
    REFERENCES `backtests`.`trade_types` (`trade_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `backtests`.`assets_currencies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backtests`.`assets_currencies` (
  `asset_id` INT NOT NULL,
  `currency_id` INT NOT NULL,
  INDEX `fk_assets_currencies_1_idx` (`currency_id` ASC),
  INDEX `fk_assets_currencies_2_idx` (`asset_id` ASC),
  PRIMARY KEY (`asset_id`, `currency_id`),
  CONSTRAINT `fk_assets_currencies_1`
    FOREIGN KEY (`currency_id`)
    REFERENCES `backtests`.`currencies` (`currency_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assets_currencies_2`
    FOREIGN KEY (`asset_id`)
    REFERENCES `backtests`.`assets` (`asset_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `backtests`.`run_params`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backtests`.`run_params` (
  `run_id` INT NOT NULL,
  `history_size` INT NOT NULL,
  `candle_size` INT NOT NULL,
  `custom_params` JSON NULL,
  INDEX `fk_run_params_1_idx` (`run_id` ASC),
  PRIMARY KEY (`run_id`),
  CONSTRAINT `fk_run_params_1`
    FOREIGN KEY (`run_id`)
    REFERENCES `backtests`.`runs` (`run_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
