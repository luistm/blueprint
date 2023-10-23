# Blueprint

A template to build Python projects.

## Requirements

In order to use this template, you will need to use Python 3.10 or above and have the
following tools installed in your machine:

- [Poetry](https://python-poetry.org)
- [Poetry Plugin: Export](https://github.com/python-poetry/poetry-plugin-export)
- [Poetry Plugin: up](https://github.com/MousaZeidBaker/poetry-plugin-up)

```bash
python --version
# Python 3.10.9
pip install poetry poetry-plugin-export poetry-plugin-up
```

## How to use the blueprint?

1. Clone this repository.
2. Rename the repository directory to your project's name.
3. Run this command to replace all instances of the template's name with your
   project's name within each file (if you're on a Mac read [Other notes](#other-notes) below:

   ```bash
   sed -i 's/blueprint/your-project-name/g' **/*.*
   ```

4. Update the name, author, and description in the `pyproject.toml` file.
5. Update the `README.md` file with content relevant to your project.
6. Rename the `blueprint` directory within the `src` directory with `your-project-name`.

## How to update all the dependencies?

Just run the following command in your project directory:

```bash
make updatelatest
```

## Code style

Just let [Black](https://github.com/psf/black) do its magic.

## Other notes

If you use a Mac, you may need to install `gnu-sed` to run the above `sed` command.

You can install it using [Homebrew](http://brew.sh):

```bash
brew install gnu-sed
```

Read Homebrew's logs to confirm how to run gnu-sed:

```bash
GNU "sed" has been installed as "gsed".
If you need to use it as "sed", you can add a "gnubin" directory
to your PATH from your bashrc like:

    PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
```

For instance, if you get the above message, you can now run the `sed` command like this:

```bash
gsed -i 's/blueprint/your-project-name/g' **/*.*
```
