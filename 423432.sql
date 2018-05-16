/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.6.35-log : Database - zhongchouke
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zhongchouke` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zhongchouke`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

/*Table structure for table `employer` */

DROP TABLE IF EXISTS `employer`;

CREATE TABLE `employer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `adress` varchar(30) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `monthpay` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employer` */

/*Table structure for table `employerwage` */

DROP TABLE IF EXISTS `employerwage`;

CREATE TABLE `employerwage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employerId` int(11) NOT NULL,
  `months` varchar(255) NOT NULL,
  `wage` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf50anqf0837nm2626nbib530a` (`employerId`),
  CONSTRAINT `FKf50anqf0837nm2626nbib530a` FOREIGN KEY (`employerId`) REFERENCES `employer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employerwage` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inputerId` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `inputPrise` double DEFAULT NULL,
  `outputPrise` double DEFAULT NULL,
  `remainNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmq6rc51u6sbhofk9nof4c3r18` (`inputerId`),
  CONSTRAINT `FKmq6rc51u6sbhofk9nof4c3r18` FOREIGN KEY (`inputerId`) REFERENCES `inputer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

/*Table structure for table `goodssell` */

DROP TABLE IF EXISTS `goodssell`;

CREATE TABLE `goodssell` (
  `id` int(11) NOT NULL,
  `goodsId` int(11) NOT NULL,
  `employerId` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `sellDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK55lsi4xc5rgaj5q8c4j0u9em0` (`goodsId`),
  KEY `FKq3j847c8ro53yj3wy3uofc11s` (`employerId`),
  CONSTRAINT `FK55lsi4xc5rgaj5q8c4j0u9em0` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`id`),
  CONSTRAINT `FKq3j847c8ro53yj3wy3uofc11s` FOREIGN KEY (`employerId`) REFERENCES `employer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goodssell` */

/*Table structure for table `goodsspend` */

DROP TABLE IF EXISTS `goodsspend`;

CREATE TABLE `goodsspend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intoGoodsId` int(11) NOT NULL,
  `spendMoney` double NOT NULL,
  `goodsId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc04octkcdh03bcid9feaa27oa` (`intoGoodsId`),
  KEY `FKkd9g1s0examhxbwvuvt8t74yr` (`goodsId`),
  CONSTRAINT `FKc04octkcdh03bcid9feaa27oa` FOREIGN KEY (`intoGoodsId`) REFERENCES `intogoods` (`id`),
  CONSTRAINT `FKkd9g1s0examhxbwvuvt8t74yr` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goodsspend` */

/*Table structure for table `inputer` */

DROP TABLE IF EXISTS `inputer`;

CREATE TABLE `inputer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `inputer` */

/*Table structure for table `intogoods` */

DROP TABLE IF EXISTS `intogoods`;

CREATE TABLE `intogoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) NOT NULL,
  `intoDate` datetime DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjhmjx1jihdyr4oh5gv5trin3i` (`goodsId`),
  CONSTRAINT `FKjhmjx1jihdyr4oh5gv5trin3i` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `intogoods` */

/*Table structure for table `workday` */

DROP TABLE IF EXISTS `workday`;

CREATE TABLE `workday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employerId` int(11) DEFAULT NULL,
  `workday` varchar(23) NOT NULL,
  `addwork` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5i252xa25u6h55xbmbdx1nsa9` (`employerId`),
  CONSTRAINT `FK5i252xa25u6h55xbmbdx1nsa9` FOREIGN KEY (`employerId`) REFERENCES `employer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `workday` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
