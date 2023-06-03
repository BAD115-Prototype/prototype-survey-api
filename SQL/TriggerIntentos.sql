DELIMITER //
CREATE TRIGGER `<nombre_tabla>usuarios`.validarIntentos
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
   IF NEW.intentos >= 3 THEN
      SET NEW.activo = FALSE;
   END IF;
END;//
DELIMITER ;