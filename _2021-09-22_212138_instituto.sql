-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: instituto
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asignaciones`
--

DROP TABLE IF EXISTS `asignaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `empleado_id` int NOT NULL,
  `asignacionable_id` int NOT NULL,
  `asignacionable_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaciones`
--

/*!40000 ALTER TABLE `asignaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignaciones` ENABLE KEYS */;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `escuela_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `escuela_id` (`escuela_id`),
  CONSTRAINT `carreras_ibfk_1` FOREIGN KEY (`escuela_id`) REFERENCES `escuelas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'Ingenieria en Informatica','INF001',1);
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;

--
-- Table structure for table `comunas`
--

DROP TABLE IF EXISTS `comunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `region_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_regiones` (`region_id`),
  CONSTRAINT `FK_regiones` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunas`
--

/*!40000 ALTER TABLE `comunas` DISABLE KEYS */;
INSERT INTO `comunas` VALUES (1,'Santiago',1),(2,'Valparaiso',2),(3,'Viña del Mar',2),(4,'Concepcion',4),(5,'Rancagua',3),(7,'Estacion Central',1),(8,'Providencia',1),(9,'Las Condes',1),(10,'La Florida',1),(11,'Cerrillos',1),(12,'Talcahuano',4),(13,'Coronel',4),(14,'Chillan',16),(15,'Arica',15),(16,'Santa Barbara',4),(17,'La Pintana',1),(18,'Rengo',3),(19,'La Serena',8),(20,'Temuco',10),(21,'Curanilahue',4),(22,'Quillon',16),(23,'Los Angeles',4);
/*!40000 ALTER TABLE `comunas` ENABLE KEYS */;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rut` varchar(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `rol_id` int NOT NULL,
  `comuna_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_roles` (`rol_id`),
  KEY `FK_comunas` (`comuna_id`),
  CONSTRAINT `FK_comunas` FOREIGN KEY (`comuna_id`) REFERENCES `comunas` (`id`),
  CONSTRAINT `FK_roles` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'16800356-9','Pablo Contreras','1990-09-10','pcontreras@gmail.com','Las Acacias 322',2,1),(2,'18792304-K','Laura Diaz',NULL,'ldiaz@gmail.com','Ohiggins 344',3,1),(3,'17564900-7','Luis Mora',NULL,'lmora@gmail.com','San Luis 222',4,1),(4,'15999874-1','Javiera Rosales','1994-07-14','javierarosales@hotmail.com','Carrera 999',2,3),(5,'20467890-K','Lucia Suarez','1999-09-02','lsuarezj@gmail.com','San Martin 899',3,1),(6,'19567822-0','Luis Ramirez','1999-10-22','luisramirez@gmail.com','Carreras 8971',2,4);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;

--
-- Table structure for table `escuelas`
--

DROP TABLE IF EXISTS `escuelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escuelas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `sede_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sede_id` (`sede_id`),
  CONSTRAINT `escuelas_ibfk_1` FOREIGN KEY (`sede_id`) REFERENCES `sedes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuelas`
--

/*!40000 ALTER TABLE `escuelas` DISABLE KEYS */;
INSERT INTO `escuelas` VALUES (1,'Tecnologia',1),(2,'Negocios',1);
/*!40000 ALTER TABLE `escuelas` ENABLE KEYS */;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rut` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_nac` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `comuna_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comuna_id` (`comuna_id`),
  CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`comuna_id`) REFERENCES `comunas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'20963876-4','Francisco Perez','1998-12-15','fperez@gmail.com','Las Animas 4',9),(2,'16987230-K','Eunice Jara','1988-07-10','e.jara@hotmail.com','Sargento Aldea 415',11),(3,'19800741-3','Juan Morales','1990-03-22','jmoraless@gmail.com','Chacabuco 903',7);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;

--
-- Table structure for table `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matriculas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_matricula` datetime NOT NULL,
  `valor` bigint NOT NULL,
  `regimen` enum('Diurno','PEV','TLP','SP') NOT NULL,
  `carrera_id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `nivel_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carrera_id` (`carrera_id`),
  KEY `estudiante_id` (`estudiante_id`),
  KEY `nivel_id` (`nivel_id`),
  CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`id`),
  CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`),
  CONSTRAINT `matriculas_ibfk_3` FOREIGN KEY (`nivel_id`) REFERENCES `niveles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculas`
--

/*!40000 ALTER TABLE `matriculas` DISABLE KEYS */;
INSERT INTO `matriculas` VALUES (1,'2021-09-15 22:37:41',0,'Diurno',1,1,1);
/*!40000 ALTER TABLE `matriculas` ENABLE KEYS */;

--
-- Table structure for table `niveles`
--

DROP TABLE IF EXISTS `niveles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niveles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles`
--

/*!40000 ALTER TABLE `niveles` DISABLE KEYS */;
INSERT INTO `niveles` VALUES (1,'Semestre 1','N1'),(2,'Semestre 2','N2'),(3,'Semestre 3','N3'),(4,'Semestre 4','N4'),(5,'Semestre 5','N5'),(6,'Semestre 6','N6'),(7,'Semestre 7','N7'),(8,'Semestre 8','N8');
/*!40000 ALTER TABLE `niveles` ENABLE KEYS */;

--
-- Table structure for table `regiones`
--

DROP TABLE IF EXISTS `regiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regiones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regiones`
--

/*!40000 ALTER TABLE `regiones` DISABLE KEYS */;
INSERT INTO `regiones` VALUES (1,'Metropolitana de Santiago','XIII'),(2,'De Valparaiso','V'),(3,'Del Libertador General Bernardo OHiggins','VI'),(4,'Del Bio Bio','VIII'),(5,'De Tarapacá','I'),(6,'De Antofagasta','II'),(7,'De Atacama','III'),(8,'De Coquimbo','IV'),(9,'Del Maule','VII'),(10,'De La Araucanía','IX'),(11,'De Los Lagos','X'),(12,'De Aysén del General Carlos Ibáñez del Campo','XI'),(13,'De Magallanes y Antártica Chilena','XII'),(14,'De Los Ríos','XIV'),(15,'De Arica y Parinacota','XV'),(16,'De Ñuble','XVI');
/*!40000 ALTER TABLE `regiones` ENABLE KEYS */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador(a)'),(2,'Director(a) de Sede'),(3,'Director(a) de Escuela'),(4,'Jefe(a) de Carrera');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

--
-- Table structure for table `sedes`
--

DROP TABLE IF EXISTS `sedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sedes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `comuna_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comunas_empleados` (`comuna_id`),
  CONSTRAINT `FK_comunas_empleados` FOREIGN KEY (`comuna_id`) REFERENCES `comunas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sedes`
--

/*!40000 ALTER TABLE `sedes` DISABLE KEYS */;
INSERT INTO `sedes` VALUES (1,'Bellavista','Bellavista 80',8),(2,'Valparaiso','Avenida Peru 415',2),(3,'Chillan','Brasil 7777',14);
/*!40000 ALTER TABLE `sedes` ENABLE KEYS */;

--
-- Table structure for table `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `fijo` int NOT NULL,
  `telefonoable_id` int NOT NULL,
  `telefonoable_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos`
--

/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
INSERT INTO `telefonos` VALUES (1,963245187,2,2,'empleados');
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `activo` int NOT NULL,
  `usuarioable_id` int NOT NULL,
  `usuarioable_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'pablo.contreras@aiep.cl','283e14e9d4fdc50153ff275041e70711c9617bf0',2,1,'empleados'),(2,'laura.diaz@aiep.cl','02854a2e82fdb312a8e8d61813c316f083c1d80c',1,2,'empleados'),(3,'luis.mora@aiep.cl','c9555b6c72e884d3d7e52f1f309e886cbeef1cd7',1,3,'empleados');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-22 21:49:59
