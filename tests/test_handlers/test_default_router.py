from http import HTTPStatus

from fastapi.testclient import TestClient
import pytest


@pytest.mark.asyncio
async def test_default_router(test_app: TestClient) -> None:
    res = test_app.get("/ping")

    assert res.status_code == HTTPStatus.OK
    assert res.json() == "pong"
