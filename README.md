# Blueprint: a python project template

A template to kickstart your Python projects with ease and consistency.

## Introduction

### Installation

To use this template, you need the following tools installed on your machine:

- [Poetry](https://python-poetry.org) for Python package management.
- [Poetry Plugin: Export](https://github.com/python-poetry/poetry-plugin-export)
  for exporting dependencies.
- [Poetry Plugin: up](https://github.com/MousaZeidBaker/poetry-plugin-up)
  for updating dependencies.

Ensure you have Python 3.10 or above installed by running:

```bash
python --version
# Python 3.10.9
```

### Usage

1. Clone this repository.
2. Rename the repository directory to your project's name.
3. Run the following command to replace instances of "blueprint" with your
   project's name:

   ```bash
   sed -i 's/blueprint/your-project-name/g' **/*.*
   ```

   🚨 If you're on a Mac, please read [Other notes](#other-notes) below.

4. Update the project's information in the `pyproject.toml` file, such as the
   name, author, and description
5. Customise the `README.md` with content relevant to your project.
6. Rename the `blueprint` directory within the `src` directory with your
   project's name.

Type `make` in the project root to see the available commands.

## Configuration

### How to update all the dependencies?

Regularly updating project dependencies is crucial for ensuring your project
stays secure and up-to-date with the latest features and bug fixes. To update
all your project dependencies, simply run the following command in your
project directory:

```bash
make updatelatest
```

This command leverages the power of Poetry and its plugins to update your
dependencies efficiently. It helps prevent security vulnerabilities and keeps
your project aligned with the ever-evolving Python ecosystem. By keeping your
dependencies up to date, you ensure that your project remains maintainable and
robust in the long run.

### Code Style

This project enforces a consistent and clean code style using
[Black](https://github.com/psf/black), a highly regarded Python code formatter.
[Black](https://github.com/psf/black) ensures that your code remains neatly formatted
and follows the Python Enhancement Proposals (PEP 8) style guide. To automatically
format your code according to the project's coding style, simply run the following
command in your project directory:

```bash
black .
```

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

## License and Contribution Guidelines

This project is released under the [Unlicense](https://unlicense.org/), which
essentially places it in the public domain. You are free to use, modify, and distribute
this code as you see fit, with no restrictions. Please keep in mind that, since this
project is unlicensed, there are no warranties or guarantees, and you are responsible
for any legal implications of using the code.

If you wish to contribute to this project, we welcome your input. Feel free to submit
issues or pull requests through GitHub. Your contributions are highly valued and appreciated.
