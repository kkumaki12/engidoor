FROM ruby:3.0.0
RUN mkdir /back
WORKDIR /back
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
    libpq-dev \        
    sudo \
    nginx

COPY Gemfile /back/Gemfile
COPY Gemfile.lock /back/Gemfile.lock
RUN bundle install
RUN gem install bundler
COPY . /back
RUN mkdir -p tmp/sockets


# nginx
RUN groupadd nginx
RUN useradd -g nginx nginx
ADD nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

RUN chmod +x /back/entrypoint.sh

CMD ["/back/entrypoint.sh"]
