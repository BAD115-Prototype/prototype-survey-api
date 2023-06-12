FROM ruby:3.2.2

WORKDIR /home/app

ENV PORT 3000

EXPOSE $PORT

RUN gem install rails bundler
RUN gem install rails
RUN apt-get update -qq && apt-get install -y nodejs
RUN rails s

ENTRYPOINT [ "/bin/bash" ]