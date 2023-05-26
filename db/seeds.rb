# seeds.rb
Usuario.create(
  nombre_usuario: "Kenya",
  email: "kenyaerivas@gmail.com",
  password: "Pa$$w0rd321",
  activo: true
)

Encuesta.create(
  titulo_encuesta: "Encuesta de satisfacción del cliente",
  objetivo_encuesta: "Recopilar feedback de los clientes para mejorar nuestros productos y servicios",
  indicacion_encuesta: "Por favor, complete la encuesta con sinceridad y brinde comentarios detallados.",
  fecha_creacion_encuesta: DateTime.now,
  fecha_actualizacion_encuesta: DateTime.now,
  link_encuesta: "https://www.google.com/",
  estado_encuesta: true,
  fecha_inicio_encuesta: DateTime.now,
  fecha_finalizacion_encuesta: DateTime.now + 14.days,
  usuario_id: 1
)

Encuesta.create(
  titulo_encuesta: "Encuesta de hábitos de compra",
  objetivo_encuesta: "Comprender los patrones de compra de nuestros clientes para ofrecer mejores ofertas y promociones",
  indicacion_encuesta: "Por favor, responda a las preguntas con respecto a sus hábitos de compra.",
  fecha_creacion_encuesta: DateTime.now,
  fecha_actualizacion_encuesta: DateTime.now,
  link_encuesta: "https://www.google.com/",
  estado_encuesta: true,
  fecha_inicio_encuesta: DateTime.now,
  fecha_finalizacion_encuesta: DateTime.now + 10.days,
  usuario_id: 1
)

Encuesta.create(
  titulo_encuesta: "Encuesta de satisfacción del empleado",
  objetivo_encuesta: "Evaluar la satisfacción y el compromiso de los empleados con la empresa",
  indicacion_encuesta: "Por favor, proporcione su opinión sincera sobre su experiencia laboral en nuestra empresa.",
  fecha_creacion_encuesta: DateTime.now,
  fecha_actualizacion_encuesta: DateTime.now,
  link_encuesta: "https://www.google.com/",
  estado_encuesta: true,
  fecha_inicio_encuesta: DateTime.now,
  fecha_finalizacion_encuesta: DateTime.now + 21.days,
  usuario_id: 1
)


PersonalizacionEncuesta.create(
  tipografia: "Arial",
  imagen: "https://i.imgur.com/1PeQdB4.jpeg",
  color_fondo: "FFFFFF",
  color_principal: "FF0000",
  encuesta_id: 1
)


PersonalizacionEncuesta.create(
  tipografia: "Verdana",
  imagen: "https://i.imgur.com/dZH9gh8.jpeg",
  color_fondo: "F5F5F5",
  color_principal: "0000FF",
  encuesta_id: 2
)


PersonalizacionEncuesta.create(
  tipografia: "Helvetica",
  imagen: "https://i.imgur.com/a5fk7XM.jpeg",
  color_fondo: "ECECEC",
  color_principal: "00FF00",
  encuesta_id: 3
)

Pregunta.create(
  texto_pregunta: "¿Pregunta realizada correctamente?",
  campo_obligatorio: true,
  encuesta_id: 1,
  tipo_pregunta_id: 1
)

Pregunta.create(
  texto_pregunta: "¿La pregunta se ha creado satisfactoriamente?",
  campo_obligatorio: false,
  encuesta_id: 1,
  tipo_pregunta_id: 1
)