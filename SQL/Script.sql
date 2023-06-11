INSERT INTO usuarios (nombre_usuario, email, password_digest, activo, created_at, updated_at)
VALUES
  ('Admin', 'admin@email.com', '$2a$12$hPJgDVbPSM8w8oraNh5NLuX6M.lxvG6b1jJ4896s2qdw7wK8V.3vW', true, NOW(), NOW()), /* contra:admin123 */
  ('Juan Perez', 'juanperez@email.com', '$2a$12$IsuBRwBR3xn0tgwqg.zly.Kyk3vb2g3lHYRFVvXmJXxlM4fvdIMB6', true, NOW(), NOW()), /* contra:juan123 */
  ('Felipe Herrrera', 'felipeherrera@email.com', '$2a$12$KnJJLEzxgZeM5MgWHjfo3OENPDQEDVssK.lSzPDIuHwx/3gVu6pju', false, NOW(), NOW()); /* contra:felipe123 */

INSERT INTO tipo_pregunta (descripcion_tipo) VALUES
  ('Pregunta Abierta'),
  ('Elección Única'),
  ('Elección Multiple'),
  ('Escala Numerica'),
  ('Escala Nominal'),
  ('Escala Likert'),
  ('Ranking'),
  ('Mixta');

INSERT INTO generos (valor_genero, created_at, updated_at) VALUES
  ('Masculino', NOW(), NOW()),
  ('Femenino', NOW(), NOW()),
  ('Prefiero no contestar', NOW(), NOW());


/*ENCUESTA 1*/
INSERT INTO encuestas (titulo_encuesta, objetivo_encuesta, indicacion_encuesta, fecha_creacion_encuesta, fecha_actualizacion_encuesta, link_encuesta, estado_encuesta, fecha_inicio_encuesta, fecha_finalizacion_encuesta, usuario_id) 
VALUES ('Hábitos de sueño y descanso', 'Obtener datos sobre los patrones de sueño, la duración promedio del sueño, las dificultades para conciliar el sueño, los factores que afectan la calidad del sueño y las prácticas de relajación utilizadas para descansar mejor.', 'Responde a las siguientes preguntas sobre tus hábitos de sueño y descanso. Intenta proporcionar información precisa y sincera.', NOW(), NOW(), '37e67738d9c54c099cd31337518c8af8', 1, '2023-06-11 05:32:37.366000', '2023-06-20 05:32:37.366000', 2);

INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at)
VALUES ('¿Cuántas horas duermes en promedio por noche?', 1, 1, 4, NOW(), NOW());
INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at)
VALUES ('¿Sueles tener dificultades para conciliar el sueño?', 1, 1, 2, NOW(), NOW());
INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at)
VALUES ('¿Sigues alguna rutina antes de dormir? Si es así, describe brevemente qué haces.', 1, 1, 1, NOW(), NOW());
INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at)
VALUES ('¿Utilizas alguno de estos dispositivos electrónicos antes de dormir?', 1, 1, 3, NOW(), NOW());
INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at)
VALUES ('Considero que mi calidad de sueño es la ideal', 1, 1, 6, NOW(), NOW());
INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at)
VALUES ('Qué factor consideras que más influyen en tu calidad de tu sueño?', 1, 1, 8, NOW(), NOW());
INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at)
VALUES ('Realiza un ranking de las que consideras mejores rutinas para dormir', 1, 1, 7, NOW(), NOW());

INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at)
VALUES ('3', 1, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('4', 1, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('5', 1, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('6', 1, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('7', 1, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('8', 1, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Sí', 2, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('No', 2, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('.', 3, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Celular', 4, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Tableta', 4, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Computadora', 4, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Totalmente en desacuerdo', 5, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('En desacuerdo', 5, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Indiferente', 5, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('De acuerdo', 5, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Totalmente de acuerdo', 5, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Rutina de sueño', 6, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Ambiente de sueño', 6, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Estrés y ansiedad', 6, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Estimulantes', 6, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('.', 6, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Establecer un horario regular para acostarse y levantarse', 7, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Crear un ambiente propicio para dormir', 7, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Evitar las pantallas antes de dormir', 7, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Establecer una rutina de relajación', 7, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Actividad física regular', 7, NOW(), NOW());

INSERT INTO `personalizacion_encuestas` ( `tipografia`, `imagen`, `color_fondo`, `color_principal`, `encuesta_id`) VALUES ('', '/uploads/1686462662.jpg', '#e2dbd9', '#885847', 1);

/*ENCUESTA 2*/
INSERT INTO encuestas (titulo_encuesta, objetivo_encuesta, indicacion_encuesta, fecha_creacion_encuesta, fecha_actualizacion_encuesta, link_encuesta, estado_encuesta, fecha_inicio_encuesta, fecha_finalizacion_encuesta, usuario_id) 
VALUES ('Tecnología y dispositivos electrónicos', 'Recopilar datos sobre los dispositivos electrónicos más utilizados, las actividades realizadas con ellos, las preferencias de marca y las opiniones sobre el impacto de la tecnología en la vida diaria.', 'Por favor, responde a las siguientes preguntas relacionadas con tus hábitos y opiniones sobre tecnología y dispositivos electrónicos.', NOW(), NOW(), '18c6100f96044ba0b14d3392847b9a79', 1, '2023-06-11 06:43:19.289000', '2023-06-29 00:00:00.000000', 2);

INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at) 
VALUES ('¿Cuántos dispositivos electrónicos posees en total?', 0, 2, 4, NOW(), NOW());
INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at) 
VALUES ('¿Tienes preferencias de marca cuando se trata de dispositivos electrónicos?', 0, 2, 2, NOW(), NOW());
INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at) 
VALUES ('¿Cuál es tu dispositivo electrónico más utilizado?', 0, 2, 8, NOW(), NOW());
INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at) 
VALUES ('¿Cuál de las siguientes categorías te identifica mejor en términos de adopción de tecnología?', 0, 2, 5, NOW(), NOW());
INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at) 
VALUES ('¿Has experimentado dificultades para desconectar de tus dispositivos electrónicos?', 0, 2, 2, NOW(), NOW());
INSERT INTO preguntas (texto_pregunta, campo_obligatorio, encuesta_id, tipo_pregunta_id, created_at, updated_at) 
VALUES ('¿Cuáles de las siguientes actividades principales realizas con tus dispositivos electrónicos? (Selecciona todas las opciones que correspondan)', 0, 2, 3, NOW(), NOW());

INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('1', 8, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('2', 8, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('3', 8, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('4', 8, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('5', 8, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Sí', 9, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('No', 9, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Tablet', 10, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Smartphone', 10, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Computadora personal', 10, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('.', 10, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Innovadores', 11, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Adoptantes tempranos', 11, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Mayoría temprana', 11, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Mayoría tardía', 11, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Retardatarios', 11, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Sí', 12, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('No', 12, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Aveces', 12, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Navegar por internet', 13, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Jugar videojuegos', 13, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Ver películas o series en streaming', 13, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Trabajar', 13, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Realizar tareas/productividad', 13, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Usar redes sociales', 13, NOW(), NOW());
INSERT INTO opcion_respuestas (texto_opcion, fk_pregunta_id, created_at, updated_at) 
VALUES ('Realizar compras en línea', 13, NOW(), NOW());

INSERT INTO `personalizacion_encuestas` ( `tipografia`, `imagen`, `color_fondo`, `color_principal`, `encuesta_id`) VALUES ('', '/uploads/1686467530.jpg', '#d8cef0', '#895bd8', 2);
