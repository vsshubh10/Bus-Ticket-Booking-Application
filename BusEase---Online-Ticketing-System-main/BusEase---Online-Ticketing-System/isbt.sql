CREATE DATABASE  IF NOT EXISTS `isbt` 
USE `isbt`;


DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `busNo` varchar(45) NOT NULL,
  `busName` varchar(45) NOT NULL,
  `from_city` varchar(45) NOT NULL,
  `to_city` varchar(45) NOT NULL,
  `depart_time` varchar(45) NOT NULL,
  `fare` varchar(45) NOT NULL,
  `fullName` varchar(45) NOT NULL,
  `tickets` varchar(45) NOT NULL,
  `route_id` int NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`user_id`),
  KEY `rid_idx` (`route_id`),
  CONSTRAINT `rid` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `routes`;

CREATE TABLE `routes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `busno` varchar(45) NOT NULL,
  `busname` varchar(45) NOT NULL,
  `from_city` varchar(45) NOT NULL,
  `to_city` varchar(45) NOT NULL,
  `depart_time` varchar(45) NOT NULL,
  `fare` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `user_dtls`;

CREATE TABLE `user_dtls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

