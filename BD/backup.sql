-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.1.25-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla jidaweb.s_clasificaciones
CREATE TABLE IF NOT EXISTS `s_clasificaciones` (
  `id_clasificacion` int(11) NOT NULL AUTO_INCREMENT,
  `clasificacion` varchar(100) DEFAULT NULL,
  `identificador` varchar(100) DEFAULT NULL,
  `padre` int(11) DEFAULT NULL,
  `hijo` int(11) DEFAULT NULL,
  `nombre_clave` varchar(100) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `permiso` int(11) DEFAULT NULL,
  `total_post` int(11) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `id_estatus` int(11) DEFAULT NULL,
  `id_idioma` varchar(5) DEFAULT NULL,
  `texto_original` int(11) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_clasificacion`),
  KEY `fk_s_estatus_idx` (`id_estatus`),
  KEY `fk_s_idiomas_s_clasificacion_post_idx` (`id_idioma`),
  KEY `fk_s_clasificacion_post_texto_original_idx` (`texto_original`),
  CONSTRAINT `fk_s_estatus` FOREIGN KEY (`id_estatus`) REFERENCES `s_estatus` (`id_estatus`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_s_idiomas_s_clasificaciones` FOREIGN KEY (`id_idioma`) REFERENCES `s_idiomas` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `texto_original_s_clasificaciones` FOREIGN KEY (`texto_original`) REFERENCES `s_clasificaciones` (`id_clasificacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_clasificaciones: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `s_clasificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_clasificaciones` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_clasificacion_posts
CREATE TABLE IF NOT EXISTS `s_clasificacion_posts` (
  `id_clasificacion_post` int(11) NOT NULL,
  `id_post` int(11) DEFAULT NULL,
  `id_clasificacion` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_clasificacion_post`),
  KEY `fk_t_posts_r_clasificacion_post_idx` (`id_post`),
  KEY `fk_s_clasificacion_post_r_clasificacion_post_idx` (`id_clasificacion`),
  CONSTRAINT `fk_s_clasificaciones_s_clasificacion_post` FOREIGN KEY (`id_clasificacion`) REFERENCES `s_clasificaciones` (`id_clasificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_t_posts_r_clasificacion_post` FOREIGN KEY (`id_post`) REFERENCES `s_posts` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_clasificacion_posts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `s_clasificacion_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_clasificacion_posts` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_comentarios_posts
CREATE TABLE IF NOT EXISTS `s_comentarios_posts` (
  `id_comentario_post` int(11) NOT NULL AUTO_INCREMENT,
  `comentario_post` text,
  `nombres` varchar(25) DEFAULT NULL,
  `apellidos` varchar(35) DEFAULT NULL,
  `correo` varchar(35) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_Creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_comentario_post`),
  KEY `fk_s_usuarios_idx` (`id_usuario`),
  KEY `fk_t_comentarios_t_post_idx` (`id_post`),
  CONSTRAINT `fk_s_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `s_usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_t_comentarios_t_post` FOREIGN KEY (`id_post`) REFERENCES `s_posts` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_comentarios_posts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `s_comentarios_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_comentarios_posts` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_componentes
CREATE TABLE IF NOT EXISTS `s_componentes` (
  `id_componente` int(11) NOT NULL AUTO_INCREMENT,
  `componente` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `identificador` varchar(100) DEFAULT NULL,
  `texto_original` int(11) DEFAULT NULL,
  `id_idioma` varchar(5) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modifcador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_componente`),
  KEY `fk_s_idiomas_s_componentes_idx` (`id_idioma`),
  KEY `fk_texto_original_s_componentes_idx` (`texto_original`),
  CONSTRAINT `fk_texto_original_s_componentes` FOREIGN KEY (`texto_original`) REFERENCES `s_componentes` (`id_componente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fks_idiomas_s_componentes` FOREIGN KEY (`id_idioma`) REFERENCES `s_idiomas` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_componentes: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `s_componentes` DISABLE KEYS */;
INSERT INTO `s_componentes` (`id_componente`, `componente`, `descripcion`, `identificador`, `texto_original`, `id_idioma`, `id_usuario_creador`, `id_usuario_modifcador`, `fecha_creacion`, `fecha_modificacion`) VALUES
	(1, 'principal', NULL, 'principal', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'jadmin', NULL, 'jadmin', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'admin', NULL, 'admin', NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_componentes` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_componentes_perfiles
CREATE TABLE IF NOT EXISTS `s_componentes_perfiles` (
  `id_componente_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) NOT NULL,
  `id_componente` int(11) NOT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_componente_perfil`),
  KEY `id_perfil` (`id_perfil`),
  KEY `id_componente` (`id_componente`),
  CONSTRAINT `s_componentes_perfiles_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `s_perfiles` (`id_perfil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `s_componentes_perfiles_ibfk_2` FOREIGN KEY (`id_componente`) REFERENCES `s_componentes` (`id_componente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_componentes_perfiles: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `s_componentes_perfiles` DISABLE KEYS */;
INSERT INTO `s_componentes_perfiles` (`id_componente_perfil`, `id_perfil`, `id_componente`, `id_usuario_creador`, `id_usuario_modificador`, `fecha_creacion`, `fecha_modificacion`) VALUES
	(1, 1, 2, NULL, NULL, NULL, NULL),
	(2, 1, 3, NULL, NULL, NULL, NULL),
	(3, 2, 3, NULL, NULL, NULL, NULL),
	(4, 1, 1, NULL, NULL, NULL, NULL),
	(5, 2, 1, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_componentes_perfiles` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_elementos
CREATE TABLE IF NOT EXISTS `s_elementos` (
  `id_elemento` int(11) NOT NULL AUTO_INCREMENT,
  `elemento` varchar(50) DEFAULT NULL,
  `data` text,
  `area` varchar(80) DEFAULT NULL,
  `identificador` varchar(100) DEFAULT NULL,
  `id_idioma` varchar(5) DEFAULT NULL,
  `texto_original` int(11) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_elemento`),
  KEY `fk_s_idiomas_s_elementos_idx` (`id_idioma`),
  KEY `fk_s_elementos_texto_original_idx` (`texto_original`),
  CONSTRAINT `fk_s_elementos_texto_original` FOREIGN KEY (`texto_original`) REFERENCES `s_elementos` (`id_elemento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_s_idiomas_s_elementos` FOREIGN KEY (`id_idioma`) REFERENCES `s_idiomas` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_elementos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `s_elementos` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_elementos` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_estatus
CREATE TABLE IF NOT EXISTS `s_estatus` (
  `id_estatus` int(11) NOT NULL AUTO_INCREMENT,
  `estatus` varchar(40) DEFAULT NULL,
  `identificador` varchar(80) DEFAULT NULL,
  `id_idioma` varchar(5) DEFAULT NULL,
  `texto_original` int(11) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_estatus`),
  KEY `fk_s_idiomas_s_estatus_idx` (`id_idioma`),
  KEY `fk_s_idiomas_texto_originas_idx` (`texto_original`),
  CONSTRAINT `fk_s_estatus_texto_originas` FOREIGN KEY (`texto_original`) REFERENCES `s_estatus` (`id_estatus`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_s_idiomas_s_estatus` FOREIGN KEY (`id_idioma`) REFERENCES `s_idiomas` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_estatus: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `s_estatus` DISABLE KEYS */;
INSERT INTO `s_estatus` (`id_estatus`, `estatus`, `identificador`, `id_idioma`, `texto_original`, `id_usuario_creador`, `id_usuario_modificador`, `fecha_creacion`, `fecha_modificacion`) VALUES
	(1, 'Activo', 'activo', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Inactivo', 'inactivo', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Eliminado', 'eliminado', NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Data Incompleta', 'data_incompleta', NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_estatus` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_estatus_posts
CREATE TABLE IF NOT EXISTS `s_estatus_posts` (
  `id_estatus_post` int(11) NOT NULL AUTO_INCREMENT,
  `estatus_post` varchar(80) DEFAULT NULL,
  `identificador` varchar(80) DEFAULT NULL,
  `texto_original` int(11) DEFAULT NULL,
  `id_idioma` varchar(5) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_estatus_post`),
  KEY `fk_s_idiomas_idx` (`id_idioma`),
  KEY `fk_texto_original_idx` (`texto_original`),
  KEY `sk_s_idiomas_s_estatus_post_idx` (`id_idioma`),
  CONSTRAINT `fk_s_estatus_posts_texto_original` FOREIGN KEY (`texto_original`) REFERENCES `s_estatus_posts` (`id_estatus_post`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_s_idiomas_s_estatus_posts` FOREIGN KEY (`id_idioma`) REFERENCES `s_idiomas` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_estatus_posts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `s_estatus_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_estatus_posts` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_idiomas
CREATE TABLE IF NOT EXISTS `s_idiomas` (
  `id_idioma` varchar(5) NOT NULL,
  `idioma` varchar(20) DEFAULT NULL,
  `por_defecto` tinyint(4) DEFAULT NULL,
  `identificador` varchar(30) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_idiomas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `s_idiomas` DISABLE KEYS */;
INSERT INTO `s_idiomas` (`id_idioma`, `idioma`, `por_defecto`, `identificador`, `id_usuario_creador`, `id_usuario_modificador`, `fecha_creacion`, `fecha_modificacion`) VALUES
	('esp', 'Español', 1, 'español', NULL, NULL, NULL, NULL),
	('fra', 'Frances', NULL, 'frances', NULL, NULL, NULL, NULL),
	('ing', 'Ingles', NULL, 'ingles', NULL, NULL, NULL, NULL),
	('ita', 'Italiano', NULL, 'italiano', NULL, NULL, NULL, NULL),
	('por', 'Portugues', NULL, 'portugues', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_idiomas` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_menus
CREATE TABLE IF NOT EXISTS `s_menus` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(50) NOT NULL,
  `meta_data` varchar(200) DEFAULT NULL,
  `identificador` varchar(60) DEFAULT NULL,
  `texto_original` int(11) DEFAULT NULL,
  `id_idioma` varchar(5) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `fk_s_idiomas_s_menus_idx` (`id_idioma`),
  KEY `fk_s_menus_texto_original_idx` (`texto_original`),
  CONSTRAINT `fk_s_idiomas__s_menus` FOREIGN KEY (`id_idioma`) REFERENCES `s_idiomas` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_s_menus_texto_original` FOREIGN KEY (`texto_original`) REFERENCES `s_menus` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_menus: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `s_menus` DISABLE KEYS */;
INSERT INTO `s_menus` (`id_menu`, `menu`, `meta_data`, `identificador`, `texto_original`, `id_idioma`, `id_usuario_creador`, `id_usuario_modificador`, `fecha_creacion`, `fecha_modificacion`) VALUES
	(1, 'Principal', NULL, 'principal', NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Administrador', NULL, 'administrador', NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'topCliente', NULL, 'topcliente', NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_menus` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_metodos
CREATE TABLE IF NOT EXISTS `s_metodos` (
  `id_metodo` int(11) NOT NULL AUTO_INCREMENT,
  `id_objeto` int(11) DEFAULT NULL,
  `metodo` varchar(150) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `identificador` varchar(160) DEFAULT NULL,
  `loggin` int(11) DEFAULT '0',
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_metodo`),
  KEY `id_objeto` (`id_objeto`),
  CONSTRAINT `s_metodos_ibfk_1` FOREIGN KEY (`id_objeto`) REFERENCES `s_objetos` (`id_objeto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_metodos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `s_metodos` DISABLE KEYS */;
INSERT INTO `s_metodos` (`id_metodo`, `id_objeto`, `metodo`, `descripcion`, `identificador`, `loggin`, `id_usuario_creador`, `id_usuario_modificador`, `fecha_creacion`, `fecha_modificacion`) VALUES
	(38, 22, 'index', NULL, NULL, 0, NULL, NULL, NULL, NULL),
	(39, 23, 'index', NULL, NULL, 0, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_metodos` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_metodos_perfiles
CREATE TABLE IF NOT EXISTS `s_metodos_perfiles` (
  `id_metodo_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `id_metodo` int(11) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_metodo_perfil`),
  KEY `id_metodo` (`id_metodo`),
  KEY `id_perfil` (`id_perfil`),
  CONSTRAINT `fk_s_metodos` FOREIGN KEY (`id_metodo`) REFERENCES `s_metodos` (`id_metodo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_s_perfiles` FOREIGN KEY (`id_perfil`) REFERENCES `s_perfiles` (`id_perfil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_metodos_perfiles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `s_metodos_perfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_metodos_perfiles` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_objetos
CREATE TABLE IF NOT EXISTS `s_objetos` (
  `id_objeto` int(11) NOT NULL AUTO_INCREMENT,
  `id_componente` int(11) DEFAULT NULL,
  `objeto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `identificador` varchar(120) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_objeto`),
  KEY `id_componente` (`id_componente`),
  CONSTRAINT `fk_s_objetos_s_componentes` FOREIGN KEY (`id_componente`) REFERENCES `s_componentes` (`id_componente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_objetos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `s_objetos` DISABLE KEYS */;
INSERT INTO `s_objetos` (`id_objeto`, `id_componente`, `objeto`, `descripcion`, `identificador`, `id_usuario_creador`, `id_usuario_modificador`, `fecha_creacion`, `fecha_modificacion`) VALUES
	(22, 2, 'Jadmin', NULL, 'jadmin', NULL, NULL, NULL, NULL),
	(23, 3, 'Admin', NULL, 'admin', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_objetos` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_objetos_media
CREATE TABLE IF NOT EXISTS `s_objetos_media` (
  `id_objeto_media` int(11) NOT NULL AUTO_INCREMENT,
  `objeto_media` varchar(100) NOT NULL,
  `directorio` varchar(100) DEFAULT NULL,
  `tipo_media` int(11) DEFAULT NULL COMMENT '1= imagen; 2 = Video',
  `interno` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `leyenda` varchar(150) DEFAULT NULL,
  `alt` varchar(45) DEFAULT NULL,
  `meta_data` varchar(500) DEFAULT NULL,
  `id_idioma` varchar(5) DEFAULT NULL,
  `texto_original` int(11) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_objeto_media`),
  KEY `fk_s_idiomas_s_objetos_media_idx` (`id_idioma`),
  KEY `fk_s_objetos_media_texto_original_idx` (`texto_original`),
  CONSTRAINT `fk_s_idiomas_s_objetos_media` FOREIGN KEY (`id_idioma`) REFERENCES `s_idiomas` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_s_objetos_media_texto_original` FOREIGN KEY (`texto_original`) REFERENCES `s_objetos_media` (`id_objeto_media`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_objetos_media: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `s_objetos_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_objetos_media` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_objetos_perfiles
CREATE TABLE IF NOT EXISTS `s_objetos_perfiles` (
  `id_objeto_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) NOT NULL,
  `id_objeto` int(11) NOT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_objeto_perfil`),
  KEY `id_perfil` (`id_perfil`),
  KEY `id_objeto` (`id_objeto`),
  CONSTRAINT `s_objetos_perfiles_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `s_perfiles` (`id_perfil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `s_objetos_perfiles_ibfk_2` FOREIGN KEY (`id_objeto`) REFERENCES `s_objetos` (`id_objeto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_objetos_perfiles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `s_objetos_perfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_objetos_perfiles` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_opciones_menu
CREATE TABLE IF NOT EXISTS `s_opciones_menu` (
  `id_opcion_menu` int(11) NOT NULL AUTO_INCREMENT,
  `opcion_menu` varchar(100) NOT NULL,
  `url_opcion` varchar(100) DEFAULT NULL,
  `identificador` varchar(120) DEFAULT NULL,
  `padre` int(11) DEFAULT NULL,
  `hijo` tinyint(1) DEFAULT NULL,
  `icono` varchar(100) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `id_estatus` int(11) DEFAULT NULL,
  `selector_icono` int(11) DEFAULT NULL,
  `id_metodo` int(11) DEFAULT NULL,
  `texto_original` int(11) DEFAULT NULL,
  `id_idioma` varchar(5) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_opcion_menu`),
  KEY `id_menu` (`id_menu`),
  KEY `fk_s_idiomas_s_opciones_menu_idx` (`id_idioma`),
  KEY `fk_s_opciones_menu_texto_original_idx` (`texto_original`),
  KEY `fk_s_estatus_s_opciones_menu_idx` (`id_estatus`),
  KEY `fk_s_metodos_s_opciones_menu_idx` (`id_metodo`),
  CONSTRAINT `fk_s_estatus_s_opciones_menu` FOREIGN KEY (`id_estatus`) REFERENCES `s_estatus` (`id_estatus`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_s_idiomas_s_opciones_menu` FOREIGN KEY (`id_idioma`) REFERENCES `s_idiomas` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_s_metodos_s_opciones_menu` FOREIGN KEY (`id_metodo`) REFERENCES `s_metodos` (`id_metodo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_s_opciones_menu_texto_original` FOREIGN KEY (`texto_original`) REFERENCES `s_opciones_menu` (`id_opcion_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `s_opciones_menu_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `s_menus` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_opciones_menu: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `s_opciones_menu` DISABLE KEYS */;
INSERT INTO `s_opciones_menu` (`id_opcion_menu`, `opcion_menu`, `url_opcion`, `identificador`, `padre`, `hijo`, `icono`, `orden`, `id_menu`, `id_estatus`, `selector_icono`, `id_metodo`, `texto_original`, `id_idioma`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creador`, `id_usuario_modificador`) VALUES
	(1, 'Formularios', '/jadmin/forms/', NULL, 0, 1, 'fa fa-check', 2, 1, 1, 1, NULL, NULL, NULL, '2014-02-13 13:01:11', '2014-08-08 10:56:35', NULL, NULL),
	(2, 'Menus', '/jadmin/menus/', NULL, 0, 0, 'fa fa-bars', 3, 1, 1, 1, NULL, NULL, NULL, '2014-02-13 13:01:11', NULL, NULL, NULL),
	(3, 'ACL', NULL, NULL, 0, 1, 'fa fa-dashboard', 1, 1, 1, 1, NULL, NULL, NULL, '2014-02-13 13:01:11', NULL, NULL, NULL),
	(4, 'Objetos', '/jadmin/objetos/', NULL, 3, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2014-02-13 13:01:11', NULL, NULL, NULL),
	(5, 'Componentes', '/jadmin/componentes/', NULL, 3, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2014-02-13 13:01:11', NULL, NULL, NULL),
	(9, 'Perfiles', '/jadmin/perfiles/', NULL, 3, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'Cerrar Sesión', '/jadmin/users/cierresesion/', NULL, 0, 0, 'fa fa-power-off', 10, 1, 1, 1, NULL, NULL, NULL, NULL, '2014-09-02 22:30:26', NULL, NULL),
	(11, 'Usuarios', '/jadmin/users/', NULL, 3, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, 'Jida', '/jadmin/forms/jida-forms', NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, '2014-08-04 05:31:21', '2014-08-08 10:37:52', NULL, NULL),
	(28, 'Aplicaci&oacute;n', '/jadmin/forms/filter/aplicacion', NULL, 1, 0, 'fa-plus-square-o', 2, 1, 1, 1, NULL, NULL, NULL, '2014-08-04 05:54:06', '2014-08-04 05:54:06', NULL, NULL),
	(29, '1', '/algo-distinto/', NULL, 1, 0, NULL, 10, 1, 1, 1, NULL, NULL, NULL, '2014-08-08 10:57:10', '2014-08-08 10:57:10', NULL, NULL);
/*!40000 ALTER TABLE `s_opciones_menu` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_opciones_menu_perfiles
CREATE TABLE IF NOT EXISTS `s_opciones_menu_perfiles` (
  `id_opcion_menu_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `id_opcion_menu` int(11) DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_opcion_menu_perfil`),
  KEY `id_opcion` (`id_opcion_menu`),
  KEY `id_perfil` (`id_perfil`),
  CONSTRAINT `s_opciones_menu_perfiles_ibfk_1` FOREIGN KEY (`id_opcion_menu`) REFERENCES `s_opciones_menu` (`id_opcion_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `s_opciones_menu_perfiles_ibfk_2` FOREIGN KEY (`id_perfil`) REFERENCES `s_perfiles` (`id_perfil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_opciones_menu_perfiles: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `s_opciones_menu_perfiles` DISABLE KEYS */;
INSERT INTO `s_opciones_menu_perfiles` (`id_opcion_menu_perfil`, `id_opcion_menu`, `id_perfil`, `id_usuario_creador`, `id_usuario_modificador`, `fecha_creacion`, `fecha_modificacion`) VALUES
	(1, 1, 1, NULL, NULL, NULL, NULL),
	(2, 2, 1, NULL, NULL, NULL, NULL),
	(3, 3, 1, NULL, NULL, NULL, NULL),
	(4, 4, 1, NULL, NULL, NULL, NULL),
	(5, 5, 1, NULL, NULL, NULL, NULL),
	(6, 9, 1, NULL, NULL, NULL, NULL),
	(7, 10, 1, NULL, NULL, NULL, NULL),
	(8, 11, 1, NULL, NULL, NULL, NULL),
	(9, 27, 1, NULL, NULL, NULL, NULL),
	(10, 28, 1, NULL, NULL, NULL, NULL),
	(11, 29, 1, NULL, NULL, NULL, NULL),
	(12, 1, 1, NULL, NULL, NULL, NULL),
	(13, 2, 1, NULL, NULL, NULL, NULL),
	(14, 10, 1, NULL, NULL, NULL, NULL),
	(15, 3, 1, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_opciones_menu_perfiles` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_perfiles
CREATE TABLE IF NOT EXISTS `s_perfiles` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(50) DEFAULT NULL,
  `fecha_creado` datetime DEFAULT NULL,
  `clave_perfil` varchar(100) NOT NULL,
  `identificador` varchar(60) DEFAULT NULL,
  `id_idioma` varchar(5) DEFAULT NULL,
  `texto_original` int(11) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_perfil`),
  KEY `fk_s_idiomas_s_perfiles_idx` (`id_idioma`),
  KEY `fk_s_perfiles_texto_original_idx` (`texto_original`),
  CONSTRAINT `fk_s_idiomas_s_perfiles` FOREIGN KEY (`id_idioma`) REFERENCES `s_idiomas` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_s_perfiles_texto_original` FOREIGN KEY (`texto_original`) REFERENCES `s_perfiles` (`id_perfil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_perfiles: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `s_perfiles` DISABLE KEYS */;
INSERT INTO `s_perfiles` (`id_perfil`, `perfil`, `fecha_creado`, `clave_perfil`, `identificador`, `id_idioma`, `texto_original`, `id_usuario_creador`, `id_usuario_modificador`, `fecha_creacion`, `fecha_modificacion`) VALUES
	(1, 'Jida Administrador', '2014-02-13 13:01:11', 'JidaAdministrador', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, 'Administrador', '2014-02-13 13:01:11', 'Administrador', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Usuario Publico', '2014-02-13 13:01:11', 'UsuarioPublico', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_perfiles` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_posts
CREATE TABLE IF NOT EXISTS `s_posts` (
  `id_post` int(11) NOT NULL AUTO_INCREMENT,
  `post` varchar(160) DEFAULT NULL,
  `resumen` varchar(600) DEFAULT NULL,
  `contenido` text,
  `meta_descripcion` varchar(200) DEFAULT NULL,
  `identificador` varchar(180) DEFAULT NULL,
  `relevancia` int(11) DEFAULT NULL,
  `id_media_principal` int(11) DEFAULT NULL,
  `id_seccion` int(11) DEFAULT NULL,
  `fecha_publicacion` datetime DEFAULT NULL,
  `numero_visitas` int(11) DEFAULT NULL,
  `id_estatus_post` int(11) DEFAULT NULL,
  `visibilidad` int(11) DEFAULT NULL,
  `nombre_post` varchar(100) DEFAULT NULL,
  `tipo` varchar(25) DEFAULT NULL,
  `data` text,
  `texto_original` int(11) DEFAULT NULL,
  `id_idioma` varchar(5) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_post`),
  KEY `id_seccion_idx` (`id_seccion`),
  KEY `id_estatus_post_idx` (`id_estatus_post`),
  KEY `id_idioma_idx` (`id_idioma`),
  KEY `fk_texto_original_idx` (`texto_original`),
  KEY `s_post_s_objetos_media_idx` (`id_media_principal`),
  CONSTRAINT `fk_s_idiomas_s_posts` FOREIGN KEY (`id_idioma`) REFERENCES `s_idiomas` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_texto_original` FOREIGN KEY (`texto_original`) REFERENCES `s_posts` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_estatus_post` FOREIGN KEY (`id_estatus_post`) REFERENCES `s_estatus_posts` (`id_estatus_post`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_seccion` FOREIGN KEY (`id_seccion`) REFERENCES `s_clasificaciones` (`id_clasificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `s_post_s_objetos_media` FOREIGN KEY (`id_media_principal`) REFERENCES `s_objetos_media` (`id_objeto_media`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_posts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `s_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_posts` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_usuarios
CREATE TABLE IF NOT EXISTS `s_usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(100) NOT NULL,
  `clave_usuario` varchar(50) NOT NULL,
  `identificador` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `id_estatus` int(11) NOT NULL,
  `ultima_session` datetime DEFAULT NULL,
  `validacion` varchar(500) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `codigo_recuperacion` varchar(80) DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL,
  `img_perfil` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_s_usuarios_s_estatus_idx` (`id_estatus`),
  CONSTRAINT `fk_s_usuarios_s_estatus` FOREIGN KEY (`id_estatus`) REFERENCES `s_estatus` (`id_estatus`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_usuarios: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `s_usuarios` DISABLE KEYS */;
INSERT INTO `s_usuarios` (`id_usuario`, `nombre_usuario`, `clave_usuario`, `identificador`, `activo`, `id_estatus`, `ultima_session`, `validacion`, `nombres`, `apellidos`, `correo`, `codigo_recuperacion`, `sexo`, `img_perfil`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creador`, `id_usuario_modificador`) VALUES
	(1, 'jadmin', '3711be79067177199efb2589054a6894', NULL, 1, 1, '2017-02-26 09:22:50', '1', NULL, NULL, NULL, NULL, NULL, NULL, '2014-02-13 13:01:12', NULL, NULL, NULL),
	(2, 'jeanpierre', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, 1, NULL, '1', NULL, NULL, 'jeacontreras2009@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'felix', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'dayan', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, 1, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla jidaweb.s_usuarios_perfiles
CREATE TABLE IF NOT EXISTS `s_usuarios_perfiles` (
  `id_usuario_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario_perfil`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_perfil` (`id_perfil`),
  CONSTRAINT `s_usuarios_perfiles_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `s_usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `s_usuarios_perfiles_ibfk_2` FOREIGN KEY (`id_perfil`) REFERENCES `s_perfiles` (`id_perfil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla jidaweb.s_usuarios_perfiles: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `s_usuarios_perfiles` DISABLE KEYS */;
INSERT INTO `s_usuarios_perfiles` (`id_usuario_perfil`, `id_usuario`, `id_perfil`, `id_usuario_creador`, `id_usuario_modificador`, `fecha_creacion`, `fecha_modificacion`) VALUES
	(1, 1, 1, NULL, NULL, NULL, NULL),
	(2, 1, 2, NULL, NULL, NULL, NULL),
	(3, 2, 1, NULL, NULL, NULL, NULL),
	(4, 2, 2, NULL, NULL, NULL, NULL),
	(5, 3, 1, NULL, NULL, NULL, NULL),
	(6, 3, 2, NULL, NULL, NULL, NULL),
	(7, 4, 1, NULL, NULL, NULL, NULL),
	(8, 4, 2, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_usuarios_perfiles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
