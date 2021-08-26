FROM ruby:3.0.0

ENV RAILS_ENV="production"

ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}



RUN apt-get update -qq && \
  apt-get install -y apt-utils \
  build-essential \
  libpq-dev \
  nodejs \
  vim \
  default-mysql-client 

WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install -j4

ADD . /app


EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-u", "puma", "-b", "0.0.0.0", "-p", "3000", "-e", "production"]
