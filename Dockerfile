FROM ruby:2.6

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD bundle exec jekyll serve --host 0.0.0.0