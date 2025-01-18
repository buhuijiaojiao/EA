CREATE DATABASE EA;
USE EA;
CREATE TABLE `EA`.`teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `EA`.`student` (
  `Sid` varchar(10) NOT NULL,
  `sname` varchar(20) NOT NULL ,
  `ssex` varchar(10) NOT NULL ,
  `scollege` varchar(20) NOT NULL,
  `smajor` varchar(20) NOT NULL ,
  PRIMARY KEY (`Sid`)
);
CREATE TABLE`EA`.`course` (
  `Cid` varchar(5) NOT NULL,
  `cname` varchar(40)NOT NULL  ,
  PRIMARY KEY (`Cid`),
  KEY `Cid` (`Cid`)
) ;
CREATE TABLE `sc` (
  `Sid` char(8) NOT NULL,
  `Cid` char(5) NOT NULL,
  `Grade` smallint NOT NULL ,
  PRIMARY KEY (`Sid`,`Cid`),
  KEY `fk_Cid` (`Cid`),
  CONSTRAINT `fk_Cid` FOREIGN KEY (`Cid`) REFERENCES `course` (`Cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sno` FOREIGN KEY (`Sid`) REFERENCES `student` (`Sid`) ON DELETE CASCADE ON UPDATE CASCADE
);

