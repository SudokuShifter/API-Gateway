FROM python:3.11-slim-bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /BACKEND

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

COPY pyproject.toml uv.lock .python-version ./
RUN uv sync --no-dev --no-cache --frozen --no-install-project --no-editable

COPY . .

EXPOSE 8000
CMD ["uv", "run", "main.py"]
