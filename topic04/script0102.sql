CREATE DATABASE  IF NOT EXISTS `highschool` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `highschool`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: highschool
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course` (
  `courseid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `hoursbyweek` int(3) DEFAULT NULL,
  `scheduletime` int(1) DEFAULT NULL,
  `teacherid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`courseid`),
  UNIQUE KEY `courseid_UNIQUE` (`courseid`),
  KEY `fk_course_teacher1_idx` (`teacherid`),
  CONSTRAINT `fk_course_teacher1` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'The art of running',NULL,NULL,3),(2,'Tree climbing',NULL,NULL,1),(3,'Surviving the Zombie Apocalypse',NULL,NULL,2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_has_student`
--

DROP TABLE IF EXISTS `course_has_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course_has_student` (
  `courseid` int(10) unsigned NOT NULL,
  `studentid` int(10) unsigned NOT NULL,
  `grade1` decimal(4,2) DEFAULT NULL,
  `grade2` decimal(4,2) DEFAULT NULL,
  `grade3` decimal(4,2) DEFAULT NULL,
  `finalgrade` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`courseid`,`studentid`),
  KEY `fk_course_has_student_student1_idx` (`studentid`),
  KEY `fk_course_has_student_course1_idx` (`courseid`),
  CONSTRAINT `fk_course_has_student_course1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  CONSTRAINT `fk_course_has_student_student1` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_has_student`
--

LOCK TABLES `course_has_student` WRITE;
/*!40000 ALTER TABLE `course_has_student` DISABLE KEYS */;
INSERT INTO `course_has_student` VALUES (1,1,2.00,2.00,2.00,2.00),(1,4,2.00,8.00,7.00,5.67),(1,7,9.00,1.00,5.00,5.00),(1,8,5.00,6.00,8.00,6.33),(1,10,6.00,6.00,9.00,7.00),(1,13,10.00,3.00,5.00,6.33),(1,16,4.00,10.00,8.00,7.33),(1,19,5.00,5.00,10.00,6.67),(1,22,4.00,4.00,5.00,4.33),(1,25,7.00,8.00,5.00,6.67),(2,2,2.00,2.00,4.00,2.67),(2,5,10.00,1.00,6.00,5.67),(2,8,4.00,8.00,3.00,5.00),(2,11,10.00,1.00,10.00,7.00),(2,14,2.00,8.00,8.00,7.33),(2,17,2.00,6.00,8.00,5.33),(2,20,10.00,10.00,8.00,9.33),(2,23,4.00,10.00,9.00,7.67),(2,26,6.00,5.00,1.00,4.00),(2,29,3.00,3.00,2.00,2.67),(3,3,8.00,3.00,6.00,5.67),(3,6,9.00,9.00,10.00,9.33),(3,9,2.00,4.00,5.00,3.67),(3,12,9.00,3.00,3.00,5.00),(3,15,10.00,6.00,8.00,8.00),(3,18,1.00,10.00,6.00,5.67),(3,21,4.00,1.00,9.00,4.67),(3,24,5.00,1.00,10.00,5.33),(3,27,9.00,1.00,7.00,5.67),(3,30,7.00,6.00,4.00,5.67);
/*!40000 ALTER TABLE `course_has_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `studentid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `registrationnumber` int(10) NOT NULL,
  `dateofbirth` date DEFAULT NULL,
  PRIMARY KEY (`studentid`),
  UNIQUE KEY `registrationnumber_UNIQUE` (`registrationnumber`),
  UNIQUE KEY `studentid_UNIQUE` (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Phillip','Douglas',151005383,'1998-07-01'),(2,'Wesley','Pope',136428858,'1999-11-28'),(3,'Halee','Santiago',64005038,'1996-06-28'),(4,'Irma','Bullock',323077797,'1992-06-21'),(5,'Graham','Valdez',303444915,'1991-01-23'),(6,'Raja','Booth',993378747,'1992-09-10'),(7,'MacKensie','Todd',500706515,'1999-10-07'),(8,'Jaime','Mooney',295801003,'1991-04-26'),(9,'Quinn','Preston',343098105,'1997-11-11'),(10,'Brian','Lucas',718972770,'1999-05-28'),(11,'Caesar','Vang',672839056,'1997-08-18'),(12,'Irma','Mcmillan',349433222,'1997-10-26'),(13,'Wayne','Thomas',615578926,'1995-12-11'),(14,'Zia','Morales',523921626,'1993-06-03'),(15,'Erica','Carver',682801902,'1993-01-17'),(16,'Hayes','Hogan',76532769,'1997-05-16'),(17,'Jameson','Frazier',363249786,'1991-02-23'),(18,'Keiko','Dominguez',13916598,'1993-02-24'),(19,'Brody','Lara',84885919,'1991-02-03'),(20,'Cameron','Hammond',521083982,'1992-06-29'),(21,'Zena','Bright',189181457,'1991-10-20'),(22,'Plato','Humphrey',656119508,'1997-08-19'),(23,'Gisela','Whitley',839561696,'1992-08-19'),(24,'Whoopi','Pierce',888775999,'1991-10-19'),(25,'Zane','Grimes',961837046,'1994-11-23'),(26,'Otto','Hendricks',916170206,'1998-02-27'),(27,'Kendall','Barrett',540858734,'1998-11-18'),(28,'Howard','Singleton',798706021,'1993-12-11'),(29,'Mark','Tucker',664872560,'1991-06-11'),(30,'Clarke','Munoz',882719904,'1991-12-21');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacher` (
  `teacherid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  PRIMARY KEY (`teacherid`),
  UNIQUE KEY `teacherid_UNIQUE` (`teacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'Rubén','Jirafales','1934-06-01'),(2,'George','Romero','1940-02-04'),(3,'Kylian ','Mbappé','1998-12-20');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-23 15:58:22
CREATE DATABASE  IF NOT EXISTS `highschool` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `highschool`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: highschool
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course` (
  `courseid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `hoursbyweek` int(3) DEFAULT NULL,
  `scheduletime` int(1) DEFAULT NULL,
  `teacherid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`courseid`),
  UNIQUE KEY `courseid_UNIQUE` (`courseid`),
  KEY `fk_course_teacher1_idx` (`teacherid`),
  CONSTRAINT `fk_course_teacher1` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`teacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'The art of running',NULL,NULL,3),(2,'Tree climbing',NULL,NULL,1),(3,'Surviving the Zombie Apocalypse',NULL,NULL,2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_has_student`
--

DROP TABLE IF EXISTS `course_has_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course_has_student` (
  `courseid` int(10) unsigned NOT NULL,
  `studentid` int(10) unsigned NOT NULL,
  `grade1` decimal(4,2) DEFAULT NULL,
  `grade2` decimal(4,2) DEFAULT NULL,
  `grade3` decimal(4,2) DEFAULT NULL,
  `finalgrade` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`courseid`,`studentid`),
  KEY `fk_course_has_student_student1_idx` (`studentid`),
  KEY `fk_course_has_student_course1_idx` (`courseid`),
  CONSTRAINT `fk_course_has_student_course1` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  CONSTRAINT `fk_course_has_student_student1` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_has_student`
--

LOCK TABLES `course_has_student` WRITE;
/*!40000 ALTER TABLE `course_has_student` DISABLE KEYS */;
INSERT INTO `course_has_student` VALUES (1,1,2.00,2.00,2.00,2.00),(1,4,2.00,8.00,7.00,5.67),(1,7,9.00,1.00,5.00,5.00),(1,8,5.00,6.00,8.00,6.33),(1,10,6.00,6.00,9.00,7.00),(1,13,10.00,3.00,5.00,6.33),(1,16,4.00,10.00,8.00,7.33),(1,19,5.00,5.00,10.00,6.67),(1,22,4.00,4.00,5.00,4.33),(1,25,7.00,8.00,5.00,6.67),(2,2,2.00,2.00,4.00,2.67),(2,5,10.00,1.00,6.00,5.67),(2,8,4.00,8.00,3.00,5.00),(2,11,10.00,1.00,10.00,7.00),(2,14,2.00,8.00,8.00,7.33),(2,17,2.00,6.00,8.00,5.33),(2,20,10.00,10.00,8.00,9.33),(2,23,4.00,10.00,9.00,7.67),(2,26,6.00,5.00,1.00,4.00),(2,29,3.00,3.00,2.00,2.67),(3,3,8.00,3.00,6.00,5.67),(3,6,9.00,9.00,10.00,9.33),(3,9,2.00,4.00,5.00,3.67),(3,12,9.00,3.00,3.00,5.00),(3,15,10.00,6.00,8.00,8.00),(3,18,1.00,10.00,6.00,5.67),(3,21,4.00,1.00,9.00,4.67),(3,24,5.00,1.00,10.00,5.33),(3,27,9.00,1.00,7.00,5.67),(3,30,7.00,6.00,4.00,5.67);
/*!40000 ALTER TABLE `course_has_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `studentid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `registrationnumber` int(10) NOT NULL,
  `dateofbirth` date DEFAULT NULL,
  PRIMARY KEY (`studentid`),
  UNIQUE KEY `registrationnumber_UNIQUE` (`registrationnumber`),
  UNIQUE KEY `studentid_UNIQUE` (`studentid`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Phillip','Douglas',151005383,'1998-07-01'),(2,'Wesley','Pope',136428858,'1999-11-28'),(3,'Halee','Santiago',64005038,'1996-06-28'),(4,'Irma','Bullock',323077797,'1992-06-21'),(5,'Graham','Valdez',303444915,'1991-01-23'),(6,'Raja','Booth',993378747,'1992-09-10'),(7,'MacKensie','Todd',500706515,'1999-10-07'),(8,'Jaime','Mooney',295801003,'1991-04-26'),(9,'Quinn','Preston',343098105,'1997-11-11'),(10,'Brian','Lucas',718972770,'1999-05-28'),(11,'Caesar','Vang',672839056,'1997-08-18'),(12,'Irma','Mcmillan',349433222,'1997-10-26'),(13,'Wayne','Thomas',615578926,'1995-12-11'),(14,'Zia','Morales',523921626,'1993-06-03'),(15,'Erica','Carver',682801902,'1993-01-17'),(16,'Hayes','Hogan',76532769,'1997-05-16'),(17,'Jameson','Frazier',363249786,'1991-02-23'),(18,'Keiko','Dominguez',13916598,'1993-02-24'),(19,'Brody','Lara',84885919,'1991-02-03'),(20,'Cameron','Hammond',521083982,'1992-06-29'),(21,'Zena','Bright',189181457,'1991-10-20'),(22,'Plato','Humphrey',656119508,'1997-08-19'),(23,'Gisela','Whitley',839561696,'1992-08-19'),(24,'Whoopi','Pierce',888775999,'1991-10-19'),(25,'Zane','Grimes',961837046,'1994-11-23'),(26,'Otto','Hendricks',916170206,'1998-02-27'),(27,'Kendall','Barrett',540858734,'1998-11-18'),(28,'Howard','Singleton',798706021,'1993-12-11'),(29,'Mark','Tucker',664872560,'1991-06-11'),(30,'Clarke','Munoz',882719904,'1991-12-21');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacher` (
  `teacherid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  PRIMARY KEY (`teacherid`),
  UNIQUE KEY `teacherid_UNIQUE` (`teacherid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'Rubén','Jirafales','1934-06-01'),(2,'George','Romero','1940-02-04'),(3,'Kylian ','Mbappé','1998-12-20');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-23 15:58:22
