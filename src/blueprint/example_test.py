import pytest


def test_unit():
    assert True is True  # nosec


@pytest.mark.integration
def test_integration():
    assert True is True  # nosec
