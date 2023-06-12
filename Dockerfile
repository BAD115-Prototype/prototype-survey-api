FROM ruby:3.2.2

# Establece el directorio de trabajo en /home/app
WORKDIR /home/app

# Configura la variable de entorno para el puerto
ENV PORT 3000

# Expone el puerto definido
EXPOSE $PORT

# Instala las gemas requeridas para Rails y Bundler
RUN gem install rails bundler --no-document

# Instala las dependencias del sistema necesarias para Rails y Node.js
RUN apt-get update -qq && apt-get install -y build-essential nodejs

# Copia los archivos de la aplicación al directorio de trabajo
COPY . .

# Instala las gemas y ejecuta los comandos de inicialización
RUN bundle install
RUN rails db:migrate

# Configura el comando de inicio del servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
