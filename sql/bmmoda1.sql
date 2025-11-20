CREATE DATABASE  IF NOT EXISTS `bmmoda1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bmmoda1`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bmmoda1
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'polo'),(2,'Blusa'),(3,'Pantalón'),(4,'Vestido'),(5,'Camisa'),(6,'Falda'),(7,'Chompa'),(8,'Short'),(9,'Chaleco'),(10,'Abrigo'),(11,'Bufanda'),(12,'Gorro'),(13,'Zapatillas'),(14,'Sandalias'),(15,'Chaqueta'),(16,'Traje'),(17,'Leggings'),(18,'Pijama'),(19,'Interior'),(20,'Guantes'),(21,'Cazadora'),(22,'Buzo'),(23,'Terno');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle_venta` int NOT NULL AUTO_INCREMENT,
  `id_ventas` int DEFAULT NULL,
  `id_ropa` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `idventas_idx` (`id_ventas`),
  KEY `idropa_idx` (`id_ropa`),
  CONSTRAINT `idropa` FOREIGN KEY (`id_ropa`) REFERENCES `ropa` (`id_ropa`),
  CONSTRAINT `idventas` FOREIGN KEY (`id_ventas`) REFERENCES `ventas` (`id_ventas`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,30,2,2,90.00,180.00),(2,30,3,1,95.00,95.00),(3,30,6,1,70.00,70.00),(4,38,3,1,95.00,95.00),(5,38,2,1,90.00,90.00),(6,39,3,1,95.00,95.00),(7,40,6,1,70.00,70.00),(8,40,4,1,110.00,110.00),(9,40,11,1,160.00,160.00),(10,41,30,1,120.00,120.00),(11,41,19,1,70.00,70.00),(12,41,20,4,55.00,220.00),(13,42,2,2,90.00,180.00),(14,43,3,1,95.00,95.00),(15,43,2,1,90.00,90.00),(16,43,1,1,55.00,55.00),(17,44,3,1,95.00,95.00),(18,44,2,1,90.00,90.00),(19,45,9,1,55.00,55.00),(20,45,5,1,85.00,85.00),(21,46,1,1,55.00,55.00),(22,46,3,1,95.00,95.00),(23,46,2,1,90.00,90.00),(24,47,1,1,55.00,55.00),(25,47,9,1,55.00,55.00),(26,48,2,1,90.00,90.00),(27,48,3,2,95.00,190.00),(28,48,1,1,55.00,55.00),(29,53,7,1,75.00,75.00),(30,53,8,1,130.00,130.00),(31,53,9,1,55.00,55.00),(32,54,10,5,65.00,325.00),(33,54,14,1,60.00,60.00),(34,55,3,2,95.00,190.00),(35,55,2,2,90.00,180.00),(36,55,1,2,55.00,110.00),(37,56,30,1,120.00,120.00),(38,56,26,1,120.00,120.00),(39,56,25,1,70.00,70.00),(40,57,28,1,330.00,330.00),(41,57,26,1,120.00,120.00),(42,57,27,1,160.00,160.00),(43,58,19,1,70.00,70.00),(44,58,21,1,85.00,85.00),(45,58,25,1,70.00,70.00),(46,59,29,1,65.00,65.00),(47,59,26,1,120.00,120.00),(48,60,20,2,55.00,110.00),(49,61,28,1,330.00,330.00),(50,61,26,1,120.00,120.00),(51,61,27,1,160.00,160.00),(52,61,25,1,70.00,70.00),(53,62,21,1,85.00,85.00),(54,62,20,1,55.00,55.00),(55,62,19,1,70.00,70.00),(56,63,26,1,120.00,120.00),(57,64,19,1,70.00,70.00),(58,65,24,2,190.00,380.00),(59,66,30,1,120.00,120.00),(60,67,17,1,125.00,125.00),(61,67,18,1,270.00,270.00),(62,67,14,1,60.00,60.00),(63,67,15,1,180.00,180.00),(64,68,13,1,55.00,55.00),(65,68,16,1,55.00,55.00),(66,68,14,1,60.00,60.00),(67,68,15,1,180.00,180.00),(68,69,1,1,55.00,55.00),(69,69,9,1,55.00,55.00),(70,69,10,1,65.00,65.00),(71,69,15,1,180.00,180.00),(72,70,8,1,130.00,130.00),(73,70,12,1,200.00,200.00),(74,71,3,1,95.00,95.00),(75,72,2,1,90.00,90.00),(76,73,1,1,55.00,55.00),(77,74,9,1,55.00,55.00),(78,74,8,1,130.00,130.00),(79,75,16,1,55.00,55.00),(80,75,18,1,270.00,270.00),(81,75,14,1,60.00,60.00),(82,76,7,1,75.00,75.00),(83,76,9,1,55.00,55.00),(84,76,14,1,60.00,60.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Escvdo'),(2,'Ayni'),(3,'Anntarah');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `rol` int DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `enlace` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,0,'Inicio','Principal.php'),(2,0,'Nosotros','Nosotros.php'),(3,0,'Todo','todo.php'),(4,0,'Ofertas del dia','ofertas.php'),(5,0,'servicio al cliente','servicio_cliente.php'),(6,0,'Contactanos','Contactanos.php'),(7,0,'Iniciar Sesion','IniciarSesion.php'),(8,1,'Inicio','Principal.php'),(9,1,'Nosotros','Nosotros.php'),(10,1,'Todo','Todo.php'),(11,1,'Ofertar del dia','ofertas.php'),(12,1,'Listas','listas.php'),(13,1,'Tarjetas de regalo','targetas.php'),(14,1,'Servicio al cliente','servicio_cliente.php'),(15,1,'Contactanos','Contactanos.php'),(16,1,'Carrito','?modal=carrito'),(17,1,'Perfil','perfil.php'),(18,1,'Cerrar Sesion','cerrarSesion.php'),(19,2,'Inicio','Principal.php'),(20,2,'Nosotros','Nosotros.php'),(21,2,'ContactenosMSG','Contactanos.php'),(22,2,'Pedidos por confirmar','pedidos.php'),(23,2,'solicitudes de devolucion','solicitudes_devolucion.php'),(24,2,'Comentarios y sugerencias','comentarios.php'),(25,2,'Enviar correo','Correo.php'),(26,2,'Perfil','perfil.php'),(27,2,'Cerrar Sesion','cerrarSesion.php'),(28,3,'Inicio','Principal.php'),(29,3,'informe y analisis','informe.php'),(30,3,'Configuraciones del Sistema','configuracion.php'),(31,3,'Soporte tecnico','soporte_tecnico.php'),(32,3,'Politicas y procedimientos','politicas.php'),(33,3,'Gestion de contenido','Gestion_contenido.php'),(34,3,'Ver inventario','inventario.php'),(35,3,'Ver Usuario','usuario.php'),(36,3,'Ver Ventas','venta.php'),(37,3,'Enviar correo','Correo.php'),(38,3,'Perfil','Perfil.php'),(39,3,'Cerrar Sesion','cerrarSesion.php');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ropa`
--

DROP TABLE IF EXISTS `ropa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ropa` (
  `id_ropa` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  `cuidado` varchar(200) DEFAULT NULL,
  `materiales` varchar(200) DEFAULT NULL,
  `precio_compra` decimal(10,2) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_marca` int DEFAULT NULL,
  `id_talla` int DEFAULT NULL,
  `img_ruta` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_ropa`),
  KEY `idcategoria_idx` (`id_categoria`),
  KEY `idmarca_idx` (`id_marca`),
  KEY `idtalla_idx` (`id_talla`),
  CONSTRAINT `idcategoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `idmarca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  CONSTRAINT `idtalla` FOREIGN KEY (`id_talla`) REFERENCES `talla` (`id_talla`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ropa`
--

LOCK TABLES `ropa` WRITE;
/*!40000 ALTER TABLE `ropa` DISABLE KEYS */;
INSERT INTO `ropa` VALUES (1,'Camiseta Sport','Azul','Camiseta Sport de color azul ideal para realizar deportes o ir al gimnacio.','Lavado a máquina','Poliéster',40.00,55.00,8,1,1,2,'imgProducto/camisetaSport.jpg'),(2,'Blusa Elegante','Blanco','Blusa elegante de color blanco, ideal para ocasiones formales o semi-formales. Diseñada con líneas modernas y un ajuste cómodo, perfecta para combinar con cualquier estilo.','Lavado a mano','Algodón',65.00,90.00,12,2,3,4,'imgProducto/bluzaElegante.jpg'),(3,'Pantalón Casual','Negro','Pantalón casual de color negro, diseñado para ofrecer comodidad y versatilidad. Ideal para un look relajado o para combinar con prendas formales, adaptándose a diversas ocasiones','Lavado a máquina','Mezclilla',70.00,95.00,27,3,2,2,'imgProducto/pantalonCasual.jpg'),(4,'Vestido Floral','Rosa','Vestido con estampado floral en tonos rosa, diseñado para brindar frescura y estilo. Perfecto para eventos casuales o salidas al aire libre, combinando comodidad y elegancia.','Lavado a mano','Seda',80.00,110.00,24,4,3,4,'imgProducto/vestidoFloral.jpg'),(5,'Camisa Formal','Celeste','Camisa formal de color celeste, confeccionada con un diseño clásico y elegante. Ideal para ocasiones profesionales o eventos formales, aportando un toque de sofisticación y frescura.','Lavado en seco','Algodón',60.00,85.00,13,5,2,1,'imgProducto/camisetaFormal.jpg'),(6,'Jeans Clásicos','Azul Marino','Jeans clásicos en color azul marino, diseñados con un estilo atemporal y un ajuste cómodo. Perfectos para un look casual o semi-formal, ideales para el uso diario.','Lavado a máquina','Denim',50.00,70.00,19,3,3,3,'imgProducto/jeansClasico.jpg'),(7,'Falda Plisada','Verde','Falda plisada en color verde, con un diseño elegante y fluido. Ideal para ocasiones especiales o looks casuales con un toque sofisticado','Lavado a máquina','Poliéster',55.00,75.00,21,6,3,2,'imgProducto/faldaPlisada.jpg'),(8,'Chompa de Lana','Beige','Chompa de lana en color beige, suave y abrigadora, perfecta para climas fríos. Su diseño versátil combina fácilmente con estilos casuales o relajados','Lavado a mano','Lana',100.00,130.00,14,7,2,3,'imgProducto/chompaLana.jpg'),(9,'Polo Básico','Negro','Polo básico de color negro, confeccionado con materiales suaves y cómodos. Una prenda versátil y esencial para combinar con cualquier estilo casual.','Lavado a máquina','Algodón',40.00,55.00,18,1,1,4,'imgProducto/poloBasico.jpg'),(10,'Short Deportivo','Gris','Short deportivo en color gris, diseñado con materiales ligeros y transpirables. Perfecto para actividades físicas o días de descanso, ofreciendo comodidad y libertad de movimiento.\"','Lavado a máquina','Poliéster',45.00,65.00,30,8,3,3,'imgProducto/shortDeportivo.jpg'),(11,'Chaleco Moderno','Marrón','Chaleco moderno en color marrón, con un diseño elegante y versátil. Ideal para agregar un toque de estilo a un conjunto casual o semi-formal, combinando confort y sofisticación.','Lavado en seco','Cuero',120.00,160.00,12,9,3,2,'imgProducto/chalecoModerno.jpg'),(12,'Abrigo Largo','Negro','Abrigo largo en color negro, elegante y sofisticado. Perfecto para mantenerte abrigado en días fríos sin sacrificar estilo, ideal para ocasiones formales o eventos especiales.','Lavado en seco','Lana',150.00,200.00,4,10,2,3,'imgProducto/abrigoLargo.jpg'),(13,'Bufanda Casual','Rojo','Bufanda casual en color rojo, suave y cálida. Ideal para darle un toque de color y confort a tus atuendos diarios, perfecta para el clima frío con un estilo relajado','Lavado a mano','Lana',40.00,55.00,2,11,2,4,'imgProducto/bufandaCasual.jpg'),(14,'Gorro Tejido','Beige','Gorro tejido en color beige, suave y cálido, perfecto para mantener la cabeza abrigada durante los días fríos. Su diseño sencillo y versátil combina con cualquier atuendo casual','Lavado a mano','Lana',45.00,60.00,26,12,3,1,'imgProducto/gorroTejido.jpg'),(15,'Zapatillas Urbanas','Blanco','Zapatillas urbanas de color blanco, diseñadas para un estilo moderno y cómodo. Perfectas para el día a día, combinando con una variedad de looks casuales y urbanos','Limpiar con paño','Cuero',130.00,180.00,9,13,2,4,'imgProducto/zapatillaUrbana.jpg'),(16,'Sandalias Playa','Amarillo','Sandalias de playa en color amarillo, ligeras y cómodas, ideales para disfrutar del sol y la arena. Su diseño fresco y colorido agrega un toque vibrante a tu atuendo veraniego','Limpiar con paño','Goma',40.00,55.00,18,14,3,2,'imgProducto/sandaliaPlaya.jpg'),(17,'Chaqueta Casual','Azul Marino','Chaqueta casual en color azul marino, con un diseño moderno y cómodo. Perfecta para un look relajado y elegante, ideal para el día a día o para salir con estilo','Lavado a máquina','Poliéster',95.00,125.00,10,15,1,4,'imgProducto/chaquetaCasual.jpg'),(18,'Traje Formal','Gris','Traje formal en color gris, confeccionado con un corte elegante y sofisticado. Ideal para ocasiones especiales, reuniones de negocios o eventos formales, ofreciendo un estilo pulido y profesional','Lavado en seco','Lana',200.00,270.00,24,16,3,3,'imgProducto/trajeFormal.jpg'),(19,'Leggings Deportivas','Negro','Leggings deportivas en color negro, diseñados para ofrecer comodidad y soporte durante el ejercicio. Con un ajuste perfecto y materiales transpirables, ideales para entrenamientos y actividades deportivas.','Lavado a máquina','Poliéster',50.00,70.00,12,17,3,1,'imgProducto/legginsDeportivos.jpg'),(20,'Camiseta Básica','Blanco','Camiseta básica en color blanco, confeccionada con un tejido suave y cómodo. Perfecta para un look casual, fácil de combinar con cualquier prenda y adecuada para el día a día.','Lavado a máquina','Algodón',40.00,55.00,11,1,2,4,'imgProducto/camisetaBasica.jpg'),(21,'Pijama Cómoda','Rosa','Pijama cómoda en color rosa, suave y ligera, diseñada para ofrecer confort durante la noche. Ideal para descansar con estilo, brindando una sensación de bienestar y relajación.','Lavado a máquina','Algodón',65.00,85.00,27,18,2,3,'imgProducto/pijamaComoda.jpg'),(22,'Ropa Interior','Blanco','Ropa interior de color blanco, confeccionada con materiales suaves y cómodos. Ideal para el uso diario, proporcionando una sensación de frescura y confort','Lavado a mano','Algodón',50.00,70.00,30,19,1,1,'imgProducto/ropaInterior.jpg'),(23,'Guantes Invierno','Gris','Guantes de invierno en color gris, confeccionados con materiales cálidos y suaves. Perfectos para mantener las manos abrigadas durante los días fríos, combinando estilo y funcionalidad.','Lavado a mano','Lana',40.00,55.00,14,20,1,3,'imgProducto/guanteInvierno.jpg'),(24,'Cazadora Moderna','Verde','Cazadora moderna en color verde, con un diseño contemporáneo y ajustado. Ideal para combinar con looks casuales o semi-formales, ofreciendo estilo y comodidad en cualquier ocasión.','Lavado en seco','Cuero',140.00,190.00,9,21,2,4,'imgProducto/casadoraModerna.jpg'),(25,'Chalina Decorativa','Azul','Chalina decorativa en color azul, ligera y elegante. Perfecta para añadir un toque de color y sofisticación a tu atuendo, ideal para complementar tanto looks casuales como formales.','Lavado a mano','Seda',50.00,70.00,1,11,3,2,'imgProducto/chalinaDecorativa.jpg'),(26,'Buzo Completo','Negro','Buzo completo en color negro, diseñado para brindar comodidad y estilo. Ideal para actividades deportivas o momentos de descanso, con un ajuste cómodo y práctico para el día a día','Lavado a máquina','Poliéster',90.00,120.00,2,22,1,1,'imgProducto/buzoCompleto.jpg'),(27,'Vestido Elegante','Rojo','Vestido elegante en color rojo, con un diseño sofisticado y femenino. Perfecto para ocasiones especiales, combinando estilo y elegancia para un look deslumbrante','Lavado a mano','Seda',120.00,160.00,11,4,2,3,'imgProducto/vestidoElegante.jpg'),(28,'Terno Ejecutivo','Negro','Terno ejecutivo en color negro, diseñado con un corte clásico y elegante. Ideal para ocasiones formales o reuniones de negocios, ofreciendo un estilo profesional y sofisticado.','Lavado en seco','Lana',250.00,330.00,21,23,1,4,'imgProducto/ternoEjecutivo.jpg'),(29,'Polo Casual','Amarillo','Polo casual en color amarillo, confeccionado con materiales suaves y ligeros. Perfecto para un look relajado y fresco, ideal para días informales o actividades al aire libre','Lavado a máquina','Algodón',45.00,65.00,26,1,3,3,'imgProducto/poloCasual.jpg'),(30,'Zapatillas Running','Negro','Zapatillas running en color negro, diseñadas para ofrecer comodidad y soporte durante tus entrenamientos. Con un diseño ligero y transpirante, ideales para correr o actividades deportivas.','Limpiar con paño','Poliéster',90.00,120.00,15,13,2,1,'imgProducto/zapatillasRunning.jpg');
/*!40000 ALTER TABLE `ropa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talla`
--

DROP TABLE IF EXISTS `talla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talla` (
  `id_talla` int NOT NULL,
  `talla` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_talla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talla`
--

LOCK TABLES `talla` WRITE;
/*!40000 ALTER TABLE `talla` DISABLE KEYS */;
INSERT INTO `talla` VALUES (1,'S'),(2,'M'),(3,'L'),(4,'XL');
/*!40000 ALTER TABLE `talla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `contraseña` varchar(150) DEFAULT NULL,
  `rol` int DEFAULT NULL,
  `estado` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'sibenito','sibenito','sibenito@gmail.com',123456789,'asdfasdfasdfasfasd','2020-02-21','hombre','$2y$10$WdlRrC/I2IRpaBk3Jc4i0OmX.bLMbJdM.kW/pikUHe3wp9FSL7Dr2',3,1),(3,'juan','sibenitos','marulolpbe@gmail.com',123456789,'aaaaaaaaaaaaaaaaaaaa','2020-02-12','hombre','$2y$10$uWDXRrMDsqJoTZCZxLMw.OkWnjNC3HwQ0W/w9G4I4ZsK.GTLaUY9a',1,1),(4,'pablo','sibenitoso','0621enblanco@gmail.com',123456789,'eeeeeeeeeeeeee','2020-12-21','hombre','$2y$10$tEDdWRoe1pCgTRdCiLrvE.0g61y83UDHVfl01KfhopaPrap2quqyO',1,1),(5,'marcos','sibenitosos','sibenito4@gmail.com',123456789,'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii','2020-04-23','hombre','$2y$10$N.YpM.zzW6LJ7iTiRNBHfOP6qbMT77LRoBvW8wtlg8VAhuowzpbZ2',1,1),(6,'asdfasdfasdf','asdfasdf','marulolpbe@gmail.com',123456789,'asdfasdfasdfasfasd','2024-02-21','hombre','$2y$10$N4a2jmviDspLO8qIazpf2ucUExXCPedJqAlKRbodEKaWgIAa6lwoK',1,1),(7,'sibenito','sibenito','sibenito0@gmail.com',123456789,'asdfasdfasdfasfasd','2025-04-17','mujer','$2y$10$bvDvHSL2MNFS2f02tO9AJeDxkM.HtOEF2eqPXbLTRHyHG.Kw64qbW',NULL,NULL),(8,'sibenito','sibenito','sibenito00@gmail.com',123456789,'asdfasdfasdfasfasd','2025-04-10','mujer','$2y$10$UJ4lQWOCm7VpECQ9IxndjOEnGv6.PPRMuaVU9vqyYMXkMphptvMQS',1,1),(9,'enrique','calos','enrique@gmail.com',123456789,'asdfasdfasdfasfasddfasf','2025-04-18','hombre','$2y$10$9WNZSiCvtrygoTyxCGiaBeDyUBDEiDKDO1tYxg.AkQWginZLnXy8K',1,1),(10,'rene','rene','rene@gmail.com',123456789,'asdfasdfasdfasfasd','2025-04-12','hombre','$2y$10$8aBZ6WVPeSUHIvcgptlcz.5uhaxM0eD5c.YnJLlk5jPb0YJp0BmaO',1,1),(11,'mario','mario','mario@gmail.com',123456789,'asdfasdfasdfasfasd','2025-04-18','hombre','$2y$10$BafTkwNbdy0USSDeH1yaIOnVs85Ue8kFv5kWogTW91gaS8XGdehIW',1,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_ventas` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_ventas`),
  KEY `idusuario_idx` (`id_usuario`),
  CONSTRAINT `idusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (30,1,'2024-12-01',345.00),(38,1,'2024-01-01',185.00),(39,1,'2024-02-03',95.00),(40,3,'2024-03-02',340.00),(41,3,'2024-04-02',410.00),(42,3,'2024-05-03',180.00),(43,3,'2024-06-03',240.00),(44,3,'2024-07-03',185.00),(45,3,'2024-08-03',140.00),(46,3,'2024-09-03',240.00),(47,3,'2024-10-03',110.00),(48,3,'2024-11-03',335.00),(53,3,'2024-12-04',260.00),(54,3,'2024-12-05',385.00),(55,3,'2024-12-03',480.00),(56,3,'2024-12-05',310.00),(57,3,'2024-12-05',610.00),(58,3,'2024-12-05',225.00),(59,3,'2024-12-03',185.00),(60,3,'2024-12-05',110.00),(61,3,'2024-12-05',680.00),(62,3,'2024-12-05',210.00),(63,3,'2024-12-05',120.00),(64,3,'2024-12-05',70.00),(65,3,'2024-12-05',380.00),(66,3,'2024-12-05',120.00),(67,3,'2024-12-05',635.00),(68,3,'2024-12-05',350.00),(69,3,'2024-12-05',355.00),(70,3,'2024-12-05',330.00),(71,3,'2024-12-05',95.00),(72,3,'2024-12-05',90.00),(73,3,'2024-12-05',55.00),(74,3,'2024-12-05',185.00),(75,3,'2024-12-05',385.00),(76,3,'2024-12-05',190.00);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-20 11:41:42
