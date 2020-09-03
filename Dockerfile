# AQUI BUSCO LA IMAGEN DE LA MISMA VERSION O AFINES
FROM ruby:2.6
#ES EL DIRECTORIO DE LA IMAGEN
WORKDIR /app
#SON LAS DEPENDENCIAS 
COPY Gemfile Gemfile.lock ./
# AQUI SE INSTALA, BUNDLE ES EL COMANDO QUE USA RUBI
RUN bundle install
# PARA QUE SE COPIE TODO AQUI
COPY . .
# jeckyll es un framework para que se abra la pagina y se pueda comunicar el pc con el contenedor
CMD bundle exec jekyll serve --host 0.0.0.0
