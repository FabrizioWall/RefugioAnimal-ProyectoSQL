/*
1 - adoptantes: guarda la info de cada persona que adopte animales en el refugio
2 - after_logs_animales_edad: es una tabla de logs, que nace a partir de un trigger en la tabla animales, para guardar 
edades anteriores de los animales despues de que sean modifiacados
3 - after_logs_rutina: otra tabla de logs, que nace a partir de un trigger en la tabla responsables,
guarda las rutinas después de que sean modificadas
4 - animales: la tabla más importante y que le da vida al proyecto, en ella se encuentran todos los datos de los animales
que componen al refugio
5 - animales_estados: en ella se almacenan los datos informativos de los estados de los animales. Cada animal tiene designado un estado
especial
6 - before_logs_animales_ests: tabla que nace a partir de un trigger en la tabla animales, guarda el estado del animal ANTES de que sea 
actualizado
7 - before_logs_responsables: ultima tabla de logs de mi DB, cuando un empleado deja de ser responsable de un animal, antes de que se 
elimine, se guardan sus datos en esta tabla de logs.
8 - compras: guarda los datos de las compras generales que se hacen para mantener al refugio: fecha de compra, tipo de producto, valor, etc.
9 - costos: en ella se almacena la info de precios totales de la tabla compras y medicamentos pare verificar costos
10 - donaciones: se almacena información de las donaciones realizadas hacia el refugio, importante para saber montos que ingresan 
y analizar (de forma ficticia) en que gastos priorizar el dinero
11 - donantes: guarda info de las personas que son donantes en el refugio
12 - emplados: es la tabla que contiene los datos de los empleados que trabajan en el refugio
13 - lista_cargos: se encuentran todos los cargos, actuales, que se ejercen en el refugio
14 - localidad: almacena localidades de Argentina
15 - medicamentos: contiene toda la información de cada medicamento que se necesita en el refugio para los animales
responsable  
16 - paises: almacena paises
17 - responsable: se encuentran los empleados que son responsables de un animal para su cuidado en caso de que necesite
trato especial
18 - tratamientos: contiene informacion de los tratamientos que realiza un animal, con fecha de inicio y fin

-- Datos que componen a las vistas -- 
1 - adoptantes_resumen: contiene datos personales de las personas que adoptan
2 - animales_sin_raza: guarda los animales que cumplan con el criterio de no tener raza
3 - compras_costos: contiene info de solo los precios de las compras
4 - costos_medicamentos: contiene info de los precios y el tipo de medicamento para hacer una formalización de los costos
5 - costoss: une los precios finales de las compras y medicamentos para realizar un costo general, detallando numeros de ambos
6 - fechasdecompra: contiene join que ayudan a filtrar los datos de las compras de medicamentos y productos generales por misma fecha
7 - responsables_detalle: ayuda a ver datos personales de los responsables de una forma más resumida
*/
CREATE DATABASE  IF NOT EXISTS `refugioanimal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `refugioanimal`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: refugioanimal
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adoptantes`
--

DROP TABLE IF EXISTS `adoptantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoptantes` (
  `id_adoptante` int NOT NULL AUTO_INCREMENT,
  `nombre_adoptante` varchar(30) NOT NULL,
  `apellido_adoptante` varchar(30) NOT NULL,
  `dni_adoptante` varchar(30) NOT NULL,
  `domicilio_adoptante` varchar(50) NOT NULL,
  `telefono_adoptante` int DEFAULT NULL,
  `id_animal` int DEFAULT NULL,
  `fecha_adopcion` date NOT NULL,
  PRIMARY KEY (`id_adoptante`),
  KEY `fk_adoptantes_animales` (`id_animal`),
  CONSTRAINT `fk_adoptantes_animales` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoptantes`
--

LOCK TABLES `adoptantes` WRITE;
/*!40000 ALTER TABLE `adoptantes` DISABLE KEYS */;
INSERT INTO `adoptantes` VALUES (1,'Dilly','Manterfield','20404129','Calle Falsa 123',1592576195,2,'2023-03-21'),(2,'Teodora','Kittle','35121073','Calle Falsa 123',1523697315,4,'2023-02-01'),(3,'Artemas','Elbourne','70851461','Calle Falsa 123',1527518381,5,'2023-01-09'),(4,'Marcella','Manclark','14020098','Calle Falsa 123',1518070940,8,'2022-12-25'),(5,'Whitman','Galea','40765707','Calle Falsa 123',1596638465,4,'2023-08-02'),(6,'Nikolia','Druitt','55554889','Calle Falsa 123',1567605252,4,'2023-01-02'),(7,'Bridget','Savery','33606807','Calle Falsa 123',1595947970,4,'2023-06-09'),(8,'Pauletta','Ranscome','49016174','Calle Falsa 123',1529623983,2,'2023-01-22'),(9,'Inger','Cortese','15536896','Calle Falsa 123',1561040222,8,'2023-03-02'),(10,'Fabrizio','McNelis','52190506','Calle Falsa 123',1526131469,1,'2023-05-29');
/*!40000 ALTER TABLE `adoptantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `adoptantes_resumen`
--

DROP TABLE IF EXISTS `adoptantes_resumen`;
/*!50001 DROP VIEW IF EXISTS `adoptantes_resumen`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `adoptantes_resumen` AS SELECT 
 1 AS `id_adoptante`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `id_animal`,
 1 AS `DNI`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `after_logs_animales_edad`
--

DROP TABLE IF EXISTS `after_logs_animales_edad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `after_logs_animales_edad` (
  `id_animal` int DEFAULT NULL,
  `edad_estimada_animal` int DEFAULT NULL,
  `usuario` varchar(60) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `hora_modificacion` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `after_logs_animales_edad`
--

LOCK TABLES `after_logs_animales_edad` WRITE;
/*!40000 ALTER TABLE `after_logs_animales_edad` DISABLE KEYS */;
INSERT INTO `after_logs_animales_edad` VALUES (2,2,'root@localhost','2023-09-07','00:00:00');
/*!40000 ALTER TABLE `after_logs_animales_edad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `after_logs_rutina`
--

DROP TABLE IF EXISTS `after_logs_rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `after_logs_rutina` (
  `id_responsable` int DEFAULT NULL,
  `id_animal` int DEFAULT NULL,
  `rutina` varchar(200) DEFAULT NULL,
  `usuario` varchar(60) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `hora_modificacion` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `after_logs_rutina`
--

LOCK TABLES `after_logs_rutina` WRITE;
/*!40000 ALTER TABLE `after_logs_rutina` DISABLE KEYS */;
INSERT INTO `after_logs_rutina` VALUES (1,144,'Pasear y bañar semanalmente','root@localhost','2023-09-07','23:24:55');
/*!40000 ALTER TABLE `after_logs_rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animales`
--

DROP TABLE IF EXISTS `animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animales` (
  `id_animal` int NOT NULL AUTO_INCREMENT,
  `nombre_animal` varchar(200) DEFAULT NULL,
  `raza_animal` varchar(200) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `edad_estimada_animal` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `sexo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_animal`),
  KEY `fk_animales_animales_estados` (`id_estado`),
  CONSTRAINT `fk_animales_animales_estados` FOREIGN KEY (`id_estado`) REFERENCES `animales_estados` (`id_estado`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animales`
--

LOCK TABLES `animales` WRITE;
/*!40000 ALTER TABLE `animales` DISABLE KEYS */;
INSERT INTO `animales` VALUES (1,'Nollie','Siamese','territorial','2023-03-11',9,1,'M'),(2,'Wilhelmine',NULL,'territorial','2022-11-29',2,4,'F'),(3,'Sean','Siamese','agresivo','2023-06-12',12,1,'M'),(4,'Taylor','Golden Retriever','agresivo','2022-09-24',13,2,'M'),(5,'Murdock','Labrador Retriever','territorial','2023-03-25',12,7,'M'),(6,'Laurie','Siamese','juguetón','2022-09-17',11,5,'M'),(7,'Mort',NULL,'agresivo','2023-05-25',1,2,'M'),(8,'Kimberly','Siamese','amigable','2023-03-18',4,5,'F'),(9,'Sheryl',NULL,'territorial','2023-07-28',17,5,'F'),(10,'Pietra',NULL,'territorial','2023-04-29',11,2,'F'),(11,'Alvera',NULL,'tímido','2022-11-16',19,5,'F'),(12,'Willabella','Siamese','curioso','2022-09-05',4,5,'F'),(13,'Art','Siamese','curioso','2023-05-15',9,1,'M'),(14,'Lorrie',NULL,'curioso','2023-07-16',7,3,'F'),(15,'Barthel',NULL,'agresivo','2023-01-13',12,5,'M'),(16,'Ennis','Bulldog','juguetón','2023-02-05',20,5,'M'),(17,'Gert','Poodle','juguetón','2023-05-30',9,2,'F'),(18,'Delainey','Golden Retriever','curioso','2023-04-15',6,5,'M'),(19,'Mychal','Bulldog','territorial','2023-07-09',13,6,'M'),(20,'Romy','Poodle','territorial','2023-06-01',7,4,'F'),(21,'Calvin','Persian','amigable','2022-08-26',6,6,'M'),(22,'Clemmy',NULL,'tímido','2023-04-26',7,4,'M'),(23,'Kevan',NULL,'amigable','2022-09-04',8,3,'M'),(24,'Reade','Poodle','territorial','2022-11-22',16,7,'M'),(25,'De',NULL,'tímido','2023-06-03',14,1,'F'),(26,'Rahel',NULL,'juguetón','2023-04-06',8,2,'F'),(27,'Ofelia',NULL,'amigable','2023-03-31',15,1,'F'),(28,'Paddie','German Shepherd','juguetón','2022-09-14',4,3,'M'),(29,'Meryl','Golden Retriever','juguetón','2023-06-29',1,1,'M'),(30,'Daniel','Bulldog','tímido','2023-04-02',13,3,'M'),(31,'Madalyn',NULL,'curioso','2023-07-08',16,6,'F'),(32,'Lorianne','Maine Coon','juguetón','2023-01-21',10,6,'F'),(33,'Steven','German Shepherd','territorial','2023-03-08',14,6,'M'),(34,'Solly','Maine Coon','territorial','2022-12-23',7,3,'M'),(35,'Aeriela','Maine Coon','amigable','2023-06-28',18,6,'F'),(36,'Jessalyn','Poodle','territorial','2023-07-18',1,4,'F'),(37,'Chen',NULL,'curioso','2022-11-03',17,6,'M'),(38,'Rich','Golden Retriever','juguetón','2022-10-26',6,3,'M'),(39,'Vale',NULL,'agresivo','2022-12-07',1,1,'F'),(40,'Padraic','Poodle','territorial','2023-04-14',17,2,'M'),(41,'Jorey',NULL,'amigable','2023-04-04',9,6,'F'),(42,'Amalia','Persian','curioso','2023-01-26',20,6,'F'),(43,'Paco','Siamese','amigable','2023-04-10',12,6,'M'),(44,'Jasen','German Shepherd','juguetón','2023-06-05',12,7,'M'),(45,'Michael','Labrador Retriever','amigable','2023-02-24',10,1,'M'),(46,'Kerstin','Maine Coon','agresivo','2023-05-23',12,7,'F'),(47,'Parrnell','German Shepherd','amigable','2023-01-17',6,1,'M'),(48,'Nathaniel',NULL,'juguetón','2023-02-18',4,4,'M'),(49,'Miles',NULL,'tímido','2022-10-05',7,5,'M'),(50,'Brig','Bulldog','tímido','2023-02-01',18,1,'M'),(51,'Correna',NULL,'territorial','2023-03-15',17,3,'F'),(52,'Christophe','Maine Coon','amigable','2023-05-23',6,3,'M'),(53,'Lulu','Maine Coon','tímido','2023-01-04',8,7,'F'),(54,'Terencio','Siamese','curioso','2023-06-25',2,6,'M'),(55,'Muhammad','Maine Coon','tímido','2023-03-04',6,1,'M'),(56,'Eli',NULL,'amigable','2022-12-23',14,5,'M'),(57,'Erasmus',NULL,'territorial','2022-10-16',18,4,'M'),(58,'Gilli',NULL,'territorial','2023-02-05',2,4,'F'),(59,'Pavel','Labrador Retriever','agresivo','2023-07-15',6,7,'M'),(60,'Drucy','Poodle','tímido','2023-07-08',5,4,'F'),(61,'Iormina','Siamese','curioso','2023-06-20',7,2,'F'),(62,'Eachelle','Maine Coon','territorial','2022-10-01',4,2,'F'),(63,'Rosaleen','Maine Coon','agresivo','2023-06-13',4,6,'F'),(64,'Major','Golden Retriever','territorial','2023-01-01',18,5,'M'),(65,'Mireielle',NULL,'amigable','2022-10-14',8,3,'F'),(66,'Mohammed','Poodle','territorial','2022-11-09',1,5,'M'),(67,'Nicole',NULL,'territorial','2022-11-10',6,5,'F'),(68,'Chelsie','Siamese','agresivo','2023-05-02',18,2,'F'),(69,'Vi','German Shepherd','juguetón','2022-11-14',3,4,'F'),(70,'Zuzana','Poodle','tímido','2023-05-12',19,2,'F'),(71,'Leonanie','Maine Coon','tímido','2023-04-22',3,3,'F'),(72,'Hannah','Siamese','juguetón','2023-02-09',5,6,'F'),(73,'Jake','Poodle','juguetón','2023-04-19',10,6,'M'),(74,'Jobyna',NULL,'curioso','2023-01-18',9,4,'F'),(75,'Felice',NULL,'territorial','2022-11-15',19,3,'M'),(76,'Krystalle','Persian','amigable','2023-03-02',9,5,'F'),(77,'Ginger','Labrador Retriever','agresivo','2023-08-14',12,2,'M'),(78,'Hendrika','Labrador Retriever','juguetón','2022-12-02',12,1,'F'),(79,'Vaughn','Poodle','territorial','2023-03-03',4,2,'M'),(80,'Nichol','Maine Coon','tímido','2023-03-08',11,6,'F'),(81,'Jodie','Poodle','territorial','2023-08-10',14,1,'M'),(82,'Giacobo','Siamese','juguetón','2022-10-11',11,1,'M'),(83,'Linnie','Labrador Retriever','tímido','2022-12-24',16,4,'F'),(84,'Viviana','Maine Coon','amigable','2023-03-07',7,1,'F'),(85,'Jobie','German Shepherd','juguetón','2023-06-29',5,2,'F'),(86,'Malchy',NULL,'tímido','2023-02-24',3,2,'M'),(87,'Glennie',NULL,'agresivo','2023-04-17',4,7,'F'),(88,'Fredek','German Shepherd','juguetón','2022-12-06',13,2,'M'),(89,'Daisi','Golden Retriever','territorial','2023-03-25',4,3,'F'),(90,'Avie','Labrador Retriever','agresivo','2023-06-30',19,2,'F'),(91,'Alec','Labrador Retriever','juguetón','2022-09-07',6,1,'M'),(92,'Quinton',NULL,'territorial','2023-07-04',20,6,'M'),(93,'Clotilda','Golden Retriever','curioso','2023-03-30',0,7,'F'),(94,'Grantley',NULL,'amigable','2023-03-23',5,1,'M'),(95,'Dion','German Shepherd','amigable','2023-03-29',19,6,'F'),(96,'Dru',NULL,'agresivo','2023-06-08',12,5,'M'),(97,'Chicky',NULL,'agresivo','2022-11-06',17,6,'F'),(98,'Alice','Siamese','amigable','2023-08-12',15,4,'F'),(99,'Trude','Siamese','juguetón','2022-09-20',16,6,'F'),(100,'Orville','Bulldog','curioso','2023-04-11',19,3,'M'),(101,'Agnella','Poodle','juguetón','2023-03-28',4,6,'F'),(102,'Rheba','Maine Coon','juguetón','2023-04-26',1,1,'F'),(103,'Lazare','Golden Retriever','territorial','2022-09-18',9,7,'M'),(104,'Nealson','Labrador Retriever','juguetón','2022-09-12',17,7,'M'),(105,'Eda','Siamese','tímido','2023-06-24',15,1,'F'),(106,'Jayson','Siamese','juguetón','2022-10-23',14,1,'M'),(107,'Ardis',NULL,'tímido','2022-09-25',13,5,'F'),(108,'Ches','Persian','agresivo','2023-07-31',16,3,'M'),(109,'Drusy','Maine Coon','amigable','2022-11-02',17,5,'F'),(110,'Lindy','Golden Retriever','curioso','2023-01-30',9,3,'M'),(111,'Orelia',NULL,'territorial','2023-07-23',16,6,'F'),(112,'Gwyneth',NULL,'agresivo','2023-02-05',2,4,'F'),(113,'Tymothy','Bulldog','juguetón','2022-10-13',10,2,'M'),(114,'Kari','German Shepherd','territorial','2023-07-24',0,2,'F'),(115,'Jobyna','Bulldog','amigable','2022-11-19',18,7,'F'),(116,'Ignacius','Poodle','tímido','2023-07-21',0,3,'M'),(117,'Albie','Poodle','agresivo','2023-02-16',8,2,'M'),(118,'Cornell','German Shepherd','juguetón','2023-05-31',10,4,'M'),(119,'Tod','Labrador Retriever','curioso','2022-09-18',18,6,'M'),(120,'Bert','Siamese','territorial','2023-03-06',10,5,'M'),(121,'Marissa',NULL,'territorial','2023-03-15',15,4,'F'),(122,'Austen','German Shepherd','juguetón','2022-10-18',18,4,'M'),(123,'Irina','Siamese','amigable','2022-10-27',10,6,'F'),(124,'Windy','German Shepherd','tímido','2023-02-07',3,2,'F'),(125,'Hestia',NULL,'amigable','2023-01-22',10,4,'F'),(126,'Briney','German Shepherd','juguetón','2023-03-13',4,3,'F'),(127,'Car','Siamese','juguetón','2023-03-17',14,2,'M'),(128,'Woody',NULL,'amigable','2023-08-02',9,5,'M'),(129,'Rianon',NULL,'amigable','2022-09-16',10,5,'F'),(130,'Chris',NULL,'curioso','2022-10-08',14,6,'M'),(131,'Gregoire','Siamese','territorial','2022-11-12',10,1,'M'),(132,'Cathyleen','Golden Retriever','juguetón','2023-03-09',2,4,'F'),(133,'Jen',NULL,'territorial','2023-06-13',12,7,'F'),(134,'Nance','Maine Coon','amigable','2022-08-30',11,4,'F'),(135,'Sadye','Poodle','curioso','2023-01-08',17,6,'F'),(136,'Porty',NULL,'juguetón','2023-01-17',3,6,'M'),(137,'Langston','Maine Coon','amigable','2023-05-13',9,3,'M'),(138,'Roarke','Persian','tímido','2022-11-19',16,5,'M'),(139,'Reynard','Bulldog','juguetón','2023-05-11',14,1,'M'),(140,'Salvatore','Maine Coon','territorial','2023-07-05',13,1,'M'),(141,'Norman','Persian','agresivo','2023-05-24',17,4,'M'),(142,'Jeffrey','Persian','territorial','2022-12-29',17,7,'M'),(143,'Jolie','Golden Retriever','curioso','2023-05-19',5,2,'F'),(144,'Devina',NULL,'curioso','2023-07-14',20,3,'F'),(145,'Carol-jean','Maine Coon','curioso','2022-12-18',0,3,'F'),(146,'Fernandina','Labrador Retriever','tímido','2023-02-03',13,7,'F'),(147,'Hermann','Golden Retriever','agresivo','2022-11-09',16,3,'M'),(148,'Georgi','Bulldog','tímido','2023-02-08',12,6,'M'),(149,'Hyatt',NULL,'amigable','2023-05-19',5,6,'M'),(150,'Vin','Poodle','curioso','2022-09-09',16,7,'F'),(151,'Moise','Labrador Retriever','juguetón','2023-03-30',12,1,'M'),(152,'Adan','Bulldog','curioso','2022-09-24',11,2,'M'),(153,'Petrina','Persian','tímido','2022-12-18',20,1,'F'),(154,'Judas',NULL,'territorial','2023-06-28',14,3,'M'),(155,'Patrica','Siamese','amigable','2023-06-13',2,5,'F'),(156,'Lynea','Labrador Retriever','tímido','2023-06-11',17,6,'F'),(157,'Rhonda',NULL,'agresivo','2023-03-18',8,4,'F'),(158,'Crissy','Labrador Retriever','tímido','2023-05-25',11,7,'F'),(159,'Beryle','Golden Retriever','amigable','2023-01-16',8,6,'F'),(160,'Ginnie','Labrador Retriever','curioso','2023-06-27',11,6,'F'),(161,'Chevalier','Labrador Retriever','territorial','2022-10-28',14,3,'M'),(162,'Laina','Bulldog','juguetón','2023-04-13',9,7,'F'),(163,'Nola','Persian','curioso','2023-07-29',10,7,'F'),(164,'Derby','Persian','tímido','2022-11-30',13,5,'M'),(165,'Killy','Siamese','amigable','2023-07-07',2,1,'M'),(166,'Federico','Poodle','tímido','2022-09-01',0,4,'M'),(167,'Arturo','Poodle','curioso','2023-05-06',11,7,'M'),(168,'Emmett','Bulldog','territorial','2023-01-30',2,4,'M'),(169,'Ondrea','Siamese','curioso','2023-04-14',10,1,'F'),(170,'Valida','German Shepherd','territorial','2023-08-13',4,1,'F'),(171,'Linoel','Poodle','tímido','2023-06-06',18,6,'M'),(172,'Jay','German Shepherd','amigable','2023-01-08',18,1,'M'),(173,'Tedra',NULL,'agresivo','2023-04-14',11,6,'F'),(174,'Hashim','Poodle','agresivo','2022-12-01',2,4,'M'),(175,'Syd','Golden Retriever','agresivo','2023-03-10',0,4,'M'),(176,'Tamara','German Shepherd','juguetón','2022-09-08',7,6,'F'),(177,'Nerty','Bulldog','agresivo','2023-02-03',15,4,'F'),(178,'Carolus','Bulldog','juguetón','2022-11-09',11,6,'M'),(179,'Wes',NULL,'curioso','2023-01-13',7,7,'M'),(180,'Doy','Maine Coon','curioso','2023-07-24',15,6,'M'),(181,'Vergil',NULL,'curioso','2023-06-13',20,6,'M'),(182,'Bren','Poodle','tímido','2022-09-01',13,7,'F'),(183,'Wit','Persian','amigable','2022-12-18',3,6,'M'),(184,'Devina','Golden Retriever','agresivo','2022-09-06',1,6,'F'),(185,'Melvyn','Golden Retriever','amigable','2023-02-22',8,1,'M'),(186,'Bald',NULL,'curioso','2023-07-29',19,6,'M'),(187,'Lief','Labrador Retriever','territorial','2022-12-16',19,4,'M'),(188,'Zane','Golden Retriever','amigable','2022-11-02',0,1,'M'),(189,'Chery','Siamese','curioso','2023-01-09',14,4,'F'),(190,'Pacorro','Siamese','curioso','2023-03-31',12,1,'M'),(191,'Brandi','Labrador Retriever','juguetón','2023-01-11',19,4,'F'),(192,'Mirna',NULL,'juguetón','2023-05-20',5,2,'F'),(193,'Horacio','Bulldog','territorial','2023-06-12',7,6,'M'),(194,'Zena','Maine Coon','territorial','2022-09-19',2,1,'F'),(195,'Bail','Maine Coon','territorial','2023-04-14',2,1,'M'),(196,'Abba',NULL,'juguetón','2023-05-28',11,6,'M'),(197,'Gertruda','Bulldog','tímido','2023-03-21',5,7,'F'),(198,'Rochell',NULL,'agresivo','2023-08-11',20,6,'F'),(199,'Evanne',NULL,'tímido','2023-08-06',4,6,'F'),(200,'Rodie',NULL,'territorial','2023-07-29',9,6,'F'),(201,'Maureene',NULL,'tímido','2022-09-04',6,1,'F'),(202,'Lacee','Labrador Retriever','agresivo','2023-05-14',13,1,'F'),(203,'Wendye',NULL,'agresivo','2022-10-21',1,7,'F'),(204,'Izaak',NULL,'amigable','2023-07-24',11,4,'M'),(205,'Harrie','Labrador Retriever','amigable','2023-04-18',7,7,'F'),(206,'Norma',NULL,'agresivo','2022-08-19',20,1,'F'),(207,'Bria','Labrador Retriever','territorial','2023-07-25',19,7,'F'),(208,'Amandi','Labrador Retriever','territorial','2022-12-04',10,4,'F'),(209,'Dorry','Labrador Retriever','territorial','2022-11-13',4,5,'F'),(210,'Aloisia','Maine Coon','juguetón','2023-07-10',20,1,'F'),(211,'Stephine','Persian','territorial','2023-05-28',0,5,'F'),(212,'Adele',NULL,'amigable','2023-01-07',0,3,'F'),(213,'Penni','Bulldog','tímido','2023-02-25',20,4,'F'),(214,'Ian','','territorial','2022-11-09',15,6,'M'),(215,'Nels','Bulldog','juguetón','2023-07-20',1,7,'M'),(216,'Roderigo','Golden Retriever','territorial','2023-03-24',8,1,'M'),(217,'Andria','Golden Retriever','amigable','2023-07-11',8,4,'F'),(218,'Ericka','Bulldog','territorial','2023-05-11',10,3,'F'),(219,'Alfonso',NULL,'agresivo','2022-10-06',13,2,'M'),(220,'Zonda','Siamese','curioso','2023-03-24',19,1,'F'),(221,'Vinita',NULL,'curioso','2022-12-22',10,5,'F'),(222,'Kaspar','Maine Coon','curioso','2023-01-29',18,5,'M'),(223,'Franny','Labrador Retriever','amigable','2022-11-17',10,7,'M'),(224,'Zitella',NULL,'amigable','2023-01-27',15,7,'F'),(225,'Coreen','Persian','juguetón','2023-06-13',14,1,'F'),(226,'Lindie',NULL,'amigable','2023-08-07',9,4,'F'),(227,'Marilee',NULL,'amigable','2023-06-04',15,3,'F'),(228,'Ilsa',NULL,'territorial','2022-10-22',12,3,'F'),(229,'Rosemarie',NULL,'amigable','2023-04-24',17,2,'F'),(230,'Derry','German Shepherd','juguetón','2022-10-31',5,5,'M'),(231,'Baudoin',NULL,'territorial','2023-05-25',14,5,'M'),(232,'Dorrie','Siamese','agresivo','2022-10-06',3,2,'F'),(233,'Carlin',NULL,'territorial','2023-07-12',17,4,'M'),(234,'Reena','Maine Coon','territorial','2023-03-11',18,1,'F'),(235,'Eolanda','Persian','amigable','2023-02-23',4,2,'F'),(236,'Harli','Maine Coon','tímido','2023-03-30',15,7,'F'),(237,'Ethelyn',NULL,'territorial','2023-05-19',7,7,'F'),(238,'Justis','Golden Retriever','tímido','2022-11-23',15,6,'M'),(239,'Alameda','Persian','juguetón','2022-12-25',11,5,'F'),(240,'Gabrila','German Shepherd','curioso','2022-10-06',11,5,'F'),(241,'Elisabeth','Bulldog','tímido','2022-12-16',9,3,'F'),(242,'Zebadiah',NULL,'tímido','2023-01-16',20,4,'M'),(243,'Malinda','Bulldog','amigable','2023-04-28',2,6,'F'),(244,'Christel','Bulldog','territorial','2023-01-26',13,5,'F'),(245,'Loraine','Siamese','curioso','2023-07-19',4,4,'F'),(246,'Christyna',NULL,'curioso','2022-12-18',17,7,'F'),(247,'Elwyn',NULL,'juguetón','2023-03-11',11,5,'M'),(248,'Margaux','Siamese','territorial','2022-11-12',7,7,'F'),(249,'Carrissa',NULL,'tímido','2022-11-15',11,1,'F'),(250,'Kala','Maine Coon','amigable','2023-02-13',2,6,'F'),(251,'Clo','Maine Coon','curioso','2023-07-29',4,1,'F'),(252,'Marita','Bulldog','amigable','2023-02-17',2,6,'F'),(253,'Rozamond','Bulldog','territorial','2023-07-20',6,5,'F'),(254,'Nanette',NULL,'juguetón','2023-06-19',18,7,'F'),(255,'Birdie','Persian','curioso','2023-07-25',13,2,'F'),(256,'Starr','Maine Coon','curioso','2023-06-09',14,1,'F'),(257,'Barnie',NULL,'juguetón','2023-06-11',18,5,'M'),(258,'Gregorius','Labrador Retriever','amigable','2022-11-11',6,3,'M'),(259,'Ashlie','Labrador Retriever','territorial','2023-06-07',12,6,'F'),(260,'Mitch','Labrador Retriever','juguetón','2023-02-23',17,4,'M'),(261,'Frasco','German Shepherd','curioso','2022-09-21',14,5,'M'),(262,'Aldous','Persian','amigable','2023-01-28',10,3,'M'),(263,'Haydon',NULL,'agresivo','2022-11-29',17,2,'M'),(264,'Brantley',NULL,'territorial','2023-06-21',4,6,'M'),(265,'Mona','Poodle','curioso','2023-01-31',20,3,'F'),(266,'Woodrow','Persian','amigable','2023-04-12',11,6,'M'),(267,'Sophie','German Shepherd','tímido','2023-07-06',12,3,'F'),(268,'Kelsi','German Shepherd','amigable','2022-09-19',18,7,'F'),(269,'Charlotte','Maine Coon','juguetón','2023-02-17',9,3,'F'),(270,'Trixie',NULL,'territorial','2023-03-19',20,6,'F'),(271,'Maurene',NULL,'amigable','2023-06-13',4,2,'F'),(272,'Hillary','German Shepherd','agresivo','2022-09-29',20,3,'F'),(273,'Sydney',NULL,'territorial','2023-05-10',2,2,'F'),(274,'Bruis','Persian','territorial','2023-04-15',8,5,'M'),(275,'Ruddie','Maine Coon','curioso','2023-06-08',15,2,'M'),(276,'Harlan','Maine Coon','agresivo','2022-10-22',6,6,'M'),(277,'Emalia','Persian','curioso','2022-11-06',14,7,'F'),(278,'Remus','German Shepherd','curioso','2023-05-23',7,2,'M'),(279,'Tam','Golden Retriever','territorial','2022-09-27',4,6,'M'),(280,'Gardner','Siamese','curioso','2023-07-07',19,4,'M'),(281,'Atlante','Poodle','tímido','2022-09-24',9,4,'F'),(282,'Jacintha','Siamese','territorial','2022-12-14',18,3,'F'),(283,'Karia','Bulldog','juguetón','2022-10-21',11,4,'F'),(284,'Meyer','Bulldog','amigable','2023-02-08',7,3,'M'),(285,'Heinrick',NULL,'juguetón','2022-08-28',10,1,'M'),(286,'Anthia','Persian','curioso','2023-07-02',7,5,'F'),(287,'Davidde','Persian','tímido','2022-12-18',15,2,'M'),(288,'Billie','Maine Coon','agresivo','2023-04-17',12,7,'M'),(289,'Gerald',NULL,'juguetón','2023-08-10',0,3,'M'),(290,'Daniella','Labrador Retriever','territorial','2022-11-26',0,3,'F'),(291,'Davis','Siamese','tímido','2022-11-19',19,1,'M'),(292,'Perren','Bulldog','tímido','2023-06-12',12,3,'M'),(293,'Ross','German Shepherd','curioso','2023-07-15',4,5,'M'),(294,'Augusto',NULL,'tímido','2023-01-11',12,6,'M'),(295,'Karol','German Shepherd','territorial','2023-03-17',18,3,'F'),(296,'Terri','Persian','curioso','2022-12-23',0,1,'M'),(297,'Bendick',NULL,'curioso','2023-07-01',10,7,'M'),(298,'Mahmud',NULL,'agresivo','2022-11-29',19,3,'M'),(299,'Dedra','Poodle','curioso','2022-09-16',18,5,'F'),(300,'Francois','Maine Coon','tímido','2023-02-06',7,4,'M'),(301,'Nellie',NULL,'agresivo','2023-03-06',5,2,'F'),(302,'Emmerich','Persian','territorial','2023-03-12',6,3,'M'),(303,'Siegfried','Poodle','curioso','2023-05-07',6,1,'M'),(304,'Ase',NULL,'curioso','2022-10-07',16,4,'M'),(305,'Deeann',NULL,'curioso','2023-02-16',9,1,'F'),(306,'Esmeralda',NULL,'amigable','2023-07-16',20,2,'F'),(307,'Tammy',NULL,'curioso','2023-06-19',11,2,'F'),(308,'Gerty',NULL,'tímido','2023-05-11',13,4,'F'),(309,'Michel','Poodle','juguetón','2022-10-04',0,2,'M'),(310,'Carlos','Bulldog','curioso','2023-05-29',1,3,'M'),(311,'Caralie',NULL,'agresivo','2023-07-25',4,3,'F'),(312,'Allianora','Golden Retriever','amigable','2022-09-30',6,2,'F'),(313,'Pete','Bulldog','curioso','2023-01-07',7,1,'M'),(314,'Weston','Bulldog','curioso','2022-12-15',15,4,'M'),(315,'Friederike','Golden Retriever','tímido','2023-06-22',16,6,'F'),(316,'Marchelle','Maine Coon','amigable','2023-06-11',10,7,'F'),(317,'Chrystel','Persian','juguetón','2023-03-22',8,1,'F'),(318,'Tandy','Labrador Retriever','amigable','2022-08-22',15,5,'F'),(319,'Jonell','German Shepherd','agresivo','2023-05-14',17,1,'F'),(320,'Bradford','Bulldog','agresivo','2022-12-10',1,1,'M'),(321,'Yule','Poodle','tímido','2022-09-25',14,6,'M'),(322,'Trefor','Maine Coon','amigable','2022-09-04',1,1,'M'),(323,'Fletcher','Poodle','amigable','2023-04-28',15,3,'M'),(324,'Even','Labrador Retriever','agresivo','2023-08-04',9,3,'M'),(325,'Chic','Labrador Retriever','juguetón','2023-06-03',12,7,'M'),(326,'Marleen','Poodle','territorial','2023-02-11',5,7,'F'),(327,'Clovis','Golden Retriever','curioso','2023-01-07',4,3,'F'),(328,'Renault','Golden Retriever','tímido','2023-01-15',5,1,'M'),(329,'Claudetta','Labrador Retriever','amigable','2022-12-15',16,3,'F'),(330,'Madison','Labrador Retriever','juguetón','2023-04-30',15,7,'M'),(331,'Gerrilee','Maine Coon','amigable','2023-07-29',1,2,'F'),(332,'Mikol',NULL,'tímido','2023-03-01',17,6,'M'),(333,'Upton','Siamese','amigable','2023-04-01',12,6,'M'),(334,'Benedict','Labrador Retriever','amigable','2023-04-18',3,5,'M'),(335,'Gloriane','Poodle','amigable','2023-02-14',6,7,'F'),(336,'Bartlet',NULL,'tímido','2023-02-08',15,5,'M'),(337,'Granville','Labrador Retriever','juguetón','2023-07-02',5,6,'M'),(338,'Lenore',NULL,'agresivo','2022-09-21',15,3,'F'),(339,'Emilee','Maine Coon','territorial','2022-10-03',11,3,'F'),(340,'Langston','Persian','curioso','2022-12-19',20,1,'M'),(341,'Carlin','German Shepherd','tímido','2023-02-06',19,6,'F'),(342,'Carolina','Maine Coon','amigable','2022-09-16',2,7,'F'),(343,'Lyman','Bulldog','juguetón','2022-11-23',2,5,'M'),(344,'Selia','German Shepherd','amigable','2023-06-14',20,7,'F'),(345,'Nana','Labrador Retriever','tímido','2023-05-01',8,4,'F'),(346,'Ignacio','Maine Coon','curioso','2023-04-27',13,7,'M'),(347,'Barn',NULL,'territorial','2022-10-30',7,4,'M'),(348,'Sari','Persian','tímido','2023-03-21',11,3,'F'),(349,'Corbet','Labrador Retriever','territorial','2023-07-19',17,4,'M'),(350,'Courtnay','Maine Coon','curioso','2023-01-08',3,2,'F'),(351,'Fairlie','Labrador Retriever','juguetón','2022-09-07',14,1,'M'),(352,'Ingeberg','Poodle','curioso','2023-04-01',11,2,'F'),(353,'Gayelord','Labrador Retriever','juguetón','2022-09-27',17,3,'M'),(354,'Shea','Labrador Retriever','territorial','2022-12-07',9,1,'F'),(355,'Emlen','Golden Retriever','amigable','2022-12-12',19,3,'M'),(356,'Corry','German Shepherd','curioso','2023-01-02',6,3,'F'),(357,'Hilda','Poodle','juguetón','2023-04-18',10,7,'F'),(358,'Pasquale','Labrador Retriever','amigable','2023-02-09',5,6,'M'),(359,'West',NULL,'curioso','2022-12-22',19,2,'M'),(360,'Frederica','Siamese','juguetón','2022-10-18',3,6,'F'),(361,'Lucinda',NULL,'juguetón','2023-01-24',15,3,'F'),(362,'Kristel','Siamese','curioso','2023-08-03',4,7,'F'),(363,'Archibold','Poodle','tímido','2023-01-21',15,1,'M'),(364,'Brod',NULL,'territorial','2023-06-29',18,4,'M'),(365,'Keely','Maine Coon','tímido','2022-09-15',13,7,'F'),(366,'Salvatore','Maine Coon','juguetón','2023-05-19',8,4,'M'),(367,'Bucky',NULL,'agresivo','2023-05-05',14,7,'M'),(368,'Tommi','Maine Coon','juguetón','2023-04-18',2,3,'F'),(369,'Delainey','Poodle','tímido','2023-05-12',2,3,'M'),(370,'Lynnette',NULL,'juguetón','2022-10-05',8,3,'F'),(371,'Delbert','Bulldog','territorial','2023-02-14',11,5,'M'),(372,'Rockwell','Labrador Retriever','agresivo','2023-04-02',18,5,'M'),(373,'Gris','Bulldog','agresivo','2023-03-18',3,1,'M'),(374,'Euphemia','Siamese','tímido','2022-12-20',19,3,'F'),(375,'Brig','German Shepherd','curioso','2022-12-27',19,7,'M'),(376,'Kayle','Poodle','curioso','2022-11-26',9,7,'F'),(377,'Shelley','Poodle','territorial','2023-01-19',11,4,'M'),(378,'Ivory',NULL,'amigable','2023-02-08',14,2,'F'),(379,'Lynnett','Labrador Retriever','agresivo','2023-06-04',14,5,'F'),(380,'Clementius','Labrador Retriever','amigable','2023-07-03',1,4,'M'),(381,'Ingeberg','Bulldog','tímido','2023-04-23',15,5,'F'),(382,'Tally','Poodle','territorial','2023-04-24',3,6,'M'),(383,'Ford',NULL,'tímido','2022-09-26',7,3,'M'),(384,'Elwira','Siamese','agresivo','2022-09-09',11,7,'F'),(385,'Ardyce','Golden Retriever','territorial','2023-05-05',18,2,'F'),(386,'Normie','Persian','curioso','2023-02-15',11,3,'M'),(387,'Farrand','German Shepherd','amigable','2023-06-02',3,6,'F'),(388,'Ignacio',NULL,'amigable','2023-04-04',1,5,'M'),(389,'Sebastian',NULL,'tímido','2023-03-14',8,3,'M'),(390,'Halie','Siamese','curioso','2023-04-29',0,2,'F'),(391,'Dom','Persian','tímido','2023-03-25',4,2,'M'),(392,'Jeffy','Labrador Retriever','curioso','2023-02-13',10,1,'M'),(393,'Whitney','Siamese','tímido','2022-09-05',17,4,'M'),(394,'Selia',NULL,'curioso','2022-10-16',4,4,'F'),(395,'Davidde','Persian','tímido','2022-11-04',6,6,'M'),(396,'Sandi','Siamese','tímido','2022-10-12',20,5,'F'),(397,'Lucienne',NULL,'amigable','2022-11-13',17,7,'F'),(398,'Rockwell','Maine Coon','tímido','2022-09-25',11,5,'M'),(399,'Cathy',NULL,'juguetón','2023-05-01',1,2,'F'),(400,'Nickolaus','Poodle','agresivo','2022-09-19',12,7,'M'),(401,'Malvin','German Shepherd','amigable','2022-10-03',16,7,'M'),(402,'Dulcine','Golden Retriever','amigable','2023-07-10',4,5,'F'),(403,'Felicle',NULL,'territorial','2023-01-05',6,3,'F'),(404,'Celeste',NULL,'territorial','2023-07-02',15,4,'F'),(405,'Kelley',NULL,'agresivo','2022-09-07',1,4,'M'),(406,'Curt','Labrador Retriever','juguetón','2022-11-20',20,2,'M'),(407,'Isabel','Persian','juguetón','2022-08-19',6,4,'F'),(408,'Bambi',NULL,'agresivo','2023-07-11',3,7,'F'),(409,'Nady','Maine Coon','curioso','2023-02-06',14,6,'F'),(410,'Robin','Siamese','amigable','2023-05-14',17,3,'F'),(411,'Loise',NULL,'territorial','2023-07-20',18,2,'F'),(412,'Halsey','Siamese','territorial','2023-07-19',9,4,'M'),(413,'Giorgia','German Shepherd','territorial','2023-06-15',0,7,'F'),(414,'Silvanus','Siamese','juguetón','2023-01-16',17,5,'M'),(415,'Stavro',NULL,'tímido','2023-03-28',6,5,'M'),(416,'Leah','Maine Coon','agresivo','2023-05-28',18,1,'F'),(417,'Neville',NULL,'agresivo','2023-02-12',18,5,'M'),(418,'Ted','Siamese','agresivo','2023-07-31',5,2,'F'),(419,'Ursula','Persian','curioso','2022-12-24',9,5,'F'),(420,'Ginni','German Shepherd','territorial','2022-12-07',17,4,'F'),(421,'Florenza','Labrador Retriever','amigable','2023-05-08',0,7,'F'),(422,'Cedric','Labrador Retriever','juguetón','2023-03-06',17,1,'M'),(423,'Grange','Siamese','territorial','2023-03-28',1,2,'M'),(424,'Craig','German Shepherd','territorial','2022-09-10',14,5,'M'),(425,'Bertie','Poodle','agresivo','2023-04-02',11,6,'F'),(426,'Briana','Siamese','territorial','2022-12-14',19,2,'F'),(427,'Hali',NULL,'agresivo','2022-09-24',10,2,'F'),(428,'Ham','Siamese','amigable','2022-11-17',6,4,'M'),(429,'Byron','German Shepherd','juguetón','2023-03-14',7,4,'M'),(430,'Gerda','Labrador Retriever','juguetón','2022-10-05',9,6,'F'),(431,'Robina','Persian','agresivo','2023-05-18',18,2,'F'),(432,'Agace','Golden Retriever','amigable','2023-01-14',9,1,'F'),(433,'Willette','Poodle','tímido','2022-11-13',4,7,'F'),(434,'Ashli','Bulldog','amigable','2023-06-26',15,4,'F'),(435,'Brandea','German Shepherd','territorial','2023-01-27',10,1,'F'),(436,'Fritz',NULL,'tímido','2023-04-22',10,4,'M'),(437,'Mireille','Poodle','curioso','2022-09-14',19,3,'F'),(438,'Lynnelle','Siamese','juguetón','2023-07-02',20,1,'F'),(439,'Quillan','Bulldog','juguetón','2023-01-21',17,1,'M'),(440,'Jacquenette',NULL,'agresivo','2023-05-01',1,6,'F'),(441,'Berti','Labrador Retriever','agresivo','2023-04-17',20,7,'F'),(442,'Whitby','Golden Retriever','amigable','2022-11-06',10,7,'M'),(443,'Marjorie',NULL,'curioso','2023-03-24',8,7,'F'),(444,'Enrika','Poodle','tímido','2022-11-14',19,6,'F'),(445,'Donalt','Golden Retriever','territorial','2023-02-13',6,2,'M'),(446,'Chen',NULL,'territorial','2023-02-24',9,5,'M'),(447,'Ikey',NULL,'tímido','2023-02-23',0,4,'M'),(448,'Arley',NULL,'tímido','2023-04-26',6,4,'M'),(449,'Eugine','Golden Retriever','amigable','2023-03-22',8,4,'F'),(450,'Barbabra',NULL,'amigable','2023-04-09',18,2,'F'),(451,'Ailis','Labrador Retriever','agresivo','2023-03-14',11,3,'F'),(452,'Torrin','Siamese','agresivo','2023-05-03',10,4,'M'),(453,'Bordie','Labrador Retriever','agresivo','2023-07-26',1,3,'M'),(454,'Rad','Maine Coon','agresivo','2023-01-13',4,7,'M'),(455,'Hastie','Labrador Retriever','curioso','2023-03-01',0,3,'M'),(456,'Harbert','Bulldog','territorial','2022-09-19',2,5,'M'),(457,'Mickey','Bulldog','juguetón','2023-05-12',14,1,'M'),(458,'Alasteir',NULL,'amigable','2023-08-05',11,7,'M'),(459,'Lonny','Labrador Retriever','territorial','2023-01-31',8,6,'M'),(460,'Celestine','Poodle','territorial','2022-11-23',11,2,'F'),(461,'Caleb','Siamese','tímido','2022-12-09',20,5,'M'),(462,'Tristan','Golden Retriever','territorial','2022-12-12',0,2,'M'),(463,'Emelen','German Shepherd','territorial','2022-08-22',15,6,'M'),(464,'Cassaundra',NULL,'tímido','2023-08-02',17,7,'F'),(465,'Conrado','Poodle','curioso','2022-12-09',8,6,'M'),(466,'Julianna','Persian','tímido','2022-12-29',10,1,'F'),(467,'Libbi','Labrador Retriever','amigable','2022-08-23',12,3,'F'),(468,'Tades','Poodle','curioso','2023-05-08',7,2,'M'),(469,'Ole',NULL,'territorial','2022-12-11',20,1,'M'),(470,'Ferne',NULL,'curioso','2022-10-16',12,5,'F'),(471,'Ed','German Shepherd','territorial','2022-12-26',1,5,'M'),(472,'Noel',NULL,'agresivo','2022-08-22',0,4,'F'),(473,'Tabbi','Persian','territorial','2023-04-01',3,6,'F'),(474,'Kalie','German Shepherd','agresivo','2022-10-19',15,3,'F'),(475,'Geoffry','Golden Retriever','agresivo','2023-07-02',18,6,'M'),(476,'Glenden','Labrador Retriever','agresivo','2022-09-13',3,1,'M'),(477,'Carmine','Labrador Retriever','curioso','2023-05-14',3,1,'F'),(478,'Crystie','German Shepherd','agresivo','2023-04-26',12,6,'F'),(479,'Pavia',NULL,'curioso','2023-04-11',8,7,'F'),(480,'Tabby','Maine Coon','curioso','2023-08-10',13,1,'M'),(481,'Richart','Labrador Retriever','agresivo','2022-11-01',8,6,'M'),(482,'Nigel','Maine Coon','juguetón','2022-12-28',12,7,'M'),(483,'Meara',NULL,'tímido','2023-01-24',8,5,'F'),(484,'Electra','Golden Retriever','amigable','2023-02-03',9,6,'F'),(485,'Allard','Maine Coon','amigable','2023-06-23',9,3,'M'),(486,'Toby',NULL,'juguetón','2022-10-03',9,6,'M'),(487,'Herculie','Labrador Retriever','curioso','2023-01-28',20,1,'M'),(488,'Lurlene','Persian','territorial','2022-09-22',5,1,'F'),(489,'Sibel','Labrador Retriever','territorial','2022-11-17',8,2,'F'),(490,'Armand',NULL,'tímido','2022-11-11',10,6,'M'),(491,'Avram','Poodle','juguetón','2023-05-18',17,3,'M'),(492,'Mia','Golden Retriever','tímido','2023-03-15',8,3,'F'),(493,'Zita','Poodle','territorial','2023-06-01',17,1,'F'),(494,'Barrett','Labrador Retriever','curioso','2023-03-07',12,7,'M'),(495,'Moise','German Shepherd','juguetón','2023-06-10',0,3,'M'),(496,'Giuseppe','Labrador Retriever','curioso','2023-04-13',8,4,'M'),(497,'Jaclyn','Maine Coon','amigable','2023-01-13',0,3,'F'),(498,'Brinn','Persian','agresivo','2023-03-13',11,4,'F'),(499,'Kory','Siamese','tímido','2023-07-18',10,2,'M'),(500,'Dorothee','Persian','juguetón','2022-11-26',13,7,'F');
/*!40000 ALTER TABLE `animales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_animales` BEFORE UPDATE ON `animales` FOR EACH ROW INSERT INTO before_logs_animales_ests (id_animal, id_estado, usuario, fecha_modificacion, hora_modificacion)
    VALUES (OLD.id_animal, OLD.id_estado, USER(), CURDATE(), CURTIME()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_animal_edad` AFTER UPDATE ON `animales` FOR EACH ROW INSERT INTO after_logs_animales_edad (id_animal, edad_estimada_animal, usuario, fecha_modificacion, hora_modificacion)
VALUES (NEW.id_animal, NEW.edad_estimada_animal, USER(), CURDATE(), CURTIME()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `animales_estados`
--

DROP TABLE IF EXISTS `animales_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animales_estados` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `descripcion_estado` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animales_estados`
--

LOCK TABLES `animales_estados` WRITE;
/*!40000 ALTER TABLE `animales_estados` DISABLE KEYS */;
INSERT INTO `animales_estados` VALUES (1,'sano'),(2,'enfermo'),(3,'herido'),(4,'recuperándose'),(5,'activo'),(6,'en tratamiento'),(7,'fallecido');
/*!40000 ALTER TABLE `animales_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `animales_sin_raza`
--

DROP TABLE IF EXISTS `animales_sin_raza`;
/*!50001 DROP VIEW IF EXISTS `animales_sin_raza`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `animales_sin_raza` AS SELECT 
 1 AS `id_animal`,
 1 AS `nombre_animal`,
 1 AS `raza_animal`,
 1 AS `descripcion`,
 1 AS `fecha_ingreso`,
 1 AS `edad_estimada_animal`,
 1 AS `id_estado`,
 1 AS `sexo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `before_logs_animales_ests`
--

DROP TABLE IF EXISTS `before_logs_animales_ests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `before_logs_animales_ests` (
  `id_animal` int DEFAULT NULL,
  `usuario` varchar(60) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `hora_modificacion` time DEFAULT NULL,
  `id_estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `before_logs_animales_ests`
--

LOCK TABLES `before_logs_animales_ests` WRITE;
/*!40000 ALTER TABLE `before_logs_animales_ests` DISABLE KEYS */;
INSERT INTO `before_logs_animales_ests` VALUES (3,'root@localhost','2023-09-07','00:00:00',2),(2,'root@localhost','2023-09-07','00:00:00',4);
/*!40000 ALTER TABLE `before_logs_animales_ests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `before_logs_responsables`
--

DROP TABLE IF EXISTS `before_logs_responsables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `before_logs_responsables` (
  `id_responsable` int DEFAULT NULL,
  `id_animal` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `usuario` varchar(60) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `hora_modificacion` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `before_logs_responsables`
--

LOCK TABLES `before_logs_responsables` WRITE;
/*!40000 ALTER TABLE `before_logs_responsables` DISABLE KEYS */;
INSERT INTO `before_logs_responsables` VALUES (58,222,22,'root@localhost','2023-09-07','23:20:59'),(57,21,5,'root@localhost','2023-09-09','10:49:24');
/*!40000 ALTER TABLE `before_logs_responsables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_producto` int NOT NULL,
  `tipo_compra` varchar(200) DEFAULT NULL,
  `cantidad` float NOT NULL,
  `fecha_compra` date NOT NULL,
  `precio_unitario` float NOT NULL,
  `monto_impositivo` float NOT NULL,
  `monto_total` float DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'Correa',34,'2023-08-16',42508.5,518.14,43026.6),(2,'Juguetes',30,'2024-03-30',68308.3,780.92,69089.2),(3,'Juguetes',47,'2023-09-22',13635,137.73,13772.8),(4,'Potes de comida',45,'2023-09-24',13105.4,552.72,13658.1),(5,'Gasto Veterinario',31,'2023-12-03',36475,558.46,37033.5),(6,'Pañales',53,'2024-03-06',59129.4,898.11,60027.5),(7,'Gasto Veterinario',53,'2023-01-16',45220,611.01,45831),(8,'Potes de agua',91,'2023-12-23',75143.6,660.77,75804.3),(9,'Cama',20,'2022-12-27',67605.1,196.57,67801.7),(10,'Potes de agua',9,'2024-06-22',26564.2,734.75,NULL),(11,'Gasto Veterinario',66,'2024-02-23',71688.9,151.12,NULL),(12,'Collar',62,'2024-06-21',45691.5,358.58,NULL),(13,'Potes de comida',60,'2024-02-06',51946.8,575.13,NULL),(14,'Correa',7,'2023-12-07',23195,758.4,NULL),(15,'Gasto Veterinario',44,'2023-06-11',46724.6,351.91,NULL),(16,'Cuchas',41,'2024-05-17',22144.6,231.33,NULL),(17,'Cuchas',20,'2024-02-06',63684.9,162.86,NULL),(18,'Pañales',82,'2022-11-24',8823.16,309.71,NULL),(19,'Pañales',38,'2023-07-27',21734.2,932.53,NULL),(20,'Potes de agua',99,'2023-12-08',58766.8,723.63,NULL),(21,'Cuchas',2,'2023-06-16',44228.1,237.77,NULL),(22,'Cama',49,'2022-12-23',30670.4,991.89,NULL),(23,'Juguetes',71,'2024-05-18',43437.4,617.84,NULL),(24,'Gasto Veterinario',96,'2023-03-04',61917.1,612.44,NULL),(25,'Juguetes',29,'2023-01-11',70438.1,758.63,NULL),(26,'Comida',22,'2022-08-20',75116,773,NULL),(27,'Cuchas',94,'2023-08-14',14715.9,392.3,NULL),(28,'Comida',93,'2024-02-01',23332.4,747.3,NULL),(29,'Pañales',41,'2024-02-28',38839.4,491.73,NULL),(30,'Comida',32,'2023-11-29',60084.1,557.62,NULL),(31,'Pañales',71,'2024-02-14',67316.4,222.36,NULL),(32,'Correa',66,'2022-10-30',60913.3,266.02,NULL),(33,'Collar',50,'2024-07-27',52684.6,477.71,NULL),(34,'Collar',36,'2023-12-12',59873,699.86,NULL),(35,'Potes de agua',33,'2023-05-30',33037.2,262.69,NULL),(36,'Potes de comida',45,'2022-10-20',53754.7,539.66,NULL),(37,'Correa',10,'2023-04-16',19806,692.03,NULL),(38,'Potes de agua',12,'2023-10-04',37147.6,379.48,NULL),(39,'Comida',9,'2024-05-20',20496.1,674.2,NULL),(40,'Potes de comida',65,'2023-09-13',57704.5,735.01,NULL),(41,'Pañales',39,'2024-05-14',5329.26,515.75,NULL),(42,'Cama',32,'2024-03-13',14681.8,867.81,NULL),(43,'Potes de comida',92,'2024-04-30',61649,730.96,NULL),(44,'Cama',86,'2023-11-03',29105.9,25.43,NULL),(45,'Juguetes',91,'2022-11-04',19101.4,490.28,NULL),(46,'Potes de comida',57,'2023-03-02',59383.9,423.01,NULL),(47,'Correa',58,'2023-07-14',23607.3,761.43,NULL),(48,'Potes de comida',55,'2024-07-11',42663.1,330.28,NULL),(49,'Comida',83,'2024-07-21',15805.2,702.82,NULL),(50,'Juguetes',30,'2024-05-11',18561.6,593.13,NULL),(51,'Gasto Veterinario',22,'2022-09-12',64808.3,759.26,NULL),(52,'Collar',17,'2023-06-09',16113.8,733.29,NULL),(53,'Potes de agua',78,'2023-01-30',36579.9,285.17,NULL),(54,'Gasto Veterinario',2,'2024-08-13',7538.66,781.85,NULL),(55,'Juguetes',16,'2024-03-14',6076.65,567.12,NULL),(56,'Potes de comida',97,'2023-03-31',14997.2,914.1,NULL),(57,'Cama',10,'2023-06-24',67824.9,613.31,NULL),(58,'Correa',33,'2024-03-03',51851.4,53.46,NULL),(59,'Comida',14,'2024-04-09',8899.94,269.74,NULL),(60,'Cuchas',46,'2023-07-01',61370.4,553.83,NULL),(61,'Comida',45,'2024-03-21',25963.1,26.4,NULL),(62,'Collar',63,'2023-09-16',74087.6,853.64,NULL),(63,'Correa',3,'2023-11-02',5069.71,641.89,NULL),(64,'Pañales',42,'2024-05-31',48072.4,700.99,NULL),(65,'Gasto Veterinario',66,'2023-02-21',46772.2,918.11,NULL),(66,'Gasto Veterinario',21,'2023-02-22',65430.9,599.84,NULL),(67,'Gasto Veterinario',21,'2023-07-04',64606.3,57.73,NULL),(68,'Gasto Veterinario',60,'2022-12-29',66286.5,40.2,NULL),(69,'Correa',54,'2024-07-12',79338.7,626.28,NULL),(70,'Cuchas',54,'2023-02-05',74424.1,871.92,NULL),(71,'Cuchas',44,'2023-07-13',43502.3,612.81,NULL),(72,'Comida',19,'2024-03-27',74617.9,861.07,NULL),(73,'Juguetes',27,'2023-03-03',6368.96,310.6,NULL),(74,'Potes de agua',38,'2023-11-23',72102.7,304.79,NULL),(75,'Potes de agua',90,'2022-12-05',40516.2,123.05,NULL),(76,'Pañales',87,'2023-04-10',26162.7,719.98,NULL),(77,'Comida',38,'2023-10-03',34046.4,675.84,NULL),(78,'Potes de comida',13,'2023-10-11',34572.4,24.74,NULL),(79,'Collar',8,'2022-12-18',5894.59,299.47,NULL),(80,'Comida',78,'2023-08-03',29556.3,749.24,NULL),(81,'Potes de comida',72,'2023-10-04',6190.78,681.02,NULL),(82,'Gasto Veterinario',57,'2023-07-16',29173.6,593.15,NULL),(83,'Potes de comida',44,'2023-07-19',15596.9,562.71,NULL),(84,'Pañales',1,'2023-01-22',74468.1,535.1,NULL),(85,'Pañales',95,'2024-04-26',32559.3,699.54,NULL),(86,'Cuchas',40,'2023-05-26',65156.4,962.19,NULL),(87,'Cuchas',66,'2023-08-04',58274.3,336.74,NULL),(88,'Cama',13,'2023-01-25',52976.7,881.07,NULL),(89,'Comida',95,'2024-03-21',56808,887.12,NULL),(90,'Gasto Veterinario',39,'2023-03-18',49042.3,47.47,NULL),(91,'Correa',90,'2024-08-12',35594.9,821.21,NULL),(92,'Correa',6,'2022-09-08',10362.6,957.07,NULL),(93,'Juguetes',26,'2023-01-15',30154.1,459.32,NULL),(94,'Comida',27,'2023-12-20',54306.3,535.28,NULL),(95,'Cama',60,'2024-01-17',33779.5,718.45,NULL),(96,'Gasto Veterinario',82,'2023-07-06',61555.3,533.83,NULL),(97,'Correa',16,'2022-10-10',29049.4,690.51,NULL),(98,'Potes de comida',26,'2022-09-16',45643,45.06,NULL),(99,'Cama',38,'2023-04-04',44690.8,731.75,NULL),(100,'Correa',64,'2023-05-25',73728.1,43.63,NULL),(101,'Cama',44,'2022-11-11',27775.1,256.88,NULL),(102,'Correa',10,'2023-04-24',79009.1,562.41,NULL),(103,'Cama',50,'2024-05-08',43433.1,832.65,NULL),(104,'Gasto Veterinario',39,'2023-02-05',25634.4,485.1,NULL),(105,'Potes de agua',28,'2024-02-02',19041.1,739.55,NULL),(106,'Comida',34,'2024-06-27',35301.2,28.42,NULL),(107,'Potes de agua',84,'2022-10-22',42013,193.61,NULL),(108,'Gasto Veterinario',25,'2024-02-11',31921.6,311.61,NULL),(109,'Collar',81,'2023-08-02',46566.5,157.55,NULL),(110,'Comida',98,'2023-01-19',20347.5,479,NULL),(111,'Potes de agua',31,'2024-02-29',68551.9,98.41,NULL),(112,'Juguetes',65,'2024-06-09',52332.8,325.48,NULL),(113,'Potes de agua',81,'2023-01-19',23791.2,518.79,NULL),(114,'Pañales',92,'2023-12-30',33017.3,409.87,NULL),(115,'Correa',86,'2022-12-20',9396.7,212.51,NULL),(116,'Potes de agua',6,'2022-12-07',33419.4,462.98,NULL),(117,'Gasto Veterinario',94,'2022-12-05',74723.4,696.94,NULL),(118,'Comida',12,'2022-09-23',38349.2,44.92,NULL),(119,'Potes de agua',97,'2023-02-27',7238.23,712.75,NULL),(120,'Comida',36,'2022-09-04',34155.1,48.3,NULL),(121,'Potes de agua',44,'2024-07-02',58385.6,278.68,NULL),(122,'Potes de comida',34,'2022-08-24',75813.3,904.56,NULL),(123,'Pañales',59,'2024-08-09',33732.6,638.59,NULL),(124,'Correa',7,'2023-05-15',27237.3,626.56,NULL),(125,'Gasto Veterinario',99,'2024-07-15',31192.8,918.64,NULL),(126,'Collar',17,'2022-10-05',75551.8,384.16,NULL),(127,'Cama',99,'2023-01-06',27861.5,912.46,NULL),(128,'Pañales',76,'2024-05-10',71858.8,397.32,NULL),(129,'Comida',66,'2023-03-17',72660.7,656.28,NULL),(130,'Juguetes',35,'2023-01-08',68795,352.11,NULL),(131,'Correa',46,'2023-12-26',48898.2,869.27,NULL),(132,'Juguetes',47,'2024-03-29',28893.3,121.26,NULL),(133,'Collar',5,'2023-04-11',13933,362.78,NULL),(134,'Correa',57,'2023-03-09',41993.6,12.17,NULL),(135,'Potes de agua',100,'2023-05-03',69561.5,634.21,NULL),(136,'Collar',59,'2023-05-08',35555.8,444.07,NULL),(137,'Potes de comida',99,'2024-02-06',64137.8,550.65,64688.5),(138,'Cuchas',60,'2023-08-11',42441.4,494.45,NULL),(139,'Pañales',47,'2023-06-30',77578,94.04,NULL),(140,'Collar',84,'2024-07-21',79908.2,977.99,NULL),(141,'Potes de agua',26,'2022-12-30',31078.7,243.99,NULL),(142,'Gasto Veterinario',31,'2024-05-31',24416.4,677.01,NULL),(143,'Potes de comida',76,'2023-01-09',43322,736.92,NULL),(144,'Cuchas',58,'2024-06-22',8501.74,383.49,NULL),(145,'Gasto Veterinario',52,'2024-03-22',60621.3,882.53,NULL),(146,'Cama',78,'2024-07-02',77539.1,868.18,NULL),(147,'Gasto Veterinario',31,'2023-08-28',71964.9,411.96,NULL),(148,'Cama',7,'2024-02-25',55439,501.36,NULL),(149,'Juguetes',46,'2023-02-11',26957.8,601.54,NULL),(150,'Potes de comida',12,'2023-07-05',18096.1,720.27,NULL),(151,'Potes de agua',43,'2023-11-10',48128.6,848.14,NULL),(152,'Juguetes',3,'2023-06-06',8229.12,860.85,NULL),(153,'Correa',34,'2023-04-08',75095.5,241.35,NULL),(154,'Correa',50,'2023-02-10',26130.2,403.77,NULL),(155,'Cama',37,'2023-08-09',64151.1,280.26,NULL),(156,'Cama',87,'2023-02-10',15928.1,985.44,NULL),(157,'Potes de comida',94,'2023-04-18',67075.1,197.56,NULL),(158,'Cuchas',51,'2023-03-21',11164.1,26.36,NULL),(159,'Potes de agua',18,'2022-11-01',38515.8,617.52,NULL),(160,'Potes de agua',17,'2022-11-22',17725.8,512.17,NULL),(161,'Potes de comida',80,'2022-12-19',18345.5,676.33,NULL),(162,'Correa',56,'2023-05-15',65001.4,475.44,NULL),(163,'Gasto Veterinario',92,'2023-12-26',24684.6,624.58,NULL),(164,'Collar',7,'2023-07-12',17554,655.59,NULL),(165,'Potes de comida',89,'2024-01-24',17698.5,982.53,NULL),(166,'Cuchas',83,'2023-06-08',23978.4,596.49,NULL),(167,'Gasto Veterinario',63,'2023-06-04',51743.6,454.85,NULL),(168,'Correa',51,'2023-12-11',39441.9,623.26,NULL),(169,'Juguetes',89,'2024-03-13',31258.1,86.31,NULL),(170,'Juguetes',62,'2022-11-08',29983.9,975.76,NULL),(171,'Gasto Veterinario',17,'2023-01-19',42814,707.95,NULL),(172,'Collar',12,'2024-03-13',44963.1,408.02,NULL),(173,'Cuchas',79,'2023-07-04',76386.5,181.74,NULL),(174,'Correa',12,'2024-01-26',35892.5,10.15,NULL),(175,'Juguetes',11,'2023-12-03',37830.7,97.49,NULL),(176,'Comida',43,'2022-11-21',37352.5,104.78,NULL),(177,'Potes de agua',6,'2023-05-23',59384.6,696.6,NULL),(178,'Pañales',11,'2023-05-13',11533.6,343.53,NULL),(179,'Juguetes',80,'2023-10-09',54377.5,184.34,NULL),(180,'Gasto Veterinario',79,'2024-06-01',7773.2,871.72,NULL),(181,'Cuchas',74,'2023-04-27',23468.6,557.29,NULL),(182,'Collar',65,'2023-03-14',46136,940.57,NULL),(183,'Juguetes',57,'2023-09-07',41959.7,577.68,NULL),(184,'Pañales',9,'2022-12-26',78016.3,351.21,NULL),(185,'Gasto Veterinario',93,'2024-02-06',25884.2,577.52,NULL),(186,'Potes de agua',25,'2022-11-08',37434.5,569.09,NULL),(187,'Potes de comida',8,'2024-01-20',48217.4,688.85,NULL),(188,'Potes de agua',59,'2023-07-23',8955.99,645.8,NULL),(189,'Comida',25,'2022-10-22',21445.9,921.75,NULL),(190,'Cama',23,'2024-06-11',12606.8,602.7,NULL),(191,'Collar',38,'2023-09-04',79614.3,741.8,NULL),(192,'Pañales',73,'2022-09-21',14715.1,242.39,NULL),(193,'Comida',48,'2023-08-14',35044.4,278.47,NULL),(194,'Pañales',12,'2024-07-13',40345.7,803.51,NULL),(195,'Juguetes',3,'2022-09-06',16406.4,409.02,NULL),(196,'Potes de comida',20,'2024-05-31',16165.7,430.23,NULL),(197,'Cama',7,'2023-04-09',55009.9,8.9,NULL),(198,'Pañales',97,'2023-12-19',47792.1,659.15,NULL),(199,'Potes de comida',31,'2022-10-24',24818.8,201.45,NULL),(200,'Comida',28,'2024-05-14',65073.3,131.24,NULL),(201,'Gasto Veterinario',37,'2024-01-18',72562.3,49.02,NULL),(202,'Cuchas',33,'2024-04-28',48872.1,841.92,NULL),(203,'Potes de comida',43,'2024-04-03',6641.95,640.17,NULL),(204,'Potes de comida',61,'2024-04-08',45447.3,227.23,NULL),(205,'Gasto Veterinario',54,'2023-11-23',38533.4,101.97,NULL),(206,'Collar',83,'2023-04-29',64604.9,261.08,NULL),(207,'Cuchas',70,'2022-10-08',35778.2,4.12,NULL),(208,'Juguetes',80,'2024-07-25',15029.9,522.72,NULL),(209,'Juguetes',56,'2023-06-23',52301.1,925.22,NULL),(210,'Correa',92,'2023-07-26',43991.7,845.4,NULL),(211,'Correa',5,'2022-11-06',25463.7,730.84,NULL),(212,'Potes de agua',72,'2023-12-01',13653.2,272.2,NULL),(213,'Juguetes',43,'2023-04-10',46429.1,964.71,NULL),(214,'Potes de agua',81,'2022-08-27',36650.9,805.48,NULL),(215,'Comida',98,'2022-11-27',27027.6,500.32,NULL),(216,'Gasto Veterinario',97,'2022-11-24',78222.6,841.82,NULL),(217,'Correa',50,'2024-04-17',53706.6,249.77,NULL),(218,'Collar',98,'2024-07-23',27361.4,803.49,NULL),(219,'Cuchas',72,'2023-01-16',70360.7,575.74,NULL),(220,'Potes de comida',88,'2023-05-21',76905.5,791.72,NULL),(221,'Juguetes',9,'2024-06-12',75144.1,941.24,NULL),(222,'Juguetes',52,'2022-11-11',49145.2,874.79,NULL),(223,'Pañales',41,'2023-07-09',47908.6,842.66,NULL),(224,'Cama',11,'2024-07-13',53691.1,376.25,NULL),(225,'Comida',72,'2022-10-10',61289.8,918.1,NULL),(226,'Correa',36,'2023-07-06',40319.7,662.22,NULL),(227,'Gasto Veterinario',66,'2024-07-04',44428.2,230.62,NULL),(228,'Juguetes',43,'2024-05-26',49300.4,230.82,NULL),(229,'Cama',25,'2023-06-14',62698.9,325.74,NULL),(230,'Pañales',62,'2024-05-03',17374.3,748.38,NULL),(231,'Cama',91,'2023-04-26',8152.22,183.1,NULL),(232,'Gasto Veterinario',60,'2023-05-25',65752.1,183.04,NULL),(233,'Correa',58,'2023-10-04',40674.1,55.04,NULL),(234,'Juguetes',81,'2023-12-18',28082,478.94,NULL),(235,'Potes de agua',83,'2023-12-25',79476.5,819.97,NULL),(236,'Juguetes',6,'2023-08-25',64997,814.28,NULL),(237,'Potes de agua',74,'2023-07-28',77612.5,789.12,NULL),(238,'Juguetes',76,'2024-01-06',28588.8,616.57,NULL),(239,'Cuchas',94,'2023-07-29',53029.2,305.68,NULL),(240,'Potes de comida',43,'2022-12-04',63473,897.71,NULL),(241,'Comida',27,'2023-10-10',74977,183.74,NULL),(242,'Juguetes',33,'2022-09-06',44342,807.51,NULL),(243,'Comida',58,'2023-01-14',47790.9,991.84,NULL),(244,'Gasto Veterinario',4,'2023-01-24',10820.1,584.3,NULL),(245,'Correa',25,'2022-12-28',41479.3,963.76,NULL),(246,'Comida',35,'2024-02-10',44855.1,511.91,NULL),(247,'Potes de agua',74,'2024-02-10',25589.1,832.46,NULL),(248,'Cuchas',55,'2023-12-31',14676.8,116.42,NULL),(249,'Potes de agua',8,'2024-01-11',68933.4,579.84,NULL),(250,'Collar',57,'2022-11-14',46623.1,72.74,NULL),(251,'Comida',74,'2023-08-04',29171.6,425.03,NULL),(252,'Potes de agua',38,'2023-10-31',5299.51,894.97,NULL),(253,'Juguetes',28,'2024-06-04',7473.71,139.14,NULL),(254,'Correa',57,'2023-06-17',69564.4,471.31,NULL),(255,'Comida',67,'2023-01-03',12512.3,536.29,NULL),(256,'Juguetes',94,'2023-11-20',13354.9,597.63,NULL),(257,'Pañales',27,'2023-05-14',37697.1,528.68,NULL),(258,'Cuchas',6,'2023-08-19',77154.8,515.53,NULL),(259,'Potes de comida',39,'2024-04-14',13384,328.05,NULL),(260,'Juguetes',20,'2022-09-16',61365.1,336.61,NULL),(261,'Potes de agua',91,'2023-01-10',76736.2,795.26,NULL),(262,'Correa',58,'2023-01-04',54177.3,978.34,NULL),(263,'Pañales',76,'2023-04-19',59113.4,659.81,NULL),(264,'Cuchas',89,'2023-11-08',62850.9,657.74,NULL),(265,'Correa',22,'2024-07-06',59248.2,324.91,NULL),(266,'Cuchas',30,'2023-06-05',77561.6,747.52,NULL),(267,'Pañales',80,'2022-10-10',52823.1,153.48,NULL),(268,'Comida',69,'2023-08-27',68936.7,22.68,NULL),(269,'Collar',100,'2023-01-06',25919.6,889.26,NULL),(270,'Potes de agua',72,'2022-10-11',75203.8,114.17,NULL),(271,'Gasto Veterinario',16,'2024-02-24',28404.6,793.01,NULL),(272,'Correa',87,'2022-11-05',21096.2,748.02,NULL),(273,'Pañales',12,'2024-03-16',72784.8,365.92,NULL),(274,'Gasto Veterinario',50,'2023-11-28',62992.2,824.5,NULL),(275,'Comida',100,'2023-07-03',40798.8,177.45,NULL),(276,'Cuchas',84,'2024-05-17',32740.6,621.66,NULL),(277,'Collar',5,'2023-04-27',61208.7,71.41,NULL),(278,'Comida',82,'2022-12-06',46254.4,91.76,NULL),(279,'Potes de agua',12,'2023-05-31',18247.1,866.49,NULL),(280,'Potes de comida',22,'2024-05-24',11160,205.21,NULL),(281,'Juguetes',16,'2023-05-02',50930.5,761.04,NULL),(282,'Potes de agua',53,'2023-12-17',55966,965.6,NULL),(283,'Gasto Veterinario',25,'2024-08-08',77028.8,884.15,NULL),(284,'Pañales',37,'2024-01-06',67100,230.8,NULL),(285,'Collar',44,'2022-10-22',60791.9,401.76,NULL),(286,'Collar',91,'2024-04-08',72910.8,907.37,NULL),(287,'Pañales',80,'2023-10-03',17368.1,858.15,NULL),(288,'Pañales',29,'2023-08-22',48081.3,968.51,NULL),(289,'Correa',39,'2023-05-30',11995.8,922.67,NULL),(290,'Pañales',45,'2022-10-03',49429.5,610.61,NULL),(291,'Gasto Veterinario',65,'2023-04-28',39581,643.79,NULL),(292,'Collar',23,'2023-07-18',12748.1,482.24,NULL),(293,'Potes de comida',1,'2023-12-10',28978.1,219.72,NULL),(294,'Gasto Veterinario',94,'2023-06-18',48285.7,735.13,NULL),(295,'Cuchas',93,'2023-03-23',17433.6,901.74,NULL),(296,'Pañales',72,'2023-10-04',79151.3,61.6,NULL),(297,'Pañales',44,'2023-03-06',53960.8,580.43,NULL),(298,'Pañales',53,'2024-07-30',48846.6,73.08,NULL),(299,'Gasto Veterinario',1,'2024-01-16',36451.9,105.68,NULL),(300,'Correa',28,'2023-12-26',22272.2,744.86,NULL),(301,'Cuchas',46,'2024-06-18',45198.6,835.79,NULL),(302,'Pañales',14,'2024-02-26',73841.9,677.02,NULL),(303,'Potes de comida',97,'2022-09-19',38417.8,970.21,NULL),(304,'Comida',97,'2023-01-04',46306.9,575.28,NULL),(305,'Potes de comida',14,'2022-09-25',40816.8,52.06,NULL),(306,'Comida',63,'2024-04-26',20712.2,612.39,NULL),(307,'Juguetes',22,'2022-12-19',33042.4,904.69,NULL),(308,'Potes de comida',90,'2023-08-03',75707.1,581.13,NULL),(309,'Juguetes',63,'2024-07-26',41370.4,80.62,NULL),(310,'Pañales',28,'2024-04-11',66984.9,519.46,NULL),(311,'Collar',99,'2022-10-18',32681.6,796.21,NULL),(312,'Collar',100,'2023-02-01',7725.49,511.77,NULL),(313,'Comida',37,'2023-05-23',9620.6,716.41,NULL),(314,'Potes de comida',79,'2023-05-10',62097.1,727.42,NULL),(315,'Gasto Veterinario',89,'2024-03-20',47466,618.14,NULL),(316,'Potes de agua',39,'2023-11-23',47150.8,684.72,NULL),(317,'Cama',17,'2024-01-01',23705.4,724.78,NULL),(318,'Cama',24,'2024-04-13',37098.8,375.37,NULL),(319,'Pañales',43,'2023-11-23',53954.3,493.99,NULL),(320,'Potes de comida',99,'2022-12-16',39472.8,927.8,NULL),(321,'Potes de agua',27,'2023-05-26',15816.4,657.36,NULL),(322,'Potes de agua',55,'2023-04-06',46086.3,825.97,NULL),(323,'Cama',80,'2022-08-24',53172.6,42.28,NULL),(324,'Correa',64,'2024-03-05',54645.3,981.85,NULL),(325,'Gasto Veterinario',11,'2023-04-29',79792.3,995.02,NULL),(326,'Correa',42,'2024-01-28',35742.9,796.22,NULL),(327,'Cuchas',20,'2023-08-22',26944.6,859.68,NULL),(328,'Pañales',50,'2023-08-03',17832.5,881.06,NULL),(329,'Collar',58,'2023-12-18',34582.5,957.65,NULL),(330,'Potes de comida',2,'2024-02-28',41259,887.81,NULL),(331,'Cuchas',94,'2023-11-05',18221.2,748.87,NULL),(332,'Collar',67,'2024-06-08',50073.1,810.99,NULL),(333,'Gasto Veterinario',35,'2024-05-28',24854.1,568.61,NULL),(334,'Juguetes',47,'2023-08-22',21306.6,600.03,NULL),(335,'Comida',22,'2023-07-30',30956.8,533.23,NULL),(336,'Cuchas',47,'2023-11-12',25113.1,126.05,NULL),(337,'Comida',73,'2022-11-13',58096.9,240.53,NULL),(338,'Collar',74,'2024-08-14',50466.5,294.73,NULL),(339,'Potes de agua',46,'2022-11-13',72199.4,776.08,NULL),(340,'Juguetes',50,'2024-06-22',28009.5,32.05,NULL),(341,'Juguetes',97,'2022-10-03',58424,787.49,NULL),(342,'Cama',14,'2024-07-15',34406,614.26,NULL),(343,'Comida',4,'2023-10-24',13123.9,556.47,NULL),(344,'Pañales',62,'2023-11-11',19450.4,497.36,NULL),(345,'Collar',65,'2023-08-30',54273.1,291.47,NULL),(346,'Juguetes',53,'2024-04-03',71141.6,540.63,NULL),(347,'Juguetes',82,'2023-02-13',53876.1,836.15,NULL),(348,'Potes de comida',72,'2024-02-19',52768.2,514.85,NULL),(349,'Collar',78,'2024-07-31',69491.7,361.05,NULL),(350,'Pañales',89,'2023-07-18',5194.74,631.02,NULL),(351,'Cuchas',6,'2024-02-16',34598.3,805.21,NULL),(352,'Correa',71,'2022-11-09',59485.5,610.32,NULL),(353,'Correa',53,'2024-05-08',29678.9,984.18,NULL),(354,'Potes de comida',7,'2023-06-02',67212.3,328.07,NULL),(355,'Potes de agua',81,'2022-11-28',28663.7,570.94,NULL),(356,'Correa',78,'2023-04-04',61596.1,918.44,NULL),(357,'Pañales',47,'2024-04-15',45963.8,422.17,NULL),(358,'Gasto Veterinario',87,'2022-08-26',19254.2,202.23,NULL),(359,'Gasto Veterinario',54,'2023-03-28',24249.5,851.43,NULL),(360,'Potes de agua',81,'2024-08-05',50036.8,150.51,NULL),(361,'Pañales',29,'2022-09-22',19804.9,817.01,NULL),(362,'Comida',76,'2023-06-19',67738.1,365.94,NULL),(363,'Gasto Veterinario',56,'2023-10-20',49500.2,802.39,NULL),(364,'Pañales',98,'2024-06-13',14779.4,461.73,NULL),(365,'Pañales',59,'2023-11-09',62651,865.67,NULL),(366,'Potes de comida',87,'2022-09-02',25946.5,560.37,NULL),(367,'Potes de agua',66,'2023-03-10',42347.6,225.2,NULL),(368,'Comida',22,'2023-01-17',27535.1,656.91,NULL),(369,'Correa',49,'2022-12-23',20039.3,161.86,NULL),(370,'Juguetes',6,'2023-04-10',42067.7,927.73,NULL),(371,'Cuchas',47,'2024-08-09',62703,519.67,NULL),(372,'Juguetes',65,'2023-11-25',18263,506.68,NULL),(373,'Collar',26,'2023-05-14',31528.3,394.03,NULL),(374,'Cama',54,'2024-01-25',46145.3,542.25,NULL),(375,'Collar',82,'2023-10-19',6346.7,91.46,NULL),(376,'Potes de comida',33,'2024-03-15',63655.7,934.5,NULL),(377,'Cama',41,'2022-09-14',73469.6,15.43,NULL),(378,'Gasto Veterinario',2,'2023-02-17',18491.8,708.79,NULL),(379,'Potes de agua',93,'2023-11-15',77248.2,795.17,NULL),(380,'Cuchas',78,'2023-01-15',9847.21,434.2,NULL),(381,'Correa',10,'2023-06-24',66624.8,204.9,NULL),(382,'Potes de comida',73,'2024-02-23',46062.6,773.42,NULL),(383,'Cuchas',19,'2023-03-24',74368.8,946.09,NULL),(384,'Pañales',38,'2023-11-22',65602.2,459.46,NULL),(385,'Gasto Veterinario',59,'2023-05-07',35950.2,926.76,NULL),(386,'Potes de comida',61,'2023-05-23',50108.6,235.81,NULL),(387,'Pañales',68,'2022-12-09',58143.4,333.97,NULL),(388,'Cuchas',47,'2022-11-25',44128.3,364.19,NULL),(389,'Pañales',46,'2023-06-13',32737.6,596.37,NULL),(390,'Potes de agua',96,'2022-11-29',49224.9,905.89,NULL),(391,'Potes de agua',14,'2023-12-12',58961,545.46,NULL),(392,'Cama',25,'2023-04-13',24468.1,507.37,NULL),(393,'Juguetes',82,'2022-08-31',5284.9,914.77,NULL),(394,'Potes de agua',62,'2022-09-16',34902.7,20.38,NULL),(395,'Cama',52,'2022-12-20',19698.5,577.15,NULL),(396,'Juguetes',60,'2024-01-26',16393.6,580.75,NULL),(397,'Cuchas',69,'2022-11-11',49566.4,505.16,NULL),(398,'Gasto Veterinario',87,'2023-12-02',36100,875.06,NULL),(399,'Comida',89,'2023-12-26',21097.2,113.51,NULL),(400,'Cuchas',40,'2022-08-22',61758.1,811.2,NULL),(401,'Cama',24,'2023-09-07',34928.3,360.08,NULL),(402,'Cuchas',86,'2023-01-24',22753.3,721.21,NULL),(403,'Comida',60,'2023-11-20',69709.9,275.24,NULL),(404,'Potes de agua',39,'2023-12-24',40065.6,42.04,NULL),(405,'Correa',100,'2023-03-20',14199.5,256.44,NULL),(406,'Potes de comida',84,'2022-10-15',45566.8,927.34,NULL),(407,'Collar',7,'2023-01-29',40449.9,336.24,NULL),(408,'Comida',29,'2024-02-05',66447.8,495.04,NULL),(409,'Comida',65,'2023-09-18',7827.36,810.44,NULL),(410,'Gasto Veterinario',11,'2023-12-19',79471.2,831.74,NULL),(411,'Comida',77,'2023-09-05',61984,904.09,NULL),(412,'Gasto Veterinario',74,'2023-07-30',39979.4,672.88,NULL),(413,'Juguetes',46,'2023-06-13',48804.9,626.47,NULL),(414,'Gasto Veterinario',7,'2023-05-15',29005.7,64.09,NULL),(415,'Comida',35,'2022-09-03',21100.6,344.3,NULL),(416,'Gasto Veterinario',60,'2022-10-26',14831.8,815.48,NULL),(417,'Correa',75,'2023-09-02',78999.7,153.88,NULL),(418,'Potes de agua',80,'2023-09-02',14097.9,966,NULL),(419,'Cuchas',90,'2022-11-08',69731.4,629.76,NULL),(420,'Gasto Veterinario',25,'2024-02-05',39646.4,857.43,NULL),(421,'Collar',94,'2024-01-28',46517.8,469.35,NULL),(422,'Juguetes',90,'2024-01-05',40742.5,926.48,NULL),(423,'Potes de comida',15,'2023-10-22',50004.9,483.95,NULL),(424,'Juguetes',43,'2024-04-20',79906.6,664.17,NULL),(425,'Potes de comida',12,'2023-05-04',42221.4,603.19,NULL),(426,'Gasto Veterinario',71,'2022-09-27',71496.1,334.53,NULL),(427,'Collar',81,'2024-03-27',18284.4,494.94,NULL),(428,'Potes de agua',74,'2023-05-22',27435,330.75,NULL),(429,'Cama',23,'2023-02-04',23870.3,135.64,NULL),(430,'Correa',45,'2022-10-19',27736.5,502.38,NULL),(431,'Potes de comida',69,'2023-01-23',19046.9,819.21,NULL),(432,'Gasto Veterinario',19,'2024-08-14',61478.9,740.48,NULL),(433,'Cama',83,'2022-12-14',11261.3,300.16,NULL),(434,'Collar',65,'2024-08-14',41083.2,350.96,NULL),(435,'Gasto Veterinario',35,'2022-10-17',66222.7,531.5,NULL),(436,'Comida',28,'2023-03-29',37881.7,166.87,NULL),(437,'Correa',95,'2024-05-16',38529.1,91.55,NULL),(438,'Comida',11,'2023-09-18',38506.7,603.52,NULL),(439,'Cuchas',5,'2022-12-22',56224.9,649.45,NULL),(440,'Cama',65,'2023-10-28',39859.2,560.99,NULL),(441,'Juguetes',35,'2024-02-25',14169.2,254.81,NULL),(442,'Collar',48,'2023-02-02',50353.4,480.37,NULL),(443,'Potes de agua',31,'2023-12-06',25645.5,503.25,NULL),(444,'Correa',55,'2022-08-25',60512.9,926.14,NULL),(445,'Cuchas',70,'2024-03-21',21287.3,883.63,NULL),(446,'Gasto Veterinario',24,'2022-09-22',30542.6,799.37,NULL),(447,'Comida',76,'2024-08-05',31568.6,443.85,NULL),(448,'Juguetes',80,'2024-03-15',30384.5,129.83,NULL),(449,'Pañales',8,'2023-10-13',78136,189.19,NULL),(450,'Cuchas',71,'2022-10-24',35790.9,134.21,NULL),(451,'Cama',33,'2024-08-07',62290.4,964.85,NULL),(452,'Cuchas',6,'2024-07-16',72905.8,604.82,NULL),(453,'Comida',48,'2024-01-30',76880.5,136.11,NULL),(454,'Collar',23,'2023-12-05',33630.6,367.61,NULL),(455,'Cuchas',55,'2024-03-01',47221.1,922.65,NULL),(456,'Comida',16,'2023-03-30',33346.1,322.78,NULL),(457,'Potes de comida',34,'2023-07-26',37353.9,264.51,NULL),(458,'Collar',59,'2022-11-01',14857.4,621.4,NULL),(459,'Cuchas',73,'2023-09-26',48079.5,739.76,NULL),(460,'Correa',6,'2022-12-09',53870.1,393.01,NULL),(461,'Gasto Veterinario',13,'2024-04-12',24972.4,156.15,NULL),(462,'Potes de agua',54,'2023-08-13',19105,732.12,NULL),(463,'Cama',33,'2023-08-30',66919.9,995.52,NULL),(464,'Correa',50,'2023-08-24',14486.5,751.03,NULL),(465,'Juguetes',17,'2023-10-28',64342.6,171.99,NULL),(466,'Cuchas',32,'2022-08-31',32221.8,853.46,NULL),(467,'Pañales',90,'2024-06-23',25631.8,50.04,NULL),(468,'Potes de agua',65,'2022-12-16',45302.2,111.31,NULL),(469,'Potes de comida',99,'2024-02-20',56963,482.04,NULL),(470,'Pañales',87,'2023-12-25',48061.4,880.27,NULL),(471,'Cuchas',99,'2023-05-20',66028.5,459.42,NULL),(472,'Collar',48,'2023-03-23',41045.9,321.43,NULL),(473,'Cama',55,'2024-07-19',10618.8,656.15,NULL),(474,'Comida',53,'2023-05-14',57111.8,353.09,NULL),(475,'Potes de agua',22,'2023-04-28',17618.9,838.87,NULL),(476,'Comida',10,'2023-11-16',52308.6,781.34,NULL),(477,'Comida',17,'2023-07-20',35571,877.16,NULL),(478,'Collar',95,'2024-03-23',62625.4,458.94,NULL),(479,'Pañales',83,'2022-09-16',44243.7,27.19,NULL),(480,'Pañales',4,'2022-11-28',58692.5,993.74,NULL),(481,'Potes de agua',61,'2023-08-28',57038.4,6.74,NULL),(482,'Potes de agua',35,'2022-12-30',76147.3,444.55,NULL),(483,'Correa',13,'2023-03-15',44194.6,673.51,NULL),(484,'Juguetes',32,'2024-08-13',55292.4,164.5,NULL),(485,'Cuchas',42,'2024-03-10',26408.8,726.46,NULL),(486,'Potes de comida',12,'2023-01-11',5134.44,605.48,NULL),(487,'Cuchas',50,'2022-12-18',33324.2,506.11,NULL),(488,'Comida',57,'2022-11-17',60438,597.79,NULL),(489,'Comida',53,'2024-06-04',79203.9,116.49,NULL),(490,'Pañales',77,'2023-10-03',20486.7,89.98,NULL),(491,'Correa',83,'2024-07-30',73540.9,92.83,NULL),(492,'Gasto Veterinario',69,'2024-04-26',59842.3,921.84,NULL),(493,'Cuchas',45,'2024-01-10',52841.6,750.03,NULL),(494,'Comida',10,'2024-02-06',67321.3,980.14,NULL),(495,'Correa',43,'2023-08-10',43295.7,294.74,NULL),(496,'Pañales',23,'2023-05-11',59327.5,227.2,NULL),(497,'Potes de agua',75,'2022-10-17',10718,316.91,NULL),(498,'Potes de comida',97,'2022-11-12',27989.1,39.1,NULL),(499,'Cama',53,'2022-08-28',14960,515.15,NULL),(500,'Pañales',4,'2022-10-13',65532.8,505.17,NULL);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `compras_costos`
--

DROP TABLE IF EXISTS `compras_costos`;
/*!50001 DROP VIEW IF EXISTS `compras_costos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `compras_costos` AS SELECT 
 1 AS `id_producto`,
 1 AS `tipo_producto`,
 1 AS `precio_unitario`,
 1 AS `impuestos`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `costos`
--

DROP TABLE IF EXISTS `costos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costos` (
  `id_costo` int NOT NULL AUTO_INCREMENT,
  `id_medicamento` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`id_costo`),
  KEY `id_medicamento` (`id_medicamento`),
  KEY `fk_costos_compras` (`id_producto`),
  CONSTRAINT `costos_ibfk_1` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamentos` (`id_medicamento`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_costos_compras` FOREIGN KEY (`id_producto`) REFERENCES `compras` (`id_producto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costos`
--

LOCK TABLES `costos` WRITE;
/*!40000 ALTER TABLE `costos` DISABLE KEYS */;
INSERT INTO `costos` VALUES (1,297,114,119221),(2,205,137,126647),(3,195,339,NULL),(4,428,3,NULL),(5,487,315,NULL),(6,226,115,NULL),(7,121,483,NULL),(8,474,480,NULL),(9,198,465,NULL),(10,224,183,NULL),(11,135,70,NULL),(12,394,300,NULL),(13,10,83,NULL),(14,75,5,NULL),(15,27,205,NULL),(16,184,129,NULL),(17,161,224,NULL),(18,84,6,NULL),(19,295,268,NULL),(20,436,150,NULL),(21,353,210,NULL),(22,15,195,NULL),(23,308,317,NULL),(24,154,269,NULL),(25,486,123,NULL),(26,468,12,NULL),(27,170,447,NULL),(28,52,355,NULL),(29,270,146,NULL),(30,269,255,NULL),(31,395,473,NULL),(32,14,359,NULL),(33,412,312,NULL),(34,119,41,NULL),(35,193,337,NULL),(36,425,305,NULL),(37,311,72,NULL),(38,131,105,NULL),(39,340,256,NULL),(40,421,369,NULL),(41,234,113,NULL),(42,166,481,NULL),(43,26,302,NULL),(44,101,163,NULL),(45,194,156,NULL),(46,266,195,NULL),(47,217,74,NULL),(48,286,120,NULL),(49,431,66,NULL),(50,368,262,NULL),(51,372,48,NULL),(52,48,364,NULL),(53,81,23,NULL),(54,436,406,NULL),(55,496,344,NULL),(56,425,147,NULL),(57,384,348,NULL),(58,376,165,NULL),(59,480,252,NULL),(60,358,355,NULL),(61,142,30,NULL),(62,426,472,NULL),(63,133,387,NULL),(64,165,318,NULL),(65,133,408,NULL),(66,345,317,NULL),(67,496,83,NULL),(68,468,165,NULL),(69,273,66,NULL),(70,44,357,NULL),(71,355,237,NULL),(72,458,94,NULL),(73,69,400,NULL),(74,255,294,NULL),(75,165,448,NULL),(76,35,106,NULL),(77,236,205,NULL),(78,170,213,NULL),(79,123,181,NULL),(80,195,318,NULL),(81,476,265,NULL),(82,155,15,NULL),(83,99,38,NULL),(84,52,322,NULL),(85,386,383,NULL),(86,422,366,NULL),(87,336,398,NULL),(88,386,351,NULL),(89,73,444,NULL),(90,492,313,NULL),(91,295,319,NULL),(92,9,107,NULL),(93,357,122,NULL),(94,230,157,NULL),(95,406,307,NULL),(96,231,159,NULL),(97,74,235,NULL),(98,75,183,NULL),(99,310,149,NULL),(100,54,12,NULL),(101,328,79,NULL),(102,436,13,NULL),(103,152,332,NULL),(104,386,80,NULL),(105,289,178,NULL),(106,428,86,NULL),(107,71,295,NULL),(108,409,331,NULL),(109,303,269,NULL),(110,198,450,NULL),(111,197,412,NULL),(112,354,310,NULL),(113,71,462,NULL),(114,418,401,NULL),(115,400,277,NULL),(116,149,336,NULL),(117,270,331,NULL),(118,368,263,NULL),(119,52,406,NULL),(120,274,352,NULL),(121,237,160,NULL),(122,75,140,NULL),(123,473,341,NULL),(124,20,295,NULL),(125,366,450,NULL),(126,150,379,NULL),(127,266,33,NULL),(128,477,302,NULL),(129,336,460,NULL),(130,200,452,NULL),(131,247,269,NULL),(132,294,395,NULL),(133,413,174,NULL),(134,44,131,NULL),(135,280,151,NULL),(136,62,454,NULL),(137,491,44,NULL),(138,293,408,NULL),(139,190,50,NULL),(140,165,315,NULL),(141,387,221,NULL),(142,423,140,NULL),(143,1,250,NULL),(144,359,484,NULL),(145,432,323,NULL),(146,143,250,NULL),(147,198,461,NULL),(148,79,90,NULL),(149,68,80,NULL),(150,394,462,NULL),(151,328,440,NULL),(152,268,488,NULL),(153,221,325,NULL),(154,338,239,NULL),(155,486,451,NULL),(156,191,236,NULL),(157,281,96,NULL),(158,458,154,NULL),(159,93,92,NULL),(160,499,169,NULL),(161,148,94,NULL),(162,41,152,NULL),(163,238,66,NULL),(164,474,388,NULL),(165,472,221,NULL),(166,86,86,NULL),(167,160,322,NULL),(168,134,70,NULL),(169,111,328,NULL),(170,145,460,NULL),(171,135,319,NULL),(172,25,262,NULL),(173,305,387,NULL),(174,409,325,NULL),(175,148,486,NULL),(176,26,456,NULL),(177,388,264,NULL),(178,219,42,NULL),(179,228,465,NULL),(180,34,92,NULL),(181,14,348,NULL),(182,355,350,NULL),(183,170,297,NULL),(184,422,222,NULL),(185,6,123,NULL),(186,370,340,NULL),(187,375,289,NULL),(188,80,270,NULL),(189,409,16,NULL),(190,272,423,NULL),(191,124,348,NULL),(192,314,22,NULL),(193,409,329,NULL),(194,433,209,NULL),(195,260,102,NULL),(196,54,122,NULL),(197,96,299,NULL),(198,275,399,NULL),(199,474,202,NULL),(200,378,231,NULL),(201,412,281,NULL),(202,43,319,NULL),(203,423,89,NULL),(204,477,362,NULL),(205,392,201,NULL),(206,205,239,NULL),(207,390,381,NULL),(208,198,269,NULL),(209,146,410,NULL),(210,236,409,NULL),(211,142,71,NULL),(212,472,430,NULL),(213,321,362,NULL),(214,493,1,NULL),(215,461,385,NULL),(216,128,111,NULL),(217,59,85,NULL),(218,382,275,NULL),(219,196,193,NULL),(220,128,222,NULL),(221,397,237,NULL),(222,97,285,NULL),(223,93,260,NULL),(224,143,62,NULL),(225,459,365,NULL),(226,428,220,NULL),(227,400,16,NULL),(228,130,21,NULL),(229,229,55,NULL),(230,56,350,NULL),(231,490,74,NULL),(232,398,196,NULL),(233,229,62,NULL),(234,139,192,NULL),(235,247,29,NULL),(236,114,304,NULL),(237,190,206,NULL),(238,61,263,NULL),(239,383,492,NULL),(240,390,244,NULL),(241,427,470,NULL),(242,316,27,NULL),(243,388,75,NULL),(244,282,265,NULL),(245,136,256,NULL),(246,208,340,NULL),(247,337,353,NULL),(248,14,495,NULL),(249,313,314,NULL),(250,55,172,NULL),(251,416,330,NULL),(252,169,433,NULL),(253,43,6,NULL),(254,309,401,NULL),(255,267,259,NULL),(256,313,10,NULL),(257,55,498,NULL),(258,103,349,NULL),(259,251,195,NULL),(260,166,69,NULL),(261,211,25,NULL),(262,408,203,NULL),(263,223,26,NULL),(264,267,236,NULL),(265,470,331,NULL),(266,216,45,NULL),(267,324,473,NULL),(268,422,20,NULL),(269,272,201,NULL),(270,332,42,NULL),(271,289,367,NULL),(272,162,306,NULL),(273,122,288,NULL),(274,483,445,NULL),(275,415,294,NULL),(276,411,178,NULL),(277,190,387,NULL),(278,75,183,NULL),(279,441,306,NULL),(280,483,249,NULL),(281,104,79,NULL),(282,364,167,NULL),(283,468,240,NULL),(284,235,123,NULL),(285,147,348,NULL),(286,324,353,NULL),(287,297,90,NULL),(288,439,72,NULL),(289,305,395,NULL),(290,375,349,NULL),(291,355,334,NULL),(292,21,11,NULL),(293,364,483,NULL),(294,221,479,NULL),(295,52,460,NULL),(296,284,321,NULL),(297,297,500,NULL),(298,264,470,NULL),(299,361,281,NULL),(300,76,192,NULL),(301,352,490,NULL),(302,169,267,NULL),(303,276,176,NULL),(304,265,384,NULL),(305,352,403,NULL),(306,329,369,NULL),(307,47,126,NULL),(308,365,279,NULL),(309,455,66,NULL),(310,439,132,NULL),(311,439,150,NULL),(312,397,302,NULL),(313,287,267,NULL),(314,283,78,NULL),(315,30,61,NULL),(316,306,347,NULL),(317,310,172,NULL),(318,52,307,NULL),(319,79,207,NULL),(320,478,444,NULL),(321,191,309,NULL),(322,178,172,NULL),(323,362,222,NULL),(324,262,412,NULL),(325,108,389,NULL),(326,202,3,NULL),(327,227,252,NULL),(328,356,483,NULL),(329,265,392,NULL),(330,95,435,NULL),(331,347,38,NULL),(332,319,108,NULL),(333,481,360,NULL),(334,63,194,NULL),(335,369,437,NULL),(336,9,185,NULL),(337,367,473,NULL),(338,356,239,NULL),(339,143,360,NULL),(340,79,446,NULL),(341,19,218,NULL),(342,266,156,NULL),(343,23,386,NULL),(344,218,29,NULL),(345,197,141,NULL),(346,215,153,NULL),(347,475,418,NULL),(348,364,147,NULL),(349,432,420,NULL),(350,351,194,NULL),(351,419,147,NULL),(352,43,471,NULL),(353,431,230,NULL),(354,446,422,NULL),(355,163,232,NULL),(356,93,85,NULL),(357,292,285,NULL),(358,328,338,NULL),(359,198,383,NULL),(360,67,146,NULL),(361,80,296,NULL),(362,379,334,NULL),(363,32,71,NULL),(364,352,252,NULL),(365,424,302,NULL),(366,17,22,NULL),(367,167,33,NULL),(368,76,399,NULL),(369,367,490,NULL),(370,375,372,NULL),(371,158,462,NULL),(372,210,261,NULL),(373,106,282,NULL),(374,378,1,NULL),(375,160,105,NULL),(376,419,150,NULL),(377,174,350,NULL),(378,206,451,NULL),(379,213,185,NULL),(380,29,456,NULL),(381,450,144,NULL),(382,170,312,NULL),(383,264,31,NULL),(384,428,364,NULL),(385,161,296,NULL),(386,316,373,NULL),(387,476,362,NULL),(388,261,425,NULL),(389,222,375,NULL),(390,100,289,NULL),(391,228,85,NULL),(392,147,139,NULL),(393,85,26,NULL),(394,450,458,NULL),(395,55,275,NULL),(396,113,431,NULL),(397,187,343,NULL),(398,8,474,NULL),(399,143,488,NULL),(400,354,115,NULL),(401,374,373,NULL),(402,232,341,NULL),(403,165,482,NULL),(404,31,355,NULL),(405,499,39,NULL),(406,382,86,NULL),(407,348,237,NULL),(408,435,392,NULL),(409,90,184,NULL),(410,450,449,NULL),(411,473,129,NULL),(412,140,291,NULL),(413,355,470,NULL),(414,137,345,NULL),(415,343,314,NULL),(416,347,447,NULL),(417,411,39,NULL),(418,32,151,NULL),(419,265,221,NULL),(420,119,423,NULL),(421,16,142,NULL),(422,319,323,NULL),(423,186,213,NULL),(424,170,7,NULL),(425,347,256,NULL),(426,120,30,NULL),(427,353,140,NULL),(428,133,199,NULL),(429,347,136,NULL),(430,13,352,NULL),(431,60,368,NULL),(432,153,484,NULL),(433,153,115,NULL),(434,21,75,NULL),(435,3,440,NULL),(436,178,373,NULL),(437,240,81,NULL),(438,58,72,NULL),(439,204,297,NULL),(440,33,199,NULL),(441,190,174,NULL),(442,239,82,NULL),(443,405,385,NULL),(444,444,227,NULL),(445,416,67,NULL),(446,346,245,NULL),(447,462,247,NULL),(448,77,450,NULL),(449,249,163,NULL),(450,311,129,NULL),(451,494,397,NULL),(452,74,31,NULL),(453,343,196,NULL),(454,368,179,NULL),(455,360,26,NULL),(456,425,266,NULL),(457,439,196,NULL),(458,124,434,NULL),(459,384,177,NULL),(460,36,263,NULL),(461,159,191,NULL),(462,22,175,NULL),(463,64,38,NULL),(464,48,457,NULL),(465,81,8,NULL),(466,32,156,NULL),(467,54,341,NULL),(468,79,26,NULL),(469,97,96,NULL),(470,443,242,NULL),(471,110,57,NULL),(472,229,227,NULL),(473,204,423,NULL),(474,148,219,NULL),(475,479,27,NULL),(476,374,27,NULL),(477,125,61,NULL),(478,393,359,NULL),(479,211,417,NULL),(480,341,322,NULL),(481,10,225,NULL),(482,428,73,NULL),(483,171,114,NULL),(484,69,332,NULL),(485,484,413,NULL),(486,61,65,NULL),(487,228,324,NULL),(488,82,438,NULL),(489,116,349,NULL),(490,169,399,NULL),(491,94,109,NULL),(492,433,472,NULL),(493,486,88,NULL),(494,345,56,NULL),(495,125,449,NULL),(496,99,292,NULL),(497,354,159,NULL),(498,422,408,NULL),(499,335,191,NULL),(500,311,479,NULL);
/*!40000 ALTER TABLE `costos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `costos_medicamentos`
--

DROP TABLE IF EXISTS `costos_medicamentos`;
/*!50001 DROP VIEW IF EXISTS `costos_medicamentos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `costos_medicamentos` AS SELECT 
 1 AS `id_medicamento`,
 1 AS `tipo`,
 1 AS `precio_unitario`,
 1 AS `monto_impositivo`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `costoss`
--

DROP TABLE IF EXISTS `costoss`;
/*!50001 DROP VIEW IF EXISTS `costoss`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `costoss` AS SELECT 
 1 AS `id_medicamento`,
 1 AS `monto_total_medicamento`,
 1 AS `id_producto`,
 1 AS `monto_total_producto`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `donaciones`
--

DROP TABLE IF EXISTS `donaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donaciones` (
  `id_donacion` int NOT NULL AUTO_INCREMENT,
  `monto` float DEFAULT NULL,
  `fecha_donacion` date NOT NULL,
  `id_donante` int DEFAULT NULL,
  PRIMARY KEY (`id_donacion`),
  KEY `fk_donaciones_donantes` (`id_donante`),
  CONSTRAINT `fk_donaciones_donantes` FOREIGN KEY (`id_donante`) REFERENCES `donantes` (`id_donante`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donaciones`
--

LOCK TABLES `donaciones` WRITE;
/*!40000 ALTER TABLE `donaciones` DISABLE KEYS */;
INSERT INTO `donaciones` VALUES (1,74127.6,'2022-12-19',7),(2,124145,'2022-10-26',11),(3,460359,'2023-07-09',16),(4,353103,'2023-08-17',18),(5,476729,'2022-12-29',2),(6,499125,'2022-08-30',12),(7,228029,'2023-04-13',18),(8,534771,'2023-01-03',16),(9,332349,'2022-12-12',20),(10,137335,'2023-03-05',3),(11,395353,'2022-10-18',14),(12,82019.8,'2023-01-18',9),(13,79760.6,'2023-05-19',3),(14,454065,'2023-05-12',14),(15,105968,'2023-05-27',1),(16,314174,'2023-01-18',6),(17,208339,'2022-09-16',19),(18,489441,'2023-07-27',12),(19,61400.6,'2023-03-22',8),(20,665008,'2022-12-12',10);
/*!40000 ALTER TABLE `donaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donantes`
--

DROP TABLE IF EXISTS `donantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donantes` (
  `id_donante` int NOT NULL AUTO_INCREMENT,
  `id_pais` int NOT NULL,
  `id_provincia` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_donante`),
  KEY `fk_donantes_paises` (`id_pais`),
  KEY `fk_donantes_provincias` (`id_provincia`),
  CONSTRAINT `fk_donantes_paises` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_donantes_provincias` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id_provincia`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donantes`
--

LOCK TABLES `donantes` WRITE;
/*!40000 ALTER TABLE `donantes` DISABLE KEYS */;
INSERT INTO `donantes` VALUES (1,1,24,'Hugues','Joddins'),(2,1,17,'Lorene','Hamal'),(3,1,2,'','Horrod'),(4,1,18,'Nikaniki',''),(5,1,20,'Tull','Gipp'),(6,1,5,'Emlen','Claiden'),(7,1,24,'Thorvald','Pes'),(8,1,21,'Gussie','Landeg'),(9,1,18,'Allegra','Illingsworth'),(10,1,8,'Sophia','MacCafferky'),(11,1,8,'Lissy','Margery'),(12,1,20,'Fair','Hedgeley'),(13,1,18,'Guthrie','Trousdell'),(14,1,10,'Bastian',''),(15,1,8,'Gene',''),(16,1,14,'Kelcey','Sandeford'),(17,1,19,'Aaren','Hiseman'),(18,1,5,'',''),(19,1,10,'Casey','Fosse'),(20,1,10,'Melva','Casserly');
/*!40000 ALTER TABLE `donantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `id_cargo` int NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `nombre_empleado` varchar(200) DEFAULT NULL,
  `apellido_empleado` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `id_localidad` int NOT NULL,
  `id_pais` int DEFAULT NULL,
  `id_provincia` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_emplados_lista_cargos` (`id_cargo`),
  KEY `fk_emplados_localidad` (`id_localidad`),
  KEY `fk_empleados_paises` (`id_pais`),
  KEY `fk_empleados_pronvincias` (`id_provincia`),
  CONSTRAINT `fk_emplados_lista_cargos` FOREIGN KEY (`id_cargo`) REFERENCES `lista_cargos` (`id_cargo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_emplados_localidad` FOREIGN KEY (`id_localidad`) REFERENCES `localidad` (`id_localidad`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_empleados_paises` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_empleados_pronvincias` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id_provincia`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,1,'2023-06-27','Dita','Hydes','Avenida 456',37,1,9),(2,6,'2022-12-19','Debee','Ferro','Calle 123',90,1,22),(3,5,'2023-04-23','Willie','Osboldstone','Plaza 789',31,1,19),(4,1,'2023-04-08','Xena','Redier','Calle 123',98,1,5),(5,3,'2022-11-07','Doe','Goldup','Plaza 789',30,1,11),(6,4,'2023-08-04','Toni','Brenard','Avenida 456',40,1,2),(7,3,'2023-02-08','Hyacinthie','Castleton','Calle 123',80,1,21),(8,3,'2023-07-26','Kara-lynn','Knappe','Calle 123',85,1,13),(9,3,'2022-10-23','Edgardo','Cathenod','Calle 123',11,1,6),(10,7,'2023-02-07','Johnathon','Bosket','Calle 123',22,1,9),(11,1,'2023-02-27','Emmet','Gilmore','Avenida 456',86,1,6),(12,1,'2023-04-28','Ada','Beddis','Plaza 789',50,1,6),(13,6,'2023-05-20','Jacki','Batty','Plaza 789',9,1,7),(14,1,'2023-08-11','Shela','Stainfield','Avenida 456',21,1,1),(15,3,'2023-06-29','Carrol','Romero','Plaza 789',61,1,12),(16,1,'2023-08-17','Matias','Friman','Calle 123',32,1,9),(17,6,'2023-03-17','Corie','Banke','Plaza 789',76,1,23),(18,2,'2023-06-26','Delaney','Horning','Plaza 789',72,1,18),(19,5,'2023-05-26','Hank','Scoble','Plaza 789',82,1,13),(20,2,'2023-03-16','Ray','Rahlof','Avenida 456',22,1,17),(21,1,'2023-03-20','Carol','Greensides','Plaza 789',58,1,8),(22,5,'2023-01-17','Jessi','Barrabeale','Calle 123',19,1,8),(23,5,'2023-05-10','L;urette','Cleveley','Avenida 456',8,1,20),(24,7,'2022-10-20','Thea','Venes','Plaza 789',78,1,9),(25,6,'2023-03-04','Nataniel','Turn','Plaza 789',96,1,7),(26,4,'2023-01-17','Malinda','Morteo','Avenida 456',51,1,18),(27,4,'2023-08-08','Syman','Scarisbrick','Plaza 789',62,1,7),(28,4,'2023-03-30','Benedick','Doorly','Avenida 456',26,1,19),(29,5,'2022-09-15','Brandais','enzley','Plaza 789',87,1,16),(30,5,'2023-07-02','Ibrahim','Leither','Calle 123',44,1,22),(31,5,'2023-03-08','Felicia','Benitez','Calle 123',39,1,24),(32,4,'2022-12-28','Carlee','Dizlie','Plaza 789',10,1,9),(33,1,'2023-07-28','Tobin','Eglaise','Calle 123',68,1,11),(34,1,'2022-09-12','Lon','Sunter','Plaza 789',10,1,14),(35,4,'2022-12-29','Sydelle','Lightbourne','Avenida 456',8,1,21),(36,2,'2023-02-02','Teri','O\'Hdirscoll','Calle 123',12,1,12),(37,1,'2023-07-13','Therine','Godlip','Plaza 789',25,1,6),(38,1,'2023-07-29','Consalve','Rabb','Avenida 456',2,1,16),(39,6,'2022-08-23','Moselle','Spratley','Avenida 456',25,1,20),(40,5,'2022-12-30','Enoch','Scourgie','Calle 123',89,1,10),(41,7,'2022-12-08','Mead','Pryer','Plaza 789',25,1,20),(42,1,'2023-08-03','Willyt','Ingram','Plaza 789',75,1,1),(43,3,'2022-11-10','Terrence','Haker','Plaza 789',28,1,7),(44,2,'2023-04-07','Herbie','Boscott','Plaza 789',81,1,16),(45,1,'2023-07-06','Melantha','Carde','Calle 123',12,1,12),(46,3,'2023-06-27','Meaghan','Aston','Avenida 456',20,1,16),(47,7,'2023-07-09','Gisela','Menichini','Calle 123',72,1,15),(48,3,'2023-02-05','Haskel','Coate','Plaza 789',69,1,13),(49,5,'2023-06-12','Gerry','Gullberg','Calle 123',75,1,7),(50,2,'2023-03-30','Selig','Sedgemond','Avenida 456',73,1,24),(51,6,'2023-07-25','Augusto','Coryndon','Calle 123',16,1,13),(52,2,'2022-12-08','Knox','Dey','Plaza 789',68,1,14),(53,3,'2023-07-22','Bessy','Feaveer','Avenida 456',7,1,23),(54,6,'2023-07-20','Marjorie','Rogliero','Calle 123',72,1,5),(55,2,'2023-02-04','Daryl','Steljes','Plaza 789',81,1,21),(56,5,'2022-09-15','Dallas','Hardaway','Avenida 456',14,1,6),(57,3,'2022-11-09','Maddie','Matuskiewicz','Avenida 456',25,1,21),(58,5,'2022-09-29','Issie','Conry','Calle 123',83,1,23),(59,2,'2023-01-05','Brendis','Walak','Calle 123',98,1,5),(60,2,'2022-12-15','Ado','Laurentino','Plaza 789',57,1,17),(61,1,'2023-07-27','Stacey','Rumbelow','Plaza 789',4,1,7),(62,3,'2022-08-24','Ruttger','Basketfield','Calle 123',75,1,21),(63,6,'2023-04-03','Gayelord','Pennuzzi','Calle 123',19,1,21),(64,3,'2023-06-17','Chad','Clack','Calle 123',24,1,21),(65,7,'2023-08-11','Nolana','Davet','Avenida 456',87,1,19),(66,5,'2022-09-27','Barn','Undy','Calle 123',6,1,15),(67,5,'2023-01-09','Cecil','Bollini','Calle 123',70,1,9),(68,6,'2023-01-13','Brody','Purvey','Calle 123',94,1,22),(69,1,'2023-06-18','Meggi','Cicchetto','Calle 123',48,1,13),(70,1,'2022-12-29','Alvin','St. Quentin','Plaza 789',3,1,17),(71,7,'2023-01-25','Flori','Tremellier','Plaza 789',63,1,19),(72,5,'2022-12-08','Dwain','Ilchenko','Plaza 789',50,1,23),(73,1,'2023-01-31','Shermy','Betton','Calle 123',60,1,15),(74,6,'2023-01-18','Marcelia','Blanning','Avenida 456',12,1,19),(75,5,'2023-06-28','Loraine','Baudone','Plaza 789',98,1,8),(76,1,'2022-08-21','Rich','McGlew','Plaza 789',39,1,4),(77,2,'2023-08-15','Lewes','Canet','Avenida 456',26,1,15),(78,4,'2023-06-04','Nike','Vasilyev','Calle 123',69,1,11),(79,3,'2022-12-16','Rudolf','Collip','Avenida 456',65,1,14),(80,2,'2023-06-20','Zita','Briton','Plaza 789',6,1,24),(81,5,'2023-04-15','Lucais','Echallier','Calle 123',19,1,16),(82,4,'2023-03-10','Hyatt','Leidecker','Calle 123',57,1,17),(83,5,'2022-09-06','Rebekkah','Winspurr','Plaza 789',9,1,2),(84,6,'2022-10-19','Tildi','Tear','Calle 123',40,1,12),(85,3,'2022-11-16','Amos','Burge','Avenida 456',30,1,7),(86,1,'2023-04-15','Niko','Ferreo','Avenida 456',81,1,8),(87,2,'2023-04-12','Karrah','Rudge','Avenida 456',55,1,4),(88,1,'2023-08-12','Geoffry','Tidball','Avenida 456',2,1,6),(89,2,'2022-09-18','Elfreda','Smallsman','Calle 123',22,1,9),(90,3,'2022-08-24','Page','Bockings','Avenida 456',76,1,5),(91,5,'2022-10-20','Hilliard','Chorley','Avenida 456',56,1,10),(92,7,'2022-10-02','Norma','Bente','Calle 123',13,1,21),(93,2,'2023-01-11','Diarmid','Lovering','Avenida 456',87,1,15),(94,6,'2023-03-02','Crissie','Chadderton','Calle 123',94,1,15),(95,6,'2023-05-03','Kenny','Sherebrook','Avenida 456',18,1,3),(96,5,'2022-09-16','Boyd','Longo','Plaza 789',77,1,2),(97,2,'2023-04-12','Jewel','Duffet','Calle 123',75,1,5),(98,6,'2022-10-06','Papagena','Delicate','Calle 123',65,1,24),(99,5,'2022-10-21','Arley','Staite','Plaza 789',90,1,22),(100,1,'2022-12-23','Alex','Knagges','Calle 123',96,1,21),(101,1,'2022-12-15','Alexandr','Kirdsch','Avenida 456',31,1,23),(102,5,'2022-09-03','Loni','Lannon','Calle 123',26,1,5),(103,7,'2022-10-04','Adrianne','Cocklie','Avenida 456',12,1,16),(104,4,'2023-01-22','Hannah','Goodyer','Calle 123',65,1,10),(105,1,'2023-05-23','Josselyn','Sooley','Plaza 789',73,1,3),(106,4,'2023-01-27','Devlen','Brakespear','Avenida 456',10,1,10),(107,4,'2023-01-19','Kristopher','Gribbin','Plaza 789',53,1,2),(108,2,'2022-10-24','Mariejeanne','Bolter','Avenida 456',2,1,21),(109,2,'2023-03-16','Ulrica','Cruddas','Plaza 789',25,1,19),(110,7,'2022-11-16','Nathan','Teese','Calle 123',72,1,5),(111,4,'2022-10-14','Danie','Bruneton','Avenida 456',32,1,11),(112,2,'2023-03-19','Lalo','Hartzog','Avenida 456',22,1,9),(113,3,'2023-03-13','Anderson','Etchells','Avenida 456',50,1,22),(114,4,'2023-02-23','Clari','Indruch','Calle 123',33,1,15),(115,1,'2023-04-15','Sigismondo','Sotheby','Calle 123',84,1,7),(116,4,'2022-12-23','Marylinda','de Mendoza','Avenida 456',47,1,1),(117,2,'2022-09-29','Yul','Le Conte','Avenida 456',1,1,2),(118,4,'2023-02-23','Shurwood','Elsley','Plaza 789',81,1,12),(119,6,'2023-07-21','Chaunce','Alldis','Plaza 789',55,1,9),(120,1,'2022-10-17','Sophi','Moran','Calle 123',15,1,22),(121,2,'2022-11-06','Diarmid','Schohier','Avenida 456',62,1,1),(122,7,'2023-02-03','Christal','Lummis','Plaza 789',24,1,12),(123,6,'2023-03-01','Scott','Hallwood','Calle 123',12,1,7),(124,2,'2023-07-03','Shara','Fear','Plaza 789',5,1,22),(125,1,'2022-10-14','Juliette','Malamore','Calle 123',98,1,22),(126,1,'2023-05-23','Dorrie','Ogger','Calle 123',26,1,18),(127,5,'2022-09-21','Cointon','Embury','Plaza 789',27,1,24),(128,4,'2023-04-19','Leonid','Louis','Plaza 789',69,1,14),(129,7,'2023-01-20','Aileen','Beedham','Calle 123',43,1,20),(130,7,'2022-11-03','Colly','Naptin','Calle 123',71,1,5),(131,5,'2022-10-13','Dick','Corneliussen','Avenida 456',59,1,2),(132,2,'2022-09-25','Gawen','Challes','Plaza 789',26,1,13),(133,2,'2022-09-14','Marty','McClurg','Calle 123',60,1,13),(134,3,'2023-03-27','Addie','Garbar','Calle 123',59,1,1),(135,2,'2022-09-01','Raynor','Santello','Calle 123',74,1,18),(136,6,'2023-01-25','Vidovik','Simkiss','Avenida 456',31,1,18),(137,7,'2023-03-28','Albrecht','Pyecroft','Calle 123',18,1,14),(138,7,'2023-07-12','Morty','MacPaden','Plaza 789',20,1,12),(139,4,'2023-07-14','Theresita','Appleton','Avenida 456',72,1,24),(140,1,'2022-12-10','Morly','Salasar','Plaza 789',14,1,24),(141,7,'2023-05-11','Fayette','Hudless','Calle 123',23,1,20),(142,2,'2023-07-28','Corbin','Diffley','Plaza 789',5,1,10),(143,6,'2023-06-22','Salomon','Yeeles','Plaza 789',96,1,7),(144,2,'2022-08-21','Margaux','Margrem','Calle 123',66,1,10),(145,4,'2023-02-11','Jolynn','Cargill','Plaza 789',95,1,1),(146,1,'2023-05-29','Orelie','Bilby','Calle 123',43,1,14),(147,7,'2023-02-13','Bay','Chasteney','Plaza 789',14,1,11),(148,4,'2023-05-17','Tobit','Jamme','Calle 123',73,1,19),(149,3,'2023-08-15','Gerty','Sayles','Plaza 789',98,1,17),(150,4,'2022-08-20','Tedi','Ilchuk','Plaza 789',62,1,13);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `fechasdecompra`
--

DROP TABLE IF EXISTS `fechasdecompra`;
/*!50001 DROP VIEW IF EXISTS `fechasdecompra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fechasdecompra` AS SELECT 
 1 AS `fecha_compra_med`,
 1 AS `id_medicamento`,
 1 AS `id_producto`,
 1 AS `fecha_compra_prod`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!50001 DROP VIEW IF EXISTS `inventario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inventario` AS SELECT 
 1 AS `id_medicamento`,
 1 AS `cantidad_medicamentos`,
 1 AS `id_producto`,
 1 AS `cantidad_productos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lista_cargos`
--

DROP TABLE IF EXISTS `lista_cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_cargos` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `cargo_cumplir` varchar(200) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_cargos`
--

LOCK TABLES `lista_cargos` WRITE;
/*!40000 ALTER TABLE `lista_cargos` DISABLE KEYS */;
INSERT INTO `lista_cargos` VALUES (1,'Voluntario'),(2,'Cuidador'),(3,'Veterinario'),(4,'Adiestrador'),(5,'Administrativo'),(6,'Mantenimiento'),(7,'Chofer');
/*!40000 ALTER TABLE `lista_cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `id_localidad` int NOT NULL,
  `localidad` varchar(30) NOT NULL,
  PRIMARY KEY (`id_localidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'Buenos Aires'),(2,'Córdoba'),(3,'Rosario'),(4,'Mendoza'),(5,'La Plata'),(6,'Mar del Plata'),(7,'San Miguel de Tucumán'),(8,'Salta'),(9,'Santa Fe'),(10,'San Juan'),(11,'Resistencia'),(12,'Santiago del Estero'),(13,'Corrientes'),(14,'Posadas'),(15,'San Salvador de Jujuy'),(16,'Bahía Blanca'),(17,'Paraná'),(18,'Formosa'),(19,'Neuquén'),(20,'Tucumán'),(21,'Buenos Aires'),(22,'Córdoba'),(23,'Rosario'),(24,'Mendoza'),(25,'La Plata'),(26,'Mar del Plata'),(27,'San Miguel de Tucumán'),(28,'Salta'),(29,'Santa Fe'),(30,'San Juan'),(31,'Resistencia'),(32,'Santiago del Estero'),(33,'Corrientes'),(34,'Posadas'),(35,'San Salvador de Jujuy'),(36,'Bahía Blanca'),(37,'Paraná'),(38,'Formosa'),(39,'Neuquén'),(40,'San Juan'),(41,'Buenos Aires'),(42,'Córdoba'),(43,'Rosario'),(44,'Mendoza'),(45,'La Plata'),(46,'Mar del Plata'),(47,'San Miguel de Tucumán'),(48,'Salta'),(49,'Santa Fe'),(50,'San Juan'),(51,'Resistencia'),(52,'Santiago del Estero'),(53,'Corrientes'),(54,'Posadas'),(55,'San Salvador de Jujuy'),(56,'Bahía Blanca'),(57,'Paraná'),(58,'Formosa'),(59,'Neuquén'),(60,'Rosario'),(61,'Buenos Aires'),(62,'Córdoba'),(63,'Rosario'),(64,'Mendoza'),(65,'La Plata'),(66,'Mar del Plata'),(67,'San Miguel de Tucumán'),(68,'Salta'),(69,'Santa Fe'),(70,'San Juan'),(71,'Resistencia'),(72,'Santiago del Estero'),(73,'Corrientes'),(74,'Posadas'),(75,'San Salvador de Jujuy'),(76,'Bahía Blanca'),(77,'Paraná'),(78,'Formosa'),(79,'Neuquén'),(80,'Santa Fe'),(81,'Buenos Aires'),(82,'Córdoba'),(83,'Rosario'),(84,'Mendoza'),(85,'La Plata'),(86,'Mar del Plata'),(87,'San Miguel de Tucumán'),(88,'Salta'),(89,'Santa Fe'),(90,'San Juan'),(91,'Resistencia'),(92,'Santiago del Estero'),(93,'Corrientes'),(94,'Posadas'),(95,'San Salvador de Jujuy'),(96,'Bahía Blanca'),(97,'Paraná'),(98,'Formosa'),(99,'Neuquén'),(100,'Rosario'),(101,'Rosario'),(102,'La Plata'),(103,'Mendoza'),(104,'Córdoba'),(105,'Mar del Plata'),(106,'Mendoza'),(107,'Tucumán'),(108,'Salta'),(109,'Tucumán'),(110,'Salta'),(111,'Salta'),(112,'Rosario'),(113,'Rosario'),(114,'Córdoba'),(115,'Córdoba'),(116,'Mar del Plata'),(117,'Córdoba'),(118,'Rosario'),(119,'Buenos Aires'),(120,'Tucumán'),(121,'San Juan'),(122,'Santa Fe'),(123,'Buenos Aires'),(124,'Buenos Aires'),(125,'Rosario'),(126,'San Juan'),(127,'Buenos Aires'),(128,'La Plata'),(129,'Córdoba'),(130,'Córdoba'),(131,'San Juan'),(132,'Rosario'),(133,'Mar del Plata'),(134,'Buenos Aires'),(135,'San Juan'),(136,'Mendoza'),(137,'La Plata'),(138,'Santa Fe'),(139,'Mendoza'),(140,'Tucumán'),(141,'Rosario'),(142,'Buenos Aires'),(143,'Buenos Aires'),(144,'Mendoza'),(145,'Salta'),(146,'Buenos Aires'),(147,'Córdoba'),(148,'Córdoba'),(149,'Mendoza'),(150,'Tucumán'),(151,'Rosario'),(152,'San Juan'),(153,'La Plata'),(154,'Mar del Plata'),(155,'Tucumán'),(156,'Rosario'),(157,'Santa Fe'),(158,'Salta'),(159,'La Plata'),(160,'Mar del Plata'),(161,'Santa Fe'),(162,'San Juan'),(163,'Salta'),(164,'Mar del Plata'),(165,'Mar del Plata'),(166,'Mendoza'),(167,'Buenos Aires'),(168,'Santa Fe'),(169,'Córdoba'),(170,'Buenos Aires'),(171,'Buenos Aires'),(172,'Mar del Plata'),(173,'Rosario'),(174,'La Plata'),(175,'Buenos Aires'),(176,'Santa Fe'),(177,'Rosario'),(178,'La Plata'),(179,'San Juan'),(180,'Córdoba'),(181,'Mar del Plata'),(182,'Córdoba'),(183,'La Plata'),(184,'Salta'),(185,'Santa Fe'),(186,'La Plata'),(187,'Rosario'),(188,'La Plata'),(189,'La Plata'),(190,'Rosario'),(191,'Mar del Plata'),(192,'Buenos Aires'),(193,'San Juan'),(194,'Salta'),(195,'Salta'),(196,'Mar del Plata'),(197,'Santa Fe'),(198,'Mendoza'),(199,'Buenos Aires'),(200,'Salta'),(201,'Salta'),(202,'Tucumán'),(203,'San Juan'),(204,'Santa Fe'),(205,'San Juan'),(206,'Buenos Aires'),(207,'Córdoba'),(208,'Mar del Plata'),(209,'San Juan'),(210,'Buenos Aires'),(211,'Mendoza'),(212,'Santa Fe'),(213,'Córdoba'),(214,'Salta'),(215,'La Plata'),(216,'Salta'),(217,'Santa Fe'),(218,'Rosario'),(219,'Mendoza'),(220,'Santa Fe'),(221,'Salta'),(222,'Buenos Aires'),(223,'Tucumán'),(224,'Rosario'),(225,'Mendoza'),(226,'Rosario'),(227,'La Plata'),(228,'Salta'),(229,'Salta'),(230,'Santa Fe'),(231,'Mar del Plata'),(232,'Santa Fe'),(233,'Santa Fe'),(234,'Buenos Aires'),(235,'Rosario'),(236,'Córdoba'),(237,'Córdoba'),(238,'Rosario'),(239,'Córdoba'),(240,'Buenos Aires'),(241,'Tucumán'),(242,'Tucumán'),(243,'Córdoba'),(244,'San Juan'),(245,'Córdoba'),(246,'Tucumán'),(247,'San Juan'),(248,'Mendoza'),(249,'Buenos Aires'),(250,'La Plata'),(251,'Rosario'),(252,'Salta'),(253,'Buenos Aires'),(254,'San Juan'),(255,'Santa Fe'),(256,'Mar del Plata'),(257,'Mar del Plata'),(258,'Córdoba'),(259,'Salta'),(260,'Buenos Aires'),(261,'Buenos Aires'),(262,'Rosario'),(263,'Salta'),(264,'Mendoza'),(265,'Mendoza'),(266,'Tucumán'),(267,'Mendoza'),(268,'Mendoza'),(269,'Tucumán'),(270,'La Plata'),(271,'Buenos Aires'),(272,'Buenos Aires'),(273,'Buenos Aires'),(274,'Salta'),(275,'Tucumán'),(276,'Santa Fe'),(277,'Salta'),(278,'Santa Fe'),(279,'Salta'),(280,'La Plata'),(281,'Mendoza'),(282,'Buenos Aires'),(283,'Buenos Aires'),(284,'Salta'),(285,'San Juan'),(286,'Buenos Aires'),(287,'Mar del Plata'),(288,'Buenos Aires'),(289,'Mar del Plata'),(290,'La Plata'),(291,'La Plata'),(292,'Rosario'),(293,'Salta'),(294,'Tucumán'),(295,'Mendoza'),(296,'Salta'),(297,'Mar del Plata'),(298,'La Plata'),(299,'Córdoba'),(300,'Mendoza'),(301,'Buenos Aires'),(302,'Buenos Aires'),(303,'Mar del Plata'),(304,'Santa Fe'),(305,'Santa Fe'),(306,'La Plata'),(307,'Córdoba'),(308,'La Plata'),(309,'Salta'),(310,'Mendoza'),(311,'Santa Fe'),(312,'Mendoza'),(313,'Mar del Plata'),(314,'Córdoba'),(315,'Santa Fe'),(316,'San Juan'),(317,'Santa Fe'),(318,'Salta'),(319,'Santa Fe'),(320,'Tucumán'),(321,'Salta'),(322,'San Juan'),(323,'Tucumán'),(324,'Rosario'),(325,'Mendoza'),(326,'Mendoza'),(327,'Córdoba'),(328,'La Plata'),(329,'Santa Fe'),(330,'Mar del Plata'),(331,'Mar del Plata'),(332,'Salta'),(333,'Rosario'),(334,'Mendoza'),(335,'Rosario'),(336,'La Plata'),(337,'Córdoba'),(338,'La Plata'),(339,'Salta'),(340,'San Juan'),(341,'La Plata'),(342,'Rosario'),(343,'Buenos Aires'),(344,'Tucumán'),(345,'Córdoba'),(346,'Tucumán'),(347,'Córdoba'),(348,'Rosario'),(349,'Mendoza'),(350,'Tucumán'),(351,'Salta'),(352,'Buenos Aires'),(353,'Tucumán'),(354,'Rosario'),(355,'Mendoza'),(356,'Tucumán'),(357,'Córdoba'),(358,'Mendoza'),(359,'Tucumán'),(360,'Córdoba'),(361,'San Juan'),(362,'San Juan'),(363,'Córdoba'),(364,'Buenos Aires'),(365,'La Plata'),(366,'Buenos Aires'),(367,'Mar del Plata'),(368,'Mendoza'),(369,'Córdoba'),(370,'Rosario'),(371,'Rosario'),(372,'La Plata'),(373,'Rosario'),(374,'Mendoza'),(375,'Mendoza'),(376,'San Juan'),(377,'La Plata'),(378,'Mar del Plata'),(379,'Tucumán'),(380,'San Juan'),(381,'Mendoza'),(382,'Tucumán'),(383,'Tucumán'),(384,'Rosario'),(385,'Tucumán'),(386,'Tucumán'),(387,'Rosario'),(388,'Santa Fe'),(389,'Mendoza'),(390,'Córdoba'),(391,'San Juan'),(392,'Mar del Plata'),(393,'Rosario'),(394,'Mar del Plata'),(395,'Mendoza'),(396,'San Juan'),(397,'Mendoza'),(398,'Rosario'),(399,'San Juan'),(400,'Tucumán'),(401,'Mendoza'),(402,'Salta'),(403,'Buenos Aires'),(404,'Rosario'),(405,'San Juan'),(406,'Tucumán'),(407,'Tucumán'),(408,'Buenos Aires'),(409,'San Juan'),(410,'Mendoza'),(411,'Salta'),(412,'Santa Fe'),(413,'Buenos Aires'),(414,'Córdoba'),(415,'Mar del Plata'),(416,'Córdoba'),(417,'Mar del Plata'),(418,'Córdoba'),(419,'Rosario'),(420,'Rosario'),(421,'Mendoza'),(422,'Rosario'),(423,'Mar del Plata'),(424,'San Juan'),(425,'Buenos Aires'),(426,'Salta'),(427,'Salta'),(428,'San Juan'),(429,'Mendoza'),(430,'Tucumán'),(431,'Tucumán'),(432,'San Juan'),(433,'Salta'),(434,'Mar del Plata'),(435,'Buenos Aires'),(436,'Santa Fe'),(437,'Mar del Plata'),(438,'Mar del Plata'),(439,'Mendoza'),(440,'Tucumán'),(441,'Santa Fe'),(442,'Salta'),(443,'Mendoza'),(444,'Rosario'),(445,'Santa Fe'),(446,'Buenos Aires'),(447,'Rosario'),(448,'San Juan'),(449,'Mendoza'),(450,'Tucumán'),(451,'Mendoza'),(452,'Córdoba'),(453,'Santa Fe'),(454,'Mendoza'),(455,'Buenos Aires'),(456,'San Juan'),(457,'Salta'),(458,'Tucumán'),(459,'Mar del Plata'),(460,'Mendoza'),(461,'Mar del Plata'),(462,'Salta'),(463,'La Plata'),(464,'Mendoza'),(465,'Mar del Plata'),(466,'Córdoba'),(467,'Mar del Plata'),(468,'Tucumán'),(469,'Córdoba'),(470,'Buenos Aires'),(471,'Mar del Plata'),(472,'Rosario'),(473,'San Juan'),(474,'San Juan'),(475,'Mendoza'),(476,'Córdoba'),(477,'Salta'),(478,'Mar del Plata'),(479,'Buenos Aires'),(480,'San Juan'),(481,'Santa Fe'),(482,'Mendoza'),(483,'Mendoza'),(484,'Córdoba'),(485,'Buenos Aires'),(486,'Salta'),(487,'Rosario'),(488,'San Juan'),(489,'Salta'),(490,'Santa Fe'),(491,'Córdoba'),(492,'Salta'),(493,'Rosario'),(494,'Córdoba'),(495,'Mendoza'),(496,'Mendoza'),(497,'Mar del Plata'),(498,'Salta'),(499,'Mar del Plata'),(500,'Rosario'),(501,'Santa Fe'),(502,'Tucumán'),(503,'Rosario'),(504,'Santa Fe'),(505,'Salta'),(506,'Salta'),(507,'San Juan'),(508,'Tucumán'),(509,'Salta'),(510,'Mendoza'),(511,'Mendoza'),(512,'Salta'),(513,'Tucumán'),(514,'San Juan'),(515,'Santa Fe'),(516,'Mar del Plata'),(517,'Buenos Aires'),(518,'Santa Fe'),(519,'San Juan'),(520,'La Plata'),(521,'Córdoba'),(522,'Córdoba'),(523,'Tucumán'),(524,'Rosario'),(525,'Córdoba'),(526,'Tucumán'),(527,'La Plata'),(528,'Córdoba'),(529,'Buenos Aires'),(530,'Santa Fe'),(531,'La Plata'),(532,'Córdoba'),(533,'San Juan'),(534,'Buenos Aires'),(535,'Buenos Aires'),(536,'Mar del Plata'),(537,'Rosario'),(538,'Santa Fe'),(539,'Rosario'),(540,'Tucumán'),(541,'Salta'),(542,'San Juan'),(543,'Santa Fe'),(544,'Mar del Plata'),(545,'La Plata'),(546,'La Plata'),(547,'Mar del Plata'),(548,'Mar del Plata'),(549,'Rosario'),(550,'Tucumán'),(551,'Mar del Plata'),(552,'Tucumán'),(553,'Tucumán'),(554,'Mar del Plata'),(555,'Santa Fe'),(556,'Rosario'),(557,'La Plata'),(558,'La Plata'),(559,'Santa Fe'),(560,'San Juan'),(561,'La Plata'),(562,'Rosario'),(563,'La Plata'),(564,'Salta'),(565,'La Plata'),(566,'Tucumán'),(567,'Buenos Aires'),(568,'San Juan'),(569,'Buenos Aires'),(570,'Mar del Plata'),(571,'Córdoba'),(572,'Santa Fe'),(573,'Buenos Aires'),(574,'Salta'),(575,'Mendoza'),(576,'Mendoza'),(577,'Salta'),(578,'Santa Fe'),(579,'Mendoza'),(580,'Tucumán'),(581,'San Juan'),(582,'Buenos Aires'),(583,'La Plata'),(584,'Santa Fe'),(585,'Santa Fe'),(586,'Buenos Aires'),(587,'Mar del Plata'),(588,'Mendoza'),(589,'La Plata'),(590,'Mendoza'),(591,'Buenos Aires'),(592,'Buenos Aires'),(593,'Córdoba'),(594,'Rosario'),(595,'Rosario'),(596,'Santa Fe'),(597,'Mar del Plata'),(598,'Santa Fe'),(599,'Santa Fe'),(600,'Tucumán'),(601,'Tucumán'),(602,'Tucumán'),(603,'Santa Fe'),(604,'San Juan'),(605,'San Juan'),(606,'Rosario'),(607,'Tucumán'),(608,'Mar del Plata'),(609,'Santa Fe'),(610,'Mendoza'),(611,'Buenos Aires'),(612,'Mar del Plata'),(613,'San Juan'),(614,'Rosario'),(615,'Buenos Aires'),(616,'Mendoza'),(617,'San Juan'),(618,'Buenos Aires'),(619,'Salta'),(620,'Mar del Plata'),(621,'Buenos Aires'),(622,'Buenos Aires'),(623,'Rosario'),(624,'Tucumán'),(625,'Salta'),(626,'Salta'),(627,'Córdoba'),(628,'Rosario'),(629,'Tucumán'),(630,'Rosario'),(631,'Tucumán'),(632,'La Plata'),(633,'Tucumán'),(634,'Tucumán'),(635,'Mar del Plata'),(636,'Rosario'),(637,'San Juan'),(638,'Córdoba'),(639,'Mar del Plata'),(640,'Mendoza'),(641,'Salta'),(642,'Rosario'),(643,'Rosario'),(644,'Rosario'),(645,'Mar del Plata'),(646,'Santa Fe'),(647,'Mendoza'),(648,'Córdoba'),(649,'Mar del Plata'),(650,'Buenos Aires'),(651,'Córdoba'),(652,'Mendoza'),(653,'Rosario'),(654,'Mendoza'),(655,'Córdoba'),(656,'Tucumán'),(657,'Mar del Plata'),(658,'Tucumán'),(659,'La Plata'),(660,'Mar del Plata'),(661,'Mendoza'),(662,'La Plata'),(663,'Mar del Plata'),(664,'Rosario'),(665,'Rosario'),(666,'Mar del Plata'),(667,'Santa Fe'),(668,'Buenos Aires'),(669,'Mar del Plata'),(670,'La Plata'),(671,'San Juan'),(672,'Mar del Plata'),(673,'Rosario'),(674,'Santa Fe'),(675,'Buenos Aires'),(676,'San Juan'),(677,'San Juan'),(678,'Córdoba'),(679,'Santa Fe'),(680,'Salta'),(681,'Santa Fe'),(682,'San Juan'),(683,'Santa Fe'),(684,'Mendoza'),(685,'Rosario'),(686,'San Juan'),(687,'La Plata'),(688,'Mar del Plata'),(689,'Tucumán'),(690,'Santa Fe'),(691,'Tucumán'),(692,'Mar del Plata'),(693,'Mar del Plata'),(694,'San Juan'),(695,'Rosario'),(696,'Buenos Aires'),(697,'Mar del Plata'),(698,'Rosario'),(699,'Santa Fe'),(700,'Santa Fe'),(701,'Buenos Aires'),(702,'Mar del Plata'),(703,'La Plata'),(704,'Tucumán'),(705,'Salta'),(706,'Salta'),(707,'La Plata'),(708,'San Juan'),(709,'Mar del Plata'),(710,'Buenos Aires'),(711,'Santa Fe'),(712,'Córdoba'),(713,'Buenos Aires'),(714,'Rosario'),(715,'La Plata'),(716,'Salta'),(717,'San Juan'),(718,'Salta'),(719,'La Plata'),(720,'La Plata'),(721,'Rosario'),(722,'San Juan'),(723,'Rosario'),(724,'La Plata'),(725,'La Plata'),(726,'Mendoza'),(727,'Córdoba'),(728,'Tucumán'),(729,'Santa Fe'),(730,'Salta'),(731,'Córdoba'),(732,'Santa Fe'),(733,'San Juan'),(734,'Salta'),(735,'Salta'),(736,'La Plata'),(737,'La Plata'),(738,'Tucumán'),(739,'San Juan'),(740,'Tucumán'),(741,'Buenos Aires'),(742,'Santa Fe'),(743,'Mar del Plata'),(744,'Buenos Aires'),(745,'Salta'),(746,'Buenos Aires'),(747,'Rosario'),(748,'Santa Fe'),(749,'Tucumán'),(750,'Buenos Aires'),(751,'La Plata'),(752,'La Plata'),(753,'Mar del Plata'),(754,'Salta'),(755,'San Juan'),(756,'La Plata'),(757,'San Juan'),(758,'San Juan'),(759,'Buenos Aires'),(760,'La Plata'),(761,'San Juan'),(762,'Tucumán'),(763,'Córdoba'),(764,'Santa Fe'),(765,'Santa Fe'),(766,'Salta'),(767,'Buenos Aires'),(768,'San Juan'),(769,'Rosario'),(770,'Salta'),(771,'San Juan'),(772,'Mendoza'),(773,'Santa Fe'),(774,'Tucumán'),(775,'San Juan'),(776,'Rosario'),(777,'Rosario'),(778,'Mendoza'),(779,'Buenos Aires'),(780,'La Plata'),(781,'Córdoba'),(782,'Santa Fe'),(783,'La Plata'),(784,'Rosario'),(785,'Buenos Aires'),(786,'Córdoba'),(787,'Mendoza'),(788,'Mendoza'),(789,'Mendoza'),(790,'Córdoba'),(791,'San Juan'),(792,'Tucumán'),(793,'San Juan'),(794,'Córdoba'),(795,'Mendoza'),(796,'Santa Fe'),(797,'Mar del Plata'),(798,'Mendoza'),(799,'Tucumán'),(800,'Salta'),(801,'San Juan'),(802,'San Juan'),(803,'Córdoba'),(804,'Buenos Aires'),(805,'Salta'),(806,'Rosario'),(807,'San Juan'),(808,'Rosario'),(809,'Buenos Aires'),(810,'Tucumán'),(811,'Rosario'),(812,'Tucumán'),(813,'Rosario'),(814,'San Juan'),(815,'Salta'),(816,'Rosario'),(817,'Santa Fe'),(818,'Mendoza'),(819,'Córdoba'),(820,'Salta'),(821,'Mendoza'),(822,'Córdoba'),(823,'Rosario'),(824,'Buenos Aires'),(825,'Salta'),(826,'Santa Fe'),(827,'Santa Fe'),(828,'San Juan'),(829,'Buenos Aires'),(830,'Santa Fe'),(831,'Mar del Plata'),(832,'Mendoza'),(833,'Tucumán'),(834,'Córdoba'),(835,'Santa Fe'),(836,'Buenos Aires'),(837,'Mar del Plata'),(838,'Tucumán'),(839,'La Plata'),(840,'Salta'),(841,'Santa Fe'),(842,'Buenos Aires'),(843,'Rosario'),(844,'Santa Fe'),(845,'Buenos Aires'),(846,'La Plata'),(847,'Santa Fe'),(848,'Rosario'),(849,'Salta'),(850,'Salta'),(851,'Tucumán'),(852,'Rosario'),(853,'Mendoza'),(854,'Tucumán'),(855,'Rosario'),(856,'Rosario'),(857,'Salta'),(858,'Buenos Aires'),(859,'Mendoza'),(860,'Mar del Plata'),(861,'La Plata'),(862,'Santa Fe'),(863,'La Plata'),(864,'Mar del Plata'),(865,'Mar del Plata'),(866,'Mendoza'),(867,'San Juan'),(868,'Córdoba'),(869,'Córdoba'),(870,'Santa Fe'),(871,'Buenos Aires'),(872,'San Juan'),(873,'Mendoza'),(874,'Mar del Plata'),(875,'San Juan'),(876,'Salta'),(877,'Mendoza'),(878,'Tucumán'),(879,'La Plata'),(880,'San Juan'),(881,'San Juan'),(882,'La Plata'),(883,'Santa Fe'),(884,'La Plata'),(885,'La Plata'),(886,'Santa Fe'),(887,'San Juan'),(888,'Mar del Plata'),(889,'La Plata'),(890,'La Plata'),(891,'San Juan'),(892,'San Juan'),(893,'Tucumán'),(894,'Córdoba'),(895,'Mendoza'),(896,'San Juan'),(897,'Mendoza'),(898,'Rosario'),(899,'Santa Fe'),(900,'Buenos Aires'),(901,'Mar del Plata'),(902,'Buenos Aires'),(903,'Salta'),(904,'Santa Fe'),(905,'La Plata'),(906,'Mar del Plata'),(907,'Mendoza'),(908,'Córdoba'),(909,'La Plata'),(910,'La Plata'),(911,'Mar del Plata'),(912,'Rosario'),(913,'Santa Fe'),(914,'Buenos Aires'),(915,'Salta'),(916,'La Plata'),(917,'San Juan'),(918,'San Juan'),(919,'Santa Fe'),(920,'Rosario'),(921,'Santa Fe'),(922,'San Juan'),(923,'Santa Fe'),(924,'Santa Fe'),(925,'Salta'),(926,'Salta'),(927,'Buenos Aires'),(928,'Córdoba'),(929,'Mar del Plata'),(930,'Santa Fe'),(931,'Córdoba'),(932,'Salta'),(933,'Mendoza'),(934,'Mendoza'),(935,'Mendoza'),(936,'Tucumán'),(937,'La Plata'),(938,'Santa Fe'),(939,'Buenos Aires'),(940,'Salta'),(941,'Mar del Plata'),(942,'Mar del Plata'),(943,'Buenos Aires'),(944,'Tucumán'),(945,'La Plata'),(946,'Mendoza'),(947,'Mar del Plata'),(948,'Mendoza'),(949,'Córdoba'),(950,'Córdoba'),(951,'San Juan'),(952,'Córdoba'),(953,'Santa Fe'),(954,'Tucumán'),(955,'Buenos Aires'),(956,'Santa Fe'),(957,'Rosario'),(958,'Mendoza'),(959,'Tucumán'),(960,'Tucumán'),(961,'Córdoba'),(962,'Tucumán'),(963,'La Plata'),(964,'Buenos Aires'),(965,'Rosario'),(966,'Salta'),(967,'Santa Fe'),(968,'San Juan'),(969,'Rosario'),(970,'San Juan'),(971,'Rosario'),(972,'Buenos Aires'),(973,'Córdoba'),(974,'Rosario'),(975,'Buenos Aires'),(976,'Salta'),(977,'Santa Fe'),(978,'Rosario'),(979,'Tucumán'),(980,'Tucumán'),(981,'Mar del Plata'),(982,'Mendoza'),(983,'San Juan'),(984,'Buenos Aires'),(985,'Buenos Aires'),(986,'Rosario'),(987,'Salta'),(988,'Santa Fe'),(989,'Córdoba'),(990,'Rosario'),(991,'Tucumán'),(992,'Santa Fe'),(993,'Tucumán'),(994,'Mendoza'),(995,'Santa Fe'),(996,'Córdoba'),(997,'Salta'),(998,'Salta'),(999,'Mendoza'),(1000,'La Plata');
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos` (
  `id_medicamento` int NOT NULL AUTO_INCREMENT,
  `tipo_medicamento` varchar(200) DEFAULT NULL,
  `cantidad` int NOT NULL,
  `fecha_compra` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `precio_unitario` float NOT NULL,
  `monto_impositivo` float NOT NULL,
  `monto_total` float DEFAULT NULL,
  PRIMARY KEY (`id_medicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (1,'Antibióticos',50,'2024-01-12','2035-08-23',40501,2089.37,42590.4),(2,'Antibióticos',20,'2024-07-06','2025-02-16',11137.1,3159.51,14296.6),(3,'Antiinflamatorios',41,'2023-03-03','2025-10-29',7342.12,7039.73,14381.8),(4,'Vitaminas',43,'2024-07-20','2028-07-21',62007.8,5608.4,NULL),(5,'Antiparasitarios',21,'2023-04-11','2023-09-05',39877.4,4777.34,NULL),(6,'Vitaminas',47,'2024-05-09','2036-01-24',32071.9,7635.66,NULL),(7,'Vitaminas',3,'2023-03-29','2038-08-13',17057.4,8625.33,NULL),(8,'Antibióticos',15,'2024-03-12','2034-03-10',60300.8,5503.32,NULL),(9,'Vitaminas',36,'2022-12-16','2039-05-14',47544.8,5343.82,NULL),(10,'Antibióticos',39,'2023-09-26','2030-08-15',59399.4,2817.38,NULL),(11,'Antiparasitarios',38,'2022-11-23','2036-03-01',8660.33,2286.72,NULL),(12,'Analgésicos',20,'2023-02-25','2034-04-19',58553.4,6986.61,NULL),(13,'Antibióticos',15,'2024-07-24','2031-09-19',47048.1,4626.41,NULL),(14,'Antiparasitarios',32,'2023-12-14','2030-11-20',36327.1,3349.95,NULL),(15,'Analgésicos',22,'2022-11-14','2034-03-02',27719.8,1176.25,NULL),(16,'Antiinflamatorios',21,'2023-11-14','2036-01-09',30480.2,2140.27,NULL),(17,'Antiinflamatorios',48,'2022-09-17','2023-12-27',60854.5,7961.54,NULL),(18,'Antibióticos',49,'2024-04-14','2038-07-26',62354.2,9423.15,NULL),(19,'Antiinflamatorios',48,'2024-06-27','2029-08-23',11544.6,8169.9,NULL),(20,'Analgésicos',41,'2023-03-15','2025-06-05',55919,3282.77,NULL),(21,'Antiinflamatorios',24,'2023-02-25','2035-04-13',61009.1,9614.85,NULL),(22,'Antibióticos',35,'2023-11-12','2025-03-01',21503.9,6877.52,NULL),(23,'Vitaminas',13,'2023-05-01','2038-10-29',25308.8,1381.23,NULL),(24,'Antiparasitarios',49,'2023-10-16','2030-02-15',40753.8,8453.48,NULL),(25,'Vitaminas',29,'2023-03-02','2039-03-11',62312.1,1085.73,NULL),(26,'Antibióticos',3,'2023-01-05','2033-12-18',45714.5,9759.23,NULL),(27,'Vitaminas',48,'2024-06-13','2040-04-09',44198.3,6662.43,NULL),(28,'Antibióticos',32,'2024-04-18','2039-11-14',31683,6924.19,NULL),(29,'Antiinflamatorios',16,'2023-01-18','2029-06-28',14143,3828.54,NULL),(30,'Vitaminas',29,'2024-04-04','2032-03-27',54873.7,5633.96,NULL),(31,'Vitaminas',6,'2024-01-29','2036-08-25',50569.8,1994.75,NULL),(32,'Antiparasitarios',22,'2023-01-19','2035-01-19',10372.7,4634.48,NULL),(33,'Antiparasitarios',7,'2024-02-05','2037-03-29',62845.6,9907.54,NULL),(34,'Antiparasitarios',16,'2023-04-04','2030-06-29',47350.3,6303.34,NULL),(35,'Antiparasitarios',4,'2023-03-21','2033-01-25',57049.8,3915.33,NULL),(36,'Analgésicos',49,'2024-08-13','2030-09-08',33776.3,4357.99,NULL),(37,'Analgésicos',1,'2023-05-12','2037-06-04',64899.6,8466.19,NULL),(38,'Analgésicos',16,'2022-10-18','2039-05-30',14492.9,3425.17,NULL),(39,'Antiparasitarios',41,'2022-11-05','2030-12-29',51730.4,2043.91,NULL),(40,'Antiinflamatorios',35,'2023-05-22','2039-05-23',6523.44,5432.7,NULL),(41,'Antiinflamatorios',16,'2023-03-15','2030-04-09',11067.3,6313.69,NULL),(42,'Analgésicos',41,'2024-03-27','2038-04-19',72564.7,1260.95,NULL),(43,'Antibióticos',24,'2023-07-21','2040-06-15',22212.6,9838.18,NULL),(44,'Antibióticos',39,'2023-09-04','2032-08-22',70150.3,8285.29,NULL),(45,'Antiinflamatorios',30,'2022-09-08','2033-05-22',11294.8,7004.91,NULL),(46,'Vitaminas',20,'2023-04-02','2026-09-05',39497.5,2786.03,NULL),(47,'Analgésicos',5,'2024-06-07','2032-01-09',71588.3,9025.9,NULL),(48,'Antibióticos',10,'2023-02-26','2030-05-24',17640.6,3790.2,NULL),(49,'Antiparasitarios',27,'2023-01-17','2033-07-10',64532.8,2190.98,NULL),(50,'Analgésicos',27,'2024-04-14','2032-04-29',44528.9,4670.14,NULL),(51,'Antibióticos',16,'2024-07-11','2038-07-19',54384.5,1702.74,NULL),(52,'Antiinflamatorios',17,'2023-10-30','2039-07-15',78053.6,8421.6,NULL),(53,'Antiinflamatorios',49,'2022-10-19','2027-01-07',79238.8,7195.46,NULL),(54,'Antiinflamatorios',27,'2023-10-22','2033-10-13',10870.8,7095.94,NULL),(55,'Vitaminas',45,'2024-07-04','2025-06-27',48507.9,9973.7,NULL),(56,'Analgésicos',8,'2024-04-01','2031-10-18',24228.9,7325.93,NULL),(57,'Antibióticos',28,'2024-08-04','2038-11-27',49988.1,1349.14,NULL),(58,'Vitaminas',48,'2023-02-28','2040-01-24',56537,9895.09,NULL),(59,'Antiparasitarios',14,'2023-12-24','2030-04-03',6285.38,1346.59,NULL),(60,'Antiparasitarios',9,'2023-07-11','2038-09-23',59872.5,2953.85,NULL),(61,'Antibióticos',22,'2022-11-03','2033-01-27',15446.1,9464.7,NULL),(62,'Antibióticos',38,'2024-08-09','2027-04-25',45783.1,9537.4,NULL),(63,'Analgésicos',16,'2022-11-03','2037-02-04',24119.9,5012.71,NULL),(64,'Antiparasitarios',50,'2023-11-19','2029-02-03',50451.5,2388.88,NULL),(65,'Antiinflamatorios',3,'2024-07-13','2036-10-08',29353.2,7856.76,NULL),(66,'Antiparasitarios',32,'2023-06-28','2029-01-21',18812.5,1804.69,NULL),(67,'Antiinflamatorios',29,'2023-04-06','2036-05-23',61880.9,5484.15,NULL),(68,'Antibióticos',37,'2023-03-14','2031-07-17',10294.9,2470.72,NULL),(69,'Antiinflamatorios',23,'2023-02-28','2038-05-04',49117.6,4964.78,NULL),(70,'Antiinflamatorios',26,'2023-02-26','2031-06-06',63976.3,1407.65,NULL),(71,'Antiparasitarios',21,'2022-11-25','2026-10-07',7810.59,5825.95,NULL),(72,'Analgésicos',27,'2022-10-13','2026-03-20',63662.5,9018.76,NULL),(73,'Antibióticos',8,'2023-09-09','2028-05-18',47773.1,1234.67,NULL),(74,'Antiinflamatorios',2,'2023-06-03','2036-03-13',62624.6,5609.1,NULL),(75,'Vitaminas',11,'2023-09-13','2032-04-10',19600.6,5888.69,NULL),(76,'Vitaminas',18,'2023-02-18','2032-04-16',53792.8,7366.28,NULL),(77,'Antiinflamatorios',24,'2023-07-29','2028-07-24',11527.4,9451.54,NULL),(78,'Antiparasitarios',22,'2023-09-19','2023-03-06',42508.1,8185.66,NULL),(79,'Antiparasitarios',17,'2023-03-30','2033-03-20',56798.2,7111.25,NULL),(80,'Vitaminas',26,'2023-04-18','2024-05-13',63521.8,2935.52,NULL),(81,'Antiinflamatorios',4,'2023-10-31','2026-06-22',78939.5,5266.86,NULL),(82,'Vitaminas',40,'2024-01-19','2033-08-01',79494.4,4494.61,NULL),(83,'Antibióticos',2,'2023-09-27','2029-08-24',35466.5,4893.71,NULL),(84,'Antiinflamatorios',6,'2023-10-05','2023-09-18',54174.9,4919.34,NULL),(85,'Antibióticos',31,'2023-12-14','2038-01-03',68673.9,3999.82,NULL),(86,'Vitaminas',40,'2023-06-26','2029-06-22',76937.8,7123.14,NULL),(87,'Analgésicos',16,'2023-06-17','2023-01-21',72979.5,8259.44,NULL),(88,'Vitaminas',25,'2023-02-14','2034-08-02',57507.1,5932.65,NULL),(89,'Antiinflamatorios',35,'2022-12-02','2035-03-25',72323.5,4776.71,NULL),(90,'Antiparasitarios',10,'2023-10-09','2031-07-11',43320.5,5043.19,NULL),(91,'Antiinflamatorios',41,'2022-11-21','2030-02-12',18476.1,4673.29,NULL),(92,'Vitaminas',26,'2023-11-18','2037-12-02',68390,7214.38,NULL),(93,'Analgésicos',17,'2023-10-30','2039-08-11',69368.7,9438.71,NULL),(94,'Antiparasitarios',45,'2023-06-14','2027-01-07',76761.8,6379.5,NULL),(95,'Antiparasitarios',44,'2024-01-10','2022-12-31',47962.5,5209.77,NULL),(96,'Antiinflamatorios',39,'2023-06-13','2023-08-10',66482.9,9769.44,NULL),(97,'Analgésicos',50,'2024-06-07','2023-05-23',20544.6,8843.72,NULL),(98,'Vitaminas',4,'2023-03-16','2037-12-30',34021.8,5921.09,NULL),(99,'Vitaminas',22,'2024-08-17','2027-02-26',58802.3,7895.71,NULL),(100,'Antiinflamatorios',10,'2022-09-01','2029-06-02',63802,3516.58,NULL),(101,'Antiparasitarios',28,'2024-08-12','2028-10-04',61168.9,2928.22,NULL),(102,'Antiinflamatorios',32,'2023-10-11','2027-02-18',48754.9,9907.87,NULL),(103,'Antiinflamatorios',40,'2022-08-21','2030-10-30',18289.3,2180.26,NULL),(104,'Vitaminas',19,'2022-12-19','2038-09-22',39516.6,3059.46,NULL),(105,'Analgésicos',35,'2023-08-31','2023-05-24',79130.3,5390.08,NULL),(106,'Antiparasitarios',7,'2023-09-13','2027-01-28',30603.8,6206.27,NULL),(107,'Antiparasitarios',2,'2024-07-28','2036-06-08',10523.2,3123.9,NULL),(108,'Antiparasitarios',21,'2024-06-01','2033-03-07',75443.3,2383.47,NULL),(109,'Analgésicos',14,'2023-12-27','2036-06-24',47279.3,1900.63,NULL),(110,'Vitaminas',41,'2023-12-16','2027-10-14',48373.3,9813.8,NULL),(111,'Antiinflamatorios',43,'2023-07-29','2035-11-15',49462.7,5516.47,NULL),(112,'Antiparasitarios',32,'2023-11-12','2031-12-08',37922.8,1113.37,NULL),(113,'Analgésicos',7,'2024-01-21','2037-03-02',75233.4,6188.65,NULL),(114,'Analgésicos',2,'2023-09-19','2036-11-22',53320,1826.29,NULL),(115,'Antiinflamatorios',29,'2023-04-16','2036-10-09',28170.7,2125.12,NULL),(116,'Analgésicos',28,'2024-07-18','2033-03-23',27884,4971.98,NULL),(117,'Vitaminas',2,'2022-11-12','2034-10-27',17194.7,7481.61,NULL),(118,'Antiinflamatorios',5,'2024-08-09','2025-07-09',14870,5937.56,NULL),(119,'Antibióticos',13,'2022-08-30','2027-06-04',34859.8,1187.18,NULL),(120,'Vitaminas',36,'2024-07-20','2038-10-02',8486.45,6661.02,NULL),(121,'Antiparasitarios',4,'2023-12-02','2032-11-28',67547,2343.94,NULL),(122,'Antiparasitarios',21,'2022-12-12','2030-08-01',56088.4,4510.68,NULL),(123,'Antiparasitarios',39,'2024-05-10','2034-04-07',46903.3,1356.45,NULL),(124,'Antiparasitarios',50,'2023-07-21','2025-05-29',27106.8,6159.17,NULL),(125,'Antiparasitarios',34,'2024-04-04','2033-11-10',74378.6,5757.5,NULL),(126,'Antiparasitarios',30,'2024-06-07','2026-12-03',26700.8,2529.31,NULL),(127,'Antiinflamatorios',41,'2023-07-04','2033-03-22',71590.3,5490.59,NULL),(128,'Antiparasitarios',49,'2024-05-17','2024-03-20',64410.2,5332.31,NULL),(129,'Analgésicos',19,'2024-06-16','2037-04-27',45894.4,2789.61,NULL),(130,'Antiinflamatorios',19,'2024-08-09','2028-10-22',79392.4,7928.38,NULL),(131,'Antiparasitarios',30,'2024-03-07','2036-07-19',67729.9,4784.14,NULL),(132,'Antiinflamatorios',29,'2023-06-21','2023-07-04',53247.7,8776.13,NULL),(133,'Antiparasitarios',27,'2024-07-15','2037-02-14',28093.1,7932.06,NULL),(134,'Antiparasitarios',34,'2024-01-08','2029-03-07',51069.8,2518.37,NULL),(135,'Antiinflamatorios',37,'2022-12-12','2038-04-01',27618.8,4862.7,NULL),(136,'Antiparasitarios',45,'2023-10-21','2026-02-01',8061.53,1347.23,NULL),(137,'Antiparasitarios',18,'2024-06-20','2033-01-20',79196,8816.04,NULL),(138,'Analgésicos',4,'2022-11-02','2034-02-06',25461.4,3842.37,NULL),(139,'Antibióticos',50,'2023-10-24','2025-10-06',72183.2,1623.91,NULL),(140,'Antiparasitarios',50,'2024-01-08','2039-09-19',21404.4,2898.69,NULL),(141,'Antiinflamatorios',31,'2022-10-13','2038-12-14',34703.6,4382.14,NULL),(142,'Antiparasitarios',47,'2024-03-15','2031-06-04',20334.7,5735.85,NULL),(143,'Antiparasitarios',3,'2022-09-23','2023-07-08',59272.6,4374.71,NULL),(144,'Antiinflamatorios',36,'2024-03-12','2030-07-06',23712.3,3688.43,NULL),(145,'Analgésicos',19,'2023-02-15','2032-05-05',49157.5,5806.8,NULL),(146,'Vitaminas',24,'2024-04-17','2035-06-04',36180,7636.19,NULL),(147,'Antiparasitarios',14,'2023-05-05','2040-01-22',28923.2,8820.44,NULL),(148,'Analgésicos',47,'2023-12-06','2022-12-27',25602.3,7569.77,NULL),(149,'Antibióticos',33,'2023-08-04','2037-07-24',51760.3,5337.94,NULL),(150,'Antibióticos',25,'2022-08-19','2035-11-27',61325.3,1523.35,NULL),(151,'Antiinflamatorios',11,'2023-07-23','2033-01-22',40360.6,9945.39,NULL),(152,'Antiinflamatorios',29,'2023-03-15','2035-08-17',67653.8,6238.12,NULL),(153,'Antiparasitarios',20,'2023-08-31','2036-12-09',18720.6,9760.15,NULL),(154,'Antiparasitarios',38,'2022-12-07','2030-04-30',19082.3,3705.16,NULL),(155,'Analgésicos',25,'2022-09-02','2036-06-21',73167.9,5687.4,NULL),(156,'Antiinflamatorios',19,'2023-11-28','2034-08-30',71676.2,9354.96,NULL),(157,'Analgésicos',27,'2024-06-15','2026-08-30',59342.8,2660.98,NULL),(158,'Analgésicos',5,'2024-06-08','2028-11-25',44471.6,9821.26,NULL),(159,'Antibióticos',11,'2024-05-20','2027-07-29',58243.8,6780.31,NULL),(160,'Analgésicos',42,'2024-04-02','2026-05-20',21169.6,8622.22,NULL),(161,'Antibióticos',8,'2023-10-30','2032-11-26',73146.9,6375.99,NULL),(162,'Antiparasitarios',1,'2022-11-06','2030-10-26',66004.8,4927.63,NULL),(163,'Vitaminas',3,'2024-04-11','2025-09-09',31274.3,7340.19,NULL),(164,'Antiinflamatorios',40,'2024-05-22','2026-12-17',44966.6,6110.03,NULL),(165,'Vitaminas',1,'2024-08-04','2025-08-02',60496.2,2857.66,NULL),(166,'Vitaminas',24,'2023-03-13','2028-02-26',61065.9,8396.68,NULL),(167,'Antiinflamatorios',40,'2024-06-17','2032-02-21',37148.1,1936.63,NULL),(168,'Antiinflamatorios',34,'2023-01-19','2034-03-21',66252.4,4422.2,NULL),(169,'Antiparasitarios',17,'2024-04-16','2027-07-30',48468.9,8771.97,NULL),(170,'Antibióticos',32,'2023-02-18','2023-08-25',27247.3,8704.72,NULL),(171,'Analgésicos',48,'2023-08-20','2027-12-24',67205.5,5964.05,NULL),(172,'Antibióticos',36,'2023-03-22','2028-09-24',9384.5,2415.69,NULL),(173,'Antiparasitarios',43,'2024-06-03','2024-06-18',53783.7,2527.2,NULL),(174,'Vitaminas',8,'2024-03-05','2040-02-21',41169.5,2584.8,NULL),(175,'Vitaminas',29,'2023-10-18','2025-11-12',32791.1,3795.04,NULL),(176,'Analgésicos',21,'2024-06-17','2028-12-09',26679.4,3917.15,NULL),(177,'Antiparasitarios',15,'2024-04-21','2040-05-05',19424.8,8951.82,NULL),(178,'Antiinflamatorios',7,'2023-06-27','2023-12-01',8588.74,1168.81,NULL),(179,'Antibióticos',45,'2022-11-12','2025-10-25',37350.7,9698.73,NULL),(180,'Analgésicos',3,'2024-08-02','2034-10-25',10670.8,4648.43,NULL),(181,'Antiinflamatorios',11,'2024-04-25','2022-09-27',74963,6130.43,NULL),(182,'Vitaminas',46,'2024-02-11','2025-02-04',55519.5,5002.43,NULL),(183,'Vitaminas',28,'2023-12-20','2037-04-23',55933.9,2760.33,NULL),(184,'Antiparasitarios',24,'2023-07-16','2037-10-12',69203.3,2259.27,NULL),(185,'Antiinflamatorios',4,'2024-07-17','2023-10-18',69685.1,4252.5,NULL),(186,'Vitaminas',29,'2023-11-20','2039-03-03',59486.9,8273.7,NULL),(187,'Antiinflamatorios',18,'2022-08-22','2037-09-15',47815.6,4552.53,NULL),(188,'Antibióticos',36,'2024-04-27','2026-02-26',8831.08,3026.27,NULL),(189,'Vitaminas',40,'2023-12-05','2033-05-08',41422.3,7862.81,NULL),(190,'Vitaminas',20,'2023-05-11','2034-01-28',79167.8,9666.1,NULL),(191,'Analgésicos',22,'2023-01-16','2027-10-10',49672.5,3127.3,NULL),(192,'Antiparasitarios',5,'2023-07-23','2030-10-26',23432,8661.44,NULL),(193,'Antiparasitarios',41,'2023-10-30','2029-03-23',52414.7,2870.38,NULL),(194,'Antiparasitarios',48,'2023-08-02','2023-12-06',64039.9,2064.32,NULL),(195,'Antibióticos',20,'2023-02-13','2023-01-21',14327.5,3046.79,NULL),(196,'Antiinflamatorios',12,'2024-06-20','2036-05-07',37346.6,8990.08,NULL),(197,'Antibióticos',41,'2023-01-25','2034-06-29',6968.49,8257.65,NULL),(198,'Antiinflamatorios',28,'2022-08-21','2032-08-06',59709.3,8504.28,NULL),(199,'Analgésicos',25,'2023-12-10','2030-07-31',59502.6,6977.3,NULL),(200,'Antiparasitarios',14,'2022-10-16','2031-07-26',56787.6,7148.48,NULL),(201,'Antibióticos',24,'2022-09-11','2030-10-12',19209.2,9738.16,NULL),(202,'Analgésicos',28,'2023-11-06','2040-02-14',76211.3,6128.16,NULL),(203,'Antiinflamatorios',41,'2022-12-23','2032-11-11',79632.3,9672.39,NULL),(204,'Antiparasitarios',6,'2022-10-18','2032-11-01',61867.4,1605.36,NULL),(205,'Vitaminas',31,'2023-01-20','2024-10-29',75025.4,3572.41,78597.8),(206,'Analgésicos',43,'2022-11-15','2039-06-21',68578.1,4448.72,NULL),(207,'Antibióticos',38,'2024-03-03','2032-06-26',12605.5,9494.49,NULL),(208,'Antiinflamatorios',49,'2024-03-30','2035-06-28',7825.42,7179.01,NULL),(209,'Analgésicos',41,'2023-09-06','2024-10-13',68134.3,2978.56,NULL),(210,'Antiinflamatorios',35,'2022-09-19','2033-11-24',75255.5,3945.12,NULL),(211,'Antiparasitarios',1,'2023-12-22','2032-01-20',50142.5,5365.29,NULL),(212,'Analgésicos',35,'2024-03-13','2032-12-15',65176.7,2227.87,NULL),(213,'Antiinflamatorios',5,'2023-02-11','2028-05-25',8113.66,7343.27,NULL),(214,'Antibióticos',35,'2023-07-03','2025-05-28',19924.5,4816.95,NULL),(215,'Analgésicos',34,'2022-11-29','2032-10-09',18291.2,5817.61,NULL),(216,'Analgésicos',9,'2022-08-27','2035-09-15',71425.8,4220.31,NULL),(217,'Antiinflamatorios',47,'2024-06-04','2036-03-15',36593.8,1133.4,NULL),(218,'Vitaminas',48,'2023-12-12','2038-09-12',42780.3,1923.67,NULL),(219,'Antibióticos',8,'2023-05-13','2023-12-19',75182.7,9905.37,NULL),(220,'Vitaminas',48,'2023-08-03','2031-07-29',75210.9,8841.12,NULL),(221,'Analgésicos',30,'2023-10-07','2024-10-29',61833.5,3056.53,NULL),(222,'Antiparasitarios',42,'2022-11-20','2024-08-08',23035.3,2562.98,NULL),(223,'Analgésicos',10,'2022-09-22','2037-06-18',57634.6,1547.76,NULL),(224,'Antibióticos',12,'2023-10-24','2023-12-22',43246.2,6083.68,NULL),(225,'Antibióticos',1,'2023-03-30','2026-11-16',66218.8,6598.76,NULL),(226,'Analgésicos',24,'2023-07-07','2026-10-11',16852.1,9733.48,NULL),(227,'Antibióticos',35,'2023-04-12','2034-07-07',18597,6243.28,NULL),(228,'Antibióticos',10,'2023-10-23','2031-12-01',36846.2,2881.96,NULL),(229,'Antiinflamatorios',39,'2023-06-17','2037-03-22',71513.9,8949.01,NULL),(230,'Antiinflamatorios',4,'2023-06-24','2025-12-30',77626.9,3220.71,NULL),(231,'Antibióticos',7,'2023-09-05','2032-12-15',69624.1,7989.82,NULL),(232,'Antibióticos',21,'2024-03-05','2029-02-11',36243.6,4156.35,NULL),(233,'Antibióticos',26,'2023-11-06','2033-08-27',76806,8960.01,NULL),(234,'Antibióticos',11,'2023-08-03','2025-05-05',62244.3,4455.36,NULL),(235,'Antibióticos',35,'2023-08-20','2035-07-15',42060.5,2918.64,NULL),(236,'Antiparasitarios',25,'2023-07-27','2037-07-11',67635.7,9484.66,NULL),(237,'Antiinflamatorios',39,'2022-10-02','2039-05-31',11243.4,1852.55,NULL),(238,'Analgésicos',35,'2022-12-30','2029-03-12',15991.5,5946.33,NULL),(239,'Antiparasitarios',28,'2022-09-19','2036-09-26',32186.6,9269.09,NULL),(240,'Antiparasitarios',36,'2023-01-05','2038-02-17',76817.1,3016.39,NULL),(241,'Vitaminas',26,'2023-12-30','2037-09-12',48420.4,1767.94,NULL),(242,'Antiinflamatorios',45,'2024-05-02','2040-04-09',7317.43,6050.29,NULL),(243,'Antiparasitarios',12,'2024-05-02','2032-03-17',12136.3,4114.8,NULL),(244,'Antibióticos',19,'2024-06-14','2025-03-23',67232.8,4066.61,NULL),(245,'Vitaminas',24,'2023-07-06','2025-11-12',73498.9,5429.37,NULL),(246,'Antiparasitarios',47,'2022-11-29','2023-07-26',43750.7,7296.46,NULL),(247,'Antibióticos',20,'2023-08-16','2035-12-15',12776.4,4918.12,NULL),(248,'Analgésicos',19,'2024-07-27','2031-12-26',75814.9,8056.43,NULL),(249,'Antiparasitarios',39,'2023-08-19','2027-09-20',33129.1,8708.03,NULL),(250,'Analgésicos',48,'2024-03-21','2027-12-13',6879.86,2456.61,NULL),(251,'Antibióticos',6,'2022-12-15','2026-08-26',8568.69,9137.27,NULL),(252,'Antiparasitarios',23,'2023-02-26','2034-09-24',42882.6,7574.04,NULL),(253,'Analgésicos',12,'2023-05-27','2027-10-05',56142.7,8215.4,NULL),(254,'Vitaminas',21,'2024-04-30','2026-10-12',54336.9,2789.57,NULL),(255,'Antiinflamatorios',27,'2024-01-26','2027-02-12',26297.5,8261.18,NULL),(256,'Vitaminas',21,'2022-10-02','2026-08-15',48614.7,9836.72,NULL),(257,'Analgésicos',7,'2024-04-23','2030-09-18',45632.4,3692.28,NULL),(258,'Vitaminas',23,'2024-06-14','2035-07-28',19093.2,2852.9,NULL),(259,'Vitaminas',1,'2023-10-30','2032-10-11',28269.3,7709.18,NULL),(260,'Analgésicos',24,'2023-11-03','2039-04-21',76853.3,3950.11,NULL),(261,'Antiparasitarios',12,'2023-07-26','2025-03-25',23985.1,9782.06,NULL),(262,'Vitaminas',25,'2022-10-10','2031-01-07',58163.7,3610.43,NULL),(263,'Antiinflamatorios',9,'2023-02-14','2034-12-29',8385.48,9693.15,NULL),(264,'Antiinflamatorios',23,'2024-01-29','2039-06-25',18268.4,9502.48,NULL),(265,'Antiparasitarios',35,'2023-08-28','2028-03-15',60054.1,9093.64,NULL),(266,'Analgésicos',10,'2024-01-03','2032-02-03',53213.7,7248.27,NULL),(267,'Analgésicos',38,'2024-01-01','2030-10-06',22159.6,3218.56,NULL),(268,'Antibióticos',47,'2024-05-11','2024-02-25',34208.4,8100.46,NULL),(269,'Antiparasitarios',12,'2024-02-17','2028-10-16',75482.8,6941.47,NULL),(270,'Antiparasitarios',1,'2023-08-29','2023-08-19',7845.26,6103.53,NULL),(271,'Antibióticos',2,'2023-09-07','2031-01-10',26477.9,5927.91,NULL),(272,'Vitaminas',35,'2024-05-24','2034-12-11',45906.1,2466.55,NULL),(273,'Antiparasitarios',46,'2024-06-09','2029-06-04',35961.2,6255.82,NULL),(274,'Antiparasitarios',44,'2023-04-19','2024-01-06',44705.6,1646.05,NULL),(275,'Analgésicos',37,'2022-12-04','2040-08-11',77031.9,6030.5,NULL),(276,'Vitaminas',26,'2024-02-27','2025-07-21',26556.2,9563.29,NULL),(277,'Vitaminas',25,'2023-04-06','2038-07-12',17494.5,3613.07,NULL),(278,'Antiparasitarios',18,'2023-12-15','2036-07-03',59902,1878.38,NULL),(279,'Antiparasitarios',21,'2023-02-22','2032-02-03',63978.5,8313.72,NULL),(280,'Antiinflamatorios',2,'2023-11-19','2027-01-19',67879.2,5165.55,NULL),(281,'Antibióticos',8,'2023-05-04','2024-10-09',66399.5,7353.87,NULL),(282,'Vitaminas',50,'2024-02-23','2038-03-31',61831.7,7301.49,NULL),(283,'Antibióticos',6,'2022-11-12','2037-03-24',38046.2,8058.26,NULL),(284,'Antiinflamatorios',49,'2024-04-26','2037-04-14',71048.1,1829.65,NULL),(285,'Antiinflamatorios',8,'2024-07-12','2025-07-09',25800.4,2475.11,NULL),(286,'Analgésicos',22,'2023-10-28','2031-09-18',65283.6,4660.68,NULL),(287,'Vitaminas',43,'2022-12-15','2023-10-20',55119.9,3682.89,NULL),(288,'Antiparasitarios',50,'2022-11-21','2031-11-08',24426.5,2861.91,NULL),(289,'Analgésicos',25,'2024-03-19','2026-06-08',34837.9,4588.21,NULL),(290,'Analgésicos',50,'2024-05-21','2027-04-04',35138.8,1110.39,NULL),(291,'Antibióticos',10,'2022-09-04','2026-03-25',7282.09,8686.99,NULL),(292,'Vitaminas',33,'2023-08-18','2039-04-16',23421,4840.19,NULL),(293,'Antibióticos',36,'2023-04-03','2028-11-18',27643.6,9331.92,NULL),(294,'Analgésicos',24,'2023-08-29','2035-09-12',58684.1,9021.16,NULL),(295,'Antibióticos',19,'2023-08-05','2022-12-27',74613.7,5046.61,NULL),(296,'Antiinflamatorios',24,'2023-11-11','2039-10-27',47733.3,3792.32,NULL),(297,'Antiinflamatorios',14,'2023-05-09','2032-10-30',78343.4,7450.01,NULL),(298,'Vitaminas',26,'2023-06-19','2039-01-30',7513.04,4987.24,NULL),(299,'Vitaminas',12,'2024-06-21','2024-12-06',55197.7,2522.83,NULL),(300,'Antiparasitarios',12,'2023-08-04','2036-12-29',44497.6,9637.67,NULL),(301,'Antiinflamatorios',38,'2022-11-27','2028-02-05',69674.7,4817.72,NULL),(302,'Antiparasitarios',11,'2023-06-04','2038-04-15',11838.4,2007.61,NULL),(303,'Analgésicos',9,'2023-08-12','2033-06-07',7850.3,8004.88,NULL),(304,'Antiinflamatorios',9,'2024-07-06','2027-03-25',16261.8,4304.08,NULL),(305,'Vitaminas',37,'2024-04-06','2031-12-04',61264.3,8639.39,NULL),(306,'Analgésicos',28,'2023-08-07','2035-01-15',60493.3,5761.93,NULL),(307,'Vitaminas',10,'2023-10-16','2025-11-16',72697.3,1884.94,NULL),(308,'Antibióticos',27,'2023-02-27','2035-11-21',24493.8,3487.97,NULL),(309,'Vitaminas',47,'2024-02-28','2039-04-18',65439.4,3181.91,NULL),(310,'Antiinflamatorios',45,'2023-01-15','2032-10-16',70904.6,9594.82,NULL),(311,'Antiinflamatorios',28,'2023-10-31','2034-06-08',11037.8,8588.18,NULL),(312,'Analgésicos',42,'2023-10-29','2039-01-13',10900.2,2879.93,NULL),(313,'Analgésicos',13,'2023-10-14','2032-04-15',9541.31,9643.81,NULL),(314,'Analgésicos',7,'2023-05-27','2040-01-20',64714.9,1535.24,NULL),(315,'Analgésicos',2,'2023-12-07','2039-04-07',26933.1,8202.61,NULL),(316,'Vitaminas',5,'2023-07-06','2024-11-24',59732.5,5838.17,NULL),(317,'Antiparasitarios',23,'2022-10-31','2039-04-10',35551,3070.13,NULL),(318,'Analgésicos',39,'2023-12-31','2034-01-30',46863.3,2516.96,NULL),(319,'Antiparasitarios',41,'2023-04-02','2023-06-16',18293.1,5768.85,NULL),(320,'Antibióticos',36,'2023-03-04','2032-08-30',54029.9,7994.09,NULL),(321,'Vitaminas',40,'2022-10-15','2037-08-17',65414.6,1482.89,NULL),(322,'Antiinflamatorios',35,'2023-11-28','2026-03-24',14825.8,8116.03,NULL),(323,'Antibióticos',5,'2022-09-25','2033-12-14',19923.8,1674.63,NULL),(324,'Antibióticos',3,'2023-01-23','2028-08-14',45225.3,7246.82,NULL),(325,'Vitaminas',23,'2024-01-17','2027-06-20',20614.5,8602.5,NULL),(326,'Analgésicos',26,'2024-04-09','2036-10-13',43540,9765.01,NULL),(327,'Analgésicos',12,'2024-02-04','2024-11-22',56661,8814.31,NULL),(328,'Antiparasitarios',28,'2024-02-20','2026-05-29',74157.5,5122.36,NULL),(329,'Antiinflamatorios',16,'2023-08-20','2035-09-10',47672.9,8678.33,NULL),(330,'Antiparasitarios',31,'2024-06-08','2036-01-06',43428.2,7195.08,NULL),(331,'Antibióticos',21,'2023-03-06','2036-04-05',17273.9,2264.03,NULL),(332,'Antiparasitarios',27,'2024-08-02','2031-01-31',54221.1,8718.37,NULL),(333,'Antiinflamatorios',22,'2024-01-31','2030-07-19',17627.2,4941.89,NULL),(334,'Antiparasitarios',25,'2023-02-15','2026-12-04',20742,4790.55,NULL),(335,'Antiinflamatorios',22,'2023-07-06','2026-07-06',66040.5,8559.3,NULL),(336,'Antiinflamatorios',29,'2024-01-01','2023-10-18',74553,5757.82,NULL),(337,'Vitaminas',47,'2024-05-30','2035-11-01',19305.5,8528.03,NULL),(338,'Antiinflamatorios',40,'2023-03-09','2036-11-03',79056.9,3521.72,NULL),(339,'Antibióticos',19,'2022-09-06','2038-02-22',31307,7489.49,NULL),(340,'Antiparasitarios',46,'2023-01-05','2035-03-23',69100.2,5689.48,NULL),(341,'Antiinflamatorios',24,'2023-11-27','2030-06-03',8658.59,2597.73,NULL),(342,'Antibióticos',41,'2023-10-18','2024-01-11',70865.1,9005.42,NULL),(343,'Vitaminas',14,'2024-04-10','2037-05-09',18468.7,8797.15,NULL),(344,'Antiinflamatorios',43,'2023-11-22','2025-01-27',50216,9195.86,NULL),(345,'Analgésicos',16,'2023-08-11','2030-04-21',77259.1,6207.54,NULL),(346,'Antiinflamatorios',47,'2023-07-04','2028-09-09',66208.2,9022.69,NULL),(347,'Antibióticos',3,'2023-11-06','2028-03-07',17757.9,2203.33,NULL),(348,'Antiinflamatorios',35,'2024-02-06','2024-06-22',51562.4,5997.07,NULL),(349,'Antiparasitarios',32,'2024-04-09','2040-03-27',73361.5,5534.05,NULL),(350,'Antibióticos',24,'2024-02-18','2026-08-18',26794.3,8778.84,NULL),(351,'Vitaminas',33,'2023-03-14','2027-06-28',13488.7,3346.51,NULL),(352,'Antiparasitarios',17,'2024-01-16','2026-10-29',32193.4,9469.81,NULL),(353,'Antiinflamatorios',41,'2022-08-31','2028-03-25',44893.7,2340.46,NULL),(354,'Vitaminas',18,'2023-01-14','2032-04-04',16582.4,4664.89,NULL),(355,'Antiparasitarios',6,'2023-03-23','2035-10-27',9668.67,8939.88,NULL),(356,'Antibióticos',6,'2022-10-21','2031-04-17',35480.5,6887.51,NULL),(357,'Antibióticos',28,'2023-06-02','2023-01-01',65090.6,6471.88,NULL),(358,'Antiparasitarios',34,'2023-07-08','2034-02-09',29843.5,3243.75,NULL),(359,'Vitaminas',19,'2022-09-03','2035-01-13',24267.8,4265.75,NULL),(360,'Analgésicos',24,'2024-03-07','2032-10-30',24944.2,9328.4,NULL),(361,'Analgésicos',38,'2023-11-26','2039-09-27',16775.1,4929.54,NULL),(362,'Analgésicos',9,'2024-04-21','2026-03-02',27774.6,5015.56,NULL),(363,'Analgésicos',43,'2023-02-20','2024-07-12',57033.4,9905.51,NULL),(364,'Vitaminas',1,'2023-12-25','2028-03-08',56677.5,4773.97,NULL),(365,'Vitaminas',37,'2022-12-03','2039-08-15',72456.4,4448.31,NULL),(366,'Vitaminas',32,'2023-05-28','2030-11-23',25966,9707.94,NULL),(367,'Antibióticos',16,'2023-10-14','2032-12-21',38237.4,7160.61,NULL),(368,'Vitaminas',35,'2024-08-01','2026-11-06',56490.8,5060.76,NULL),(369,'Analgésicos',39,'2023-08-16','2028-12-01',77520.3,1432.07,NULL),(370,'Analgésicos',45,'2024-01-30','2036-09-15',24058.7,5434.3,NULL),(371,'Analgésicos',8,'2024-04-08','2033-11-24',36529.6,6879.48,NULL),(372,'Antiparasitarios',36,'2023-11-05','2027-07-18',51293.8,7930.34,NULL),(373,'Vitaminas',21,'2023-11-11','2037-04-22',52057.2,8656.58,NULL),(374,'Analgésicos',49,'2023-09-17','2035-11-12',23454.1,6246.43,NULL),(375,'Analgésicos',24,'2023-08-01','2035-06-05',63559.3,8889.3,NULL),(376,'Antibióticos',16,'2024-01-03','2033-09-28',29146.5,9068.22,NULL),(377,'Antibióticos',47,'2024-03-31','2037-01-09',31364.6,2590.74,NULL),(378,'Antibióticos',45,'2024-08-16','2037-04-22',50202,3340.98,NULL),(379,'Antiinflamatorios',50,'2023-04-23','2026-08-04',6500.25,7636.71,NULL),(380,'Antiinflamatorios',47,'2023-08-12','2032-11-12',47500.2,1181.14,NULL),(381,'Antiinflamatorios',50,'2023-11-02','2032-01-24',20727.7,1753.5,NULL),(382,'Antibióticos',13,'2024-01-12','2023-10-07',23513.7,4587.41,NULL),(383,'Antibióticos',8,'2024-04-29','2033-05-24',61683.8,3599.66,NULL),(384,'Antibióticos',36,'2023-03-11','2023-08-04',30466,4019.76,NULL),(385,'Antibióticos',45,'2022-12-04','2031-03-21',62631.1,3354.53,NULL),(386,'Analgésicos',5,'2024-02-21','2027-09-27',53789.8,8980.46,NULL),(387,'Analgésicos',30,'2022-09-02','2037-07-12',43383.7,8640.56,NULL),(388,'Antiinflamatorios',25,'2022-11-11','2023-11-24',52690.2,1199.81,NULL),(389,'Antiparasitarios',11,'2023-07-13','2033-08-20',46137.6,8578.02,NULL),(390,'Antibióticos',47,'2023-02-08','2032-07-24',24169.5,5008.48,NULL),(391,'Antiinflamatorios',39,'2023-09-22','2035-08-13',78118.1,4074.62,NULL),(392,'Analgésicos',31,'2023-01-31','2025-06-13',29646.9,3520.53,NULL),(393,'Analgésicos',41,'2023-06-24','2031-10-31',51809.2,3533.79,NULL),(394,'Analgésicos',42,'2023-06-02','2036-10-02',16679.4,1025.22,NULL),(395,'Antiinflamatorios',26,'2023-07-11','2028-12-25',30098.4,2514.62,NULL),(396,'Antibióticos',21,'2023-10-28','2025-03-06',69512.9,7945.55,NULL),(397,'Antiinflamatorios',25,'2023-02-23','2026-08-15',79794.8,1844.15,NULL),(398,'Vitaminas',30,'2023-11-08','2040-07-27',46587.3,1413.04,NULL),(399,'Antiparasitarios',8,'2024-02-15','2030-10-28',53996.3,7992.7,NULL),(400,'Analgésicos',49,'2023-01-13','2030-06-04',41617.7,6977.35,NULL),(401,'Antiparasitarios',33,'2024-05-29','2033-12-03',6748.88,3580.41,NULL),(402,'Antibióticos',29,'2024-08-13','2032-11-27',40204.3,3755.51,NULL),(403,'Antibióticos',36,'2023-06-19','2032-07-10',54874.7,2731.17,NULL),(404,'Antiinflamatorios',2,'2023-07-15','2027-02-11',6074.85,1910.36,NULL),(405,'Antiparasitarios',10,'2024-04-06','2022-09-11',55988.7,4189.49,NULL),(406,'Antibióticos',8,'2023-07-15','2038-03-17',24005.4,2669.85,NULL),(407,'Analgésicos',45,'2024-01-11','2030-07-22',20131.6,4247.82,NULL),(408,'Antibióticos',42,'2024-02-22','2034-07-07',74788,4675.28,NULL),(409,'Antiparasitarios',17,'2023-08-20','2030-08-02',21053.6,1940.4,NULL),(410,'Vitaminas',5,'2024-06-21','2040-01-12',46782.3,9845.93,NULL),(411,'Vitaminas',15,'2022-12-26','2036-08-22',68406.8,7909.94,NULL),(412,'Vitaminas',3,'2024-03-03','2028-06-16',38852.9,4295.62,NULL),(413,'Antiparasitarios',27,'2022-12-07','2028-10-11',36030.7,4036.86,NULL),(414,'Vitaminas',30,'2024-03-02','2034-01-12',70663,5251.38,NULL),(415,'Vitaminas',38,'2024-06-21','2036-11-25',51245,6105.07,NULL),(416,'Vitaminas',14,'2023-04-21','2026-12-05',56427.7,7047.69,NULL),(417,'Antiparasitarios',37,'2022-12-27','2034-04-06',69554.7,1604.14,NULL),(418,'Analgésicos',3,'2023-12-07','2032-11-19',64934.6,4115.8,NULL),(419,'Antiparasitarios',3,'2023-11-12','2026-10-30',32480.5,9167.74,NULL),(420,'Analgésicos',50,'2022-10-05','2023-03-11',8346.49,7711.83,NULL),(421,'Antiparasitarios',16,'2023-05-16','2025-05-26',49178.9,3829.95,NULL),(422,'Analgésicos',46,'2023-04-28','2039-05-31',60665.6,5460.11,NULL),(423,'Vitaminas',30,'2023-08-11','2038-08-16',21982.3,9975.31,NULL),(424,'Antiparasitarios',27,'2022-12-13','2027-08-08',6502.1,3075.1,NULL),(425,'Analgésicos',3,'2023-09-14','2039-08-26',33555.3,2556.84,NULL),(426,'Antibióticos',18,'2024-04-26','2030-02-28',56685.8,8075.74,NULL),(427,'Antibióticos',26,'2023-07-08','2027-11-30',46601.8,8783.26,NULL),(428,'Antiparasitarios',24,'2023-12-18','2034-09-27',37020,6576,NULL),(429,'Antibióticos',36,'2023-02-22','2026-10-30',36573.7,1697.17,NULL),(430,'Antiparasitarios',6,'2023-06-25','2024-03-02',69882.8,5852.9,NULL),(431,'Antiinflamatorios',24,'2023-03-09','2026-06-02',33658.1,6717.17,NULL),(432,'Antiparasitarios',37,'2023-10-20','2031-02-13',55133.4,3658.73,NULL),(433,'Antiinflamatorios',30,'2023-12-02','2037-10-03',27672.6,3916.89,NULL),(434,'Vitaminas',25,'2023-08-25','2030-09-13',65676.3,5230.54,NULL),(435,'Antibióticos',25,'2022-12-21','2025-03-25',42209,4308.5,NULL),(436,'Antiparasitarios',37,'2024-01-20','2029-04-28',47992.3,6685.22,NULL),(437,'Vitaminas',27,'2024-08-15','2035-06-12',72407.8,8181.22,NULL),(438,'Vitaminas',35,'2023-04-21','2023-10-05',68413.3,2471.5,NULL),(439,'Vitaminas',34,'2024-03-20','2038-05-24',39329.6,6794.22,NULL),(440,'Vitaminas',32,'2024-03-16','2038-10-11',26460.3,3349.55,NULL),(441,'Analgésicos',39,'2024-05-01','2037-04-20',36975.2,7635.41,NULL),(442,'Antibióticos',36,'2023-10-25','2036-09-08',61438.8,4632.45,NULL),(443,'Antibióticos',4,'2023-12-27','2029-01-28',76509.4,5597.02,NULL),(444,'Antiparasitarios',11,'2023-03-14','2038-05-23',47739.2,2707.66,NULL),(445,'Antiinflamatorios',28,'2023-08-03','2030-04-10',33561.4,5421.04,NULL),(446,'Analgésicos',38,'2022-12-22','2028-03-26',65177.8,4041.77,NULL),(447,'Analgésicos',27,'2023-10-25','2032-06-26',52333.5,2377.97,NULL),(448,'Analgésicos',35,'2023-08-06','2029-03-13',53349.9,6737.63,NULL),(449,'Vitaminas',37,'2023-10-06','2024-05-30',51993.1,3413.31,NULL),(450,'Antibióticos',7,'2024-06-23','2022-11-26',72331.5,6442.73,NULL),(451,'Antiparasitarios',20,'2024-06-18','2039-09-01',60486.9,6101.08,NULL),(452,'Antiinflamatorios',41,'2023-08-19','2032-04-16',9555.3,3982.92,NULL),(453,'Antibióticos',34,'2023-05-20','2028-04-13',43944.2,3641.52,NULL),(454,'Analgésicos',46,'2023-11-16','2034-09-19',10004.8,2589.95,NULL),(455,'Antiinflamatorios',18,'2022-12-13','2038-08-21',38877.7,4846.42,NULL),(456,'Antibióticos',13,'2024-03-24','2033-04-21',50480.3,1260.03,NULL),(457,'Antiparasitarios',20,'2024-04-24','2024-10-08',65951.3,2908.86,NULL),(458,'Vitaminas',1,'2022-11-14','2022-12-24',48152.3,6343.8,NULL),(459,'Antibióticos',45,'2023-08-26','2037-07-11',46325.1,3800.07,NULL),(460,'Analgésicos',5,'2024-07-31','2029-08-03',68796.2,3690.36,NULL),(461,'Vitaminas',7,'2023-02-24','2037-01-03',13846.9,1021.57,NULL),(462,'Antiparasitarios',30,'2023-08-16','2027-12-18',68495.3,6383.62,NULL),(463,'Antiinflamatorios',3,'2024-07-17','2026-01-28',55435.3,5697.22,NULL),(464,'Vitaminas',6,'2024-03-13','2040-03-23',5986.3,1272.46,NULL),(465,'Vitaminas',41,'2023-01-03','2023-04-11',52495.5,6663.4,NULL),(466,'Antibióticos',9,'2024-03-16','2038-10-26',56935.2,6232.57,NULL),(467,'Antiinflamatorios',34,'2024-03-01','2029-12-16',19110,7035.15,NULL),(468,'Antiparasitarios',48,'2023-06-16','2023-05-26',64435.6,1756.25,NULL),(469,'Antibióticos',6,'2022-09-02','2032-12-16',34977.3,2973.85,NULL),(470,'Antibióticos',19,'2022-10-05','2024-06-29',30019.6,4297.46,NULL),(471,'Analgésicos',17,'2023-05-31','2040-06-15',41954.2,4070.85,NULL),(472,'Antiparasitarios',41,'2023-02-04','2033-03-16',75878.6,7892.64,NULL),(473,'Vitaminas',35,'2024-03-19','2036-09-08',39244.5,2343.93,NULL),(474,'Vitaminas',21,'2023-01-12','2033-08-28',8010.25,2005.86,NULL),(475,'Antibióticos',46,'2023-05-20','2024-10-26',20084.2,5708.9,NULL),(476,'Analgésicos',27,'2024-02-25','2033-09-17',25887.6,3920.7,NULL),(477,'Antiinflamatorios',22,'2023-04-17','2025-10-19',72635,9572.29,NULL),(478,'Antibióticos',3,'2023-10-31','2026-04-10',47649.2,8363.63,NULL),(479,'Vitaminas',47,'2023-03-15','2024-08-29',65935.8,6672.98,NULL),(480,'Antibióticos',38,'2023-08-14','2024-01-31',14273,4693.13,NULL),(481,'Antiinflamatorios',28,'2023-12-22','2038-05-06',78519.7,4987.41,NULL),(482,'Vitaminas',5,'2022-09-26','2024-01-10',17443.2,9655.1,NULL),(483,'Analgésicos',36,'2022-10-25','2032-02-07',34245.7,5264.57,NULL),(484,'Vitaminas',19,'2024-05-05','2026-01-18',38456.8,1683.02,NULL),(485,'Antibióticos',22,'2022-08-26','2033-01-02',26878.4,3423.44,NULL),(486,'Vitaminas',50,'2023-09-17','2038-01-24',11298.4,6905.94,NULL),(487,'Antiparasitarios',41,'2023-04-03','2024-03-28',11845.5,6586.95,NULL),(488,'Antiinflamatorios',20,'2024-01-31','2023-03-28',49365.3,2019.51,NULL),(489,'Antiinflamatorios',47,'2024-01-19','2022-11-14',76819.2,6888.24,NULL),(490,'Antiparasitarios',39,'2023-10-24','2031-04-16',42372.3,5749.22,NULL),(491,'Antiinflamatorios',16,'2023-06-14','2025-07-12',50950.8,3057.49,NULL),(492,'Antiinflamatorios',38,'2023-04-06','2028-05-07',71218.8,3834.31,NULL),(493,'Antiparasitarios',5,'2024-03-08','2035-01-17',50776.7,8371.07,NULL),(494,'Vitaminas',50,'2022-11-20','2025-10-24',22162.7,6925.23,NULL),(495,'Antiparasitarios',27,'2024-06-07','2024-02-16',33323.1,6535.33,NULL),(496,'Analgésicos',7,'2023-11-25','2026-05-13',22505.3,8427.03,NULL),(497,'Antiinflamatorios',33,'2024-05-23','2032-10-12',72960.6,3813.1,NULL),(498,'Antibióticos',2,'2024-01-07','2034-12-27',16527.3,8086.27,NULL),(499,'Vitaminas',42,'2023-07-14','2033-09-27',9039.43,4730.06,NULL),(500,'Analgésicos',48,'2023-10-14','2031-01-13',65611.3,7523.33,NULL);
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(30) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Argentina'),(2,'Francia'),(3,'Brasil'),(4,'Estados Unidos'),(5,'Chile'),(6,'Bolivia'),(7,'Cuba'),(8,'Venezuela'),(9,'Colombia');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `id_provincia` int NOT NULL AUTO_INCREMENT,
  `provincia` varchar(30) NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Santa Fe'),(3,'Tucumuan'),(4,'Ciudad de Buenos Aires'),(5,'Santiago del Estero'),(6,'Jujuy'),(7,'Formosa'),(8,'Misiones'),(9,'Cordoba'),(10,'Chaco'),(11,'Salta'),(12,'Catamarca'),(13,'Corrientes'),(14,'Entre Rios'),(15,'Mendoza'),(16,'Neuquen'),(17,'Rio Negro'),(18,'La Pampa'),(19,'San Luis'),(20,'San Juan'),(21,'La Rioja'),(22,'Chubut'),(23,'Santa Cruz'),(24,'Tierra Del Fuego');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsable`
--

DROP TABLE IF EXISTS `responsable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsable` (
  `id_responsable` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int DEFAULT NULL,
  `id_animal` int DEFAULT NULL,
  `descripcion_responsabilidad` varchar(200) DEFAULT NULL,
  `rutina` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_responsable`),
  KEY `fk_responsable_emplado` (`id_empleado`),
  KEY `fk_responsable_animal` (`id_animal`),
  CONSTRAINT `responsable_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `responsable_ibfk_2` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsable`
--

LOCK TABLES `responsable` WRITE;
/*!40000 ALTER TABLE `responsable` DISABLE KEYS */;
INSERT INTO `responsable` VALUES (1,86,144,'Debe proporcionar alimento y agua adecuados','Pasear y bañar semanalmente'),(2,145,227,'Proporcionar atención veterinaria regular','Juego de pelota'),(3,106,56,'Debe proporcionar alimento y agua adecuados','Caza de juguetes'),(4,55,126,'Proporcionar atención veterinaria regular','Juego de pelota'),(5,135,194,'Proporcionar atención veterinaria regular','Caza de juguetes'),(6,87,390,'Debe proporcionar alimento y agua adecuados','Caza de juguetes'),(7,81,276,'Mantener un entorno limpio y saludable','Caza de juguetes'),(8,135,466,'Proporcionar ejercicio y estimulación mental','Paseo diario'),(9,141,18,'Mantener un entorno limpio y saludable','Paseo diario'),(10,7,439,'Debe proporcionar alimento y agua adecuados','Paseo diario'),(11,100,65,'Debe proporcionar alimento y agua adecuados','Caza de juguetes'),(12,66,318,'Proporcionar atención veterinaria regular','Caza de juguetes'),(13,17,360,'Debe proporcionar alimento y agua adecuados','Juego de pelota'),(14,38,335,'Proporcionar atención veterinaria regular','Caminata en el parque'),(15,142,143,'Proporcionar ejercicio y estimulación mental','Juego de pelota'),(16,143,395,'Mantener un entorno limpio y saludable','Juego de pelota'),(17,50,237,'Proporcionar ejercicio y estimulación mental','Paseo diario'),(18,136,322,'Proporcionar atención veterinaria regular','Caza de juguetes'),(19,14,296,'Brindar un refugio seguro y cómodo','Juego de pelota'),(20,107,73,'Mantener un entorno limpio y saludable','Caminata en el parque'),(21,90,180,'Mantener un entorno limpio y saludable','Paseo diario'),(22,144,330,'Proporcionar ejercicio y estimulación mental','Caminata en el parque'),(23,73,416,'Proporcionar ejercicio y estimulación mental','Caza de juguetes'),(24,24,362,'Mantener un entorno limpio y saludable','Entrenamiento de obediencia'),(25,15,91,'Brindar un refugio seguro y cómodo','Caza de juguetes'),(26,139,1,'Proporcionar ejercicio y estimulación mental','Caminata en el parque'),(27,147,274,'Mantener un entorno limpio y saludable','Juego de pelota'),(28,92,264,'Proporcionar atención veterinaria regular','Caza de juguetes'),(29,58,63,'Debe proporcionar alimento y agua adecuados','Caza de juguetes'),(30,107,240,'Mantener un entorno limpio y saludable','Caza de juguetes'),(31,142,429,'Debe proporcionar alimento y agua adecuados','Caminata en el parque'),(32,44,293,'Proporcionar ejercicio y estimulación mental','Juego de pelota'),(33,21,245,'Brindar un refugio seguro y cómodo','Entrenamiento de obediencia'),(34,146,473,'Proporcionar atención veterinaria regular','Caza de juguetes'),(35,63,54,'Debe proporcionar alimento y agua adecuados','Caminata en el parque'),(36,140,486,'Proporcionar atención veterinaria regular','Caza de juguetes'),(37,9,12,'Brindar un refugio seguro y cómodo','Entrenamiento de obediencia'),(38,106,301,'Proporcionar ejercicio y estimulación mental','Paseo diario'),(39,33,13,'Debe proporcionar alimento y agua adecuados','Caminata en el parque'),(40,60,15,'Debe proporcionar alimento y agua adecuados','Paseo diario'),(41,102,172,'Mantener un entorno limpio y saludable','Caza de juguetes'),(42,48,162,'Debe proporcionar alimento y agua adecuados','Caza de juguetes'),(43,37,386,'Debe proporcionar alimento y agua adecuados','Caminata en el parque'),(44,115,312,'Proporcionar ejercicio y estimulación mental','Juego de pelota'),(45,89,388,'Proporcionar ejercicio y estimulación mental','Paseo diario'),(46,21,457,'Mantener un entorno limpio y saludable','Caza de juguetes'),(47,92,182,'Mantener un entorno limpio y saludable','Entrenamiento de obediencia'),(48,67,462,'Mantener un entorno limpio y saludable','Entrenamiento de obediencia'),(49,26,262,'Mantener un entorno limpio y saludable','Caza de juguetes'),(50,126,139,'Proporcionar ejercicio y estimulación mental','Caminata en el parque'),(51,73,289,'Proporcionar atención veterinaria regular','Paseo diario'),(52,100,209,'Debe proporcionar alimento y agua adecuados','Entrenamiento de obediencia'),(53,110,132,'Brindar un refugio seguro y cómodo','Juego de pelota'),(54,68,36,'Brindar un refugio seguro y cómodo','Caza de juguetes'),(55,98,133,'Mantener un entorno limpio y saludable','Caminata en el parque'),(56,142,487,'Mantener un entorno limpio y saludable','Juego de pelota');
/*!40000 ALTER TABLE `responsable` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_rutina` AFTER UPDATE ON `responsable` FOR EACH ROW INSERT INTO after_logs_rutina (id_responsable, id_animal, rutina, usuario, fecha_modificacion, hora_modificacion)
VALUES (NEW.id_responsable, NEW.id_animal, NEW.rutina, USER(), CURDATE(), CURTIME()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_responsable` BEFORE DELETE ON `responsable` FOR EACH ROW INSERT INTO before_logs_responsables (id_responsable, id_animal, id_empleado, usuario, fecha_modificacion, hora_modificacion)
VALUES (OLD.id_responsable, OLD.id_animal, OLD.id_empleado, USER(), CURDATE(), CURTIME()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `responsables_detalle`
--

DROP TABLE IF EXISTS `responsables_detalle`;
/*!50001 DROP VIEW IF EXISTS `responsables_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `responsables_detalle` AS SELECT 
 1 AS `nombre_empleado`,
 1 AS `apellido_empleado`,
 1 AS `id_empleado`,
 1 AS `id_animal`,
 1 AS `detalle`,
 1 AS `rutina`,
 1 AS `nombre_animal`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tratamientos`
--

DROP TABLE IF EXISTS `tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamientos` (
  `id_tratamiento` int NOT NULL AUTO_INCREMENT,
  `id_animal` int DEFAULT NULL,
  `id_medicamento` int DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id_tratamiento`),
  KEY `id_animal` (`id_animal`),
  KEY `id_medicamento` (`id_medicamento`),
  CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animales` (`id_animal`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tratamientos_ibfk_2` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamentos` (`id_medicamento`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamientos`
--

LOCK TABLES `tratamientos` WRITE;
/*!40000 ALTER TABLE `tratamientos` DISABLE KEYS */;
INSERT INTO `tratamientos` VALUES (1,442,465,'2022-08-19','2023-05-29'),(2,271,380,'2022-08-19','2022-12-25'),(3,42,65,'2022-08-19','2022-09-22'),(4,241,157,'2022-08-19','2023-04-01'),(5,83,67,'2022-08-19','2022-11-10'),(6,467,465,'2022-08-19','2023-02-06'),(7,41,344,'2022-08-19','2023-01-23'),(8,227,440,'2022-08-19','2023-01-27'),(9,218,490,'2022-08-19','2023-04-05'),(10,181,348,'2022-08-19','2023-04-06'),(11,117,148,'2022-08-19','2023-07-09'),(12,107,468,'2022-08-19','2022-08-26'),(13,398,495,'2022-08-19','2023-01-22'),(14,326,177,'2022-08-19','2022-09-25'),(15,429,382,'2022-08-19','2023-08-01'),(16,308,254,'2022-08-19','2023-05-21'),(17,275,406,'2022-08-19','2022-12-20'),(18,403,234,'2022-08-19','2023-04-23'),(19,343,55,'2022-08-19','2023-06-09'),(20,323,38,'2022-08-19','2023-08-09'),(21,287,255,'2022-08-19','2022-10-05'),(22,210,431,'2022-08-19','2023-06-21'),(23,286,101,'2022-08-19','2023-05-03'),(24,387,207,'2022-08-19','2023-02-25'),(25,454,262,'2022-08-19','2023-03-03'),(26,20,348,'2022-08-19','2022-11-28'),(27,336,296,'2022-08-19','2023-05-31'),(28,366,464,'2022-08-19','2023-07-07'),(29,349,156,'2022-08-19','2023-02-07'),(30,313,49,'2022-08-19','2023-03-14'),(31,20,489,'2022-08-19','2022-12-19'),(32,92,271,'2022-08-19','2022-11-03'),(33,423,458,'2022-08-19','2023-06-08'),(34,83,84,'2022-08-19','2023-01-16'),(35,74,122,'2022-08-19','2023-08-02'),(36,19,204,'2022-08-19','2023-07-31'),(37,319,321,'2022-08-19','2022-12-07'),(38,41,392,'2022-08-19','2023-01-15'),(39,385,49,'2022-08-19','2022-09-12'),(40,285,478,'2022-08-19','2022-12-23'),(41,353,283,'2022-08-19','2023-08-12'),(42,30,167,'2022-08-19','2022-08-22'),(43,119,71,'2022-08-19','2023-01-17'),(44,109,406,'2022-08-19','2022-11-13'),(45,460,92,'2022-08-19','2022-11-20'),(46,442,90,'2022-08-19','2023-07-24'),(47,266,237,'2022-08-19','2023-03-14'),(48,62,201,'2022-08-19','2023-06-02'),(49,462,413,'2022-08-19','2023-03-02'),(50,328,144,'2022-08-19','2022-11-16'),(51,74,265,'2022-08-19','2023-04-13'),(52,25,456,'2022-08-19','2022-12-09'),(53,287,285,'2022-08-19','2023-02-24'),(54,94,406,'2022-08-19','2023-01-04'),(55,380,223,'2022-08-19','2023-05-18'),(56,113,340,'2022-08-19','2023-03-21'),(57,137,407,'2022-08-19','2022-12-21'),(58,233,313,'2022-08-19','2023-01-24'),(59,163,410,'2022-08-19','2023-07-28'),(60,125,232,'2022-08-19','2023-02-16'),(61,136,237,'2022-08-19','2023-04-23'),(62,37,364,'2022-08-19','2023-05-09'),(63,11,173,'2022-08-19','2022-12-28'),(64,76,421,'2022-08-19','2022-10-21'),(65,276,392,'2022-08-19','2023-03-14'),(66,363,414,'2022-08-19','2022-09-29'),(67,374,243,'2022-08-19','2023-05-23'),(68,442,167,'2022-08-19','2023-04-16'),(69,188,162,'2022-08-19','2023-01-15'),(70,258,424,'2022-08-19','2022-10-21'),(71,117,440,'2022-08-19','2022-11-03'),(72,246,240,'2022-08-19','2023-02-23'),(73,365,153,'2022-08-19','2022-09-03'),(74,202,152,'2022-08-19','2023-08-03'),(75,222,235,'2022-08-19','2022-11-20'),(76,155,294,'2022-08-19','2022-11-16'),(77,270,435,'2022-08-19','2022-12-09'),(78,167,104,'2022-08-19','2023-08-08'),(79,13,499,'2022-08-19','2023-02-24'),(80,94,159,'2022-08-19','2023-01-18'),(81,418,493,'2022-08-19','2022-10-06'),(82,374,18,'2022-08-19','2023-05-17'),(83,395,422,'2022-08-19','2023-01-26'),(84,41,323,'2022-08-19','2023-06-10'),(85,337,323,'2022-08-19','2022-09-24'),(86,58,212,'2022-08-19','2023-05-27'),(87,288,394,'2022-08-19','2022-09-18'),(88,247,485,'2022-08-19','2023-06-14'),(89,124,418,'2022-08-19','2023-07-02'),(90,242,333,'2022-08-19','2022-12-12'),(91,237,8,'2022-08-19','2023-05-22'),(92,28,8,'2022-08-19','2023-05-27'),(93,464,143,'2022-08-19','2022-09-04'),(94,362,117,'2022-08-19','2022-10-23'),(95,93,422,'2022-08-19','2022-09-10'),(96,23,372,'2022-08-19','2023-04-04'),(97,19,271,'2022-08-19','2022-11-03'),(98,220,406,'2022-08-19','2022-10-03'),(99,264,44,'2022-08-19','2023-05-28'),(100,312,496,'2022-08-19','2022-10-27'),(101,485,35,'2022-08-19','2022-08-21'),(102,63,18,'2022-08-19','2022-11-05'),(103,99,39,'2022-08-19','2023-07-25'),(104,287,377,'2022-08-19','2022-09-05'),(105,198,367,'2022-08-19','2023-06-12'),(106,346,4,'2022-08-19','2023-05-26'),(107,453,149,'2022-08-19','2023-03-31'),(108,140,402,'2022-08-19','2023-02-09'),(109,453,193,'2022-08-19','2023-04-09'),(110,117,377,'2022-08-19','2022-10-25'),(111,218,351,'2022-08-19','2023-06-03'),(112,344,24,'2022-08-19','2022-09-30'),(113,187,82,'2022-08-19','2022-12-31'),(114,16,476,'2022-08-19','2023-03-10'),(115,312,352,'2022-08-19','2023-01-09'),(116,473,316,'2022-08-19','2022-10-31'),(117,411,285,'2022-08-19','2023-01-16'),(118,463,23,'2022-08-19','2023-01-21'),(119,400,323,'2022-08-19','2023-04-20'),(120,193,43,'2022-08-19','2023-07-19'),(121,227,109,'2022-08-19','2022-12-26'),(122,249,178,'2022-08-19','2023-08-02'),(123,490,112,'2022-08-19','2023-06-05'),(124,90,370,'2022-08-19','2023-05-06'),(125,80,166,'2022-08-19','2023-02-05'),(126,228,234,'2022-08-19','2023-03-10'),(127,96,176,'2022-08-19','2022-12-24'),(128,404,123,'2022-08-19','2023-07-18'),(129,263,51,'2022-08-19','2022-10-15'),(130,440,49,'2022-08-19','2022-10-12'),(131,226,240,'2022-08-19','2023-05-01'),(132,330,51,'2022-08-19','2023-05-27'),(133,167,448,'2022-08-19','2022-08-19'),(134,198,83,'2022-08-19','2023-07-07'),(135,469,461,'2022-08-19','2023-04-26'),(136,187,253,'2022-08-19','2023-06-25'),(137,330,372,'2022-08-19','2023-08-17'),(138,113,491,'2022-08-19','2023-08-15'),(139,223,360,'2022-08-19','2023-07-27'),(140,317,408,'2022-08-19','2023-04-06'),(141,177,119,'2022-08-19','2022-10-25'),(142,59,472,'2022-08-19','2023-04-04'),(143,6,363,'2022-08-19','2022-09-18'),(144,135,468,'2022-08-19','2023-07-12'),(145,413,447,'2022-08-19','2023-07-03'),(146,138,429,'2022-08-19','2022-10-23'),(147,469,272,'2022-08-19','2023-03-13'),(148,117,418,'2022-08-19','2023-04-20'),(149,10,146,'2022-08-19','2023-05-06'),(150,159,93,'2022-08-19','2023-07-31');
/*!40000 ALTER TABLE `tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'refugioanimal'
--

--
-- Dumping routines for database 'refugioanimal'
--
/*!50003 DROP FUNCTION IF EXISTS `actualizar_totales_compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `actualizar_totales_compras`(producto_id INT) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE resultado VARCHAR(255);
    
    UPDATE compras
	SET monto_total = ((SELECT hacer_totales (producto_id)))
	WHERE id_producto = producto_id;
    
    SET resultado = 'REGISTRO ACTUALIZADO CON ÉXITO';
    RETURN resultado;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `actualizar_totales_medicamentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `actualizar_totales_medicamentos`(medicamento_id INT) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE resultado VARCHAR(255);
    
    UPDATE medicamentos
	SET monto_total = ((SELECT hacer_totales_medicamentos (medicamento_id)))
	WHERE id_medicamento = medicamento_id;
    
    SET resultado = 'REGISTRO ACTUALIZADO CON ÉXITO';
    RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cuenta_tratamiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cuenta_tratamiento`(animal_id INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE resultado INT;
    
    SELECT COUNT(*) AS cantidad_tratamientos INTO resultado
	FROM tratamientos
	WHERE id_animal = animal_id;
    
    RETURN resultado;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `hacer_totales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `hacer_totales`(producto_id INT) RETURNS float
    READS SQL DATA
BEGIN
	DECLARE total FLOAT;
    
    SELECT SUM(precio_unitario + monto_impositivo) INTO total
	FROM compras
	WHERE id_producto = producto_id;

	RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `hacer_totales_medicamentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `hacer_totales_medicamentos`(medicamento_id INT) RETURNS float
    READS SQL DATA
BEGIN
	DECLARE total FLOAT;
    
	SELECT SUM(precio_unitario + monto_impositivo) INTO total
    FROM medicamentos
    WHERE id_medicamento = medicamento_id;
    
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_responsable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_responsable`(IN responsable_id INT)
BEGIN
	IF responsable_id = ' ' THEN
		SELECT 'NO CUMPLE CON PARAMETRO';
	ELSE  
		DELETE FROM responsable WHERE id_responsable = responsable_id;
        
        SELECT * FROM responsable;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ordenar_top_donantes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ordenar_top_donantes`(IN field VARCHAR(50), IN order_type VARCHAR (10))
BEGIN
	IF field <> ' ' AND order_type <> ' ' THEN
		SET @donante_order = CONCAT(' ORDER BY ', field, ' ', order_type);
	ELSEIF field <> ' ' AND order_type = ' ' THEN
		SET @donante_order = CONCAT(' ORDER BY ', field);
	ELSE
		SET @donante_order = ' ';
	END IF;
	
    SET @clausula = CONCAT('SELECT d.monto, d.fecha_donacion, n.nombre, n.apellido 
    FROM donaciones d 
    INNER JOIN donantes n
	ON d.id_donante = n.id_donante', @donante_order);
    PREPARE instruccion FROM @clausula;
    EXECUTE instruccion;
    DEALLOCATE PREPARE instruccion;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `adoptantes_resumen`
--

/*!50001 DROP VIEW IF EXISTS `adoptantes_resumen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adoptantes_resumen` AS select `a`.`id_adoptante` AS `id_adoptante`,`a`.`nombre_adoptante` AS `nombre`,`a`.`apellido_adoptante` AS `apellido`,`a`.`id_animal` AS `id_animal`,`a`.`dni_adoptante` AS `DNI` from (`adoptantes` `a` join `animales` `n` on((`a`.`id_animal` = `n`.`id_animal`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `animales_sin_raza`
--

/*!50001 DROP VIEW IF EXISTS `animales_sin_raza`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `animales_sin_raza` AS select `animales`.`id_animal` AS `id_animal`,`animales`.`nombre_animal` AS `nombre_animal`,`animales`.`raza_animal` AS `raza_animal`,`animales`.`descripcion` AS `descripcion`,`animales`.`fecha_ingreso` AS `fecha_ingreso`,`animales`.`edad_estimada_animal` AS `edad_estimada_animal`,`animales`.`id_estado` AS `id_estado`,`animales`.`sexo` AS `sexo` from `animales` where (`animales`.`raza_animal` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `compras_costos`
--

/*!50001 DROP VIEW IF EXISTS `compras_costos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `compras_costos` AS select `compras`.`id_producto` AS `id_producto`,`compras`.`tipo_compra` AS `tipo_producto`,`compras`.`precio_unitario` AS `precio_unitario`,`compras`.`monto_impositivo` AS `impuestos`,`compras`.`monto_total` AS `total` from `compras` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `costos_medicamentos`
--

/*!50001 DROP VIEW IF EXISTS `costos_medicamentos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `costos_medicamentos` AS select `medicamentos`.`id_medicamento` AS `id_medicamento`,`medicamentos`.`tipo_medicamento` AS `tipo`,`medicamentos`.`precio_unitario` AS `precio_unitario`,`medicamentos`.`monto_impositivo` AS `monto_impositivo`,`medicamentos`.`monto_total` AS `total` from `medicamentos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `costoss`
--

/*!50001 DROP VIEW IF EXISTS `costoss`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `costoss` AS select `m`.`id_medicamento` AS `id_medicamento`,`m`.`monto_total` AS `monto_total_medicamento`,`c`.`id_producto` AS `id_producto`,`c`.`monto_total` AS `monto_total_producto` from (`medicamentos` `m` join `compras` `c` on((`c`.`id_producto` = `m`.`id_medicamento`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fechasdecompra`
--

/*!50001 DROP VIEW IF EXISTS `fechasdecompra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fechasdecompra` AS select `m`.`fecha_compra` AS `fecha_compra_med`,`m`.`id_medicamento` AS `id_medicamento`,`c`.`id_producto` AS `id_producto`,`c`.`fecha_compra` AS `fecha_compra_prod` from (`medicamentos` `m` join `compras` `c` on((`m`.`fecha_compra` = `c`.`fecha_compra`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inventario`
--

/*!50001 DROP VIEW IF EXISTS `inventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inventario` AS select `c`.`id_medicamento` AS `id_medicamento`,`m`.`cantidad` AS `cantidad_medicamentos`,`c`.`id_producto` AS `id_producto`,`k`.`cantidad` AS `cantidad_productos` from ((`costos` `c` join `medicamentos` `m` on((`c`.`id_medicamento` = `m`.`id_medicamento`))) join `compras` `k` on((`k`.`id_producto` = `c`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `responsables_detalle`
--

/*!50001 DROP VIEW IF EXISTS `responsables_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `responsables_detalle` AS select `e`.`nombre_empleado` AS `nombre_empleado`,`e`.`apellido_empleado` AS `apellido_empleado`,`r`.`id_empleado` AS `id_empleado`,`r`.`id_animal` AS `id_animal`,`r`.`descripcion_responsabilidad` AS `detalle`,`r`.`rutina` AS `rutina`,`a`.`nombre_animal` AS `nombre_animal` from ((`responsable` `r` join `empleados` `e` on((`e`.`id_empleado` = `r`.`id_empleado`))) join `animales` `a` on((`a`.`id_animal` = `r`.`id_animal`))) order by `r`.`id_animal` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-14 22:19:07
