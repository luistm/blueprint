# Blueprint

A template to build Python projects.

## Requirements

In order to use this template, you will need the following tools installed in your
machine:

- [Poetry](https://python-poetry.org)
- [Poetry Plugin: Export](https://github.com/python-poetry/poetry-plugin-export)
- [Poetry Plugin: up](https://github.com/MousaZeidBaker/poetry-plugin-up)

## How to use the blueprint?

1. Clone this repository.
2. Rename the directory to your project's name.
3. Run this command to replace all instances of the template name with your
   project name within each file:

   ```bash
   sed -i 's/blueprint/your-project-name/g' **/*.*
   ```

4. Update the description in `pyproject.toml`.
5. Update the `README.md` file.
6. Rename the `blueprint` directory in the `src` directory to your project name.

## How to update all dependencies?

Just run the following command in your project directory:

```bash
make updatelatest
```

## Code Style

Just let [Black](https://github.com/psf/black) do its magic.

## Other notes

If you use a Mac, you may need to install `gnu-sed` to run the above `sed` command.

You can install it using [Homebrew](http://brew.sh):

```bash
brew install gnu-sed
```
