# ubuntudesign/node docker image

A docker image for running node commands while keeping dependencies up-to-date with dependencies defined in `./package.json`.

## Project format

The project may have a `./package.json` file to define its NPM dependencies.

The local folder must *not* have a `./node_modules` folder.

## Usage

Every time a command is run the image will check for a `package.json` file and if it finds one it will ensure dependencies are up-to-date.

### Basic usage

For the most basic usage, run the following from your application directory:

``` bash
$ docker run --volume `pwd`:/app ubuntudesign/node COMMAND
```

E.g.:

``` bash
$ docker run --volume `pwd`:/app ubuntudesign/node npm list
```

This will mount your application directory at `/app` inside the container, install packages from `/app/package.json`, and then run the desired command.

### Saving dependencies

The above command works but will install packages from scratch every time it's run. To avoid this, create a named data volume for the installed packages like so:

``` bash
$ docker run \
         --volume `pwd`:/app \
         --volume packages:/packages/node_modules \
         COMMAND
```

The first time you run the above command it will save the packages into the a data volume called `packages`. On subsequent runs it will load the same data volume, and only re-install requirements if `package.json` has been updated.

### Linking local packages

You can optionally link to individual NPM packages from your local computer, override what's been installed from NPM.

For example, let's say there is an NPM package called `awesome-package` which is defined in `./package.json`, but you also have a development version of `awesome-package` in `~/projects/awesome-package` which you'd like to use instead. You can do this as follows:

``` bash
$ docker run \
         --volume `pwd`:/app \
         --volume packages:/packages/node_modules \
         --volume ~/projects/awesome-package:/packages/overrides/awesome-package \
         COMMAND
```

This will cause `node` to use the module in `~/projects/my-modules` instead of the one pulled down from NPM.

### docker-compose.yml

[docker-compose](https://docs.docker.com/compose/) provides a standard way of
defining docker services for a project within a `docker-compose.yml` file.

A standard `docker-compose.yml` for the `ubuntudesign/node` image:

``` yaml
# docker-compose.yml

webapp:
    image: ubuntudesign/node:v1.0.4
    volumes:
      - "packages:/packages/node_modules"
      - .:/app
```
