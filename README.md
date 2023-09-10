# Cake Mold

Cake Mold is a template to build python projects.

## Requirements

In order to use this templace, you will need the following installed in your
machine:

- [Poetry](https://python-poetry.org)
- [Poetry Plugin: Export](https://github.com/python-poetry/poetry-plugin-export)
- [Poetry Plugin: up](https://github.com/MousaZeidBaker/poetry-plugin-up)

## How to use ?

1. Clone this repository.
2. Rename the directory to your project name.
3. Run this command to replace all instances of the template name with your
   project name within each file:

   ```bash
   sed -i 's/cakemold/your-project-name/g' **/*.*
   ```

4. Updated the description in `pyproject.toml`.
5. Update the `README.md` file.
6. Rename the `cakemold` directory in the `src` directory to your project name.

## How to update all dependencies ?

Just run in your project directory:

```bash
make updatelatest
```

## Code Style

Just let [Black](https://github.com/psf/black) do it's magic.

## Other notes

If you are using a mac, you may need to install `gnu-sed` to run the above sed.

```bash
brew install gnu-sed
```
