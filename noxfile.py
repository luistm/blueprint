import nox


@nox.session(python=["3.12", "3.13"])
def tests(session):
    session.install("-r", "requirements.txt")
    session.run("pytest", ".")
