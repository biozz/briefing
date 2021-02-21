FROM ruby:3-slim-buster

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nodejs sqlite3 libsqlite3-dev postgresql-client libpq-dev imagemagick build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile* ./
RUN bundle config set --local without 'development' \
    && bundle install
