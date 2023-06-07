CREATE TRIGGER eliminar_encuesta
BEFORE DELETE ON encuestas
FOR EACH ROW
BEGIN
    -- Eliminar detalle_opcion_respuestas
    DELETE FROM detalle_opcion_respuestas WHERE respuestas_id IN (
        SELECT pk_respuesta FROM respuestas WHERE encuestado_id IN (
            SELECT id FROM encuestados WHERE fk_encuesta_id = OLD.pk_encuesta
        )
    );

    -- Eliminar respuestas
    DELETE FROM respuestas WHERE encuestado_id IN (
        SELECT id FROM encuestados WHERE fk_encuesta_id = OLD.pk_encuesta
    );

    -- Eliminar encuestados
    DELETE FROM encuestados WHERE fk_encuesta_id = OLD.pk_encuesta;

    -- Eliminar preguntas
    DELETE FROM preguntas WHERE encuesta_id = OLD.pk_encuesta;

    -- Eliminar opcion_respuestas
    DELETE FROM opcion_respuestas WHERE fk_pregunta_id IN (
        SELECT pk_pregunta FROM preguntas WHERE encuesta_id = OLD.pk_encuesta
    );
END