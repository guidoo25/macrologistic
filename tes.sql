-- macrologistic.tb_usuarios definition

CREATE TABLE `tb_usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `id_padre` int DEFAULT '0',
  `nombre_empresa` varchar(245) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_idioma` int DEFAULT '1',
  `modo` varchar(45) DEFAULT 'sun',
  `id_bookind_driver` varchar(100) DEFAULT NULL,
  `id_booking_pais` int DEFAULT '789',
  `id_booking_zona` int DEFAULT NULL,
  `id_booking_ciudad` int DEFAULT NULL,
  `id_ubicacion` int DEFAULT NULL,
  `tipo_ubicacion` int DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '2' COMMENT '1 Activo\\\\\\\\r\\\\\\\\n2 Inactivo\\\\\\\\r\\\\\\\\n0 Eliminado',
  `token` varchar(300) DEFAULT NULL,
  `cod_empresa` int DEFAULT NULL,
  `fecha_creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_eliminado` timestamp NULL DEFAULT NULL,
  `fecha_editado` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `tb_usuarios_id_rol_IDX` (`id_rol`) USING BTREE,
  KEY `tb_usuarios_cod_empresa_IDX` (`cod_empresa`) USING BTREE,
  KEY `tb_usuarios_id_ubicacion_IDX` (`id_ubicacion`) USING BTREE,
  KEY `tb_usuarios_id_idioma_IDX` (`id_idioma`) USING BTREE,
  CONSTRAINT `tb_usuarios_tb_roles_FK` FOREIGN KEY (`id_rol`) REFERENCES `tb_roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;


CREATE TABLE `tb_chofer` (
  `id_chofer` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_transporte` int NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `fecha_creado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creado` int DEFAULT NULL,
  `fecha_editado` timestamp NULL DEFAULT NULL,
  `usuario_editado` int DEFAULT NULL,
  `fecha_eliminado` timestamp NULL DEFAULT NULL,
  `usuario_elimando` int DEFAULT NULL,
  PRIMARY KEY (`id_chofer`),
  KEY `tb_chofer_id_usuario_IDX` (`id_usuario`) USING BTREE,
  KEY `tb_chofer_tb_transportes_FK` (`id_transporte`),
  CONSTRAINT `tb_chofer_tb_transportes_FK` FOREIGN KEY (`id_transporte`) REFERENCES `tb_transportes` (`id_transporte`),
  CONSTRAINT `tb_chofer_tb_usuarios_FK` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;


-- macrologistic.tb_reservas definition

CREATE TABLE `tb_reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `cod_empresa` int DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `id_cliente` int DEFAULT '0',
  `tipo_tarea` int DEFAULT NULL,
  `tipo_reserva` int DEFAULT NULL,
  `id_tipo_transporte` int DEFAULT NULL,
  `id_transporte` int DEFAULT '0',
  `id_chofer` int DEFAULT '0',
  `punto_inicio` varchar(255) DEFAULT NULL,
  `descripcion_inicio` varchar(250) DEFAULT NULL,
  `punto_fin` varchar(255) DEFAULT NULL,
  `descripcion_fin` varchar(250) DEFAULT NULL,
  `cantidad_escalas` varchar(45) DEFAULT NULL,
  `observacion` varchar(900) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `estado` enum('ELIMINADO','POR_ASIGNAR','ASIGNADO','NOTIFICADO','ACEPTADO','RECHAZADO','ANULADO','EN_PROCESO','FINALIZADO') DEFAULT 'POR_ASIGNAR' COMMENT '1 Activo\\\\n2 Inactivo\\\\n0 Eliminado',
  `proceso` enum('PENDIENTE','COMENZADO','PUNTO_INICIO_FINALIZADO','PUNTO_ESCALA','PUNTO_FIN_FINALIZADO','ANULADO','FINALIZADO') DEFAULT 'PENDIENTE',
  `proceso_producto` varchar(245) DEFAULT NULL,
  `hora_iniciada` timestamp NULL DEFAULT NULL,
  `hora_finalizada` timestamp NULL DEFAULT NULL,
  `id_unidad_medida` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `id_tipo_carga` int DEFAULT NULL,
  `id_sub_carga` int DEFAULT NULL,
  `id_iva` int DEFAULT NULL,
  `sub_total` double DEFAULT '0',
  `iva` double DEFAULT '0',
  `total` double DEFAULT '0',
  `id_tipo_pago` int DEFAULT NULL,
  `km` varchar(45) DEFAULT NULL,
  `tiempo` varchar(45) DEFAULT NULL,
  `fecha_creado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creado` int DEFAULT '0',
  `fecha_editado` timestamp NULL DEFAULT NULL,
  `usuario_editado` int DEFAULT NULL,
  `fecha_notificado` timestamp NULL DEFAULT NULL,
  `usuario_notificado` int DEFAULT NULL,
  `fecha_anulada` timestamp NULL DEFAULT NULL,
  `usuario_anulada` int DEFAULT NULL,
  `observacion_anulada` varchar(900) DEFAULT NULL,
  `notificar_anulada` int DEFAULT '0',
  `fecha_notificar_anulada` timestamp NULL DEFAULT NULL,
  `fecha_reasignado` timestamp NULL DEFAULT NULL,
  `usuario_reasignado` int DEFAULT NULL,
  `notificar_reasignado` int DEFAULT '0',
  `fecha_notificar_reasignado` timestamp NULL DEFAULT NULL,
  `fecha_eliminado` timestamp NULL DEFAULT NULL,
  `usuario_eliminado` int DEFAULT NULL,
  PRIMARY KEY (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb3;

-- macrologistic.tb_bodegas definition


CREATE TABLE `tb_detalle_reservas` (
  `id_detalle_reserva` int NOT NULL AUTO_INCREMENT,
  `id_reserva` int NOT NULL,
  `id_transporte` int DEFAULT NULL,
  `latitud_origen` varchar(45) DEFAULT NULL,
  `longitd_origen` varchar(45) DEFAULT NULL,
  `latitud_intermedio` varchar(45) DEFAULT NULL,
  `longitud_intermedio` varchar(45) DEFAULT NULL,
  `latitud_destino` varchar(45) DEFAULT NULL,
  `longitud_destino` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_reserva`),
  KEY `tb_detalle_reservas_id_reserva_IDX` (`id_reserva`) USING BTREE,
  CONSTRAINT `tb_detalle_reservas_tb_reservas_FK` FOREIGN KEY (`id_reserva`) REFERENCES `tb_reservas` (`id_reserva`)
)  ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=utf8mb3;

-- macrologistic.tb_clase_transporte definition

CREATE TABLE `tb_clase_transporte` (
  `id_clase_transporte` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_transporte` int DEFAULT NULL,
  `estado` int DEFAULT '1' COMMENT '1 Activo\n2 Inactivo\n0 Eliminado',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_editado` timestamp NULL DEFAULT NULL,
  `fecha_eliminado` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_clase_transporte`),
  KEY `id_tipo_transporte_idx` (`id_tipo_transporte`),
  CONSTRAINT `id_tipo_transporte` FOREIGN KEY (`id_tipo_transporte`) REFERENCES `tb_tipo_transportes` (`id_tipo_transporte`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;