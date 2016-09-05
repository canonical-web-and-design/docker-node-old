Usage
===

  $ ./run \
    [-l|--local-override-module]  # Load an individual node module from a local directory instead of installed packages \
    [-h|--help]                   # Show these instructions \
    [COMMAND]                     # Optionally provide a command to run

Commands
---

The following commands are built-in:

- install: Install new packages (takes the same options as `npm install`)
- update-dependencies: Update dependencies from the `package.json` file
- clean: Remove all containers and volumes
- usage: Show these usage instructions

But you can also specify any binaries from the installed NPM dependencies.

For example, if `packages.json` includes `gulp` as a dependency, then you could run the `test` gulp command with:

  $ ./run gulp test
