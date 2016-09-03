Usage
===

  $ ./run \
    [--port NUM]          # Specify local port for server \
    [--debug|--no-debug]  # Toggle Django's DEBUG setting \
    [--db|--no-db]        # Toggle attaching a database to the webapp \
    [--watch|--no-watch]  # Toggle running "watch" script alongside server \
    [COMMAND]             # Optionally provide a command to run

If no COMMAND is provided, `server` will be run.

Commands
---

- install: Install new packages (takes the same options as `npm install`)
- update-dependencies: Update dependencies from the `package.json` file
- usage: Show these usage instructions
