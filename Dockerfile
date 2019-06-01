FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /inbox

WORKDIR /inbox

COPY Gemfile /inbox/Gemfile

COPY Gemfile.lock /inbox/Gemfile.lock

RUN gem update bundle

RUN bundle install

COPY . /inbox

EXPOSE 3000

ENTRYPOINT ["docker-entrypoint.sh"]
