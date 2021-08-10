FROM ruby:3.0.0
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs \
   && rm -rf /var/lib/apt/lists/* 
RUN mkdir /back
WORKDIR /back
COPY Gemfile /back/Gemfile
COPY Gemfile.lock /back/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /back
RUN mkdir -p tmp/sockets
