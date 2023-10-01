FROM ruby:3.1.0-alpine

RUN apk add --update --no-cache \
  build-base \
  postgresql-dev \
  tzdata \
  nodejs

WORKDIR /app

COPY Gemfile* ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
