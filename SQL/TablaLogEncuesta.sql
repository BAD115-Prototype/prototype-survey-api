CREATE TABLE `log_encuestas` (
    `id` BIGINT(19) NOT NULL AUTO_INCREMENT,
    `accion` VARCHAR(50) NOT NULL,
    `fecha` DATETIME(6) NOT NULL,
    `encuesta_id` BIGINT(19) NOT NULL,
    `usuario_id` BIGINT(19) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`encuesta_id`) REFERENCES `encuestas` (`pk_encuesta`) ON UPDATE NO ACTION ON DELETE NO ACTION,
    FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;