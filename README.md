# Phoenix template

Template to quickly start a Phoenix project using Docker.

# Quickstart
1. Create a new repository by "using this template"
2. Run `docker-compose run --service-ports --rm app mix deps.get && mix deps.compile`
3. Open devcontainer in vscode or run `docker-compose up` to start the server
4. Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


# Updating the template

To make tweaks to the template, checkout the `template` branch.


## Changing the Phoenix version

1. Update the `PHOENIX_VERSION` in `Dockerfile`
2. Run `docker-compose build`
3. Open the project in devcontainer and run `mix phx.new . --app app`
4. Do not override the `README.md`
5. Remove sleep `command` from `docker-compose.yml`
6. Enable the `entrypoint.sh` command by uncommenting it in the `Dockerfile`
7. Tweak `dev.exs` to use the correct postgres credentials
```elixir
config :hello, Hello.Repo,
  username: System.get_env("POSTGRES_USER"),
  password: System.get_env("POSTGRES_PASSWORD"),
  database: System.get_env("POSTGRES_DATABASE"),
  hostname: System.get_env("POSTGRES_HOST"),
  port: System.get_env("POSTGRES_PORT"),
```
8. Tweak `dev.exs` to bind to 0.0.0.0
```elixir
config :hello, AppWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4000],
```
9. Add the following lines to `.gitignore`:
```
.vscode
.elixir_ls
tags
```
10. Run `docker-compose build` to rebuild the image


## Changing the version of Elixir

1. Update the base image in the `Dockerfile` to the desired version
2. Run `docker-compose build`


## Changing the version of Postgres

1. Update the image the `docker-compose.yml` to the desired version
