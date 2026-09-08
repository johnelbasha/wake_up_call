FROM ruby:3.4.10

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN bundle install

CMD ["ruby", "bin/run"]

