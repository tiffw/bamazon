# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.17)
# Database: bamazon_db
# Generation Time: 2017-07-26 03:46:13 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table department_name
# ------------------------------------------------------------
CREATE DATABASE bamazon_DB;
USE bamazon_DB;


DROP TABLE IF EXISTS `department_name`;

CREATE TABLE `department_name` (
  `DepartmentID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) NOT NULL,
  `OverHeadCosts` decimal(10,2) NOT NULL,
  `TotalSales` decimal(10,2) NOT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `department_name` WRITE;
/*!40000 ALTER TABLE `department_name` DISABLE KEYS */;

INSERT INTO `department_name` (`DepartmentID`, `DepartmentName`, `OverHeadCosts`, `TotalSales`)
VALUES
	(1,'food',50000.00,15000.00),
	(2,'book',20000.00,12000.00),
	(3,'electronics',30000.00,15000.00),
	(4,'furniture',3000.00,12000.00);

/*!40000 ALTER TABLE `department_name` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `price` decimal(5,3) NOT NULL,
  `stock_quantity` int(50) NOT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`ItemID`, `product_name`, `department_name`, `price`, `stock_quantity`)
VALUES
	(1,'apple','food',1.000,15),
	(2,'pear','food',0.600,5),
	(3,'steve_jobs','book',12.990,2),
	(4,'jeff_bezos','book',14.990,10),
	(5,'headphones','electronics',29.990,5),
	(6,'speakers','electronics',3.000,8),
	(7,'chair','furniture',29.000,19),
	(8,'pillow','furniture',19.000,4),
	(9,'light','furniture',79.000,8),
	(10,'carpet','furniture',89.000,12),
	(11,'table','furniture',39.990,3),
	(12,'couch','furniture',99.000,1);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
