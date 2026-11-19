-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: supermercado_betel
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `alicuotas_iva`
--

DROP TABLE IF EXISTS `alicuotas_iva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alicuotas_iva` (
  `id_alicuota_iva` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) NOT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  `codigo_arca` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id_alicuota_iva`),
  UNIQUE KEY `uq_alicuotas_porcentaje` (`porcentaje`),
  UNIQUE KEY `uq_alicuotas_codigo` (`codigo_arca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alicuotas_iva`
--

LOCK TABLES `alicuotas_iva` WRITE;
/*!40000 ALTER TABLE `alicuotas_iva` DISABLE KEYS */;
INSERT INTO `alicuotas_iva` VALUES (1,'IVA 21%',21.00,5),(2,'IVA 10,5%',10.50,4),(3,'IVA 27%',27.00,6),(4,'IVA 0%',0.00,3);
/*!40000 ALTER TABLE `alicuotas_iva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajas` (
  `id_caja` int NOT NULL AUTO_INCREMENT,
  `id_sucursal` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Activa',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_caja`),
  KEY `id_sucursal` (`id_sucursal`),
  CONSTRAINT `cajas_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
INSERT INTO `cajas` VALUES (1,1,'Caja 2','Activa','2026-11-18 23:41:46','2026-11-18 23:41:46'),(2,1,'Caja 1','Activa','2026-11-18 23:41:46','2026-11-18 23:41:46'),(3,2,'Caja 2','Activa','2026-11-18 23:41:46','2026-11-18 23:41:46'),(4,2,'Caja 1','Activa','2026-11-18 23:41:46','2026-11-18 23:41:46'),(5,3,'Caja 2','Activa','2026-11-18 23:41:46','2026-11-18 23:41:46'),(6,3,'Caja 1','Activa','2026-11-18 23:41:46','2026-11-18 23:41:46'),(7,4,'Caja 2','Activa','2026-11-18 23:41:46','2026-11-18 23:41:46'),(8,4,'Caja 1','Activa','2026-11-18 23:41:46','2026-11-18 23:41:46'),(9,5,'Caja 2','Activa','2026-11-18 23:41:46','2026-11-18 23:41:46'),(10,5,'Caja 1','Activa','2026-11-18 23:41:46','2026-11-18 23:41:46');
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(80) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(15) NOT NULL DEFAULT 'Activo',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cargo`),
  UNIQUE KEY `uq_cargos_nombre` (`nombre_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'Administrador de base de datos','Administra el motor y la base de datos','Activo','2026-11-18 23:16:09','2026-11-18 23:16:09',NULL,'2026-11-18 23:41:47','2026-11-18 23:41:47'),(2,'Gerente general','Direccion general de la cadena','Activo','2026-11-18 23:16:09','2026-11-18 23:16:09',NULL,'2026-11-18 23:41:47','2026-11-18 23:41:47'),(3,'Responsable de sucursal','Encargado de la gestion de una sucursal','Activo','2026-11-18 23:16:09','2026-11-18 23:16:09',NULL,'2026-11-18 23:41:47','2026-11-18 23:41:47'),(4,'Encargado de deposito','Control de ingresos, egresos y stock del deposito','Activo','2026-11-18 23:16:09','2026-11-18 23:16:09',NULL,'2026-11-18 23:41:47','2026-11-18 23:41:47'),(5,'Cajero','Registro de ventas y cobros en caja','Activo','2026-11-18 23:16:09','2026-11-18 23:16:09',NULL,'2026-11-18 23:41:47','2026-11-18 23:41:47'),(6,'Repositor','Reposicion de mercaderia en gondola','Activo','2026-11-18 23:16:09','2026-11-18 23:16:09',NULL,'2026-11-18 23:41:47','2026-11-18 23:41:47'),(7,'Responsable de compras','Gestion de proveedores y ordenes de compra','Activo','2026-11-18 23:16:09','2026-11-18 23:16:09',NULL,'2026-11-18 23:41:47','2026-11-18 23:41:47'),(8,'Responsable de precios y promociones','Alta y control de precios y ofertas','Activo','2026-11-18 23:16:09','2026-11-18 23:16:09',NULL,'2026-11-18 23:41:47','2026-11-18 23:41:47'),(9,'Auditor','Control y auditoria de operaciones','Activo','2026-11-18 23:16:09','2026-11-18 23:16:09',NULL,'2026-11-18 23:41:47','2026-11-18 23:41:47'),(10,'Usuario de consulta','Acceso de solo lectura a reportes','Activo','2026-11-18 23:16:09','2026-11-18 23:16:09',NULL,'2026-11-18 23:41:47','2026-11-18 23:41:47');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Almacén','Productos secos y envasados','2026-11-18 23:41:46','2026-11-18 23:41:46'),(2,'Bebidas','Gaseosas, aguas, jugos y alcohol','2026-11-18 23:41:46','2026-11-18 23:41:46'),(3,'Limpieza','Productos de limpieza del hogar','2026-11-18 23:41:46','2026-11-18 23:41:46'),(4,'Higiene personal','Cuidado e higiene personal','2026-11-18 23:41:46','2026-11-18 23:41:46'),(5,'Lácteos','Leche, quesos, yogures y derivados','2026-11-18 23:41:46','2026-11-18 23:41:46'),(6,'Carnicería','Carnes frescas y embutidos','2026-11-18 23:41:46','2026-11-18 23:41:46'),(7,'Frutas y verduras','Productos frescos','2026-11-18 23:41:46','2026-11-18 23:41:46'),(8,'Congelados','Productos congelados','2026-11-18 23:41:46','2026-11-18 23:41:46'),(9,'Panificados','Pan, facturas y productos de panadería','2026-11-18 23:41:46','2026-11-18 23:41:46');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `cuit` varchar(13) DEFAULT NULL,
  `razon_social` varchar(150) DEFAULT NULL,
  `id_condicion_iva` int DEFAULT NULL,
  `domicilio_fiscal` varchar(150) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `uq_clientes_cuit` (`cuit`),
  KEY `idx_clientes_condicion_iva` (`id_condicion_iva`),
  CONSTRAINT `fk_clientes_condicion_iva` FOREIGN KEY (`id_condicion_iva`) REFERENCES `condiciones_iva` (`id_condicion_iva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `numero_compra` varchar(30) NOT NULL,
  `id_proveedor` int NOT NULL,
  `id_deposito` int NOT NULL,
  `fecha_emision` date NOT NULL,
  `estado` varchar(30) NOT NULL DEFAULT 'Pendiente',
  `id_usuario` int unsigned NOT NULL,
  PRIMARY KEY (`id_compra`),
  UNIQUE KEY `numero_compra` (`numero_compra`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_deposito` (`id_deposito`),
  KEY `fk_compras_usuarios` (`id_usuario`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_deposito`) REFERENCES `depositos` (`id_deposito`),
  CONSTRAINT `fk_compras_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condiciones_iva`
--

DROP TABLE IF EXISTS `condiciones_iva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condiciones_iva` (
  `id_condicion_iva` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `codigo_arca` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id_condicion_iva`),
  UNIQUE KEY `uq_condiciones_iva_nombre` (`nombre`),
  UNIQUE KEY `uq_condiciones_iva_codigo` (`codigo_arca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condiciones_iva`
--

LOCK TABLES `condiciones_iva` WRITE;
/*!40000 ALTER TABLE `condiciones_iva` DISABLE KEYS */;
INSERT INTO `condiciones_iva` VALUES (1,'IVA Responsable Inscripto',1),(2,'IVA Sujeto Exento',4),(3,'Consumidor Final',5),(4,'Responsable Monotributo',6);
/*!40000 ALTER TABLE `condiciones_iva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositos`
--

DROP TABLE IF EXISTS `depositos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depositos` (
  `id_deposito` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_sucursal` int NOT NULL,
  `estado` varchar(15) NOT NULL DEFAULT 'Activo',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_deposito`),
  KEY `id_sucursal` (`id_sucursal`),
  CONSTRAINT `depositos_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositos`
--

LOCK TABLES `depositos` WRITE;
/*!40000 ALTER TABLE `depositos` DISABLE KEYS */;
INSERT INTO `depositos` VALUES (1,'Depósito San Pedro Centro','Depósito principal',1,'Activo','2026-11-18 23:41:46','2026-11-18 23:41:46'),(2,'Depósito San Pedro Norte','Depósito principal',2,'Activo','2026-11-18 23:41:46','2026-11-18 23:41:46'),(3,'Depósito Monterrico Centro','Depósito principal',3,'Activo','2026-11-18 23:41:46','2026-11-18 23:41:46'),(4,'Depósito Monterrico Ruta','Depósito principal',4,'Activo','2026-11-18 23:41:46','2026-11-18 23:41:46'),(5,'Depósito San Salvador','Depósito principal',5,'Activo','2026-11-18 23:41:46','2026-11-18 23:41:46');
/*!40000 ALTER TABLE `depositos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compras`
--

DROP TABLE IF EXISTS `detalle_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compras` (
  `id_detalle_compra` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_solicitada` decimal(12,3) NOT NULL,
  `costo_unitario` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `id_compra` (`id_compra`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`),
  CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compras`
--

LOCK TABLES `detalle_compras` WRITE;
/*!40000 ALTER TABLE `detalle_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_devoluciones`
--

DROP TABLE IF EXISTS `detalle_devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_devoluciones` (
  `id_detalle_devolucion` int NOT NULL AUTO_INCREMENT,
  `id_devolucion` int NOT NULL,
  `id_detalle_venta` int NOT NULL,
  `cantidad_devuelta` decimal(12,3) NOT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_devolucion`),
  KEY `id_devolucion` (`id_devolucion`),
  KEY `id_detalle_venta` (`id_detalle_venta`),
  CONSTRAINT `detalle_devoluciones_ibfk_1` FOREIGN KEY (`id_devolucion`) REFERENCES `devoluciones` (`id_devolucion`),
  CONSTRAINT `detalle_devoluciones_ibfk_2` FOREIGN KEY (`id_detalle_venta`) REFERENCES `detalle_ventas` (`id_detalle_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_devoluciones`
--

LOCK TABLES `detalle_devoluciones` WRITE;
/*!40000 ALTER TABLE `detalle_devoluciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_devoluciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_facturas`
--

DROP TABLE IF EXISTS `detalle_facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_facturas` (
  `id_detalle_factura` int NOT NULL AUTO_INCREMENT,
  `id_factura` int NOT NULL,
  `id_detalle_venta` int NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `cantidad` decimal(12,3) NOT NULL,
  `precio_unitario_neto` decimal(12,2) NOT NULL,
  `id_alicuota_iva` int NOT NULL,
  `porcentaje_iva` decimal(5,2) NOT NULL,
  `importe_neto` decimal(12,2) NOT NULL,
  `importe_iva` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_detalle_factura`),
  UNIQUE KEY `uq_detalle_facturas_dv` (`id_detalle_venta`),
  KEY `idx_detalle_facturas_factura` (`id_factura`),
  KEY `idx_detalle_facturas_alicuota` (`id_alicuota_iva`),
  CONSTRAINT `fk_detfac_alicuota` FOREIGN KEY (`id_alicuota_iva`) REFERENCES `alicuotas_iva` (`id_alicuota_iva`),
  CONSTRAINT `fk_detfac_detventa` FOREIGN KEY (`id_detalle_venta`) REFERENCES `detalle_ventas` (`id_detalle_venta`),
  CONSTRAINT `fk_detfac_factura` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_facturas`
--

LOCK TABLES `detalle_facturas` WRITE;
/*!40000 ALTER TABLE `detalle_facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_promociones`
--

DROP TABLE IF EXISTS `detalle_promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_promociones` (
  `id_detalle_promocion` int NOT NULL AUTO_INCREMENT,
  `id_promocion` int NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id_detalle_promocion`),
  UNIQUE KEY `id_promocion` (`id_promocion`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_promociones_ibfk_1` FOREIGN KEY (`id_promocion`) REFERENCES `promociones` (`id_promocion`),
  CONSTRAINT `detalle_promociones_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_promociones`
--

LOCK TABLES `detalle_promociones` WRITE;
/*!40000 ALTER TABLE `detalle_promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_recepciones`
--

DROP TABLE IF EXISTS `detalle_recepciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_recepciones` (
  `id_detalle_recepcion` int NOT NULL AUTO_INCREMENT,
  `id_recepcion` int NOT NULL,
  `id_detalle_compra` int NOT NULL,
  `cantidad_recibida` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id_detalle_recepcion`),
  KEY `id_recepcion` (`id_recepcion`),
  KEY `id_detalle_compra` (`id_detalle_compra`),
  CONSTRAINT `detalle_recepciones_ibfk_1` FOREIGN KEY (`id_recepcion`) REFERENCES `recepciones` (`id_recepcion`),
  CONSTRAINT `detalle_recepciones_ibfk_2` FOREIGN KEY (`id_detalle_compra`) REFERENCES `detalle_compras` (`id_detalle_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_recepciones`
--

LOCK TABLES `detalle_recepciones` WRITE;
/*!40000 ALTER TABLE `detalle_recepciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_recepciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_transferencias`
--

DROP TABLE IF EXISTS `detalle_transferencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_transferencias` (
  `id_detalle_transferencia` int NOT NULL AUTO_INCREMENT,
  `id_transferencia` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id_detalle_transferencia`),
  KEY `id_transferencia` (`id_transferencia`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_transferencias_ibfk_1` FOREIGN KEY (`id_transferencia`) REFERENCES `transferencias` (`id_transferencia`),
  CONSTRAINT `detalle_transferencias_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_transferencias`
--

LOCK TABLES `detalle_transferencias` WRITE;
/*!40000 ALTER TABLE `detalle_transferencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_transferencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventas` (
  `id_detalle_venta` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` decimal(12,3) NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `descuento` decimal(12,2) NOT NULL DEFAULT '0.00',
  `subtotal` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devoluciones`
--

DROP TABLE IF EXISTS `devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devoluciones` (
  `id_devolucion` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_usuario` int unsigned NOT NULL,
  `fecha_devolucion` datetime NOT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Registrada',
  PRIMARY KEY (`id_devolucion`),
  KEY `id_venta` (`id_venta`),
  KEY `fk_devoluciones_usuarios` (`id_usuario`),
  CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  CONSTRAINT `fk_devoluciones_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoluciones`
--

LOCK TABLES `devoluciones` WRITE;
/*!40000 ALTER TABLE `devoluciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `devoluciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id_empresa` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(150) NOT NULL,
  `nombre_comercial` varchar(100) NOT NULL,
  `cuit` varchar(13) NOT NULL,
  `estado` varchar(15) NOT NULL DEFAULT 'Activa',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE KEY `uq_empresas_cuit` (`cuit`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Supermercado Betel S.A.','BETEL','30-71234567-8','Activa','2026-11-18 22:45:11','2026-11-18 22:45:11',NULL);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_tipo_comprobante` int NOT NULL,
  `id_punto_venta` int NOT NULL,
  `numero` int unsigned NOT NULL,
  `fecha_emision` datetime NOT NULL,
  `id_cliente` int NOT NULL,
  `cuit_receptor` varchar(13) NOT NULL,
  `razon_social_receptor` varchar(150) NOT NULL,
  `domicilio_receptor` varchar(150) DEFAULT NULL,
  `id_condicion_iva_receptor` int NOT NULL,
  `importe_neto` decimal(12,2) NOT NULL DEFAULT '0.00',
  `importe_iva` decimal(12,2) NOT NULL DEFAULT '0.00',
  `importe_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `cae` char(14) DEFAULT NULL,
  `cae_vencimiento` date DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Pendiente CAE',
  `id_usuario` int unsigned NOT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `uq_facturas_venta` (`id_venta`),
  UNIQUE KEY `uq_facturas_numeracion` (`id_tipo_comprobante`,`id_punto_venta`,`numero`),
  KEY `idx_facturas_cliente` (`id_cliente`),
  KEY `idx_facturas_condicion` (`id_condicion_iva_receptor`),
  KEY `idx_facturas_usuario` (`id_usuario`),
  KEY `idx_facturas_fecha` (`fecha_emision`),
  KEY `fk_facturas_pv` (`id_punto_venta`),
  CONSTRAINT `fk_facturas_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_facturas_condicion` FOREIGN KEY (`id_condicion_iva_receptor`) REFERENCES `condiciones_iva` (`id_condicion_iva`),
  CONSTRAINT `fk_facturas_pv` FOREIGN KEY (`id_punto_venta`) REFERENCES `puntos_venta` (`id_punto_venta`),
  CONSTRAINT `fk_facturas_tipo` FOREIGN KEY (`id_tipo_comprobante`) REFERENCES `tipos_comprobante` (`id_tipo_comprobante`),
  CONSTRAINT `fk_facturas_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_facturas_venta` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  CONSTRAINT `chk_facturas_total` CHECK ((`importe_total` = (`importe_neto` + `importe_iva`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_cargos`
--

DROP TABLE IF EXISTS `historial_cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_cargos` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int unsigned NOT NULL,
  `id_cargo_anterior` int DEFAULT NULL,
  `id_cargo_nuevo` int NOT NULL,
  `fecha_cambio` date NOT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `id_usuario_autoriza` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_historial`),
  KEY `idx_hc_usuario` (`id_usuario`),
  KEY `idx_hc_cargo_ant` (`id_cargo_anterior`),
  KEY `idx_hc_cargo_nue` (`id_cargo_nuevo`),
  KEY `idx_hc_autoriza` (`id_usuario_autoriza`),
  CONSTRAINT `fk_hc_autoriza` FOREIGN KEY (`id_usuario_autoriza`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_hc_cargo_ant` FOREIGN KEY (`id_cargo_anterior`) REFERENCES `cargos` (`id_cargo`),
  CONSTRAINT `fk_hc_cargo_nue` FOREIGN KEY (`id_cargo_nuevo`) REFERENCES `cargos` (`id_cargo`),
  CONSTRAINT `fk_hc_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_cargos`
--

LOCK TABLES `historial_cargos` WRITE;
/*!40000 ALTER TABLE `historial_cargos` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `id_localidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `id_provincia` int NOT NULL,
  PRIMARY KEY (`id_localidad`),
  UNIQUE KEY `nombre` (`nombre`,`id_provincia`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (2,'Monterrico',10),(1,'San Pedro de Jujuy',10),(3,'San Salvador de Jujuy',10);
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotes`
--

DROP TABLE IF EXISTS `lotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lotes` (
  `id_lote` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_deposito` int NOT NULL,
  `numero_lote` varchar(50) NOT NULL,
  `fecha_elaboracion` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `cantidad_actual` decimal(12,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id_lote`),
  UNIQUE KEY `id_producto` (`id_producto`,`id_deposito`,`numero_lote`),
  KEY `id_deposito` (`id_deposito`),
  CONSTRAINT `lotes_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `lotes_ibfk_2` FOREIGN KEY (`id_deposito`) REFERENCES `depositos` (`id_deposito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes`
--

LOCK TABLES `lotes` WRITE;
/*!40000 ALTER TABLE `lotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_marca`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Arcor','2026-11-18 23:41:46','2026-11-18 23:41:46'),(2,'La Serenísima','2026-11-18 23:41:46','2026-11-18 23:41:46'),(3,'Coca-Cola','2026-11-18 23:41:46','2026-11-18 23:41:46'),(4,'Cocinero','2026-11-18 23:41:46','2026-11-18 23:41:46'),(5,'Natura','2026-11-18 23:41:46','2026-11-18 23:41:46'),(6,'Ala','2026-11-18 23:41:46','2026-11-18 23:41:46'),(7,'Colgate','2026-11-18 23:41:46','2026-11-18 23:41:46'),(8,'Quilmes','2026-11-18 23:41:46','2026-11-18 23:41:46'),(9,'Marca propia Betel','2026-11-18 23:41:46','2026-11-18 23:41:46'),(10,'Sedal','2026-11-18 23:41:46','2026-11-18 23:41:46'),(11,'Pantene','2026-11-18 23:41:46','2026-11-18 23:41:46'),(12,'Head & Shoulders','2026-11-18 23:41:46','2026-11-18 23:41:46'),(13,'Elvive','2026-11-18 23:41:46','2026-11-18 23:41:46'),(14,'Plusbelle','2026-11-18 23:41:46','2026-11-18 23:41:46'),(15,'Dove','2026-11-18 23:41:46','2026-11-18 23:41:46'),(16,'Rexona','2026-11-18 23:41:46','2026-11-18 23:41:46'),(17,'Lux','2026-11-18 23:41:46','2026-11-18 23:41:46'),(18,'Protex','2026-11-18 23:41:46','2026-11-18 23:41:46'),(19,'Skip','2026-11-18 23:41:46','2026-11-18 23:41:46'),(20,'Ariel','2026-11-18 23:41:46','2026-11-18 23:41:46'),(21,'Drive','2026-11-18 23:41:46','2026-11-18 23:41:46'),(22,'Cif','2026-11-18 23:41:46','2026-11-18 23:41:46'),(23,'Elite','2026-11-18 23:41:46','2026-11-18 23:41:46'),(24,'Sussex','2026-11-18 23:41:46','2026-11-18 23:41:46'),(25,'Higienol','2026-11-18 23:41:46','2026-11-18 23:41:46'),(26,'Campanita','2026-11-18 23:41:46','2026-11-18 23:41:46'),(27,'Don Satur','2026-11-18 23:41:46','2026-11-18 23:41:46'),(28,'Formis','2026-11-18 23:41:46','2026-11-18 23:41:46'),(29,'Terrabusi','2026-11-18 23:41:46','2026-11-18 23:41:46'),(30,'Bagley','2026-11-18 23:41:46','2026-11-18 23:41:46'),(31,'Oreo','2026-11-18 23:41:46','2026-11-18 23:41:46'),(32,'Criollitas','2026-11-18 23:41:46','2026-11-18 23:41:46'),(33,'Granix','2026-11-18 23:41:46','2026-11-18 23:41:46'),(34,'Chocolinas','2026-11-18 23:41:46','2026-11-18 23:41:46'),(35,'Pepitos','2026-11-18 23:41:46','2026-11-18 23:41:46'),(36,'Traviata','2026-11-18 23:41:46','2026-11-18 23:41:46'),(37,'Lincoln','2026-11-18 23:41:46','2026-11-18 23:41:46'),(38,'Sprite','2026-11-18 23:41:46','2026-11-18 23:41:46'),(39,'Fanta','2026-11-18 23:41:46','2026-11-18 23:41:46'),(40,'Schweppes','2026-11-18 23:41:46','2026-11-18 23:41:46'),(41,'Aquarius','2026-11-18 23:41:46','2026-11-18 23:41:46'),(42,'Pepsi','2026-11-18 23:41:46','2026-11-18 23:41:46'),(43,'7UP','2026-11-18 23:41:46','2026-11-18 23:41:46'),(44,'Mirinda','2026-11-18 23:41:46','2026-11-18 23:41:46'),(45,'Marinaro','2026-11-18 23:41:46','2026-11-18 23:41:46'),(46,'Baggio','2026-11-18 23:41:46','2026-11-18 23:41:46');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medios_pago`
--

DROP TABLE IF EXISTS `medios_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medios_pago` (
  `id_medio_pago` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `estado` varchar(15) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id_medio_pago`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios_pago`
--

LOCK TABLES `medios_pago` WRITE;
/*!40000 ALTER TABLE `medios_pago` DISABLE KEYS */;
INSERT INTO `medios_pago` VALUES (1,'Efectivo','Pago en efectivo','Activo'),(2,'Tarjeta de débito','Pago con tarjeta de débito','Activo'),(3,'Tarjeta de crédito','Pago con tarjeta de crédito','Activo'),(4,'Transferencia','Transferencia bancaria','Activo'),(5,'Billetera virtual','Pago con QR o billetera virtual','Activo');
/*!40000 ALTER TABLE `medios_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_stock`
--

DROP TABLE IF EXISTS `movimientos_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_stock` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_deposito` int NOT NULL,
  `id_lote` int DEFAULT NULL,
  `id_usuario` int unsigned NOT NULL,
  `tipo_movimiento` varchar(30) NOT NULL,
  `cantidad` decimal(12,3) NOT NULL,
  `fecha_movimiento` datetime NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_producto` (`id_producto`),
  KEY `id_deposito` (`id_deposito`),
  KEY `id_lote` (`id_lote`),
  KEY `fk_movimientos_usuarios` (`id_usuario`),
  CONSTRAINT `fk_movimientos_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `movimientos_stock_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `movimientos_stock_ibfk_2` FOREIGN KEY (`id_deposito`) REFERENCES `depositos` (`id_deposito`),
  CONSTRAINT `movimientos_stock_ibfk_3` FOREIGN KEY (`id_lote`) REFERENCES `lotes` (`id_lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_stock`
--

LOCK TABLES `movimientos_stock` WRITE;
/*!40000 ALTER TABLE `movimientos_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_medio_pago` int NOT NULL,
  `importe` decimal(12,2) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_venta` (`id_venta`),
  KEY `id_medio_pago` (`id_medio_pago`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_medio_pago`) REFERENCES `medios_pago` (`id_medio_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `id_permiso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'ventas.registrar','Registrar ventas en la sucursal'),(2,'ventas.anular','Anular ventas confirmadas'),(3,'facturas.emitir','Emitir facturas'),(4,'cajas.operar','Abrir y operar cajas'),(5,'stock.consultar','Consultar stock por sucursal'),(6,'stock.ajustar','Realizar ajustes de inventario'),(7,'inventario.fisico','Realizar inventarios físicos'),(8,'productos.gestionar','Alta y modificación de productos'),(9,'precios.modificar','Modificar precios habituales y por sucursal'),(10,'promociones.gestionar','Crear y administrar promociones'),(11,'compras.registrar','Registrar órdenes de compra'),(12,'compras.recepcionar','Registrar recepciones de mercadería'),(13,'proveedores.gestionar','Administrar proveedores'),(14,'transferencias.solicitar','Solicitar transferencias entre sucursales'),(15,'transferencias.aprobar','Aprobar transferencias entre sucursales'),(16,'devoluciones.registrar','Registrar devoluciones'),(17,'usuarios.administrar','Administrar usuarios'),(18,'roles.administrar','Administrar roles y permisos'),(19,'reportes.ver','Consultar reportes e indicadores'),(20,'auditoria.ver','Consultar registros de auditoría'),(21,'backup.ejecutar','Ejecutar respaldos y recuperación');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precios_globales`
--

DROP TABLE IF EXISTS `precios_globales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precios_globales` (
  `id_precio_global` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date DEFAULT NULL,
  PRIMARY KEY (`id_precio_global`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `precios_globales_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios_globales`
--

LOCK TABLES `precios_globales` WRITE;
/*!40000 ALTER TABLE `precios_globales` DISABLE KEYS */;
/*!40000 ALTER TABLE `precios_globales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precios_sucursal`
--

DROP TABLE IF EXISTS `precios_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precios_sucursal` (
  `id_precio_sucursal` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_sucursal` int NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date DEFAULT NULL,
  PRIMARY KEY (`id_precio_sucursal`),
  KEY `id_producto` (`id_producto`),
  KEY `id_sucursal` (`id_sucursal`),
  CONSTRAINT `precios_sucursal_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `precios_sucursal_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios_sucursal`
--

LOCK TABLES `precios_sucursal` WRITE;
/*!40000 ALTER TABLE `precios_sucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `precios_sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `codigo_interno` varchar(30) NOT NULL,
  `codigo_barras` varchar(50) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_categoria` int NOT NULL,
  `id_marca` int NOT NULL,
  `id_unidad` int NOT NULL,
  `presentacion` varchar(100) DEFAULT NULL,
  `estado` varchar(15) NOT NULL DEFAULT 'Activo',
  `id_alicuota_iva` int NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_interno` (`codigo_interno`),
  UNIQUE KEY `codigo_barras` (`codigo_barras`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_marca` (`id_marca`),
  KEY `id_unidad` (`id_unidad`),
  KEY `idx_productos_alicuota` (`id_alicuota_iva`),
  CONSTRAINT `fk_productos_alicuota` FOREIGN KEY (`id_alicuota_iva`) REFERENCES `alicuotas_iva` (`id_alicuota_iva`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
  CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`id_unidad`) REFERENCES `unidades_medida` (`id_unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_proveedores`
--

DROP TABLE IF EXISTS `productos_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_proveedores` (
  `id_producto_proveedor` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `codigo_producto_proveedor` varchar(50) DEFAULT NULL,
  `costo_actual` decimal(12,2) NOT NULL,
  `tiempo_entrega` int DEFAULT NULL,
  PRIMARY KEY (`id_producto_proveedor`),
  UNIQUE KEY `id_producto` (`id_producto`,`id_proveedor`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `productos_proveedores_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `productos_proveedores_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_proveedores`
--

LOCK TABLES `productos_proveedores` WRITE;
/*!40000 ALTER TABLE `productos_proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id_promocion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `tipo_descuento` varchar(20) NOT NULL,
  `valor_descuento` decimal(12,2) NOT NULL,
  `limite_unidades` int DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Activa',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_promocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(150) NOT NULL,
  `cuit` varchar(13) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `estado` varchar(15) NOT NULL DEFAULT 'Activo',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `cuit` (`cuit`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Distribuidora Los Andes S.R.L.','30-71234501-9','388-4221100','ventas@distlosandes.com.ar','Av. Hipólito Yrigoyen 1250, San Salvador de Jujuy','Activo','2026-11-18 23:46:13','2026-11-18 23:46:13'),(2,'Mayorista del Norte S.A.','30-70987603-8','388-4235544','compras@mayoristanorte.com.ar','Ruta Nacional 9 km 1632, Palpalá, Jujuy','Activo','2026-11-18 23:46:13','2026-11-18 23:46:13'),(3,'Bebidas del NOA S.A.','30-71345603-5','387-4310021','pedidos@bebidasnoa.com.ar','Av. Bolivia 4500, Salta','Activo','2026-11-18 23:46:13','2026-11-18 23:46:13'),(4,'Lácteos del Valle S.A.','30-70456704-5','388-4260033','comercial@lacteosvalle.com.ar','Parque Industrial Alto Comedero, San Salvador de Jujuy','Activo','2026-11-18 23:46:13','2026-11-18 23:46:13'),(5,'Frigorífico Jujuy S.R.L.','30-71567805-1','388-4228877','ventas@frigorificojujuy.com.ar','Ruta Provincial 56 km 4, Perico, Jujuy','Activo','2026-11-18 23:46:13','2026-11-18 23:46:13'),(6,'Verduras del Ramal S.R.L.','30-71678907-8','388-4219900','info@verdurasramal.com.ar','Mercado de Concentración, Palpalá, Jujuy','Activo','2026-11-18 23:46:13','2026-11-18 23:46:13'),(7,'Panificadora La Espiga S.R.L.','30-70789007-6','3888-422210','pedidos@laespiga.com.ar','calle Sarmiento 310, San Pedro de Jujuy','Activo','2026-11-18 23:46:13','2026-11-18 23:46:13'),(8,'Perfumería y Tocador del Norte S.A.','30-71890108-8','381-4300455','ventas@tocadornorte.com.ar','Av. Belgrano 2100, San Miguel de Tucumán','Activo','2026-11-18 23:46:13','2026-11-18 23:46:13');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `id_provincia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_provincia`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Catamarca'),(3,'Chaco'),(4,'Chubut'),(5,'Ciudad Autónoma de Buenos Aires'),(6,'Córdoba'),(7,'Corrientes'),(8,'Entre Ríos'),(9,'Formosa'),(10,'Jujuy'),(11,'La Pampa'),(12,'La Rioja'),(13,'Mendoza'),(14,'Misiones'),(15,'Neuquén'),(16,'Río Negro'),(17,'Salta'),(18,'San Juan'),(19,'San Luis'),(20,'Santa Cruz'),(21,'Santa Fe'),(22,'Santiago del Estero'),(23,'Tierra del Fuego'),(24,'Tucumán');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntos_venta`
--

DROP TABLE IF EXISTS `puntos_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntos_venta` (
  `id_punto_venta` int NOT NULL AUTO_INCREMENT,
  `id_sucursal` int NOT NULL,
  `numero` smallint unsigned NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(15) NOT NULL DEFAULT 'Activo',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_punto_venta`),
  UNIQUE KEY `uq_puntos_venta_numero` (`numero`),
  KEY `idx_puntos_venta_sucursal` (`id_sucursal`),
  CONSTRAINT `fk_puntos_venta_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntos_venta`
--

LOCK TABLES `puntos_venta` WRITE;
/*!40000 ALTER TABLE `puntos_venta` DISABLE KEYS */;
INSERT INTO `puntos_venta` VALUES (6,1,1,'Supermercado Betel San Pedro Centro','Activo','2026-11-18 23:41:46','2026-11-18 23:41:46'),(7,2,2,'Supermercado Betel San Pedro Norte','Activo','2026-11-18 23:41:46','2026-11-18 23:41:46'),(8,3,3,'Supermercado Betel Monterrico Centro','Activo','2026-11-18 23:41:46','2026-11-18 23:41:46'),(9,4,4,'Supermercado Betel Monterrico Ruta','Activo','2026-11-18 23:41:46','2026-11-18 23:41:46'),(10,5,5,'Sucursal Betel San Salvador','Activo','2026-11-18 23:41:46','2026-11-18 23:41:46');
/*!40000 ALTER TABLE `puntos_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepciones`
--

DROP TABLE IF EXISTS `recepciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepciones` (
  `id_recepcion` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `id_usuario` int unsigned NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_recepcion`),
  KEY `id_compra` (`id_compra`),
  KEY `fk_recepciones_usuarios` (`id_usuario`),
  CONSTRAINT `fk_recepciones_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `recepciones_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepciones`
--

LOCK TABLES `recepciones` WRITE;
/*!40000 ALTER TABLE `recepciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Gerente general','Dirección de toda la cadena'),(2,'Responsable de sucursal','Gestiona una sucursal'),(3,'Encargado de depósito','Controla stock y movimientos del depósito'),(4,'Cajero','Registra ventas en su sucursal'),(5,'Responsable de compras','Gestiona proveedores y compras'),(6,'Responsable de precios y promociones','Administra precios y ofertas'),(7,'Auditor','Consulta registros de auditoría'),(8,'Administrador de base de datos','Administra el motor, respaldos y seguridad'),(9,'Usuario de consulta','Acceso de solo lectura a reportes');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_permisos`
--

DROP TABLE IF EXISTS `roles_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_permisos` (
  `id_rol` int NOT NULL,
  `id_permiso` int NOT NULL,
  PRIMARY KEY (`id_rol`,`id_permiso`),
  KEY `id_permiso` (`id_permiso`),
  CONSTRAINT `roles_permisos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  CONSTRAINT `roles_permisos_ibfk_2` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_permisos`
--

LOCK TABLES `roles_permisos` WRITE;
/*!40000 ALTER TABLE `roles_permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_deposito` int NOT NULL,
  `cantidad_disponible` decimal(12,3) NOT NULL DEFAULT '0.000',
  `cantidad_reservada` decimal(12,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id_stock`),
  UNIQUE KEY `id_producto` (`id_producto`,`id_deposito`),
  KEY `id_deposito` (`id_deposito`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`id_deposito`) REFERENCES `depositos` (`id_deposito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `id_empresa` int NOT NULL DEFAULT '1',
  `codigo_sucursal` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `id_localidad` int NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `estado` varchar(15) NOT NULL DEFAULT 'Activo',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sucursal`),
  UNIQUE KEY `codigo_sucursal` (`codigo_sucursal`),
  KEY `id_localidad` (`id_localidad`),
  KEY `idx_sucursales_empresa` (`id_empresa`),
  CONSTRAINT `fk_sucursales_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`),
  CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id_localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,1,'SUC-001','Supermercado Betel San Pedro','calle Gobernador tello 246',1,'3888992356','Activo','2026-11-18 23:41:06','2026-11-18 23:41:06'),(2,1,'SUC-002','Supermercado Betel San Pedro ','calle Haiti 267',1,'3888992356','Activo','2026-11-18 23:41:06','2026-11-18 23:41:06'),(3,1,'SUC-003','Supermercado Betel Monterrico','calle Cordoba 370',2,'3884532458','Activo','2026-11-18 23:41:06','2026-11-18 23:41:06'),(4,1,'SUC-004','Mayorista Betel Monterrico','Las Maravillas esq. La Rioja',2,'3884532458','Activo','2026-11-18 23:41:06','2026-11-18 23:41:06'),(5,1,'SUC-005','Sucursal Betel San Salvador de Jujuy','calle Azopardo 47',3,'3880247840','Activo','2026-11-18 23:41:06','2026-11-18 23:41:06');
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_comprobante`
--

DROP TABLE IF EXISTS `tipos_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_comprobante` (
  `id_tipo_comprobante` int NOT NULL AUTO_INCREMENT,
  `letra` char(1) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `codigo_arca` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id_tipo_comprobante`),
  UNIQUE KEY `uq_tipos_comprobante_codigo` (`codigo_arca`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_comprobante`
--

LOCK TABLES `tipos_comprobante` WRITE;
/*!40000 ALTER TABLE `tipos_comprobante` DISABLE KEYS */;
INSERT INTO `tipos_comprobante` VALUES (1,'A','Factura A',1);
/*!40000 ALTER TABLE `tipos_comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferencias`
--

DROP TABLE IF EXISTS `transferencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferencias` (
  `id_transferencia` int NOT NULL AUTO_INCREMENT,
  `id_deposito_origen` int NOT NULL,
  `id_deposito_destino` int NOT NULL,
  `id_usuario` int unsigned NOT NULL,
  `fecha_transferencia` datetime NOT NULL,
  `estado` varchar(30) NOT NULL DEFAULT 'Pendiente',
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_transferencia`),
  KEY `id_deposito_origen` (`id_deposito_origen`),
  KEY `id_deposito_destino` (`id_deposito_destino`),
  KEY `fk_transferencias_usuarios` (`id_usuario`),
  CONSTRAINT `fk_transferencias_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `transferencias_ibfk_1` FOREIGN KEY (`id_deposito_origen`) REFERENCES `depositos` (`id_deposito`),
  CONSTRAINT `transferencias_ibfk_2` FOREIGN KEY (`id_deposito_destino`) REFERENCES `depositos` (`id_deposito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferencias`
--

LOCK TABLES `transferencias` WRITE;
/*!40000 ALTER TABLE `transferencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades_medida`
--

DROP TABLE IF EXISTS `unidades_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades_medida` (
  `id_unidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `abreviatura` varchar(15) NOT NULL,
  PRIMARY KEY (`id_unidad`),
  UNIQUE KEY `abreviatura` (`abreviatura`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_medida`
--

LOCK TABLES `unidades_medida` WRITE;
/*!40000 ALTER TABLE `unidades_medida` DISABLE KEYS */;
INSERT INTO `unidades_medida` VALUES (1,'Unidad','u'),(2,'Kilogramo','kg'),(3,'Gramo','g'),(4,'Litro','l'),(5,'Mililitro','ml'),(6,'Paquete','pack');
/*!40000 ALTER TABLE `unidades_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int unsigned NOT NULL AUTO_INCREMENT,
  `legajo` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `dni` varchar(15) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `id_sucursal` int DEFAULT NULL,
  `estado` varchar(15) NOT NULL DEFAULT 'Activo',
  `id_cargo` int NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `uq_usuarios_legajo` (`legajo`),
  UNIQUE KEY `uq_usuarios_dni` (`dni`),
  UNIQUE KEY `email` (`email`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `idx_usuarios_cargo` (`id_cargo`),
  CONSTRAINT `fk_usuarios_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id_cargo`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_roles`
--

DROP TABLE IF EXISTS `usuarios_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_roles` (
  `id_usuario` int unsigned NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_rol`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuarios_roles_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `usuarios_roles_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_roles`
--

LOCK TABLES `usuarios_roles` WRITE;
/*!40000 ALTER TABLE `usuarios_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `numero_venta` varchar(30) NOT NULL,
  `id_caja` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_usuario` int unsigned NOT NULL,
  `fecha_venta` datetime NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Completada',
  PRIMARY KEY (`id_venta`),
  UNIQUE KEY `numero_venta` (`numero_venta`),
  KEY `id_caja` (`id_caja`),
  KEY `id_cliente` (`id_cliente`),
  KEY `fk_ventas_usuarios` (`id_usuario`),
  CONSTRAINT `fk_ventas_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_caja`) REFERENCES `cajas` (`id_caja`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
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

-- Dump completed on 2026-11-18 23:46:54
