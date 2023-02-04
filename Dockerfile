FROM elixir:1.14-alpine

# Build args
ARG PHOENIX_VERSION=1.6.15

# Install alpine packages
RUN apk add bash git inotify-tools nodejs-current npm yarn postgresql-client

# Install Phoenix packages
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install --force hex phx_new #{PHOENIX_VERSION}

# App Directory
ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 4000

CMD ["/app/entrypoint.sh"]
