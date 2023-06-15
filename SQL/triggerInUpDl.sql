DELIMITER $$
CREATE TRIGGER `encuestas_after_insert_update_delete` AFTER INSERT, UPDATE, DELETE ON `encuestas`
FOR EACH ROW
BEGIN
    DECLARE accion VARCHAR(50);
    
    IF INSERTING THEN
        SET accion = 'Creación';
    ELSEIF UPDATING THEN
        SET accion = 'Actualización';
    ELSEIF DELETING THEN
        SET accion = 'Eliminación';
    END IF;
    
    INSERT INTO `log` (`accion`, `fecha`, `encuesta_id`, `usuario_id`)
    VALUES (accion, NOW(6), OLD.pk_encuesta, OLD.usuario_id);
END$$
DELIMITER ;
