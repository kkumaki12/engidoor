FROM ruby:3.0.0
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn
RUN mkdir /engidoor
WORKDIR /engidoor
COPY Gemfile /engidoor/Gemfile
COPY Gemfile.lock /engidoor/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /engidoor
RUN mkdir -p tmp/sockets
# Start the main process.

