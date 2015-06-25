-- MySQL dump 10.13  Distrib 5.6.12, for osx10.7 (x86_64)
--
-- Host: localhost    Database: incidentes
-- ------------------------------------------------------
-- Server version	5.6.12

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
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Menu` (
  `menuId` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `estilo` varchar(100) DEFAULT NULL,
  `idPadre` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (10,'Administracion',NULL,'fa fa-lg fa-fw fa-key',0),(11,'Usuarios','app.usuarios',NULL,10),(12,'Codigo Termino','/Administracion/codigoTermino',NULL,10),(13,'Origen Problema','/Administracion/origenProblema',NULL,10),(14,'Sistema','app.administracionSistema',NULL,10),(15,'sub Tipo Incidente','/Administracion/subtipo/listado',NULL,10),(20,'Incidente',NULL,'fa fa-lg fa-fw fa-map-marker',0),(21,'Crear Incidente','app.crearIncidente',NULL,20),(24,'Panel Key User','app.homeKu',NULL,20),(25,'Panel Consultor','app.homeConsultor',NULL,20),(30,'Iniciativa',NULL,'fa fa-lg fa-fw fa-paper-plane-o',0),(31,'Crear Iniciativa','app.crearIniciativa',NULL,30),(32,'Mis Iniciatias','/iniciativa/misIniciativas',NULL,30),(40,'Proyecto',NULL,'fa fa-lg fa-fw  fa-suitcase',0),(41,'Mis Proyectos','app.homeJefeProyecto',NULL,40),(42,'Proyectos Bp','/proyecto/bpProyectos',NULL,40),(50,'Dashboard','app.dashboard','fa fa-lg fa-fw fa-home',0),(60,'Reportes',NULL,NULL,0);
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjunto`
--

DROP TABLE IF EXISTS `adjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjunto` (
  `AdjuntoId` int(11) NOT NULL AUTO_INCREMENT,
  `IncidenteId` int(11) DEFAULT NULL,
  `HistorialId` int(11) DEFAULT NULL,
  `UrlArchivo` varchar(400) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Guid` varchar(50) DEFAULT NULL,
  `FechaCreacion` varchar(45) DEFAULT NULL,
  `UsuarioCreacion` varchar(45) DEFAULT NULL,
  `EsActivo` int(11) DEFAULT NULL,
  `UsuarioEliminacion` varchar(45) DEFAULT NULL,
  `FechaEliminacion` datetime DEFAULT NULL,
  PRIMARY KEY (`AdjuntoId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjunto`
--

LOCK TABLES `adjunto` WRITE;
/*!40000 ALTER TABLE `adjunto` DISABLE KEYS */;
INSERT INTO `adjunto` VALUES (14,NULL,0,'archivos/89b04d717837eaf0a2049d9cd940fa96.pdf','Tatiana Rojas Espin (1).pdf',NULL,'2015-03-18 19:25:50',NULL,1,NULL,NULL),(15,NULL,0,'archivos/c949d02abbd23ccc26fc0960b342039a.xlsx','Perfil Usuario PP PC (2).xlsx',NULL,'2015-03-18 19:30:18',NULL,1,NULL,NULL),(16,NULL,0,'archivos/aca4c22ffc3ad6bde8556f9509d5d6f3.docx','pruebas02-03-2015.docx',NULL,'2015-03-18 19:33:15',NULL,1,NULL,NULL),(17,17,0,'archivos/346290431da4afb52446fdb9854a5d42.pdf','CertificadoCotizaciones (1).pdf','17','2015-03-18 19:45:10',NULL,1,NULL,NULL),(18,18,0,'archivos/a3251baf6c9505e99bba4138e6fe84e5.sql','cummins contenido.sql','18','2015-03-18 19:46:30',NULL,1,NULL,NULL),(19,18,0,'archivos/e703de6692bb1560b080b02e82fd2a44.pdf','CV_Iván_Sandoval.pdf','18','2015-03-18 19:46:34',NULL,1,NULL,NULL),(20,18,0,'archivos/c7441749a95d599b9ccc0b020bd4aa39.pdf','CV_Carlos_Silva.pdf','18','2015-03-18 19:46:37',NULL,1,NULL,NULL),(21,19,0,'archivos/d047095e792f46db611e8eba88bf7234.pdf','CV_Washington_catalan.pdf','19','2015-03-18 19:49:36',NULL,1,NULL,NULL),(22,19,0,'archivos/51d5b635b0ebc4bddfab2bbbf71e5b4b.docx','RFC Sistemas - GPSxxxx (4).docx','19','2015-03-18 19:49:40',NULL,1,NULL,NULL),(23,20,0,'archivos/3e09f319ff1222450e73d8389fcd2bf3.txt','produccion.txt','20','2015-03-19 18:35:08',NULL,1,NULL,NULL),(24,21,0,'archivos/c18a0944773e1cd29668c4fcaa3628bb.pdf','15.432.102-0-20062356.pdf','21','2015-03-19 22:48:54',NULL,1,NULL,NULL),(25,22,0,'archivos/a246cdea71eb3dd8c8196ce54893007a.xls','Formato revision.xls','22','2015-03-19 22:51:42',NULL,1,NULL,NULL),(26,25,0,'archivos/7ae3cb93ec911063f35f984689bb147e.pdf','Bienvenido a Club La Tercera.pdf','25','2015-03-22 02:59:57',NULL,1,NULL,NULL),(27,26,0,'archivos/fde305d90cf83f6c93d92b84ec1a4f69.pdf','Tatiana Rojas Espin (1).pdf','26','2015-03-23 12:18:35',NULL,1,NULL,NULL),(28,0,0,'archivos/1cb26b23b02819b5bede63eec2c7964c.pem','kcl-dcc-oregon-admin.pem','undefined','2015-03-23 19:11:20',NULL,1,NULL,NULL),(29,0,0,'archivos/628dae2c4c68017a9cea18376148f35e.pem','kcl-33697-oregon-des.pem','undefined','2015-03-23 19:13:22',NULL,1,NULL,NULL),(30,24,0,'archivos/0ec4420fa72340e79a0ccd83ca4faad4.xls','ExportaLista.xls','24','2015-03-23 19:23:40',NULL,1,NULL,NULL),(31,30,0,'archivos/aba26d07f84b854f943837d6ee106293.pdf','Roque Grez Santis.pdf','30','2015-03-24 12:48:44',NULL,1,NULL,NULL),(32,31,0,'archivos/9954efc066ec87b5b3cb2e4d9c34bd90.pdf','CBTA 3.0 - SP2 - Selfcheck.pdf','31','2015-03-24 14:50:17',NULL,1,NULL,NULL),(33,31,0,'archivos/fc4963cb495ade5ccd7f26e50bef3d6d.xml','LecturaOC-OutSyn-SI-soapui-project.xml','31','2015-03-24 14:54:18',NULL,1,NULL,NULL),(34,32,0,'archivos/4d2b6da9ea49ab127f923433c9c0041a.pdf','Roque Grez Santis.pdf','32','2015-03-24 16:14:40',NULL,1,NULL,NULL),(35,NULL,0,'archivos/bc53e8158c1ccc909862cda6394c6968.md','README.md',NULL,'2015-06-01 18:32:35',NULL,1,NULL,NULL),(36,NULL,0,'archivos/01e99334556c03b1b7e27ceef5394269.md','README.md',NULL,'2015-06-01 18:38:58',NULL,1,NULL,NULL),(37,NULL,0,'archivos/41b79bf11a417a05383a6402285bbeaf.md','README.md',NULL,'2015-06-01 18:40:37',NULL,1,NULL,NULL),(38,NULL,0,'archivos/abb9339db79d91354039fd7e77c419c8.json','bower.json',NULL,'2015-06-01 18:41:12',NULL,1,NULL,NULL),(39,NULL,0,'archivos/d3c7112c0783987834300ff5c1fd4666.md','LICENSE.md',NULL,'2015-06-02 15:22:38',NULL,1,NULL,NULL),(40,NULL,0,'archivos/4a7df3326231805d3f26be227c3a95db.json','package.json',NULL,'2015-06-02 15:25:56',NULL,1,NULL,NULL),(41,0,0,'archivos/782288f81805896fb72b0dc5cd2b21e4.md','README.md',NULL,'2015-06-03 11:35:25',NULL,1,NULL,NULL),(42,0,0,'archivos/7c61d5fdc72ad3c21baa0775aa7fa374.json','bower.json',NULL,'2015-06-03 11:35:58',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `adjunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bpEmpresa`
--

DROP TABLE IF EXISTS `bpEmpresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bpEmpresa` (
  `idBpEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `idDepartamento` int(11) NOT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `usuarioId` int(11) NOT NULL,
  `idDirector` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBpEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bpEmpresa`
--

LOCK TABLES `bpEmpresa` WRITE;
/*!40000 ALTER TABLE `bpEmpresa` DISABLE KEYS */;
INSERT INTO `bpEmpresa` VALUES (1,1,5,'2014-12-10 05:16:27',23,26),(2,1,11,'2014-12-10 05:16:27',23,26),(3,1,17,'2014-12-10 05:16:27',23,26),(4,1,20,'2014-12-10 05:16:27',23,26),(5,1,22,'2014-12-10 05:16:27',23,26),(6,1,33,'2014-12-10 05:16:27',23,26),(7,1,36,'2014-12-10 05:16:27',23,26),(8,1,48,'2014-12-10 05:16:27',23,26),(9,1,59,'2014-12-10 05:16:27',23,26),(10,1,83,'2014-12-10 05:16:27',23,26),(11,1,84,'2014-12-10 05:16:27',23,26),(12,1,88,'2014-12-10 05:16:27',23,26),(13,1,90,'2014-12-10 05:16:27',23,26),(14,1,91,'2014-12-10 05:16:27',23,26),(15,1,92,'2014-12-10 05:16:27',23,26),(16,1,93,'2014-12-10 05:16:27',23,26),(17,1,94,'2014-12-10 05:16:27',23,26);
/*!40000 ALTER TABLE `bpEmpresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigotermino`
--

DROP TABLE IF EXISTS `codigotermino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codigotermino` (
  `CodigoTerminoId` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `EsActivo` int(11) DEFAULT NULL,
  `FechaCreacion` datetime DEFAULT NULL,
  `derivar` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodigoTerminoId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigotermino`
--

LOCK TABLES `codigotermino` WRITE;
/*!40000 ALTER TABLE `codigotermino` DISABLE KEYS */;
INSERT INTO `codigotermino` VALUES (1,'Entrega Workaround',1,'2014-11-16 22:46:53',1),(2,'Solicita Replicar caso en QAS',1,'2014-11-16 22:46:53',0),(3,'Terminado para Requerimiento',1,'2014-11-16 22:46:53',1),(4,'Genera Ticket en Mesa de Servicio',1,'2014-11-16 22:46:53',0),(5,'Solicita Informaci�n a KU',1,'2014-11-16 22:46:53',0),(6,'Deriva a otro Consultor',1,'2014-11-16 22:46:53',0),(7,'Levantamiento de Nota',1,'2014-11-16 22:46:53',0),(8,'codigo termino MBC',0,'2014-12-18 12:16:38',0),(9,'otro codigo de termino',NULL,'2014-12-18 14:21:47',0);
/*!40000 ALTER TABLE `codigotermino` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `emailTemplate`
--

DROP TABLE IF EXISTS `emailTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailTemplate` (
  `idTemplate` int(11) NOT NULL AUTO_INCREMENT,
  `asunto` varchar(100) DEFAULT NULL,
  `cuerpo` mediumtext,
  `fechaCreacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idTemplate`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailTemplate`
--

LOCK TABLES `emailTemplate` WRITE;
/*!40000 ALTER TABLE `emailTemplate` DISABLE KEYS */;
INSERT INTO `emailTemplate` VALUES (4,'Notificacion Incidente','\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n	<head>\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n        <title>*|MC:SUBJECT|*</title>\n        <style type=\"text/css\">\n			/* ///////// CLIENT-SPECIFIC STYLES ///////// */\n			#outlook a{padding:0;} /* Force Outlook to provide a \"view in browser\" message */\n			.ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail to display emails at full width */\n			.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {line-height: 100%;} /* Force Hotmail to display normal line spacing */\n			body, table, td, p, a, li, blockquote{-webkit-text-size-adjust:100%; -ms-text-size-adjust:100%;} /* Prevent WebKit and Windows mobile changing default text sizes */\n			table, td{mso-table-lspace:0pt; mso-table-rspace:0pt;} /* Remove spacing between tables in Outlook 2007 and up */\n			img{-ms-interpolation-mode:bicubic;} /* Allow smoother rendering of resized image in Internet Explorer */\n			/* ///////// RESET STYLES ///////// */\n			body{margin:0; padding:0;}\n			img{border:0; height:auto; line-height:100%; outline:none; text-decoration:none;}\n			table{border-collapse:collapse !important;}\n			body, #bodyTable, #bodyCell{height:100% !important; margin:0; padding:0; width:100% !important;}\n			/* ///////// TEMPLATE STYLES ///////// */\n			#bodyCell{padding:20px;}\n			#templateContainer{width:600px;}\n			/* ========== Page Styles ========== */\n			/**\n			* @tab Page\n			* @section background style\n			* @tip Set the background color and top border for your email. You may want to choose colors that match your company s branding.\n			* @theme page\n			*/\n			body, #bodyTable{\n				/*@editable*/ background-color:#DEE0E2;\n			}\n			/**\n			* @tab Page\n			* @section background style\n			* @tip Set the background color and top border for your email. You may want to choose colors that match your company s branding.\n			* @theme page\n			*/\n			#bodyCell{\n				/*@editable*/ border-top:4px solid #BBBBBB;\n			}\n			/**\n			* @tab Page\n			* @section email border\n			* @tip Set the border for your email.\n			*/\n			#templateContainer{\n				/*@editable*/ border:1px solid #BBBBBB;\n			}\n			/**\n			* @tab Page\n			* @section heading 1\n			* @tip Set the styling for all first-level headings in your emails. These should be the largest of your headings.\n			* @style heading 1\n			*/\n			h1{\n				/*@editable*/ color:#202020 !important;\n				display:block;\n				/*@editable*/ font-family:Helvetica;\n				/*@editable*/ font-size:26px;\n				/*@editable*/ font-style:normal;\n				/*@editable*/ font-weight:bold;\n				/*@editable*/ line-height:100%;\n				/*@editable*/ letter-spacing:normal;\n				margin-top:0;\n				margin-right:0;\n				margin-bottom:10px;\n				margin-left:0;\n				/*@editable*/ text-align:left;\n			}\n			/**\n			* @tab Page\n			* @section heading 2\n			* @tip Set the styling for all second-level headings in your emails.\n			* @style heading 2\n			*/\n			h2{\n				/*@editable*/ color:#404040 !important;\n				display:block;\n				/*@editable*/ font-family:Helvetica;\n				/*@editable*/ font-size:20px;\n				/*@editable*/ font-style:normal;\n				/*@editable*/ font-weight:bold;\n				/*@editable*/ line-height:100%;\n				/*@editable*/ letter-spacing:normal;\n				margin-top:0;\n				margin-right:0;\n				margin-bottom:10px;\n				margin-left:0;\n				/*@editable*/ text-align:left;\n			}\n			/**\n			* @tab Page\n			* @section heading 3\n			* @tip Set the styling for all third-level headings in your emails.\n			* @style heading 3\n			*/\n			h3{\n				/*@editable*/ color:#606060 !important;\n				display:block;\n				/*@editable*/ font-family:Helvetica;\n				/*@editable*/ font-size:16px;\n				/*@editable*/ font-style:italic;\n				/*@editable*/ font-weight:normal;\n				/*@editable*/ line-height:100%;\n				/*@editable*/ letter-spacing:normal;\n				margin-top:0;\n				margin-right:0;\n				margin-bottom:10px;\n				margin-left:0;\n				/*@editable*/ text-align:left;\n			}\n			/**\n			* @tab Page\n			* @section heading 4\n			* @tip Set the styling for all fourth-level headings in your emails. These should be the smallest of your headings.\n			* @style heading 4\n			*/\n			h4{\n				/*@editable*/ color:#808080 !important;\n				display:block;\n				/*@editable*/ font-family:Helvetica;\n				/*@editable*/ font-size:14px;\n				/*@editable*/ font-style:italic;\n				/*@editable*/ font-weight:normal;\n				/*@editable*/ line-height:100%;\n				/*@editable*/ letter-spacing:normal;\n				margin-top:0;\n				margin-right:0;\n				margin-bottom:10px;\n				margin-left:0;\n				/*@editable*/ text-align:left;\n			}\n			/* ========== Header Styles ========== */\n			/**\n			* @tab Header\n			* @section preheader style\n			* @tip Set the background color and bottom border for your email s preheader area.\n			* @theme header\n			*/\n			#templatePreheader{\n				/*@editable*/ background-color:#F4F4F4;\n				/*@editable*/ border-bottom:1px solid #CCCCCC;\n			}\n			/**\n			* @tab Header\n			* @section preheader text\n			* @tip Set the styling for your email s preheader text. Choose a size and color that is easy to read.\n			*/\n			.preheaderContent{\n				/*@editable*/ color:#808080;\n				/*@editable*/ font-family:Helvetica;\n				/*@editable*/ font-size:10px;\n				/*@editable*/ line-height:125%;\n				/*@editable*/ text-align:left;\n			}\n			/**\n			* @tab Header\n			* @section preheader link\n			* @tip Set the styling for your email s preheader links. Choose a color that helps them stand out from your text.\n			*/\n			.preheaderContent a:link, .preheaderContent a:visited, /* Yahoo! Mail Override */ .preheaderContent a .yshortcuts /* Yahoo! Mail Override */{\n				/*@editable*/ color:#606060;\n				/*@editable*/ font-weight:normal;\n				/*@editable*/ text-decoration:underline;\n			}\n			/**\n			* @tab Header\n			* @section header style\n			* @tip Set the background color and borders for your email s header area.\n			* @theme header\n			*/\n			#templateHeader{\n				/*@editable*/ background-color:#F4F4F4;\n				/*@editable*/ border-top:1px solid #FFFFFF;\n				/*@editable*/ border-bottom:1px solid #CCCCCC;\n			}\n			/**\n			* @tab Header\n			* @section header text\n			* @tip Set the styling for your email s header text. Choose a size and color that is easy to read.\n			*/\n			.headerContent{\n				/*@editable*/ color:#505050;\n				/*@editable*/ font-family:Helvetica;\n				/*@editable*/ font-size:20px;\n				/*@editable*/ font-weight:bold;\n				/*@editable*/ line-height:100%;\n				/*@editable*/ padding-top:0;\n				/*@editable*/ padding-right:0;\n				/*@editable*/ padding-bottom:0;\n				/*@editable*/ padding-left:0;\n				/*@editable*/ text-align:left;\n				/*@editable*/ vertical-align:middle;\n			}\n			/**\n			* @tab Header\n			* @section header link\n			* @tip Set the styling for your email s header links. Choose a color that helps them stand out from your text.\n			*/\n			.headerContent a:link, .headerContent a:visited, /* Yahoo! Mail Override */ .headerContent a .yshortcuts /* Yahoo! Mail Override */{\n				/*@editable*/ color:#EB4102;\n				/*@editable*/ font-weight:normal;\n				/*@editable*/ text-decoration:underline;\n			}\n			#headerImage{\n				height:auto;\n				max-width:600px;\n			}\n			/* ========== Body Styles ========== */\n			/**\n			* @tab Body\n			* @section body style\n			* @tip Set the background color and borders for your email s body area.\n			*/\n			#templateBody{\n				/*@editable*/ background-color:#F4F4F4;\n				/*@editable*/ border-top:1px solid #FFFFFF;\n				/*@editable*/ border-bottom:1px solid #CCCCCC;\n			}\n			/**\n			* @tab Body\n			* @section body text\n			* @tip Set the styling for your email s main content text. Choose a size and color that is easy to read.\n			* @theme main\n			*/\n			.bodyContent{\n				/*@editable*/ color:#505050;\n				/*@editable*/ font-family:Helvetica;\n				/*@editable*/ font-size:14px;\n				/*@editable*/ line-height:150%;\n				padding-top:20px;\n				padding-right:20px;\n				padding-bottom:20px;\n				padding-left:20px;\n				/*@editable*/ text-align:left;\n			}\n			/**\n			* @tab Body\n			* @section body link\n			* @tip Set the styling for your email s main content links. Choose a color that helps them stand out from your text.\n			*/\n			.bodyContent a:link, .bodyContent a:visited, /* Yahoo! Mail Override */ .bodyContent a .yshortcuts /* Yahoo! Mail Override */{\n				/*@editable*/ color:#EB4102;\n				/*@editable*/ font-weight:normal;\n				/*@editable*/ text-decoration:underline;\n			}\n			.bodyContent img{\n				display:inline;\n				height:auto;\n				max-width:560px;\n			}\n			/* ========== Footer Styles ========== */\n			/**\n			* @tab Footer\n			* @section footer style\n			* @tip Set the background color and borders for your email s footer area.\n			* @theme footer\n			*/\n			#templateFooter{\n				/*@editable*/ background-color:#F4F4F4;\n				/*@editable*/ border-top:1px solid #FFFFFF;\n			}\n			/**\n			* @tab Footer\n			* @section footer text\n			* @tip Set the styling for your email s footer text. Choose a size and color that is easy to read.\n			* @theme footer\n			*/\n			.footerContent{\n				/*@editable*/ color:#808080;\n				/*@editable*/ font-family:Helvetica;\n				/*@editable*/ font-size:10px;\n				/*@editable*/ line-height:150%;\n				padding-top:20px;\n				padding-right:20px;\n				padding-bottom:20px;\n				padding-left:20px;\n				/*@editable*/ text-align:left;\n			}\n			/**\n			* @tab Footer\n			* @section footer link\n			* @tip Set the styling for your email s footer links. Choose a color that helps them stand out from your text.\n			*/\n			.footerContent a:link, .footerContent a:visited, /* Yahoo! Mail Override */ .footerContent a .yshortcuts, .footerContent a span /* Yahoo! Mail Override */{\n				/*@editable*/ color:#606060;\n				/*@editable*/ font-weight:normal;\n				/*@editable*/ text-decoration:underline;\n			}\n			/* ///////// MOBILE STYLES ///////// */\n            @media only screen and (max-width: 480px){\n				/* /////// CLIENT-SPECIFIC MOBILE STYLES /////// */\n				body, table, td, p, a, li, blockquote{-webkit-text-size-adjust:none !important;} /* Prevent Webkit platforms from changing default text sizes */\n                body{width:100% !important; min-width:100% !important;} /* Prevent iOS Mail from adding padding to the body */\n				/* /////// MOBILE RESET STYLES /////// */\n				#bodyCell{padding:10px !important;}\n				/* /////// MOBILE TEMPLATE STYLES /////// */\n				/* ======== Page Styles ======== */\n				/**\n				* @tab Mobile Styles\n				* @section template width\n				* @tip Make the template fluid for portrait or landscape view adaptability. If a fluid layout doesn t work for you, set the width to 300px instead.\n				*/\n				#templateContainer{\n					max-width:600px !important;\n					/*@editable*/ width:100% !important;\n				}\n				/**\n				* @tab Mobile Styles\n				* @section heading 1\n				* @tip Make the first-level headings larger in size for better readability on small screens.\n				*/\n				h1{\n					/*@editable*/ font-size:24px !important;\n					/*@editable*/ line-height:100% !important;\n				}\n				/**\n				* @tab Mobile Styles\n				* @section heading 2\n				* @tip Make the second-level headings larger in size for better readability on small screens.\n				*/\n				h2{\n					/*@editable*/ font-size:20px !important;\n					/*@editable*/ line-height:100% !important;\n				}\n				/**\n				* @tab Mobile Styles\n				* @section heading 3\n				* @tip Make the third-level headings larger in size for better readability on small screens.\n				*/\n				h3{\n					/*@editable*/ font-size:18px !important;\n					/*@editable*/ line-height:100% !important;\n				}\n				/**\n				* @tab Mobile Styles\n				* @section heading 4\n				* @tip Make the fourth-level headings larger in size for better readability on small screens.\n				*/\n				h4{\n					/*@editable*/ font-size:16px !important;\n					/*@editable*/ line-height:100% !important;\n				}\n				/* ======== Header Styles ======== */\n				#templatePreheader{display:none !important;} /* Hide the template preheader to save space */\n				/**\n				* @tab Mobile Styles\n				* @section header image\n				* @tip Make the main header image fluid for portrait or landscape view adaptability, and set the image s original width as the max-width. If a fluid setting doesn t work, set the image width to half its original size instead.\n				*/\n				#headerImage{\n					height:auto !important;\n					/*@editable*/ max-width:600px !important;\n					/*@editable*/ width:100% !important;\n				}\n				/**\n				* @tab Mobile Styles\n				* @section header text\n				* @tip Make the header content text larger in size for better readability on small screens. We recommend a font size of at least 16px.\n				*/\n				.headerContent{\n					/*@editable*/ font-size:20px !important;\n					/*@editable*/ line-height:125% !important;\n				}\n				/* ======== Body Styles ======== */\n				/**\n				* @tab Mobile Styles\n				* @section body image\n				* @tip Make the main body image fluid for portrait or landscape view adaptability, and set the image s original width as the max-width. If a fluid setting doesn t work, set the image width to half its original size instead.\n				*/\n				#bodyImage{\n					height:auto !important;\n					/*@editable*/ max-width:560px !important;\n					/*@editable*/ width:100% !important;\n				}\n				/**\n				* @tab Mobile Styles\n				* @section body text\n				* @tip Make the body content text larger in size for better readability on small screens. We recommend a font size of at least 16px.\n				*/\n				.bodyContent{\n					/*@editable*/ font-size:18px !important;\n					/*@editable*/ line-height:125% !important;\n				}\n				/* ======== Footer Styles ======== */\n				/**\n				* @tab Mobile Styles\n				* @section footer text\n				* @tip Make the body content text larger in size for better readability on small screens.\n				*/\n				.footerContent{\n					/*@editable*/ font-size:14px !important;\n					/*@editable*/ line-height:115% !important;\n				}\n				.footerContent a{display:block !important;} /* Place footer social and utility links on their own lines, for easier access */\n			}\n		</style>\n    </head>\n    <body leftmargin=\"0\" marginwidth=\"0\" topmargin=\"0\" marginheight=\"0\" offset=\"0\">\n    	<center>\n        	<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" id=\"bodyTable\">\n            	<tr>\n                	<td align=\"center\" valign=\"top\" id=\"bodyCell\">\n                    	<!-- BEGIN TEMPLATE // -->\n                    	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" id=\"templateContainer\">\n                        	<tr>\n                            	<td align=\"center\" valign=\"top\">\n                                	<!-- BEGIN PREHEADER // -->\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"templatePreheader\">\n                                        <tr>\n                                            <td valign=\"top\" class=\"preheaderContent\" style=\"padding-top:10px; padding-right:20px; padding-bottom:10px; padding-left:20px;\" mc:edit=\"preheader_content00\">\n                                                Nueva Iniciativa Proyecto {{nombreProyecto}}\n                                            </td>\n                                            <!-- *|IFNOT:ARCHIVE_PAGE|* -->\n                                            <td valign=\"top\" width=\"180\" class=\"preheaderContent\" style=\"padding-top:10px; padding-right:20px; padding-bottom:10px; padding-left:0;\" mc:edit=\"preheader_content01\">\n                                                <br /><a href=\"*|ARCHIVE|*\" target=\"_blank\"></a>\n                                            </td>\n                                            <!-- *|END:IF|* -->\n                                        </tr>\n                                    </table>\n                                    <!-- // END PREHEADER -->\n                                </td>\n                            </tr>\n                        	<tr>\n                            	<td align=\"center\" valign=\"top\">\n                                	<!-- BEGIN HEADER // -->\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"templateHeader\">\n                                        <tr>\n                                            <td valign=\"top\" class=\"headerContent\">\n                                            	<img src=\"http://gallery.mailchimp.com/2425ea8ad3/images/header_placeholder_600px.png\" style=\"max-width:600px;\" id=\"headerImage\" mc:label=\"header_image\" mc:edit=\"header_image\" mc:allowdesigner mc:allowtext />\n                                            </td>\n                                        </tr>\n                                    </table>\n                                    <!-- // END HEADER -->\n                                </td>\n                            </tr>\n                        	<tr>\n                            	<td align=\"center\" valign=\"top\">\n                                	<!-- BEGIN BODY // -->\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"templateBody\">\n                                        <tr>\n                                            <td valign=\"top\" class=\"bodyContent\" mc:edit=\"body_content00\">\n                                                <h1>Nueva Iniciatva de Proyecto {{nombreProyecto}}</h1>\n                                                \n                                                Estimado  {{nombreUsuario}} el usuario {{nombreSolicitante}} a creado una nueva inciativa para la Empresa {{nombreEmpresa}}\n                                              \n                                              debido a que es una empresa a su cargo es necesaria su aprobacion para continuar con el proceso   \n                                                \n                                            </td>\n                                        </tr>\n                                    \n                                        <tr>\n                                            <td valign=\"top\" class=\"bodyContent\" mc:edit=\"body_content01\">\n                                                <h2>Aprobación </h2>\n                                               para aprobar la iniciativa por favor seguir el siguiente link   click en <a href=\"{{aprobar}}\" target=\"_blank\">Iniciativa</a> \n                                              \n                                            </td>\n                                        </tr>\n                                    </table>\n                                    <!-- // END BODY -->\n                                </td>\n                            </tr>\n                        	<tr>\n                            	<td align=\"center\" valign=\"top\">\n                                	<!-- BEGIN FOOTER // -->\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"templateFooter\">\n                                       \n                                        <tr>\n                                            <td valign=\"top\" class=\"footerContent\" style=\"padding-top:0;\" mc:edit=\"footer_content01\">\n                                              Gerencia de Informatica\n                                                <br />\n                                              <em>KCC</em>\n                                              \n                                            </td>\n                                        </tr>\n                                        \n                                    </table>\n                                    <!-- // END FOOTER -->\n                                </td>\n                            </tr>\n                        </table>\n                        <!-- // END TEMPLATE -->\n                    </td>\n                </tr>\n            </table>\n        </center>\n    </body>\n</html>\n','2015-03-23 18:21:48');
/*!40000 ALTER TABLE `emailTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `rut` varchar(12) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'76080246-8','KOMATSU HOLDING SOUTH AMERICA LTDA.'),(2,'76366637-9','KOMATSU FINANCE CHILE S.A.'),(3,'76492400-2','KOMATSU REMAN CENTER CHILE S.A.'),(4,'77260520-K','KOMATSU CUMMINS CHILE LTDA.'),(5,'77311820-5','CUMMINS SERVICIOS LTDA.'),(6,'96711100-7','KCC TRAINING S.A.'),(7,'96843130-7','KOMATSU CHILE S.A.'),(8,'96843140-4','DISTRIBUIDORA CUMMINS CHILE S.A.'),(9,'96843150-1','KOMATSU MINING SYSTEMS CHILE S.A.'),(10,'99532160-2','KOMATSU CUMMINS CHILE ARRIENDA S.A.');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregableProyecto`
--

DROP TABLE IF EXISTS `entregableProyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entregableProyecto` (
  `idEntregable` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoEntregable` int(11) DEFAULT NULL,
  `semanaEntrega` int(11) DEFAULT NULL,
  `fechaEstimada` datetime DEFAULT NULL,
  `idProyecto` int(11) DEFAULT NULL,
  `estado` int(1) DEFAULT '0',
  `fechaEntrega` datetime DEFAULT NULL,
  `fechaActualizacion` datetime DEFAULT NULL,
  `urlArchivo` varchar(50) DEFAULT NULL,
  `nombreAdjunto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEntregable`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregableProyecto`
--

LOCK TABLES `entregableProyecto` WRITE;
/*!40000 ALTER TABLE `entregableProyecto` DISABLE KEYS */;
INSERT INTO `entregableProyecto` VALUES (11,17,1,'2015-06-20 00:00:00',19,0,NULL,NULL,NULL,NULL),(12,16,2,'2015-06-19 00:00:00',12,1,NULL,'2015-06-11 06:05:48','9fa252d10ef7a3c2d6a1f42f2f3cb2d9.pdf',NULL),(13,17,3,'2015-06-26 00:00:00',12,1,NULL,'2015-06-11 06:04:28','8ad837257519620ca7b4191a2ab387f8.pdf',NULL),(14,20,1,'2015-06-12 00:00:00',12,1,NULL,'2015-06-11 06:08:34','96741812feb0c2fef3608d491edf8d68.pdf','2485.pdf');
/*!40000 ALTER TABLE `entregableProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipoProyecto`
--

DROP TABLE IF EXISTS `equipoProyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipoProyecto` (
  `idEquipoProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `idRol` int(11) NOT NULL,
  `fechaAutorizacion` datetime DEFAULT NULL,
  `estadoAutorizacion` int(11) DEFAULT NULL,
  `idProyecto` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `idEtapaProyecto` int(11) DEFAULT NULL,
  `uid` varchar(100) DEFAULT NULL,
  `hh` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEquipoProyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipoProyecto`
--

LOCK TABLES `equipoProyecto` WRITE;
/*!40000 ALTER TABLE `equipoProyecto` DISABLE KEYS */;
INSERT INTO `equipoProyecto` VALUES (20,'moises.bravo@kcl.cl',5,'2015-06-10 03:40:05',1,14,'BRAVO  CASTILLO, MOISES ANDRES',2,'b9557ac7-bd1d-4daa-ba56-248385254862',NULL),(26,'moises.bravo@kcl.cl',6,'2015-06-11 01:22:57',1,19,'BRAVO  CASTILLO, MOISES ANDRES',3,'a65e7268-6ca3-4c6f-b03c-8cb9459c5744',7),(28,'moises.bravo@kcl.cl',4,NULL,0,12,'BRAVO  CASTILLO, MOISES ANDRES',3,'8712bc23-180c-4749-8008-00b9874b8fb3',1);
/*!40000 ALTER TABLE `equipoProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `EstadoId` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`EstadoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (10,'Creado'),(20,'Analisis Asignado'),(30,'Entrega Workaround'),(40,'Env�a informaci�n a Proveedor'),(50,'An�lisis Incidente'),(55,'Entrega resultado de an�lisis'),(60,'Envia informaci�n de an�lisis al KeyUser'),(70,'Devuelto a Consultor'),(80,'Cambio de  Consultor'),(99,'Solucionado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoPosibles`
--

DROP TABLE IF EXISTS `estadoPosibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadoPosibles` (
  `idEstadoPosible` int(11) NOT NULL AUTO_INCREMENT,
  `idEstado` int(11) NOT NULL,
  `idEstadoPermitido` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEstadoPosible`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoPosibles`
--

LOCK TABLES `estadoPosibles` WRITE;
/*!40000 ALTER TABLE `estadoPosibles` DISABLE KEYS */;
INSERT INTO `estadoPosibles` VALUES (1,20,30),(2,20,40),(3,20,50),(4,20,80),(5,50,50),(6,50,30),(7,50,40),(8,50,80),(9,30,30),(10,80,50),(11,80,30),(12,80,40),(13,80,80),(14,30,70),(15,30,99),(16,70,50),(17,70,30),(18,70,40),(19,70,80);
/*!40000 ALTER TABLE `estadoPosibles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoProyecto`
--

DROP TABLE IF EXISTS `estadoProyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadoProyecto` (
  `idEstadoProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `idEtapaProyecto` int(11) NOT NULL,
  PRIMARY KEY (`idEstadoProyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoProyecto`
--

LOCK TABLES `estadoProyecto` WRITE;
/*!40000 ALTER TABLE `estadoProyecto` DISABLE KEYS */;
INSERT INTO `estadoProyecto` VALUES (1,'Nueva',1),(2,'Iniciativa Aprobada',1),(3,'Iniciativa Rechazada',1),(4,'Pre Evaluacion Guardada',2),(5,'Pre Evaluacion enviada',2),(6,'Pre Evaluacion Aceptada',2),(7,'pre evaluacion rechazada',2),(8,'Evaluacion Guardada',3),(9,'Evaluacion Enviada',3),(10,'Director de Portafolio',3),(11,'En Ejecucion',4),(12,'Evaluacion Aprobada',3),(13,'Evaluacion Rechazada',3);
/*!40000 ALTER TABLE `estadoProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapaProyecto`
--

DROP TABLE IF EXISTS `etapaProyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etapaProyecto` (
  `idEtapaProyecto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idEtapaProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapaProyecto`
--

LOCK TABLES `etapaProyecto` WRITE;
/*!40000 ALTER TABLE `etapaProyecto` DISABLE KEYS */;
INSERT INTO `etapaProyecto` VALUES (1,'Iniciativa'),(2,'Pre Evaluacion'),(3,'Evaluacion'),(4,'Ejecucion');
/*!40000 ALTER TABLE `etapaProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialProyecto`
--

DROP TABLE IF EXISTS `historialProyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historialProyecto` (
  `idHistorial` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idEstadoProyecto` int(11) DEFAULT NULL,
  `idProyecto` int(11) NOT NULL,
  `idEtapaProyecto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idHistorial`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialProyecto`
--

LOCK TABLES `historialProyecto` WRITE;
/*!40000 ALTER TABLE `historialProyecto` DISABLE KEYS */;
INSERT INTO `historialProyecto` VALUES (103,'','2015-05-27 04:38:18',23,1,11,1),(104,'','2015-05-27 04:38:59',23,1,12,1),(105,'','2015-05-27 04:40:07',23,1,13,1),(106,'','2015-05-27 04:57:13',23,1,14,1),(107,'','2015-05-27 05:03:38',23,1,15,1),(108,'','2015-05-27 05:12:13',23,1,16,1),(109,'','2015-05-27 05:13:28',23,1,17,1),(110,NULL,'2015-05-28 01:57:26',23,1,15,1),(111,NULL,'2015-05-28 02:21:26',23,1,11,1),(112,NULL,'2015-05-28 02:22:48',23,1,13,1),(113,NULL,'2015-05-28 02:23:24',23,1,16,1),(114,NULL,'2015-06-01 19:22:28',23,1,17,1),(115,NULL,'2015-06-01 20:06:45',23,1,12,1),(116,NULL,'2015-06-02 12:39:35',22,2,12,1),(117,'Documento Enviado Aprobacion','2015-06-04 23:41:46',22,5,12,2),(118,'Documento Enviado Aprobacion','2015-06-05 00:16:15',22,5,12,2),(119,'Documento Enviado Aprobacion','2015-06-05 00:18:15',22,5,12,2),(120,'Documento Enviado Aprobacion','2015-06-05 00:20:15',22,5,12,2),(121,'Documento Enviado Aprobacion','2015-06-05 00:22:15',22,5,12,2),(122,'Documento Enviado Aprobacion','2015-06-05 00:24:15',22,5,12,2),(123,'Documento Enviado Aprobacion','2015-06-05 00:26:15',22,5,12,2),(124,'Documento Enviado Aprobacion','2015-06-05 00:29:11',22,5,12,2),(125,'Documento Enviado Aprobacion','2015-06-05 00:34:23',22,5,12,2),(126,'Documento Enviado Aprobacion','2015-06-05 00:36:24',22,5,12,2),(127,'Documento Enviado Aprobacion','2015-06-05 00:37:43',22,5,12,2),(128,'Documento Enviado Aprobacion','2015-06-05 01:46:40',22,5,12,2),(129,'Documento Enviado Aprobacion','2015-06-05 02:03:05',22,5,12,2),(130,'Documento Enviado Aprobacion','2015-06-05 04:37:54',22,5,12,2),(131,'Documento Enviado Aprobacion','2015-06-07 20:52:48',22,5,12,2),(132,'','2015-06-07 20:56:06',22,1,18,1),(133,NULL,'2015-06-09 01:41:43',23,1,14,1),(134,NULL,'2015-06-09 01:42:46',22,2,14,1),(135,'Documento Enviado Aprobacion','2015-06-09 02:54:37',22,5,14,2),(136,'Documento Enviado Aprobacion','2015-06-09 02:55:59',22,5,14,2),(137,'Documento Enviado Aprobacion','2015-06-09 02:56:50',22,5,14,2),(138,'Documento Enviado Aprobacion','2015-06-09 02:58:56',22,5,14,2),(139,'Documento Enviado Aprobacion','2015-06-09 03:01:09',22,5,14,2),(140,'Documento Enviado Aprobacion','2015-06-09 03:04:48',22,5,14,2),(141,'Documento Enviado Aprobacion','2015-06-09 03:07:46',22,5,14,2),(142,'Documento Enviado Aprobacion','2015-06-09 03:29:32',22,5,14,2),(143,'Documento Enviado Aprobacion','2015-06-09 03:30:48',22,5,14,2),(144,'Documento Enviado Aprobacion','2015-06-09 04:15:53',22,5,14,2),(145,'Documento Enviado Aprobacion','2015-06-10 01:52:38',22,5,14,2),(146,'El usuario BRAVO  CASTILLO, MOISES ANDRES','2015-06-10 03:33:31',NULL,NULL,14,2),(147,'Documento Enviado Aprobacion','2015-06-10 03:39:10',22,5,14,2),(148,'El usuario BRAVO  CASTILLO, MOISES ANDRES','2015-06-10 03:40:05',NULL,NULL,14,2),(149,'','2015-06-10 04:20:36',23,1,19,1),(150,NULL,'2015-06-10 04:26:42',23,1,19,1),(151,NULL,'2015-06-10 04:28:18',22,2,19,1),(152,'Documento Enviado Aprobacion','2015-06-10 04:47:27',22,5,19,2),(153,'El usuario BRAVO  CASTILLO, MOISES ANDRES','2015-06-10 04:48:18',NULL,NULL,19,2),(154,NULL,'2015-06-10 04:57:20',22,6,19,3),(155,'Documento Enviado Aprobacion','2015-06-11 00:57:38',22,9,19,3),(156,'Documento Enviado Aprobacion','2015-06-11 01:07:35',22,9,19,3),(157,'Documento Enviado Aprobacion','2015-06-11 01:09:38',22,9,19,3),(158,'Documento Enviado Aprobacion','2015-06-11 01:11:42',22,9,19,3),(159,'Documento Enviado Aprobacion','2015-06-11 01:14:01',22,9,19,3),(160,'El usuario BRAVO  CASTILLO, MOISES ANDRES','2015-06-11 01:22:57',NULL,NULL,19,3),(161,'Documento Enviado Aprobacion','2015-06-11 04:14:55',22,5,12,2),(162,'El usuario BRAVO  CASTILLO, MOISES ANDRES','2015-06-11 04:15:22',NULL,NULL,12,2),(163,NULL,'2015-06-11 04:15:42',22,6,12,3),(164,'Documento Enviado Aprobacion','2015-06-11 04:16:14',22,9,12,3),(165,'Avance Actualizado a 18','2015-06-11 06:37:23',NULL,9,12,3),(166,'Avance Actualizado a 18','2015-06-11 06:37:25',NULL,9,12,3),(167,'Avance Actualizado a 32','2015-06-11 06:38:50',NULL,9,12,3),(168,NULL,'2015-06-11 07:18:56',22,6,19,4),(169,NULL,'2015-06-11 07:20:13',22,6,19,4),(170,NULL,'2015-06-11 07:22:41',22,6,19,4),(171,NULL,'2015-06-11 07:23:40',22,6,19,4),(172,NULL,'2015-06-11 07:25:02',22,12,19,4);
/*!40000 ALTER TABLE `historialProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidente`
--

DROP TABLE IF EXISTS `incidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidente` (
  `idIncidente` int(11) NOT NULL AUTO_INCREMENT,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaActualizacion` datetime DEFAULT NULL,
  `idUsuarioKU` int(11) DEFAULT NULL,
  `idUsuarioConsultor` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `idTipoIncidente` int(11) DEFAULT NULL,
  `idSubTipoIncidente` int(11) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `idOrigenProblema` int(11) DEFAULT NULL,
  `idCodigoTermino` int(11) DEFAULT NULL,
  `fechaCierre` datetime DEFAULT NULL,
  `sla` int(11) DEFAULT '0',
  `comentarioConsultor` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`idIncidente`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidente`
--

LOCK TABLES `incidente` WRITE;
/*!40000 ALTER TABLE `incidente` DISABLE KEYS */;
INSERT INTO `incidente` VALUES (10,'2015-03-18 18:54:02','2015-03-22 21:07:59',22,22,'moises bravo','ssdfs',1,2,20,NULL,NULL,NULL,4,NULL),(11,'2015-03-18 19:14:03','2015-03-24 05:07:29',22,22,'nombre del incidente','Esto es una Descripcion.',1,2,20,NULL,NULL,NULL,4,NULL),(12,'2015-03-18 19:22:56','2015-03-24 03:57:24',22,23,'9878997','798nn hkjhkjh',1,2,20,NULL,NULL,NULL,4,NULL),(13,'2015-03-18 19:25:49','2015-03-18 19:25:49',22,-1,'9808980','uiybi yiy  kj h kjh khjkh',1,2,10,NULL,NULL,NULL,4,NULL),(14,'2015-03-18 19:30:16','2015-03-24 05:01:25',22,22,'oi kjh fffy87','iui yiuy h kjhjih',1,2,20,NULL,NULL,NULL,4,NULL),(15,'2015-03-18 19:33:07','2015-03-24 18:05:56',22,22,'poi p','poipipoipoi',1,2,20,NULL,NULL,NULL,4,NULL),(16,'2015-03-18 19:36:22','2015-03-18 19:36:22',22,-1,'0980808','08080890098',1,2,10,NULL,NULL,NULL,4,NULL),(17,'2015-03-18 19:44:23','2015-03-18 19:44:23',22,22,'uioyiuyiu','uyi iuy',1,2,10,NULL,NULL,NULL,4,NULL),(18,'2015-03-18 19:46:25','2015-03-24 04:56:06',22,22,'98798 897 87','786786b 876',1,2,20,NULL,NULL,NULL,4,NULL),(19,'2015-03-18 19:49:31','2015-03-24 05:09:52',22,22,'incidente  bueno.','lkjkl lkj lkjklj klj',1,2,20,NULL,NULL,NULL,4,NULL),(20,'2015-03-19 18:35:07','2015-03-24 03:34:16',22,22,'mi nuevo incidente de las 15:34','Ohhh esta es la descripcion.',1,2,80,1,2,'0000-00-00 00:00:00',4,NULL),(21,'2015-03-19 22:48:52','2015-03-19 22:48:52',22,-1,'Este es mi incidente','poipoi',1,2,10,NULL,NULL,NULL,4,NULL),(22,'2015-03-19 22:51:38','2015-03-19 22:51:38',22,-1,'este es un nuevo incidente','esto es SAP',1,2,10,NULL,NULL,NULL,4,NULL),(23,'2015-03-19 22:52:11','2015-03-19 22:52:11',22,-1,'otro incidente','opi popiopi',1,6,10,NULL,NULL,NULL,4,NULL),(24,'2015-03-21 01:07:49','2015-03-23 19:23:40',22,22,'mi incidente 12','esta es la descripcion del incidente 12',1,2,50,1,2,'0000-00-00 00:00:00',4,NULL),(25,'2015-03-22 02:59:17','2015-03-24 04:42:32',22,22,'este es un nuevo incidente','Descripcion',1,2,50,1,6,NULL,4,NULL),(26,'2015-03-23 12:18:34','2015-03-23 12:18:34',22,-1,'nuevo incidente para el cristian.','esta es una descripcion.',1,2,10,NULL,NULL,NULL,4,NULL),(27,'2015-03-24 02:40:43','2015-03-24 04:01:54',22,23,'incidente para seguimiento','Por favor responder en el tiempo necesario.',1,5,99,1,2,'2015-03-24 04:01:54',4,NULL),(28,'2015-03-24 04:21:16','2015-03-24 04:21:16',22,-1,'nuevo incidente','descripcion de incidente.',1,2,10,NULL,NULL,NULL,4,NULL),(29,'2015-03-24 04:23:16','2015-03-24 04:23:16',22,-1,'nuevo incidente','descripcion de incidente.',1,2,10,NULL,NULL,NULL,4,NULL),(30,'2015-03-24 12:48:42','2015-03-24 12:48:42',22,-1,'Mi Incidente','Este es mi incidente',1,2,10,NULL,NULL,NULL,4,NULL),(31,'2015-03-24 14:50:12','2015-03-24 14:54:16',25,24,'cualqueir cosa','se cayo er sá',1,2,30,1,4,NULL,4,NULL),(32,'2015-03-24 16:14:38','2015-03-24 16:28:19',22,22,'Titulo incidente','Descripcion asociada',1,3,99,1,6,'2015-03-24 16:28:19',4,NULL);
/*!40000 ALTER TABLE `incidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidenteHistorial`
--

DROP TABLE IF EXISTS `incidenteHistorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidenteHistorial` (
  `idIncidenteHistorial` int(11) NOT NULL AUTO_INCREMENT,
  `idIncidente` int(11) NOT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `idAccion` int(11) DEFAULT NULL,
  `usuarioId` int(11) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `idCodigoTermino` int(11) DEFAULT NULL,
  `comentarios` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`idIncidenteHistorial`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidenteHistorial`
--

LOCK TABLES `incidenteHistorial` WRITE;
/*!40000 ALTER TABLE `incidenteHistorial` DISABLE KEYS */;
INSERT INTO `incidenteHistorial` VALUES (38,10,'2015-03-18 18:54:02',NULL,22,10,NULL,NULL),(39,11,'2015-03-18 19:14:03',NULL,22,10,NULL,NULL),(40,12,'2015-03-18 19:22:56',NULL,22,10,NULL,NULL),(41,13,'2015-03-18 19:25:49',NULL,22,10,NULL,NULL),(42,14,'2015-03-18 19:30:16',NULL,22,10,NULL,NULL),(43,15,'2015-03-18 19:33:07',NULL,22,10,NULL,NULL),(44,16,'2015-03-18 19:36:22',NULL,22,10,NULL,NULL),(45,17,'2015-03-18 19:44:23',NULL,22,10,NULL,NULL),(46,18,'2015-03-18 19:46:25',NULL,22,10,NULL,NULL),(47,19,'2015-03-18 19:49:31',NULL,22,10,NULL,NULL),(48,20,'2015-03-19 18:35:08',NULL,22,10,NULL,NULL),(49,21,'2015-03-19 22:48:52',NULL,22,10,NULL,NULL),(50,22,'2015-03-19 22:51:38',NULL,22,10,NULL,NULL),(51,23,'2015-03-19 22:52:11',NULL,22,10,NULL,NULL),(52,24,'2015-03-21 01:07:49',NULL,22,10,NULL,NULL),(53,25,'2015-03-22 02:59:17',NULL,22,10,NULL,NULL),(54,25,'2015-03-22 04:20:48',NULL,22,20,NULL,NULL),(55,10,'2015-03-22 21:07:59',NULL,22,20,NULL,NULL),(56,26,'2015-03-23 12:18:35',NULL,22,10,NULL,NULL),(57,25,'2015-03-23 15:36:34',NULL,22,30,1,'este es el comenatario'),(58,25,'2015-03-23 15:38:35',NULL,22,30,1,'este es el comenatario'),(59,25,'2015-03-23 15:39:39',NULL,22,30,1,'asfsdf'),(60,25,'2015-03-23 15:40:35',NULL,22,30,1,'este es el comenatario'),(61,25,'2015-03-23 15:41:40',NULL,22,30,1,'asfsdf'),(62,25,'2015-03-23 15:42:36',NULL,22,30,1,'este es el comenatario'),(63,25,'2015-03-23 15:43:40',NULL,22,30,1,'asfsdf'),(64,25,'2015-03-23 15:44:36',NULL,22,30,1,'este es el comenatario'),(65,25,'2015-03-23 15:45:41',NULL,22,30,1,'asfsdf'),(66,25,'2015-03-23 15:46:37',NULL,22,30,1,'este es el comenatario'),(67,25,'2015-03-23 15:46:54',NULL,22,30,1,'jhgjh'),(68,25,'2015-03-23 15:47:41',NULL,22,30,1,'asfsdf'),(69,25,'2015-03-23 15:48:37',NULL,22,30,1,'este es el comenatario'),(70,25,'2015-03-23 15:48:55',NULL,22,30,1,'jhgjh'),(71,25,'2015-03-23 15:49:42',NULL,22,30,1,'asfsdf'),(72,25,'2015-03-23 15:50:38',NULL,22,30,1,'este es el comenatario'),(73,25,'2015-03-23 15:50:56',NULL,22,30,1,'jhgjh'),(74,25,'2015-03-23 15:51:42',NULL,22,30,1,'asfsdf'),(75,25,'2015-03-23 15:51:50',NULL,22,30,1,'Otro Comentario'),(76,25,'2015-03-23 15:52:10',NULL,22,30,3,'Otro Comentario'),(77,25,'2015-03-23 15:52:38',NULL,22,30,1,'este es el comenatario'),(78,25,'2015-03-23 15:52:57',NULL,22,30,1,'jhgjh'),(79,25,'2015-03-23 15:53:48',NULL,22,30,1,'asfsdf'),(80,25,'2015-03-23 15:53:51',NULL,22,30,1,'Otro Comentario'),(81,25,'2015-03-23 15:54:11',NULL,22,30,3,'Otro Comentario'),(82,25,'2015-03-23 15:54:39',NULL,22,30,1,'este es el comenatario'),(83,25,'2015-03-23 15:54:58',NULL,22,30,1,'jhgjh'),(84,25,'2015-03-23 15:55:44',NULL,22,30,1,'asfsdf'),(85,25,'2015-03-23 15:55:52',NULL,22,30,1,'Otro Comentario'),(86,25,'2015-03-23 15:56:12',NULL,22,30,3,'Otro Comentario'),(87,25,'2015-03-23 15:56:40',NULL,22,30,1,'este es el comenatario'),(88,25,'2015-03-23 15:56:59',NULL,22,30,1,'jhgjh'),(89,25,'2015-03-23 15:57:44',NULL,22,30,1,'asfsdf'),(90,25,'2015-03-23 15:58:13',NULL,22,30,3,'Otro Comentario'),(91,25,'2015-03-23 15:59:00',NULL,22,30,1,'jhgjh'),(92,25,'2015-03-23 15:59:17',NULL,22,30,6,'Cotizacion'),(93,25,'2015-03-23 15:59:45',NULL,22,30,1,'asfsdf'),(94,25,'2015-03-23 16:00:14',NULL,22,30,3,'Otro Comentario'),(95,25,'2015-03-23 16:01:01',NULL,22,30,1,'jhgjh'),(96,25,'2015-03-23 16:01:19',NULL,22,30,6,'Cotizacion'),(97,25,'2015-03-23 16:01:46',NULL,22,30,1,'asfsdf'),(98,25,'2015-03-23 16:02:15',NULL,22,30,3,'Otro Comentario'),(99,25,'2015-03-23 16:03:02',NULL,22,30,1,'jhgjh'),(100,25,'2015-03-23 16:03:20',NULL,22,30,6,'Cotizacion'),(101,25,'2015-03-23 16:04:12',NULL,22,30,6,'jhghj'),(102,25,'2015-03-23 16:04:17',NULL,22,30,3,'Otro Comentario'),(103,25,'2015-03-23 16:06:14',NULL,22,30,6,'jhghj'),(104,25,'2015-03-23 16:06:18',NULL,22,30,3,'Otro Comentario'),(105,25,'2015-03-23 16:08:16',NULL,22,30,6,'jhghj'),(106,25,'2015-03-23 16:08:19',NULL,22,30,3,'Otro Comentario'),(107,25,'2015-03-23 16:10:17',NULL,22,30,6,'jhghj'),(108,25,'2015-03-23 16:10:20',NULL,22,30,3,'Otro Comentario'),(109,25,'2015-03-23 16:12:19',NULL,22,30,6,'jhghj'),(110,25,'2015-03-23 16:14:21',NULL,22,30,6,'jhghj'),(111,25,'2015-03-23 16:16:23',NULL,22,30,6,'jhghj'),(112,25,'2015-03-23 16:18:24',NULL,22,30,6,'jhghj'),(113,25,'2015-03-23 16:20:27',NULL,22,30,6,'jhghj'),(114,25,'2015-03-23 16:22:29',NULL,22,30,6,'jhghj'),(115,25,'2015-03-23 16:24:31',NULL,22,30,6,'jhghj'),(116,25,'2015-03-23 16:26:33',NULL,22,30,6,'jhghj'),(117,25,'2015-03-23 16:28:34',NULL,22,30,6,'jhghj'),(118,25,'2015-03-23 16:30:37',NULL,22,30,6,'jhghj'),(119,25,'2015-03-23 16:32:39',NULL,22,30,6,'jhghj'),(120,25,'2015-03-23 16:34:41',NULL,22,30,6,'jhghj'),(121,25,'2015-03-23 16:36:42',NULL,22,30,6,'jhghj'),(122,25,'2015-03-23 16:38:44',NULL,22,30,6,'jhghj'),(123,25,'2015-03-23 16:40:46',NULL,22,30,6,'jhghj'),(124,25,'2015-03-23 16:42:47',NULL,22,30,6,'jhghj'),(125,25,'2015-03-23 16:44:49',NULL,22,30,6,'jhghj'),(126,25,'2015-03-23 16:46:51',NULL,22,30,6,'jhghj'),(127,25,'2015-03-23 16:48:53',NULL,22,30,6,'jhghj'),(128,25,'2015-03-23 16:50:55',NULL,22,30,6,'jhghj'),(129,25,'2015-03-23 16:52:57',NULL,22,30,6,'jhghj'),(130,25,'2015-03-23 16:54:59',NULL,22,30,6,'jhghj'),(131,24,'2015-03-23 19:01:39',NULL,22,20,NULL,NULL),(132,24,'2015-03-23 19:02:30',NULL,22,50,2,'Esto es un ejemplo.'),(133,24,'2015-03-23 19:11:20',NULL,22,50,2,'otro comentario'),(134,24,'2015-03-23 19:13:22',NULL,22,50,2,'detalle'),(135,24,'2015-03-23 19:20:18',NULL,22,50,2,'o No'),(136,24,'2015-03-23 19:23:40',NULL,22,50,2,'es seguro?'),(137,27,'2015-03-24 02:40:43',NULL,22,10,NULL,NULL),(138,27,'2015-03-24 02:49:57',NULL,23,20,NULL,NULL),(139,27,'2015-03-24 03:17:27',NULL,23,30,2,'Este es mi caso de respuesta por  favor tomar con calma'),(140,20,'2015-03-24 03:22:16',NULL,23,20,NULL,NULL),(141,20,'2015-03-24 03:34:16',NULL,23,80,2,'Por favor responde esto tu'),(142,12,'2015-03-24 03:57:24',NULL,23,20,NULL,NULL),(143,27,'2015-03-24 04:01:55',NULL,22,99,2,'Gracias por responder.'),(144,25,'2015-03-24 04:04:04',NULL,22,70,6,'Esto esta mal.'),(145,28,'2015-03-24 04:21:16',NULL,22,10,NULL,NULL),(146,29,'2015-03-24 04:23:16',NULL,22,10,NULL,NULL),(147,25,'2015-03-24 04:42:32',NULL,22,50,6,'asscs'),(148,18,'2015-03-24 04:56:06',NULL,22,20,NULL,NULL),(149,14,'2015-03-24 05:01:25',NULL,22,20,NULL,NULL),(150,11,'2015-03-24 05:07:29',NULL,22,20,NULL,NULL),(151,19,'2015-03-24 05:09:52',NULL,22,20,NULL,NULL),(152,30,'2015-03-24 12:48:42',NULL,22,10,NULL,NULL),(153,31,'2015-03-24 14:50:12',NULL,25,10,NULL,NULL),(154,31,'2015-03-24 14:53:04',NULL,24,20,NULL,NULL),(155,31,'2015-03-24 14:54:16',NULL,24,30,4,'dddd'),(156,32,'2015-03-24 16:14:38',NULL,22,10,NULL,NULL),(157,32,'2015-03-24 16:17:39',NULL,22,20,NULL,NULL),(158,32,'2015-03-24 16:21:23',NULL,22,30,6,'mi comentario.'),(159,32,'2015-03-24 16:28:19',NULL,22,99,6,'tyutyutuytyu'),(160,15,'2015-03-24 18:05:56',NULL,22,20,NULL,NULL);
/*!40000 ALTER TABLE `incidenteHistorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jefeProyecto`
--

DROP TABLE IF EXISTS `jefeProyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jefeProyecto` (
  `idJefe` int(11) NOT NULL AUTO_INCREMENT,
  `idBp` int(11) NOT NULL,
  `idJefeProyecto` int(11) NOT NULL,
  PRIMARY KEY (`idJefe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jefeProyecto`
--

LOCK TABLES `jefeProyecto` WRITE;
/*!40000 ALTER TABLE `jefeProyecto` DISABLE KEYS */;
INSERT INTO `jefeProyecto` VALUES (1,23,22),(2,23,20);
/*!40000 ALTER TABLE `jefeProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origenproblema`
--

DROP TABLE IF EXISTS `origenproblema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `origenproblema` (
  `OrigenProblemaId` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `EsActivo` int(11) DEFAULT NULL,
  `FechaCreacion` datetime DEFAULT NULL,
  PRIMARY KEY (`OrigenProblemaId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origenproblema`
--

LOCK TABLES `origenproblema` WRITE;
/*!40000 ALTER TABLE `origenproblema` DISABLE KEYS */;
INSERT INTO `origenproblema` VALUES (1,'Error Datos',1,'2015-03-22 23:15:25');
/*!40000 ALTER TABLE `origenproblema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `tipoParametro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` VALUES (1,'Baja',1),(2,'Media',1),(3,'Alta',1),(4,'Key User',2),(5,'Jefe Proyecto',2),(6,'Auditor',2),(7,'Sponsor',2),(8,'Estrategico',3),(9,'Operacional',3),(10,'Innovación',3),(11,'Documento de Solicitud',4),(12,'Documento de Inicio',4),(13,'Gantt de Proyecto',4),(14,'Orden de Compra',4),(15,'Otros Anexos',4),(16,'Documento de Inicio',5),(17,'Documento de Solicitud de Proyecto',5),(18,'Pre CAB',5),(19,'CAB',5),(20,'Gantt de Proyecto',5),(21,'Documento de Arquitectura',5),(22,'Saludable',6),(23,'En alerta',6),(24,'En Problemas',6);
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `idProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `resumenEjecutivo` varchar(255) DEFAULT NULL,
  `idSolicitante` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idDepartamento` int(11) NOT NULL,
  `idJefeProyecto` int(11) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaSolicitud` datetime DEFAULT NULL,
  `idEstadoProyecto` int(11) DEFAULT NULL,
  `idBp` int(11) DEFAULT NULL,
  `idEtapaProyecto` int(11) DEFAULT NULL,
  `fechaEstimadaComienzo` date DEFAULT NULL,
  `duracionSemana` int(11) DEFAULT NULL,
  `idComplejidad` int(11) DEFAULT NULL,
  `costoOneOff` int(11) DEFAULT NULL,
  `costoOnGoing` int(11) DEFAULT NULL,
  `beneficios` int(11) DEFAULT NULL,
  `beneficioIntangible` varchar(255) DEFAULT NULL,
  `tipoProyecto` int(11) DEFAULT NULL,
  `fechaEstimadaCierre` datetime DEFAULT NULL,
  `idSaludProyecto` int(11) DEFAULT NULL,
  `comentarioAvance` varchar(4000) DEFAULT NULL,
  `avance` int(11) DEFAULT NULL,
  `fechaUltimoInforme` datetime DEFAULT NULL,
  PRIMARY KEY (`idProyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (11,'iniciativa 1','esosdsd',23,1,5,25,'2015-05-27 04:38:18',NULL,2,25,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'Proyecto de Implementación de telemetria','esosdsd',23,1,5,22,'2015-05-27 04:38:59',NULL,9,25,3,'2015-06-05',4,2,20,3345,4,'45  gfghfh',10,'2015-07-03 00:00:00',24,'esto es un comentario',32,'2015-06-11 06:38:50'),(13,'iniciativa 2','esosdsd',23,1,5,25,'2015-05-27 04:40:07',NULL,2,25,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'mi iniciativa numero 4','afdas lsfsd fmamamam',23,1,5,22,'2015-05-27 04:57:13',NULL,8,25,2,'2015-06-09',4,2,100,120,12,'safdasfa',8,'2015-07-07 00:00:00',NULL,NULL,NULL,NULL),(15,'mi iniciativa numero sueño','zxczxz< ad ad as',23,1,5,25,'2015-05-27 05:03:38',NULL,2,25,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'mi titulo final','lkkl klj klj',23,1,5,NULL,'2015-05-27 05:12:13',NULL,2,25,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'lñklñk','nm,n,',23,1,5,25,'2015-05-27 05:13:28',NULL,2,25,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'mi iniciativa numero 2','Esta es la explicacin de mi iniciativa',22,1,5,NULL,'2015-06-07 20:56:06',NULL,1,23,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'esta es una nueva iniciativa','el resumen ejecutivo de la pagina.',23,1,5,22,'2015-06-10 04:20:36',NULL,11,23,4,'2015-06-13',8,1,1300,2200,120,'es muy importante',8,'2015-08-08 00:00:00',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectoAdjunto`
--

DROP TABLE IF EXISTS `proyectoAdjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectoAdjunto` (
  `idAdjunto` int(11) NOT NULL AUTO_INCREMENT,
  `idProyecto` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `guid` varchar(100) DEFAULT NULL,
  `urlArchivo` varchar(255) DEFAULT NULL,
  `idTipoAdjunto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAdjunto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectoAdjunto`
--

LOCK TABLES `proyectoAdjunto` WRITE;
/*!40000 ALTER TABLE `proyectoAdjunto` DISABLE KEYS */;
INSERT INTO `proyectoAdjunto` VALUES (1,12,NULL,'2015-06-04 03:23:56','12','archivos/bb318cd37e20c54c97eea4279aba1b04.md',12),(2,12,NULL,'2015-06-04 04:50:08','12','archivos/284b8d25bfecaf1e502bcca560416cb5.md',13),(3,12,NULL,'2015-06-04 04:53:43','12','65afa85dcb4a774c4763752e87571002.md',11),(4,12,NULL,'2015-06-04 22:13:16','12','8fe63494ec013ae50705aa889e4b76af.md',12),(5,12,NULL,'2015-06-04 22:18:12','12','0699980b937a5d16410b9169a620359f.phar',14),(6,12,'bower.json','2015-06-04 22:24:35','12','235803938d322c2da762bb3e7692593f.json',14),(7,12,'Postnatal Carolina Garcia.pdf','2015-06-04 22:35:25','12','65c1f94aa6b6c6f3f848f52f00122480.pdf',13),(8,12,'documentos - Documentos de Google.pdf','2015-06-04 22:36:06','12','488fa72824f7897b020bdfed15fcc8cf.pdf',14),(9,12,'gwdpage_min.js','2015-06-04 22:37:24','12','dbd78c9451f3f0d6e2e5a163c54737ca.js',13),(10,12,'gwdpagedeck_min.js','2015-06-04 22:39:26','12','37b6f67a56e61d7992d00e6ccb755629.js',12),(11,14,'gwdpage_min.js','2015-06-10 01:52:21','14','e9d7c204d8320a2db82382ba49ee5e48.js',11),(12,19,'gwddoubleclick_min.js','2015-06-10 04:47:25','19','f49e136a33f47b8a1bd0549b72059a8a.js',13),(13,19,'4m02_historia.pdf','2015-06-11 00:57:12','19','1b16701357f9f97fb5df91943f81dde0.pdf',14);
/*!40000 ALTER TABLE `proyectoAdjunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `rolId` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (10,'Administrador'),(20,'Base'),(30,'Consultor'),(40,'Key User'),(50,'Bussines Partner'),(60,'Jefe de Proyecto'),(70,'Director de Portafolio');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolMenus`
--

DROP TABLE IF EXISTS `rolMenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolMenus` (
  `idrolMenu` int(11) NOT NULL AUTO_INCREMENT,
  `rolId` int(11) DEFAULT NULL,
  `menuId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idrolMenu`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolMenus`
--

LOCK TABLES `rolMenus` WRITE;
/*!40000 ALTER TABLE `rolMenus` DISABLE KEYS */;
INSERT INTO `rolMenus` VALUES (1,10,10),(2,10,11),(3,20,50),(4,20,30),(5,20,31),(6,20,32),(8,10,12),(9,10,13),(10,10,14),(13,30,20),(14,50,33),(15,60,41),(16,60,40),(17,40,24),(18,30,25),(19,40,20),(20,40,20),(21,40,21),(22,10,15),(23,50,42);
/*!40000 ALTER TABLE `rolMenus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subtipoincidente`
--

DROP TABLE IF EXISTS `subtipoincidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subtipoincidente` (
  `SubTipoIncidenteId` int(11) NOT NULL AUTO_INCREMENT,
  `TipoIncidenteId` int(11) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `EsActivo` int(11) DEFAULT NULL,
  `FechaCreacion` datetime DEFAULT NULL,
  PRIMARY KEY (`SubTipoIncidenteId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtipoincidente`
--

LOCK TABLES `subtipoincidente` WRITE;
/*!40000 ALTER TABLE `subtipoincidente` DISABLE KEYS */;
INSERT INTO `subtipoincidente` VALUES (1,2,'MM',1,'2014-11-16 18:50:30'),(2,1,'SD',1,'2014-11-16 18:50:30'),(3,1,'PM',1,'2014-11-16 18:50:30'),(4,1,'CS',1,'2014-11-16 18:50:30'),(5,1,'FI',1,'2014-11-16 18:50:30'),(6,1,'CO',1,'2014-11-16 18:50:30'),(7,1,'PA',1,'2014-11-16 18:50:30'),(8,2,'SCAA',1,'2014-11-16 18:50:30'),(9,2,'RMMP',1,'2014-11-16 18:50:30'),(10,2,'GERENCIA TECNICA DCC1',1,'2014-11-16 18:50:30'),(11,2,'SAG DCC',1,'2014-11-16 18:50:30'),(12,2,'INTRANET KCH',1,'2014-11-16 18:50:30'),(13,3,'CIERRE DE NEGOCIOS',1,'2014-11-16 18:50:30'),(14,3,'RENDICION DE GASTOS',1,'2014-11-16 18:50:30'),(15,3,'SOLICITUD DE FONDOS',1,'2014-11-16 18:50:30'),(16,3,'FACTURA FINANCIERA',1,'2014-11-16 18:50:30'),(17,3,'ORDENES DE COMPRA',1,'2014-11-16 18:50:30'),(18,3,'ACTIVO FIJO',1,'2014-11-16 18:50:30');
/*!40000 ALTER TABLE `subtipoincidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoincidente`
--

DROP TABLE IF EXISTS `tipoincidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoincidente` (
  `TipoIncidenteId` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `EsActivo` int(11) DEFAULT NULL,
  `FechaCreacion` datetime DEFAULT NULL,
  `sla` int(11) DEFAULT NULL,
  PRIMARY KEY (`TipoIncidenteId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoincidente`
--

LOCK TABLES `tipoincidente` WRITE;
/*!40000 ALTER TABLE `tipoincidente` DISABLE KEYS */;
INSERT INTO `tipoincidente` VALUES (1,'SAP',1,'2014-11-08 23:11:46',4),(2,'WEB',1,'2014-11-08 23:11:46',NULL),(3,'BPM',1,'2014-11-08 23:11:46',NULL),(4,'SAP1',0,'2014-11-09 17:22:12',NULL),(5,'SAP1',0,'2014-11-09 17:22:43',NULL),(6,'SAP',0,'2014-11-19 22:21:01',NULL),(7,'SAP',0,'2014-11-20 11:36:35',NULL),(8,'SAP',0,'2014-11-20 11:37:05',NULL),(9,NULL,NULL,'2014-11-20 11:44:00',NULL),(10,'es nombre',1,'2014-12-16 17:01:42',NULL),(11,'nombre 2',1,'2014-12-16 17:02:00',NULL),(12,'sistema incidentes',NULL,'2015-01-26 04:59:22',5);
/*!40000 ALTER TABLE `tipoincidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usuarioId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaUltimoLogin` datetime DEFAULT NULL,
  `fechaActualizacion` datetime DEFAULT NULL,
  `rolesMenu` varchar(4000) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `idEmpresa` int(11) DEFAULT NULL,
  `foto` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`usuarioId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (22,'moises.bravo@rapazz.cl','Bravo Castillo, Moises Andres','2014-11-01 03:32:18',NULL,'2014-11-01 04:07:41','[10,20,60]','\0',NULL,'https://lh3.googleusercontent.com/-FUV9H2Tm-Xg/AAAAAAAAAAI/AAAAAAAAAAA/YizFrC0qZ-Q/photo.jpg'),(23,'moises.bravo@kcl.cl','BRAVO  CASTILLO, MOISES ANDRES','2015-03-18 01:56:49',NULL,'2015-06-11 14:01:43','[20,50]','',NULL,'https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg'),(24,'christian.hernandez@kcl.cl','HERNANDEZ  VILLANUEVA, CHRISTIAN GUILLER','2015-03-24 14:40:41',NULL,'2015-03-24 14:40:41','[20,30]','',NULL,'https://lh5.googleusercontent.com/-ETDi1pb_Sr8/AAAAAAAAAAI/AAAAAAAAAcw/1E1amClg63w/photo.jpg'),(25,'rodrigo.montes@kcl.cl','MONTES  SEREY, RODRIGO JAVIER','2015-03-24 14:44:13',NULL,'2015-03-24 14:44:13','[20,40]','',NULL,'https://lh3.googleusercontent.com/-uMLdmwmCQII/AAAAAAAAAAI/AAAAAAAAB30/efiazBSa7H8/photo.jpg'),(26,'raul.vasquez@kcl.cl','VASQUEZ  SUREDA, RAUL GERMAN','2015-06-11 14:54:07',NULL,'2015-06-11 14:54:07','[20,70]','',4,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versiones`
--

DROP TABLE IF EXISTS `versiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versiones` (
  `idVersion` int(11) NOT NULL AUTO_INCREMENT,
  `idProyecto` int(11) DEFAULT NULL,
  `documento` mediumtext,
  `idEtapaProyecto` int(11) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  PRIMARY KEY (`idVersion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versiones`
--

LOCK TABLES `versiones` WRITE;
/*!40000 ALTER TABLE `versiones` DISABLE KEYS */;
INSERT INTO `versiones` VALUES (1,2,NULL,1,'2014-12-17 10:17:59'),(2,3,'{\"idProyecto\":3,\"nombre\":\"iniciativa 3\",\"resumenEjecutivo\":\"13131  iouu oi098 890\",\"idSolicitante\":20,\"idEmpresa\":1,\"idDepartamento\":20,\"idJefeProyecto\":null,\"fechaCreacion\":\"2014-12-17T10:20:13.000Z\",\"idEstadoProyecto\":2,\"idBp\":20,\"idEtapaProyecto\":1,\"fechaEstimadaComienzo\":null,\"duracionSemana\":null,\"idComplejidad\":null,\"costoOneOff\":null,\"costoOnGoing\":null,\"beneficios\":null,\"beneficioIntangible\":null,\"tipoProyecto\":null}',1,'2014-12-17 10:20:34'),(3,5,'{\"idProyecto\":5,\"nombre\":\"iniciativa 4\",\"resumenEjecutivo\":\"Esta es mi iniciativa Final .....\",\"idSolicitante\":20,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":null,\"fechaCreacion\":\"2014-12-17T18:26:40.000Z\",\"idEstadoProyecto\":2,\"idBp\":20,\"idEtapaProyecto\":1,\"fechaEstimadaComienzo\":null,\"duracionSemana\":null,\"idComplejidad\":null,\"costoOneOff\":null,\"costoOnGoing\":null,\"beneficios\":null,\"beneficioIntangible\":null,\"tipoProyecto\":null}',1,'2014-12-17 18:27:05'),(4,NULL,'[{\"idProyecto\":5,\"nombre\":\"ñiniciativaoñ\",\"resumenEjecutivo\":\"Esta es mi iniciativa Final .....\",\"idSolicitante\":20,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":20,\"fechaCreacion\":\"2014-12-17T18:26:40.000Z\",\"idEstadoProyecto\":5,\"idBp\":20,\"idEtapaProyecto\":2,\"fechaEstimadaComienzo\":\"2014-12-21T00:00:00.000Z\",\"duracionSemana\":12708,\"idComplejidad\":1,\"costoOneOff\":1500,\"costoOnGoing\":2500,\"beneficios\":200,\"beneficioIntangible\":\"150kjjkljmm\",\"tipoProyecto\":\"[10,9]\",\"empresa\":{\"idEmpresa\":1,\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"jefeProyecto\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"usuarioBp\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"etapa\":{\"idEtapaProyecto\":2,\"nombre\":\"Pre Evaluacion\"},\"complejidad\":{\"id\":1,\"nombre\":\"Baja\",\"tipoParametro\":1},\"adjunto\":[{\"idAdjunto\":6,\"idProyecto\":5,\"descripcion\":\"este es un adjunto\",\"fechaCreacion\":\"2014-12-18T00:42:12.000Z\",\"guid\":\"5\",\"urlArchivo\":\"archivos/c6df3b6f0156e8e4831c36a1d70e72f0.gif\",\"idTipoAdjunto\":11,\"tipoAdjunto\":{\"id\":11,\"nombre\":\"Documento de Solicitud\",\"tipoParametro\":4}},{\"idAdjunto\":7,\"idProyecto\":5,\"descripcion\":\"adjunto 2\",\"fechaCreacion\":\"2014-12-21T04:05:04.000Z\",\"guid\":\"5\",\"urlArchivo\":\"archivos/85a8bba84b26958db0d4a465708a0df6.pdf\",\"idTipoAdjunto\":13,\"tipoAdjunto\":{\"id\":13,\"nombre\":\"Gantt de Proyecto\",\"tipoParametro\":4}}],\"estadoProyecto\":{\"idEstadoProyecto\":5,\"nombre\":\"Pre Evaluacion enviada\",\"idEtapaProyecto\":2},\"equipoProyecto\":[{\"idEquipoProyecto\":117,\"email\":\"moises.bravo@kcl.cl\",\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"idRol\":4,\"fechaAutorizacion\":\"2014-12-21T04:20:40.000Z\",\"estadoAutorizacion\":1,\"idProyecto\":5,\"idEtapaProyecto\":2,\"uid\":\"c41ff5a4-55dd-409b-a24d-05e8722aa782\",\"cargo\":{\"id\":4,\"nombre\":\"Key User\",\"tipoParametro\":2}},{\"idEquipoProyecto\":118,\"email\":\"carlos.rubio@kcl.cl\",\"nombre\":\"RUBIO  HERNANDEZ, CARLOS PATRICIO\",\"idRol\":5,\"fechaAutorizacion\":\"2014-12-21T04:19:23.000Z\",\"estadoAutorizacion\":1,\"idProyecto\":5,\"idEtapaProyecto\":2,\"uid\":\"cb5860f2-69bb-4d28-a720-b083d12d58a0\",\"cargo\":{\"id\":5,\"nombre\":\"Jefe Proyecto\",\"tipoParametro\":2}}],\"version\":[{\"fechaCreacion\":\"2014-12-17T18:27:05.000Z\",\"idProyecto\":5,\"etapaProyecto\":{\"idEtapaProyecto\":1,\"nombre\":\"Iniciativa\"}}]}]',3,'2014-12-21 04:21:23'),(5,3,'{\"idProyecto\":3,\"nombre\":\"iniciativa 4\",\"resumenEjecutivo\":\"13131  iouu oi098 890\",\"idSolicitante\":20,\"idEmpresa\":1,\"idDepartamento\":20,\"idJefeProyecto\":20,\"fechaCreacion\":\"2014-12-17T10:20:13.000Z\",\"idEstadoProyecto\":8,\"idBp\":20,\"idEtapaProyecto\":3,\"fechaEstimadaComienzo\":\"2014-12-21T00:00:00.000Z\",\"duracionSemana\":4,\"idComplejidad\":3,\"costoOneOff\":1200,\"costoOnGoing\":3000,\"beneficios\":1100,\"beneficioIntangible\":\"no lo se\",\"tipoProyecto\":\"[9,10]\",\"empresa\":{\"idEmpresa\":1,\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":20,\"idEmpresa\":1,\"nombre\":\"KCC PSG\"},\"usuario\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"jefeProyecto\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"usuarioBp\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"etapa\":{\"idEtapaProyecto\":2,\"nombre\":\"Pre Evaluacion\"},\"complejidad\":{\"id\":3,\"nombre\":\"Alta\",\"tipoParametro\":1},\"adjunto\":[{\"idAdjunto\":5,\"idProyecto\":3,\"descripcion\":\"jkhjkh jhjkh jkh\",\"fechaCreacion\":\"2014-12-17T14:23:37.000Z\",\"guid\":\"3\",\"urlArchivo\":\"archivos/970e2ced9f59d00ffb29e1321029d676.PDF\",\"idTipoAdjunto\":12,\"tipoAdjunto\":{\"id\":12,\"nombre\":\"Documento de Inicio\",\"tipoParametro\":4}}],\"estadoProyecto\":{\"idEstadoProyecto\":5,\"nombre\":\"Pre Evaluacion enviada\",\"idEtapaProyecto\":2},\"equipoProyecto\":[{\"idEquipoProyecto\":121,\"email\":\"moises.bravo@kcl.cl\",\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"idRol\":4,\"fechaAutorizacion\":\"2014-12-21T10:26:50.000Z\",\"estadoAutorizacion\":1,\"idProyecto\":3,\"idEtapaProyecto\":2,\"uid\":\"c26366ca-aad2-4157-a55b-e6b3c377dbfd\",\"cargo\":{\"id\":4,\"nombre\":\"Key User\",\"tipoParametro\":2}},{\"idEquipoProyecto\":122,\"email\":\"francisco.carlos@komatsu.cl\",\"nombre\":\"CARLOS  CARLOS,  FRANCISCO JAVIER\",\"idRol\":6,\"fechaAutorizacion\":\"2014-12-21T10:28:56.000Z\",\"estadoAutorizacion\":1,\"idProyecto\":3,\"idEtapaProyecto\":2,\"uid\":\"b79e9b29-b870-4dae-8b4c-f5f70df7fca4\",\"cargo\":{\"id\":6,\"nombre\":\"Auditor\",\"tipoParametro\":2}}],\"version\":[{\"fechaCreacion\":\"2014-12-17T10:20:34.000Z\",\"idProyecto\":3,\"etapaProyecto\":{\"idEtapaProyecto\":1,\"nombre\":\"Iniciativa\"}}]}',3,'2014-12-21 10:28:56'),(6,6,'{\"idProyecto\":6,\"nombre\":\"Iniciativa de Prueba 1\",\"resumenEjecutivo\":\"Esta es la iniciativa que puede llegar hasta la evaluación.\",\"idSolicitante\":20,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":null,\"fechaCreacion\":\"2014-12-22T04:29:33.000Z\",\"idEstadoProyecto\":2,\"idBp\":20,\"idEtapaProyecto\":1,\"fechaEstimadaComienzo\":null,\"duracionSemana\":null,\"idComplejidad\":null,\"costoOneOff\":null,\"costoOnGoing\":null,\"beneficios\":null,\"beneficioIntangible\":null,\"tipoProyecto\":null,\"empresa\":{\"idEmpresa\":1,\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"jefeProyecto\":null,\"usuarioBp\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"etapa\":{\"idEtapaProyecto\":1,\"nombre\":\"Iniciativa\"},\"estadoProyecto\":{\"idEstadoProyecto\":1,\"nombre\":\"Nueva\",\"idEtapaProyecto\":1}}',1,'2014-12-22 04:29:59'),(7,6,'{\"idProyecto\":6,\"nombre\":\"Iniciativa de Prueba 1\",\"resumenEjecutivo\":\"Esta es la iniciativa que puede llegar hasta la evaluación.\",\"idSolicitante\":20,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":20,\"fechaCreacion\":\"2014-12-22T04:29:33.000Z\",\"idEstadoProyecto\":5,\"idBp\":20,\"idEtapaProyecto\":2,\"fechaEstimadaComienzo\":\"2015-01-01T00:00:00.000Z\",\"duracionSemana\":4,\"idComplejidad\":2,\"costoOneOff\":1200,\"costoOnGoing\":1500,\"beneficios\":1300,\"beneficioIntangible\":\"1321321\",\"tipoProyecto\":\"[8,10]\",\"empresa\":{\"idEmpresa\":1,\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"jefeProyecto\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"usuarioBp\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"etapa\":{\"idEtapaProyecto\":2,\"nombre\":\"Pre Evaluacion\"},\"complejidad\":{\"id\":2,\"nombre\":\"Media\",\"tipoParametro\":1},\"adjunto\":[{\"idAdjunto\":8,\"idProyecto\":6,\"descripcion\":\"documento de prueba\",\"fechaCreacion\":\"2014-12-22T04:31:34.000Z\",\"guid\":\"6\",\"urlArchivo\":\"archivos/554abe20ae0929f63481da952da9076e.docx\",\"idTipoAdjunto\":11,\"tipoAdjunto\":{\"id\":11,\"nombre\":\"Documento de Solicitud\",\"tipoParametro\":4}}],\"estadoProyecto\":{\"idEstadoProyecto\":5,\"nombre\":\"Pre Evaluacion enviada\",\"idEtapaProyecto\":2},\"equipoProyecto\":[{\"idEquipoProyecto\":167,\"email\":\"moises.bravo@kcl.cl\",\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"idRol\":5,\"fechaAutorizacion\":\"2014-12-22T04:41:47.000Z\",\"estadoAutorizacion\":1,\"idProyecto\":6,\"idEtapaProyecto\":2,\"uid\":\"aa109bfe-793f-47e4-87e2-d056c72ca282\",\"cargo\":{\"id\":5,\"nombre\":\"Jefe Proyecto\",\"tipoParametro\":2}}]}',2,'2014-12-22 04:41:47'),(8,6,'{\"idProyecto\":6,\"nombre\":\"Iniciativa de Prueba\",\"resumenEjecutivo\":\"Esta es la iniciativa que puede llegar hasta la evaluación.\",\"idSolicitante\":20,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":20,\"fechaCreacion\":\"2014-12-22T04:29:33.000Z\",\"idEstadoProyecto\":9,\"idBp\":20,\"idEtapaProyecto\":3,\"fechaEstimadaComienzo\":\"2014-12-22T00:00:00.000Z\",\"duracionSemana\":4,\"idComplejidad\":2,\"costoOneOff\":1200,\"costoOnGoing\":1500,\"beneficios\":1300,\"beneficioIntangible\":\"1321321\",\"tipoProyecto\":\"[8,10]\",\"empresa\":{\"idEmpresa\":1,\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"jefeProyecto\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"usuarioBp\":{\"usuarioId\":20,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2014-10-31T17:45:56.000Z\",\"fechaActualizacion\":\"2014-12-17T10:21:03.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,50,60]\",\"estado\":[1]},\"etapa\":{\"idEtapaProyecto\":3,\"nombre\":\"Evaluacion\"},\"complejidad\":{\"id\":2,\"nombre\":\"Media\",\"tipoParametro\":1},\"adjunto\":[{\"idAdjunto\":8,\"idProyecto\":6,\"descripcion\":\"documento de prueba\",\"fechaCreacion\":\"2014-12-22T04:31:34.000Z\",\"guid\":\"6\",\"urlArchivo\":\"archivos/554abe20ae0929f63481da952da9076e.docx\",\"idTipoAdjunto\":11,\"tipoAdjunto\":{\"id\":11,\"nombre\":\"Documento de Solicitud\",\"tipoParametro\":4}}],\"estadoProyecto\":{\"idEstadoProyecto\":9,\"nombre\":\"Evaluacion Enviada\",\"idEtapaProyecto\":3},\"equipoProyecto\":[{\"idEquipoProyecto\":169,\"email\":\"moises.bravo@kcl.cl\",\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"idRol\":5,\"fechaAutorizacion\":\"2014-12-22T04:54:30.000Z\",\"estadoAutorizacion\":1,\"idProyecto\":6,\"idEtapaProyecto\":3,\"uid\":\"571ca337-22d1-4a74-ae36-9ddb969d90da\",\"cargo\":{\"id\":5,\"nombre\":\"Jefe Proyecto\",\"tipoParametro\":2}}]}',3,'2014-12-22 04:54:30'),(9,8,'{\"idProyecto\":8,\"nombre\":\"Iniciativa moises bravo\",\"resumenEjecutivo\":\"Detalle iniciativa kcc Presidencia.\",\"idSolicitante\":25,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":null,\"fechaCreacion\":\"2014-12-22T12:39:44.000Z\",\"idEstadoProyecto\":2,\"idBp\":28,\"idEtapaProyecto\":1,\"fechaEstimadaComienzo\":null,\"duracionSemana\":null,\"idComplejidad\":null,\"costoOneOff\":null,\"costoOnGoing\":null,\"beneficios\":null,\"beneficioIntangible\":null,\"tipoProyecto\":null,\"fechaEstimadaCierre\":null,\"idSaludProyecto\":null,\"comentarioAvance\":null,\"avance\":null,\"empresa\":{\"idEmpresa\":1,\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":25,\"nombre\":\"Moises Bravo\",\"email\":\"moises.bravo@rapazz.cl\",\"fechaCreacion\":\"2014-11-27T16:02:34.000Z\",\"fechaActualizacion\":\"2014-11-27T16:02:34.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,30,40,50,60,70]\",\"estado\":null},\"jefeProyecto\":null,\"usuarioBp\":{\"usuarioId\":28,\"nombre\":\"CALLEJAS  BOSSI, JUAN PABLO\",\"email\":\"juanpablo.callejas@kcl.cl\",\"fechaCreacion\":\"2014-12-22T12:24:59.000Z\",\"fechaActualizacion\":\"2014-12-22T12:28:36.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,50,60]\",\"estado\":[1]},\"etapa\":{\"idEtapaProyecto\":1,\"nombre\":\"Iniciativa\"},\"estadoProyecto\":{\"idEstadoProyecto\":1,\"nombre\":\"Nueva\",\"idEtapaProyecto\":1}}',1,'2014-12-22 12:41:28'),(10,12,'{\"idProyecto\":12,\"nombre\":\"iniciativa 1\",\"resumenEjecutivo\":\"esosdsd\",\"idSolicitante\":23,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":22,\"fechaCreacion\":\"2015-05-27T04:38:59.000Z\",\"idEstadoProyecto\":2,\"idBp\":25,\"idEtapaProyecto\":1,\"fechaEstimadaComienzo\":null,\"duracionSemana\":null,\"idComplejidad\":null,\"costoOneOff\":null,\"costoOnGoing\":null,\"beneficios\":null,\"beneficioIntangible\":null,\"tipoProyecto\":null,\"fechaEstimadaCierre\":null,\"idSaludProyecto\":null,\"comentarioAvance\":null,\"avance\":null,\"empresa\":{\"idEmpresa\":1,\"rut\":\"76080246-8\",\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"jefeProyecto\":{\"usuarioId\":22,\"nombre\":\"Bravo Castillo, Moises Andres\",\"email\":\"moises.bravo@rapazz.cl\",\"fechaCreacion\":\"2014-11-01T03:32:18.000Z\",\"fechaActualizacion\":\"2014-11-01T04:07:41.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,60]\",\"estado\":[0],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-FUV9H2Tm-Xg/AAAAAAAAAAI/AAAAAAAAAAA/YizFrC0qZ-Q/photo.jpg\"},\"usuarioBp\":{\"usuarioId\":25,\"nombre\":\"MONTES  SEREY, RODRIGO JAVIER\",\"email\":\"rodrigo.montes@kcl.cl\",\"fechaCreacion\":\"2015-03-24T14:44:13.000Z\",\"fechaActualizacion\":\"2015-03-24T14:44:13.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,40]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-uMLdmwmCQII/AAAAAAAAAAI/AAAAAAAAB30/efiazBSa7H8/photo.jpg\"},\"etapa\":{\"idEtapaProyecto\":1,\"nombre\":\"Iniciativa\"},\"estadoProyecto\":{\"idEstadoProyecto\":2,\"nombre\":\"Iniciativa Aprobada\",\"idEtapaProyecto\":1}}',1,'2015-06-02 12:39:35'),(11,14,'{\"idProyecto\":14,\"nombre\":\"mi iniciativa numero 4\",\"resumenEjecutivo\":\"afdas lsfsd fmamamam\",\"idSolicitante\":23,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":22,\"fechaCreacion\":\"2015-05-27T04:57:13.000Z\",\"idEstadoProyecto\":2,\"idBp\":25,\"idEtapaProyecto\":1,\"fechaEstimadaComienzo\":null,\"duracionSemana\":null,\"idComplejidad\":null,\"costoOneOff\":null,\"costoOnGoing\":null,\"beneficios\":null,\"beneficioIntangible\":null,\"tipoProyecto\":null,\"fechaEstimadaCierre\":null,\"idSaludProyecto\":null,\"comentarioAvance\":null,\"avance\":null,\"empresa\":{\"idEmpresa\":1,\"rut\":\"76080246-8\",\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"jefeProyecto\":{\"usuarioId\":22,\"nombre\":\"Bravo Castillo, Moises Andres\",\"email\":\"moises.bravo@rapazz.cl\",\"fechaCreacion\":\"2014-11-01T03:32:18.000Z\",\"fechaActualizacion\":\"2014-11-01T04:07:41.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,60]\",\"estado\":[0],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-FUV9H2Tm-Xg/AAAAAAAAAAI/AAAAAAAAAAA/YizFrC0qZ-Q/photo.jpg\"},\"usuarioBp\":{\"usuarioId\":25,\"nombre\":\"MONTES  SEREY, RODRIGO JAVIER\",\"email\":\"rodrigo.montes@kcl.cl\",\"fechaCreacion\":\"2015-03-24T14:44:13.000Z\",\"fechaActualizacion\":\"2015-03-24T14:44:13.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,40]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-uMLdmwmCQII/AAAAAAAAAAI/AAAAAAAAB30/efiazBSa7H8/photo.jpg\"},\"etapa\":{\"idEtapaProyecto\":1,\"nombre\":\"Iniciativa\"},\"estadoProyecto\":{\"idEstadoProyecto\":2,\"nombre\":\"Iniciativa Aprobada\",\"idEtapaProyecto\":1}}',1,'2015-06-09 01:42:46'),(12,14,'{\"idProyecto\":14,\"nombre\":\"mi iniciativa numero 4\",\"resumenEjecutivo\":\"afdas lsfsd fmamamam\",\"idSolicitante\":23,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":22,\"fechaCreacion\":\"2015-05-27T04:57:13.000Z\",\"idEstadoProyecto\":5,\"idBp\":25,\"idEtapaProyecto\":2,\"fechaEstimadaComienzo\":\"2015-06-09T00:00:00.000Z\",\"duracionSemana\":4,\"idComplejidad\":2,\"costoOneOff\":100,\"costoOnGoing\":120,\"beneficios\":12,\"beneficioIntangible\":\"safdasfa\",\"tipoProyecto\":8,\"fechaEstimadaCierre\":null,\"idSaludProyecto\":null,\"comentarioAvance\":null,\"avance\":null,\"empresa\":{\"idEmpresa\":1,\"rut\":\"76080246-8\",\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"jefeProyecto\":{\"usuarioId\":22,\"nombre\":\"Bravo Castillo, Moises Andres\",\"email\":\"moises.bravo@rapazz.cl\",\"fechaCreacion\":\"2014-11-01T03:32:18.000Z\",\"fechaActualizacion\":\"2014-11-01T04:07:41.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,60]\",\"estado\":[0],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-FUV9H2Tm-Xg/AAAAAAAAAAI/AAAAAAAAAAA/YizFrC0qZ-Q/photo.jpg\"},\"usuarioBp\":{\"usuarioId\":25,\"nombre\":\"MONTES  SEREY, RODRIGO JAVIER\",\"email\":\"rodrigo.montes@kcl.cl\",\"fechaCreacion\":\"2015-03-24T14:44:13.000Z\",\"fechaActualizacion\":\"2015-03-24T14:44:13.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,40]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-uMLdmwmCQII/AAAAAAAAAAI/AAAAAAAAB30/efiazBSa7H8/photo.jpg\"},\"etapa\":{\"idEtapaProyecto\":2,\"nombre\":\"Pre Evaluacion\"},\"complejidad\":{\"id\":2,\"nombre\":\"Media\",\"tipoParametro\":1},\"adjunto\":[{\"idAdjunto\":11,\"idProyecto\":14,\"descripcion\":\"gwdpage_min.js\",\"fechaCreacion\":\"2015-06-10T01:52:21.000Z\",\"guid\":\"14\",\"urlArchivo\":\"e9d7c204d8320a2db82382ba49ee5e48.js\",\"idTipoAdjunto\":11,\"tipoAdjunto\":{\"id\":11,\"nombre\":\"Documento de Solicitud\",\"tipoParametro\":4}}],\"estadoProyecto\":{\"idEstadoProyecto\":5,\"nombre\":\"Pre Evaluacion enviada\",\"idEtapaProyecto\":2},\"equipoProyecto\":[{\"idEquipoProyecto\":19,\"email\":\"moises.bravo@kcl.cl\",\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"idRol\":5,\"fechaAutorizacion\":\"2015-06-10T03:33:31.000Z\",\"estadoAutorizacion\":2,\"idProyecto\":14,\"idEtapaProyecto\":2,\"uid\":\"aff37626-2ea2-4283-946e-097cf01ba61b\",\"hh\":null,\"cargo\":{\"id\":5,\"nombre\":\"Jefe Proyecto\",\"tipoParametro\":2}}]}',2,'2015-06-10 03:33:31'),(13,14,'{\"idProyecto\":14,\"nombre\":\"mi iniciativa numero 4\",\"resumenEjecutivo\":\"afdas lsfsd fmamamam\",\"idSolicitante\":23,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":22,\"fechaCreacion\":\"2015-05-27T04:57:13.000Z\",\"idEstadoProyecto\":5,\"idBp\":25,\"idEtapaProyecto\":2,\"fechaEstimadaComienzo\":\"2015-06-09T00:00:00.000Z\",\"duracionSemana\":4,\"idComplejidad\":2,\"costoOneOff\":100,\"costoOnGoing\":120,\"beneficios\":12,\"beneficioIntangible\":\"safdasfa\",\"tipoProyecto\":8,\"fechaEstimadaCierre\":\"2015-07-07T00:00:00.000Z\",\"idSaludProyecto\":null,\"comentarioAvance\":null,\"avance\":null,\"empresa\":{\"idEmpresa\":1,\"rut\":\"76080246-8\",\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"jefeProyecto\":{\"usuarioId\":22,\"nombre\":\"Bravo Castillo, Moises Andres\",\"email\":\"moises.bravo@rapazz.cl\",\"fechaCreacion\":\"2014-11-01T03:32:18.000Z\",\"fechaActualizacion\":\"2014-11-01T04:07:41.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,60]\",\"estado\":[0],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-FUV9H2Tm-Xg/AAAAAAAAAAI/AAAAAAAAAAA/YizFrC0qZ-Q/photo.jpg\"},\"usuarioBp\":{\"usuarioId\":25,\"nombre\":\"MONTES  SEREY, RODRIGO JAVIER\",\"email\":\"rodrigo.montes@kcl.cl\",\"fechaCreacion\":\"2015-03-24T14:44:13.000Z\",\"fechaActualizacion\":\"2015-03-24T14:44:13.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,40]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-uMLdmwmCQII/AAAAAAAAAAI/AAAAAAAAB30/efiazBSa7H8/photo.jpg\"},\"etapa\":{\"idEtapaProyecto\":2,\"nombre\":\"Pre Evaluacion\"},\"complejidad\":{\"id\":2,\"nombre\":\"Media\",\"tipoParametro\":1},\"adjunto\":[{\"idAdjunto\":11,\"idProyecto\":14,\"descripcion\":\"gwdpage_min.js\",\"fechaCreacion\":\"2015-06-10T01:52:21.000Z\",\"guid\":\"14\",\"urlArchivo\":\"e9d7c204d8320a2db82382ba49ee5e48.js\",\"idTipoAdjunto\":11,\"tipoAdjunto\":{\"id\":11,\"nombre\":\"Documento de Solicitud\",\"tipoParametro\":4}}],\"estadoProyecto\":{\"idEstadoProyecto\":5,\"nombre\":\"Pre Evaluacion enviada\",\"idEtapaProyecto\":2},\"equipoProyecto\":[{\"idEquipoProyecto\":20,\"email\":\"moises.bravo@kcl.cl\",\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"idRol\":5,\"fechaAutorizacion\":\"2015-06-10T03:40:05.000Z\",\"estadoAutorizacion\":1,\"idProyecto\":14,\"idEtapaProyecto\":2,\"uid\":\"b9557ac7-bd1d-4daa-ba56-248385254862\",\"hh\":null,\"cargo\":{\"id\":5,\"nombre\":\"Jefe Proyecto\",\"tipoParametro\":2}}]}',2,'2015-06-10 03:40:05'),(14,19,'{\"idProyecto\":19,\"nombre\":\"esta es una nueva iniciativa\",\"resumenEjecutivo\":\"el resumen ejecutivo de la pagina.\",\"idSolicitante\":23,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":22,\"fechaCreacion\":\"2015-06-10T04:20:36.000Z\",\"idEstadoProyecto\":2,\"idBp\":23,\"idEtapaProyecto\":1,\"fechaEstimadaComienzo\":null,\"duracionSemana\":null,\"idComplejidad\":null,\"costoOneOff\":null,\"costoOnGoing\":null,\"beneficios\":null,\"beneficioIntangible\":null,\"tipoProyecto\":null,\"fechaEstimadaCierre\":null,\"idSaludProyecto\":null,\"comentarioAvance\":null,\"avance\":null,\"empresa\":{\"idEmpresa\":1,\"rut\":\"76080246-8\",\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"jefeProyecto\":{\"usuarioId\":22,\"nombre\":\"Bravo Castillo, Moises Andres\",\"email\":\"moises.bravo@rapazz.cl\",\"fechaCreacion\":\"2014-11-01T03:32:18.000Z\",\"fechaActualizacion\":\"2014-11-01T04:07:41.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,60]\",\"estado\":[0],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-FUV9H2Tm-Xg/AAAAAAAAAAI/AAAAAAAAAAA/YizFrC0qZ-Q/photo.jpg\"},\"usuarioBp\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"etapa\":{\"idEtapaProyecto\":1,\"nombre\":\"Iniciativa\"},\"estadoProyecto\":{\"idEstadoProyecto\":2,\"nombre\":\"Iniciativa Aprobada\",\"idEtapaProyecto\":1}}',1,'2015-06-10 04:28:18'),(15,19,'{\"idProyecto\":19,\"nombre\":\"esta es una nueva iniciativa\",\"resumenEjecutivo\":\"el resumen ejecutivo de la pagina.\",\"idSolicitante\":23,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":22,\"fechaCreacion\":\"2015-06-10T04:20:36.000Z\",\"idEstadoProyecto\":5,\"idBp\":23,\"idEtapaProyecto\":2,\"fechaEstimadaComienzo\":\"2015-06-13T00:00:00.000Z\",\"duracionSemana\":8,\"idComplejidad\":1,\"costoOneOff\":1300,\"costoOnGoing\":2200,\"beneficios\":120,\"beneficioIntangible\":null,\"tipoProyecto\":8,\"fechaEstimadaCierre\":null,\"idSaludProyecto\":null,\"comentarioAvance\":null,\"avance\":null,\"empresa\":{\"idEmpresa\":1,\"rut\":\"76080246-8\",\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"jefeProyecto\":{\"usuarioId\":22,\"nombre\":\"Bravo Castillo, Moises Andres\",\"email\":\"moises.bravo@rapazz.cl\",\"fechaCreacion\":\"2014-11-01T03:32:18.000Z\",\"fechaActualizacion\":\"2014-11-01T04:07:41.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,60]\",\"estado\":[0],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-FUV9H2Tm-Xg/AAAAAAAAAAI/AAAAAAAAAAA/YizFrC0qZ-Q/photo.jpg\"},\"usuarioBp\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"etapa\":{\"idEtapaProyecto\":2,\"nombre\":\"Pre Evaluacion\"},\"complejidad\":{\"id\":1,\"nombre\":\"Baja\",\"tipoParametro\":1},\"adjunto\":[{\"idAdjunto\":12,\"idProyecto\":19,\"descripcion\":\"gwddoubleclick_min.js\",\"fechaCreacion\":\"2015-06-10T04:47:25.000Z\",\"guid\":\"19\",\"urlArchivo\":\"f49e136a33f47b8a1bd0549b72059a8a.js\",\"idTipoAdjunto\":13,\"tipoAdjunto\":{\"id\":13,\"nombre\":\"Gantt de Proyecto\",\"tipoParametro\":4}}],\"estadoProyecto\":{\"idEstadoProyecto\":5,\"nombre\":\"Pre Evaluacion enviada\",\"idEtapaProyecto\":2},\"equipoProyecto\":[{\"idEquipoProyecto\":21,\"email\":\"moises.bravo@kcl.cl\",\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"idRol\":6,\"fechaAutorizacion\":\"2015-06-10T04:48:18.000Z\",\"estadoAutorizacion\":1,\"idProyecto\":19,\"idEtapaProyecto\":2,\"uid\":\"853be964-1b07-45e9-9b43-97beefac0b80\",\"hh\":7,\"cargo\":{\"id\":6,\"nombre\":\"Auditor\",\"tipoParametro\":2}}]}',2,'2015-06-10 04:48:18'),(16,19,'{\"idProyecto\":19,\"nombre\":\"esta es una nueva iniciativa\",\"resumenEjecutivo\":\"el resumen ejecutivo de la pagina.\",\"idSolicitante\":23,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":22,\"fechaCreacion\":\"2015-06-10T04:20:36.000Z\",\"idEstadoProyecto\":6,\"idBp\":23,\"idEtapaProyecto\":2,\"fechaEstimadaComienzo\":\"2015-06-13T00:00:00.000Z\",\"duracionSemana\":8,\"idComplejidad\":1,\"costoOneOff\":1300,\"costoOnGoing\":2200,\"beneficios\":120,\"beneficioIntangible\":null,\"tipoProyecto\":8,\"fechaEstimadaCierre\":\"2015-08-08T00:00:00.000Z\",\"idSaludProyecto\":null,\"comentarioAvance\":null,\"avance\":null,\"empresa\":{\"idEmpresa\":1,\"rut\":\"76080246-8\",\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"jefeProyecto\":{\"usuarioId\":22,\"nombre\":\"Bravo Castillo, Moises Andres\",\"email\":\"moises.bravo@rapazz.cl\",\"fechaCreacion\":\"2014-11-01T03:32:18.000Z\",\"fechaActualizacion\":\"2014-11-01T04:07:41.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,60]\",\"estado\":[0],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-FUV9H2Tm-Xg/AAAAAAAAAAI/AAAAAAAAAAA/YizFrC0qZ-Q/photo.jpg\"},\"usuarioBp\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"etapa\":{\"idEtapaProyecto\":2,\"nombre\":\"Pre Evaluacion\"},\"estadoProyecto\":{\"idEstadoProyecto\":6,\"nombre\":\"Pre Evaluacion Aceptada\",\"idEtapaProyecto\":2}}',2,'2015-06-10 04:57:20'),(17,19,'{\"idProyecto\":19,\"nombre\":\"esta es una nueva iniciativa\",\"resumenEjecutivo\":\"el resumen ejecutivo de la pagina.\",\"idSolicitante\":23,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":22,\"fechaCreacion\":\"2015-06-10T04:20:36.000Z\",\"idEstadoProyecto\":9,\"idBp\":23,\"idEtapaProyecto\":3,\"fechaEstimadaComienzo\":\"2015-06-13T00:00:00.000Z\",\"duracionSemana\":8,\"idComplejidad\":1,\"costoOneOff\":1300,\"costoOnGoing\":2200,\"beneficios\":120,\"beneficioIntangible\":\"es muy importante\",\"tipoProyecto\":8,\"fechaEstimadaCierre\":\"2015-08-08T00:00:00.000Z\",\"idSaludProyecto\":null,\"comentarioAvance\":null,\"avance\":null,\"empresa\":{\"idEmpresa\":1,\"rut\":\"76080246-8\",\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"jefeProyecto\":{\"usuarioId\":22,\"nombre\":\"Bravo Castillo, Moises Andres\",\"email\":\"moises.bravo@rapazz.cl\",\"fechaCreacion\":\"2014-11-01T03:32:18.000Z\",\"fechaActualizacion\":\"2014-11-01T04:07:41.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,60]\",\"estado\":[0],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-FUV9H2Tm-Xg/AAAAAAAAAAI/AAAAAAAAAAA/YizFrC0qZ-Q/photo.jpg\"},\"usuarioBp\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"etapa\":{\"idEtapaProyecto\":3,\"nombre\":\"Evaluacion\"},\"complejidad\":{\"id\":1,\"nombre\":\"Baja\",\"tipoParametro\":1},\"adjunto\":[{\"idAdjunto\":12,\"idProyecto\":19,\"descripcion\":\"gwddoubleclick_min.js\",\"fechaCreacion\":\"2015-06-10T04:47:25.000Z\",\"guid\":\"19\",\"urlArchivo\":\"f49e136a33f47b8a1bd0549b72059a8a.js\",\"idTipoAdjunto\":13,\"tipoAdjunto\":{\"id\":13,\"nombre\":\"Gantt de Proyecto\",\"tipoParametro\":4}},{\"idAdjunto\":13,\"idProyecto\":19,\"descripcion\":\"4m02_historia.pdf\",\"fechaCreacion\":\"2015-06-11T00:57:12.000Z\",\"guid\":\"19\",\"urlArchivo\":\"1b16701357f9f97fb5df91943f81dde0.pdf\",\"idTipoAdjunto\":14,\"tipoAdjunto\":{\"id\":14,\"nombre\":\"Orden de Compra\",\"tipoParametro\":4}}],\"estadoProyecto\":{\"idEstadoProyecto\":9,\"nombre\":\"Evaluacion Enviada\",\"idEtapaProyecto\":3},\"equipoProyecto\":[{\"idEquipoProyecto\":26,\"email\":\"moises.bravo@kcl.cl\",\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"idRol\":6,\"fechaAutorizacion\":\"2015-06-11T01:22:57.000Z\",\"estadoAutorizacion\":1,\"idProyecto\":19,\"idEtapaProyecto\":3,\"uid\":\"a65e7268-6ca3-4c6f-b03c-8cb9459c5744\",\"hh\":7,\"cargo\":{\"id\":6,\"nombre\":\"Auditor\",\"tipoParametro\":2}}]}',3,'2015-06-11 01:22:57'),(18,12,'{\"idProyecto\":12,\"nombre\":\"Proyecto de Implementación de telemetria\",\"resumenEjecutivo\":\"esosdsd\",\"idSolicitante\":23,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":22,\"fechaCreacion\":\"2015-05-27T04:38:59.000Z\",\"idEstadoProyecto\":5,\"idBp\":25,\"idEtapaProyecto\":2,\"fechaEstimadaComienzo\":\"2015-06-05T00:00:00.000Z\",\"duracionSemana\":4,\"idComplejidad\":2,\"costoOneOff\":20,\"costoOnGoing\":3345,\"beneficios\":4,\"beneficioIntangible\":\"45  gfghfh\",\"tipoProyecto\":10,\"fechaEstimadaCierre\":null,\"idSaludProyecto\":null,\"comentarioAvance\":null,\"avance\":null,\"empresa\":{\"idEmpresa\":1,\"rut\":\"76080246-8\",\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"jefeProyecto\":{\"usuarioId\":22,\"nombre\":\"Bravo Castillo, Moises Andres\",\"email\":\"moises.bravo@rapazz.cl\",\"fechaCreacion\":\"2014-11-01T03:32:18.000Z\",\"fechaActualizacion\":\"2014-11-01T04:07:41.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,60]\",\"estado\":[0],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-FUV9H2Tm-Xg/AAAAAAAAAAI/AAAAAAAAAAA/YizFrC0qZ-Q/photo.jpg\"},\"usuarioBp\":{\"usuarioId\":25,\"nombre\":\"MONTES  SEREY, RODRIGO JAVIER\",\"email\":\"rodrigo.montes@kcl.cl\",\"fechaCreacion\":\"2015-03-24T14:44:13.000Z\",\"fechaActualizacion\":\"2015-03-24T14:44:13.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,40]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-uMLdmwmCQII/AAAAAAAAAAI/AAAAAAAAB30/efiazBSa7H8/photo.jpg\"},\"etapa\":{\"idEtapaProyecto\":2,\"nombre\":\"Pre Evaluacion\"},\"complejidad\":{\"id\":2,\"nombre\":\"Media\",\"tipoParametro\":1},\"adjunto\":[{\"idAdjunto\":1,\"idProyecto\":12,\"descripcion\":null,\"fechaCreacion\":\"2015-06-04T03:23:56.000Z\",\"guid\":\"12\",\"urlArchivo\":\"archivos/bb318cd37e20c54c97eea4279aba1b04.md\",\"idTipoAdjunto\":12,\"tipoAdjunto\":{\"id\":12,\"nombre\":\"Documento de Inicio\",\"tipoParametro\":4}},{\"idAdjunto\":2,\"idProyecto\":12,\"descripcion\":null,\"fechaCreacion\":\"2015-06-04T04:50:08.000Z\",\"guid\":\"12\",\"urlArchivo\":\"archivos/284b8d25bfecaf1e502bcca560416cb5.md\",\"idTipoAdjunto\":13,\"tipoAdjunto\":{\"id\":13,\"nombre\":\"Gantt de Proyecto\",\"tipoParametro\":4}},{\"idAdjunto\":3,\"idProyecto\":12,\"descripcion\":null,\"fechaCreacion\":\"2015-06-04T04:53:43.000Z\",\"guid\":\"12\",\"urlArchivo\":\"65afa85dcb4a774c4763752e87571002.md\",\"idTipoAdjunto\":11,\"tipoAdjunto\":{\"id\":11,\"nombre\":\"Documento de Solicitud\",\"tipoParametro\":4}},{\"idAdjunto\":4,\"idProyecto\":12,\"descripcion\":null,\"fechaCreacion\":\"2015-06-04T22:13:16.000Z\",\"guid\":\"12\",\"urlArchivo\":\"8fe63494ec013ae50705aa889e4b76af.md\",\"idTipoAdjunto\":12,\"tipoAdjunto\":{\"id\":12,\"nombre\":\"Documento de Inicio\",\"tipoParametro\":4}},{\"idAdjunto\":5,\"idProyecto\":12,\"descripcion\":null,\"fechaCreacion\":\"2015-06-04T22:18:12.000Z\",\"guid\":\"12\",\"urlArchivo\":\"0699980b937a5d16410b9169a620359f.phar\",\"idTipoAdjunto\":14,\"tipoAdjunto\":{\"id\":14,\"nombre\":\"Orden de Compra\",\"tipoParametro\":4}},{\"idAdjunto\":6,\"idProyecto\":12,\"descripcion\":\"bower.json\",\"fechaCreacion\":\"2015-06-04T22:24:35.000Z\",\"guid\":\"12\",\"urlArchivo\":\"235803938d322c2da762bb3e7692593f.json\",\"idTipoAdjunto\":14,\"tipoAdjunto\":{\"id\":14,\"nombre\":\"Orden de Compra\",\"tipoParametro\":4}},{\"idAdjunto\":7,\"idProyecto\":12,\"descripcion\":\"Postnatal Carolina Garcia.pdf\",\"fechaCreacion\":\"2015-06-04T22:35:25.000Z\",\"guid\":\"12\",\"urlArchivo\":\"65c1f94aa6b6c6f3f848f52f00122480.pdf\",\"idTipoAdjunto\":13,\"tipoAdjunto\":{\"id\":13,\"nombre\":\"Gantt de Proyecto\",\"tipoParametro\":4}},{\"idAdjunto\":8,\"idProyecto\":12,\"descripcion\":\"documentos - Documentos de Google.pdf\",\"fechaCreacion\":\"2015-06-04T22:36:06.000Z\",\"guid\":\"12\",\"urlArchivo\":\"488fa72824f7897b020bdfed15fcc8cf.pdf\",\"idTipoAdjunto\":14,\"tipoAdjunto\":{\"id\":14,\"nombre\":\"Orden de Compra\",\"tipoParametro\":4}},{\"idAdjunto\":9,\"idProyecto\":12,\"descripcion\":\"gwdpage_min.js\",\"fechaCreacion\":\"2015-06-04T22:37:24.000Z\",\"guid\":\"12\",\"urlArchivo\":\"dbd78c9451f3f0d6e2e5a163c54737ca.js\",\"idTipoAdjunto\":13,\"tipoAdjunto\":{\"id\":13,\"nombre\":\"Gantt de Proyecto\",\"tipoParametro\":4}},{\"idAdjunto\":10,\"idProyecto\":12,\"descripcion\":\"gwdpagedeck_min.js\",\"fechaCreacion\":\"2015-06-04T22:39:26.000Z\",\"guid\":\"12\",\"urlArchivo\":\"37b6f67a56e61d7992d00e6ccb755629.js\",\"idTipoAdjunto\":12,\"tipoAdjunto\":{\"id\":12,\"nombre\":\"Documento de Inicio\",\"tipoParametro\":4}}],\"estadoProyecto\":{\"idEstadoProyecto\":5,\"nombre\":\"Pre Evaluacion enviada\",\"idEtapaProyecto\":2},\"equipoProyecto\":[{\"idEquipoProyecto\":27,\"email\":\"moises.bravo@kcl.cl\",\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"idRol\":4,\"fechaAutorizacion\":\"2015-06-11T04:15:22.000Z\",\"estadoAutorizacion\":1,\"idProyecto\":12,\"idEtapaProyecto\":2,\"uid\":\"fe37106c-dd53-4254-bb15-012767f084f0\",\"hh\":1,\"cargo\":{\"id\":4,\"nombre\":\"Key User\",\"tipoParametro\":2}}]}',2,'2015-06-11 04:15:22'),(19,12,'{\"idProyecto\":12,\"nombre\":\"Proyecto de Implementación de telemetria\",\"resumenEjecutivo\":\"esosdsd\",\"idSolicitante\":23,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":22,\"fechaCreacion\":\"2015-05-27T04:38:59.000Z\",\"idEstadoProyecto\":6,\"idBp\":25,\"idEtapaProyecto\":2,\"fechaEstimadaComienzo\":\"2015-06-05T00:00:00.000Z\",\"duracionSemana\":4,\"idComplejidad\":2,\"costoOneOff\":20,\"costoOnGoing\":3345,\"beneficios\":4,\"beneficioIntangible\":\"45  gfghfh\",\"tipoProyecto\":10,\"fechaEstimadaCierre\":\"2015-07-03T00:00:00.000Z\",\"idSaludProyecto\":null,\"comentarioAvance\":null,\"avance\":null,\"empresa\":{\"idEmpresa\":1,\"rut\":\"76080246-8\",\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"jefeProyecto\":{\"usuarioId\":22,\"nombre\":\"Bravo Castillo, Moises Andres\",\"email\":\"moises.bravo@rapazz.cl\",\"fechaCreacion\":\"2014-11-01T03:32:18.000Z\",\"fechaActualizacion\":\"2014-11-01T04:07:41.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,60]\",\"estado\":[0],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-FUV9H2Tm-Xg/AAAAAAAAAAI/AAAAAAAAAAA/YizFrC0qZ-Q/photo.jpg\"},\"usuarioBp\":{\"usuarioId\":25,\"nombre\":\"MONTES  SEREY, RODRIGO JAVIER\",\"email\":\"rodrigo.montes@kcl.cl\",\"fechaCreacion\":\"2015-03-24T14:44:13.000Z\",\"fechaActualizacion\":\"2015-03-24T14:44:13.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,40]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-uMLdmwmCQII/AAAAAAAAAAI/AAAAAAAAB30/efiazBSa7H8/photo.jpg\"},\"etapa\":{\"idEtapaProyecto\":2,\"nombre\":\"Pre Evaluacion\"},\"estadoProyecto\":{\"idEstadoProyecto\":6,\"nombre\":\"Pre Evaluacion Aceptada\",\"idEtapaProyecto\":2}}',2,'2015-06-11 04:15:42'),(20,19,'{\"idProyecto\":19,\"nombre\":\"esta es una nueva iniciativa\",\"resumenEjecutivo\":\"el resumen ejecutivo de la pagina.\",\"idSolicitante\":23,\"idEmpresa\":1,\"idDepartamento\":5,\"idJefeProyecto\":22,\"fechaCreacion\":\"2015-06-10T04:20:36.000Z\",\"idEstadoProyecto\":12,\"idBp\":23,\"idEtapaProyecto\":3,\"fechaEstimadaComienzo\":\"2015-06-13T00:00:00.000Z\",\"duracionSemana\":8,\"idComplejidad\":1,\"costoOneOff\":1300,\"costoOnGoing\":2200,\"beneficios\":120,\"beneficioIntangible\":\"es muy importante\",\"tipoProyecto\":8,\"fechaEstimadaCierre\":\"2015-08-08T00:00:00.000Z\",\"idSaludProyecto\":null,\"comentarioAvance\":null,\"avance\":null,\"fechaUltimoInforme\":null,\"empresa\":{\"idEmpresa\":1,\"rut\":\"76080246-8\",\"nombre\":\"KOMATSU HOLDING SOUTH AMERICA LTDA.\"},\"departamento\":{\"idDepartamento\":5,\"idEmpresa\":1,\"nombre\":\"KCC Presidencia\"},\"usuario\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"jefeProyecto\":{\"usuarioId\":22,\"nombre\":\"Bravo Castillo, Moises Andres\",\"email\":\"moises.bravo@rapazz.cl\",\"fechaCreacion\":\"2014-11-01T03:32:18.000Z\",\"fechaActualizacion\":\"2014-11-01T04:07:41.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[10,20,60]\",\"estado\":[0],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-FUV9H2Tm-Xg/AAAAAAAAAAI/AAAAAAAAAAA/YizFrC0qZ-Q/photo.jpg\"},\"usuarioBp\":{\"usuarioId\":23,\"nombre\":\"BRAVO  CASTILLO, MOISES ANDRES\",\"email\":\"moises.bravo@kcl.cl\",\"fechaCreacion\":\"2015-03-18T01:56:49.000Z\",\"fechaActualizacion\":\"2015-05-27T02:42:57.000Z\",\"fechaUltimoLogin\":null,\"rolesMenu\":\"[20,30,40,50]\",\"estado\":[1],\"idEmpresa\":null,\"foto\":\"https://lh3.googleusercontent.com/-Gq3QmrdKAhc/AAAAAAAAAAI/AAAAAAAACss/jVgmu6eqpYE/photo.jpg\"},\"etapa\":{\"idEtapaProyecto\":3,\"nombre\":\"Evaluacion\"},\"estadoProyecto\":{\"idEstadoProyecto\":12,\"nombre\":\"Evaluacion Aprobada\",\"idEtapaProyecto\":3}}',3,'2015-06-11 07:25:02');
/*!40000 ALTER TABLE `versiones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-11 13:44:30
