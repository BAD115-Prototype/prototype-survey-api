CREATE VIEW vista_preguntas_respuestas AS
SELECT
    p.pk_pregunta,
    p.texto_pregunta,
    p.tipo_pregunta_id,
    o.pk_opcion_respuesta,
    o.texto_opcion,
    IFNULL(COUNT(o.pk_opcion_respuesta), -1) AS conteo_opcion_respuesta,
    r.valor_respuesta,
    e.pk_encuesta AS encuesta_id
FROM
    preguntas p
    INNER JOIN opcion_respuestas o ON p.pk_pregunta = o.fk_pregunta_id
    LEFT JOIN detalle_opcion_respuestas d ON o.pk_opcion_respuesta = d.opcion_respuestas_id
    LEFT JOIN respuestas r ON d.respuestas_id = r.pk_respuesta
    LEFT JOIN encuestas e ON p.encuesta_id = e.pk_encuesta
GROUP BY
    p.pk_pregunta,
    p.texto_pregunta,
    p.tipo_pregunta_id,
    o.pk_opcion_respuesta,
    o.texto_opcion,
    r.valor_respuesta,
    e.pk_encuesta;