FROM ruby:3.0.0
ENV RUNTIME_PACKAGES="linux-headers libxml2-dev make gcc libc-dev nodejs tzdata mysql-dev mysql-client yarn" \
    DEV_PACKAGES="build-base curl-dev" 
RUN mkdir /back
WORKDIR /back
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
    libpq-dev \        
    sudo 


COPY Gemfile /back/Gemfile
COPY Gemfile.lock /back/Gemfile.lock
RUN bundle install
RUN gem install bundler
COPY . /back
RUN mkdir -p tmp/sockets

EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000", "-e", "development"]
