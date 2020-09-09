# Se especifica la imagen base a descargar desde Docker Hub (Incluida la versión)
FROM ruby:2.6
# ES EL DIRECTORIO DE LA IMAGEN
WORKDIR /app
# SON LAS DEPENDENCIAS 
COPY Gemfile Gemfile.lock ./
# AQUI SE INSTALA, BUNDLE ES EL COMANDO QUE USA RUBI
RUN bundle install
# Se copia todo el contenido de la carpeta actual del PC dentro del Workdir en el contenedor (/app)
COPY . .
# jekyll es el framework usado en el proyecto, este comando se usa para iniciar el servidor de jekyll y se pueda comunicar el PC con el contenedor
CMD bundle exec jekyll serve --host 0.0.0.0
