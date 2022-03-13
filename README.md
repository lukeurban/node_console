# node_console

#### My docker console for developing NestJS, Angular or any NodeJS app. With zsh installed.

### Config

Create this docker-console configuration in order to utilize full potential of the console

```yml
version: "3.8"
services:
  api:
    image: thatlukeurban/node_console
    container_name: the_app_console
    build:
      dockerfile: ./Dockerfile
      context: .
    ports:
      - 3000:80
    restart: "no"
    volumes:
      - .:/app
    stdin_open: true
    tty: true
    command: zsh
```

### Usage

After creating docker-compose.yml file simply run the container with the command

```bash
docker-compose up -d
```

and finally connect to the console:

```bash
docker-compsoe exec -it the_app_console zsh
```

You can change the container name `the_app_console` in the docker-compose file.

## Links

If you find this to be of value maybe consider buying me a coffee??

<a href="https://www.buymeacoffee.com/thatlukeurban">
<img src="https://github.com/lukeurban/cdn/blob/main/images/bmc-button.png?raw=true" width="200" />
</a>
