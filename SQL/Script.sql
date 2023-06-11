INSERT INTO usuarios (nombre_usuario, email, password_digest, activo, created_at, updated_at)
VALUES
  ('Admin', 'admin@email.com', '$2a$12$hPJgDVbPSM8w8oraNh5NLuX6M.lxvG6b1jJ4896s2qdw7wK8V.3vW', true, NOW(), NOW()), /* contra:admin123 */
  ('Juan Perez', 'juanperez@email.com', '$2a$12$IsuBRwBR3xn0tgwqg.zly.Kyk3vb2g3lHYRFVvXmJXxlM4fvdIMB6', true, NOW(), NOW()), /* contra:juan123 */
  ('Felipe Herrrera', 'felipeherrera@email.com', '$2a$12$KnJJLEzxgZeM5MgWHjfo3OENPDQEDVssK.lSzPDIuHwx/3gVu6pju', false, NOW(), NOW()); /* contra:felipe123 */

INSERT INTO tipo_pregunta (pk_tipo,descripcion_tipo) VALUES
  (1, 'Pregunta Abierta'),
  (2, 'Elección Única'),
  (3, 'Elección Multiple'),
  (4, 'Escala Numerica'),
  (5, 'Escala Nominal'),
  (6, 'Escala Likert'),
  (7, 'Ranking'),
  (8, 'Mixta');

INSERT INTO generos (id, valor_genero, created_at, updated_at) VALUES
  (1, 'Masculino', NOW(), NOW()),
  (2, 'Femenino', NOW(), NOW()),
  (3, 'Prefiero no contestar', NOW(), NOW());


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

INSERT INTO pais (nombre_pais) VALUES
('El Salvador'),
('Guatemala'),
('Honduras'),
('Nicaragua'),
('Costa Rica'),
('Panamá');

INSERT INTO region (nombre_region, fk_pais_id) VALUES
('Ahuachapán', 1),
('Cabañas', 1),
('Chalatenango', 1),
('Cuscatlán', 1),
('La Libertad', 1),
('La Paz', 1),
('La Unión', 1),
('Morazán', 1),
('San Miguel', 1),
('San Salvador', 1),
('Santa Ana', 1),
('San Vicente', 1),
('Sonsonate', 1),
('Usulután', 1);

INSERT INTO sub_regions (`nombre_sub_region`, `fk_region_id`, `created_at`, `updated_at`)
VALUES
  ('Ahuachapán', 1,NOW(), NOW()),
('Apaneca', 1,NOW(), NOW()),
('Atiquizaya', 1,NOW(), NOW()),
('Concepción de Ataco', 1,NOW(), NOW()),
('El Refugio', 1,NOW(), NOW()),
('Guaymango', 1,NOW(), NOW()),
('Jujutla', 1,NOW(), NOW()),
('San Francisco Menéndez', 1,NOW(), NOW()),
('San Lorenzo', 1,NOW(), NOW()),
('San Pedro Puxtla', 1,NOW(), NOW()),
('Tacuba', 1,NOW(), NOW()),
('Turín', 1,NOW(), NOW()),
('Cinquera', 2,NOW(), NOW()),
('Dolores', 2,NOW(), NOW()),
('Guacotecti', 2,NOW(), NOW()),
('Ilobasco', 2,NOW(), NOW()),
('Jutiapa', 2,NOW(), NOW()),
('San Isidro', 2,NOW(), NOW()),
('Sensuntepeque', 2,NOW(), NOW()),
('Tejutepeque', 2,NOW(), NOW()),
('Victoria', 2,NOW(), NOW()),
('Agua Caliente', 3,NOW(), NOW()),
('Arcatao', 3,NOW(), NOW()),
('Azacualpa', 3,NOW(), NOW()),
('Chalatenango', 3,NOW(), NOW()),
('Citalá', 3,NOW(), NOW()),
('Comalapa', 3,NOW(), NOW()),
('Concepción Quezaltepeque', 3,NOW(), NOW()),
('Dulce Nombre de María', 3,NOW(), NOW()),
('El Carrizal', 3,NOW(), NOW()),
('El Paraíso', 3,NOW(), NOW()),
('La Laguna', 3,NOW(), NOW()),
('La Palma', 3,NOW(), NOW()),
('La Reina', 3,NOW(), NOW()),
('Las Vueltas', 3,NOW(), NOW()),
('Nueva Concepción', 3,NOW(), NOW()),
('Nueva Trinidad', 3,NOW(), NOW()),
('Nombre de Jesús', 3,NOW(), NOW()),
('Ojos de Agua', 3,NOW(), NOW()),
('Potonico', 3,NOW(), NOW()),
('San Antonio de la Cruz', 3,NOW(), NOW()),
('San Antonio Los Ranchos', 3,NOW(), NOW()),
('San Fernando', 3,NOW(), NOW()),
('San Francisco Lempa', 3,NOW(), NOW()),
('San Francisco Morazán', 3,NOW(), NOW()),
('San Ignacio', 3,NOW(), NOW()),
('San Isidro Labrador', 3,NOW(), NOW()),
('San Luis del Carmen', 3,NOW(), NOW()),
('San Miguel de Mercedes', 3,NOW(), NOW()),
('San Rafael', 3,NOW(), NOW()),
('Santa Rita', 3,NOW(), NOW()),
('Tejutla', 3,NOW(), NOW()),
('Candelaria', 4,NOW(), NOW()),
('Cojutepeque', 4,NOW(), NOW()),
('El Carmen', 4,NOW(), NOW()),
('El Rosario', 4,NOW(), NOW()),
('Monte San Juan', 4,NOW(), NOW()),
('Oratorio de Concepción', 4,NOW(), NOW()),
('San Bartolomé Perulapía', 4,NOW(), NOW()),
('San Cristóbal', 4,NOW(), NOW()),
('San José Guayabal', 4,NOW(), NOW()),
('San Pedro Perulapán', 4,NOW(), NOW()),
('San Rafael Cedros', 4,NOW(), NOW()),
('San Ramón', 4,NOW(), NOW()),
('Santa Cruz Analquito', 4,NOW(), NOW()),
('Santa Cruz Michapa', 4,NOW(), NOW()),
('Suchitoto', 4,NOW(), NOW()),
('Tenancingo', 4,NOW(), NOW()),
('Antiguo Cuscatlán', 5,NOW(), NOW()),
('Chiltiupán', 5,NOW(), NOW()),
('Ciudad Arce', 5,NOW(), NOW()),
('Colón', 5,NOW(), NOW()),
('Comasagua', 5,NOW(), NOW()),
('Huizúcar', 5,NOW(), NOW()),
('Jayaque', 5,NOW(), NOW()),
('Jicalapa', 5,NOW(), NOW()),
('La Libertad', 5,NOW(), NOW()),
('Nueva San Salvador', 5,NOW(), NOW()),
('Nuevo Cuscatlán', 5,NOW(), NOW()),
('Opico', 5,NOW(), NOW()),
('Quezaltepeque', 5,NOW(), NOW()),
('Sacacoyo', 5,NOW(), NOW()),
('San José Villanueva', 5,NOW(), NOW()),
('San Juan Opico', 5,NOW(), NOW()),
('San Matías', 5,NOW(), NOW()),
('San Pablo Tacachico', 5,NOW(), NOW()),
('Santa Tecla', 5,NOW(), NOW()),
('Talnique', 5,NOW(), NOW()),
('Tamanique', 5,NOW(), NOW()),
('Teotepeque', 5,NOW(), NOW()),
('Tepecoyo', 5,NOW(), NOW()),
('Zaragoza', 5,NOW(), NOW()),
('Cuyultitán', 6,NOW(), NOW()),
('El Rosario', 6,NOW(), NOW()),
('Jerusalén', 6,NOW(), NOW()),
('Mercedes La Ceiba', 6,NOW(), NOW()),
('Olocuilta', 6,NOW(), NOW()),
('Paraíso de Osorio', 6,NOW(), NOW()),
('San Antonio Masahuat', 6,NOW(), NOW()),
('San Emigdio', 6,NOW(), NOW()),
('San Francisco Chinameca', 6,NOW(), NOW()),
('San Juan Nonualco', 6,NOW(), NOW()),
('San Juan Talpa', 6,NOW(), NOW()),
('San Juan Tepezontes', 6,NOW(), NOW()),
('San Luis La Herradura', 6,NOW(), NOW()),
('San Luis Talpa', 6,NOW(), NOW()),
('San Miguel Tepezontes', 6,NOW(), NOW()),
('San Pedro Masahuat', 6,NOW(), NOW()),
('San Pedro Nonualco', 6,NOW(), NOW()),
('San Rafael Obrajuelo', 6,NOW(), NOW()),
('Santa María Ostuma', 6,NOW(), NOW()),
('Santiago Nonualco', 6,NOW(), NOW()),
('Tapalhuaca', 6,NOW(), NOW()),
('Zacatecoluca', 6,NOW(), NOW()),
('Anamorós', 7,NOW(), NOW()),
('Bolívar', 7,NOW(), NOW()),
('Concepción de Oriente', 7,NOW(), NOW()),
('Conchagua', 7,NOW(), NOW()),
('El Carmen', 7,NOW(), NOW()),
('El Sauce', 7,NOW(), NOW()),
('Intipucá', 7,NOW(), NOW()),
('La Unión', 7,NOW(), NOW()),
('Lislique', 7,NOW(), NOW()),
('Meanguera del Golfo', 7,NOW(), NOW()),
('Nueva Esparta', 7,NOW(), NOW()),
('Pasaquina', 7,NOW(), NOW()),
('Polorós', 7,NOW(), NOW()),
('San Alejo', 7,NOW(), NOW()),
('San José', 7,NOW(), NOW()),
('Santa Rosa de Lima', 7,NOW(), NOW()),
('Yayantique', 7,NOW(), NOW()),
('Yucuaiquín', 7,NOW(), NOW()),
('Arambala', 8,NOW(), NOW()),
('Cacaopera', 8,NOW(), NOW()),
('Chilanga', 8,NOW(), NOW()),
('Corinto', 8,NOW(), NOW()),
('Delicias de Concepción', 8,NOW(), NOW()),
('El Divisadero', 8,NOW(), NOW()),
('El Rosario', 8,NOW(), NOW()),
('Gualococti', 8,NOW(), NOW()),
('Guatajiagua', 8,NOW(), NOW()),
('Joateca', 8,NOW(), NOW()),
('Jocoaitique', 8,NOW(), NOW()),
('Jocoro', 8,NOW(), NOW()),
('Lolotiquillo', 8,NOW(), NOW()),
('Meanguera', 8,NOW(), NOW()),
('Osicala', 8,NOW(), NOW()),
('Perquín', 8,NOW(), NOW()),
('San Carlos', 8,NOW(), NOW()),
('San Fernando', 8,NOW(), NOW()),
('San Francisco Gotera', 8,NOW(), NOW()),
('San Isidro', 8,NOW(), NOW()),
('San Simón', 8,NOW(), NOW()),
('Sensembra', 8,NOW(), NOW()),
('Sociedad', 8,NOW(), NOW()),
('Torola', 8,NOW(), NOW()),
('Yamabal', 8,NOW(), NOW()),
('Yoloaiquín', 8,NOW(), NOW()),
('Carolina', 9,NOW(), NOW()),
('Chapeltique', 9,NOW(), NOW()),
('Chinameca', 9,NOW(), NOW()),
('Chirilagua', 9,NOW(), NOW()),
('Ciudad Barrios', 9,NOW(), NOW()),
('Comacarán', 9,NOW(), NOW()),
('El Tránsito', 9,NOW(), NOW()),
('Lolotique', 9,NOW(), NOW()),
('Moncagua', 9,NOW(), NOW()),
('Nueva Guadalupe', 9,NOW(), NOW()),
('Nuevo Edén de San Juan', 9,NOW(), NOW()),
('Quelepa', 9,NOW(), NOW()),
('San Antonio del Mosco', 9,NOW(), NOW()),
('San Gerardo', 9,NOW(), NOW()),
('San Jorge', 9,NOW(), NOW()),
('San Luis de la Reina', 9,NOW(), NOW()),
('San Miguel', 9,NOW(), NOW()),
('San Rafael Oriente', 9,NOW(), NOW()),
('Sesori', 9,NOW(), NOW()),
('Uluazapa', 9,NOW(), NOW()),
('Aguilares', 10,NOW(), NOW()),
('Apopa', 10,NOW(), NOW()),
('Ayutuxtepeque', 10,NOW(), NOW()),
('Cuscatancingo', 10,NOW(), NOW()),
('Delgado', 10,NOW(), NOW()),
('El Paisnal', 10,NOW(), NOW()),
('Guazapa', 10,NOW(), NOW()),
('Ilopango', 10,NOW(), NOW()),
('Mejicanos', 10,NOW(), NOW()),
('Nejapa', 10,NOW(), NOW()),
('Panchimalco', 10,NOW(), NOW()),
('Rosario de Mora', 10,NOW(), NOW()),
('San Marcos', 10,NOW(), NOW()),
('San Martín', 10,NOW(), NOW()),
('San Salvador', 10,NOW(), NOW()),
('Santiago Texacuangos', 10,NOW(), NOW()),
('Santo Tomás', 10,NOW(), NOW()),
('Soyapango', 10,NOW(), NOW()),
('Tonacatepeque', 10,NOW(), NOW()),
('Candelaria de la Frontera', 11,NOW(), NOW()),
('Chalchuapa', 11,NOW(), NOW()),
('Coatepeque', 11,NOW(), NOW()),
('El Congo', 11,NOW(), NOW()),
('El Porvenir', 11,NOW(), NOW()),
('Masahuat', 11,NOW(), NOW()),
('Metapán', 11,NOW(), NOW()),
('San Antonio Pajonal', 11,NOW(), NOW()),
('San Sebastián Salitrillo', 11,NOW(), NOW()),
('Santa Ana', 11,NOW(), NOW()),
('Santa Rosa Guachipilín', 11,NOW(), NOW()),
('Santiago de la Frontera', 11,NOW(), NOW()),
('Texistepeque', 11,NOW(), NOW()),
('Apastepeque', 12,NOW(), NOW()),
('Guadalupe', 12,NOW(), NOW()),
('San Cayetano Istepeque', 12,NOW(), NOW()),
('San Esteban Catarina', 12,NOW(), NOW()),
('San Ildefonso', 12,NOW(), NOW()),
('San Lorenzo', 12,NOW(), NOW()),
('San Sebastián', 12,NOW(), NOW()),
('San Vicente', 12,NOW(), NOW()),
('Santa Clara', 12,NOW(), NOW()),
('Santo Domingo', 12,NOW(), NOW()),
('Tecoluca', 12,NOW(), NOW()),
('Tepetitán', 12,NOW(), NOW()),
('Verapaz', 12,NOW(), NOW()),
('Acajutla', 13,NOW(), NOW()),
('Armenia', 13,NOW(), NOW()),
('Caluco', 13,NOW(), NOW()),
('Cuisnahuat', 13,NOW(), NOW()),
('Izalco', 13,NOW(), NOW()),
('Juayúa', 13,NOW(), NOW()),
('Nahuizalco', 13,NOW(), NOW()),
('Nahulingo', 13,NOW(), NOW()),
('Salcoatitán', 13,NOW(), NOW()),
('San Antonio del Monte', 13,NOW(), NOW()),
('San Julián', 13,NOW(), NOW()),
('Santa Catarina Masahuat', 13,NOW(), NOW()),
('Santa Isabel Ishuatán', 13,NOW(), NOW()),
('Santo Domingo de Guzmán', 13,NOW(), NOW()),
('Sonsonate', 13,NOW(), NOW()),
('Sonzacate', 13,NOW(), NOW()),
('Alegría', 14,NOW(), NOW()),
('Berlín', 14,NOW(), NOW()),
('California', 14,NOW(), NOW()),
('Concepción Batres', 14,NOW(), NOW()),
('El Triunfo', 14,NOW(), NOW()),
('Ereguayquín', 14,NOW(), NOW()),
('Estanzuelas', 14,NOW(), NOW()),
('Jiquilisco', 14,NOW(), NOW()),
('Jucuapa', 14,NOW(), NOW()),
('Jucuarán', 14,NOW(), NOW()),
('Mercedes Umaña', 14,NOW(), NOW()),
('Nueva Granada', 14,NOW(), NOW()),
('Ozatlán', 14,NOW(), NOW()),
('Puerto El Triunfo', 14,NOW(), NOW()),
('San Agustín', 14,NOW(), NOW()),
('San Buenaventura', 14,NOW(), NOW()),
('San Dionisio', 14,NOW(), NOW()),
('San Francisco Javier', 14,NOW(), NOW()),
('Santa Elena', 14,NOW(), NOW()),
('Santa María', 14,NOW(), NOW()),
('Santiago de María', 14,NOW(), NOW()),
('Tecapán', 14,NOW(), NOW()),
('Usulután', 14,NOW(), NOW());
