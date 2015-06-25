-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: c9
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `idEmpresa` int(11) DEFAULT NULL,
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (3,1,'UNIDADES'),(7,2,'UNIDADES'),(8,3,'UNIDADES'),(10,4,'UNIDADES'),(1,5,'KCC Presidencia'),(4,6,'KCC Presidencia'),(2,7,'KCC Finanzas'),(4,8,'KCC Finanzas'),(4,9,'KCC RRHH'),(6,10,'KCC RRHH'),(1,11,'KCC Auditoría'),(4,12,'KCC Auditoría'),(4,13,'KCC Sistemas'),(4,14,'KCC Legal'),(4,15,'KCC Supply Chain'),(7,16,'KCC Supply Chain'),(1,17,'KHSA MBU'),(4,18,'KHSA MBU'),(4,19,'KHSA NBU'),(1,20,'KCC PSG'),(4,21,'KCC PSG'),(1,22,'Gcia General'),(2,23,'Gcia General'),(3,24,'Gcia General'),(7,25,'Gcia General'),(8,26,'Gcia General'),(9,27,'Gcia General'),(10,28,'Gcia General'),(3,29,'Gcia Zonal'),(7,30,'Gcia Zonal'),(8,31,'Gcia Zonal'),(7,32,'KCH Vta Equipos Mineros'),(1,33,'KCH Vta Equipos Construcción'),(7,34,'KCH Vta Equipos Construcción'),(7,35,'KCH Vta Equipos Forestal'),(1,36,'KCH Gcia Negocios'),(7,37,'KCH Gcia Negocios'),(10,38,'KCCA Vta Equipos Usados'),(7,39,'Sub Control Gestion'),(7,40,'KCH Vta Repuestos'),(7,41,'KCH Servicio Terreno'),(8,42,'KCH Servicio Terreno'),(4,43,'KCH Operaciones'),(7,44,'KCH Operaciones'),(9,45,'KCH Operaciones'),(10,46,'KCH Operaciones'),(7,47,'KCH Clasif. Chancado'),(1,48,'DCC Repuestos'),(8,49,'DCC Repuestos'),(8,50,'DCC Filtros'),(8,51,'DCC Venta Motores'),(7,52,'DCC Contratos Marc'),(8,53,'DCC Contratos Marc'),(8,54,'DCC Soporte'),(4,55,'DCC Servicios'),(8,56,'DCC Servicios'),(8,57,'DCC Generadores y Arriendo'),(7,58,'KCH Gerencia Minería'),(1,59,'Gcia Comercial'),(3,60,'Gcia Comercial'),(10,61,'Gcia Comercial'),(3,62,'KRCC Gcia Zonal Norte'),(7,63,'KRCC Gcia Zonal Norte'),(10,64,'KRCC Gcia Zonal Norte'),(3,65,'KCCA Taller Mecanico'),(10,66,'KCCA Taller Mecanico'),(10,67,'KCCA Arriendos'),(2,68,'Adm & Control Gestión'),(7,69,'Adm & Control Gestión'),(8,70,'Adm & Control Gestión'),(10,71,'Adm & Control Gestión'),(3,72,'KRCC Gcia Zonal Sur'),(7,73,'KRCC Gcia Zonal Sur'),(3,74,'KRCC Gcia Ingeniería'),(3,75,'CPT'),(8,76,'DCC Six Sigma'),(2,77,'KCCA Finance'),(10,78,'KCCA Finance'),(4,79,'KCC Control Gestión'),(3,80,'KRCC Gcia. Zonal Iquique'),(3,81,'KRCC Gcia. Electrónica'),(4,82,'KCC Contabilidad'),(1,83,'KCC Klas'),(1,84,'Repuestos'),(8,85,'Repuestos'),(4,86,'KCC Infraestructura'),(4,87,'RSE'),(1,88,'KHSA MEIT'),(10,89,'KCCA Transporte'),(1,90,'KHSA Administración y Finanzas'),(1,91,'KHSA Marketing'),(1,92,'KHSA Negocios y Proyectos'),(1,93,'KHSA Repuestos y Equipos Construcción'),(1,94,'KHSA PSG'),(4,95,'KCC Gcia de Asuntos Corporativos'),(7,96,'KCH Repuestos Mineria'),(7,97,'KCH Vta Equipos Constratismo'),(4,98,'Excelencia Operacional'),(3,99,'S/Unidad'),(4,100,'S/Unidad'),(6,101,'S/Unidad'),(7,102,'S/Unidad'),(8,103,'S/Unidad'),(9,104,'S/Unidad'),(10,105,'S/Unidad');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-27  3:20:35
