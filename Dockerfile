# Stage 1: Builder
FROM python:3.12 AS builder

WORKDIR /app

RUN pip install --upgrade pip setuptools wheel

RUN pip install cmake

# Install system build dependencies
RUN apt-get clean && apt-get -y update && apt-get install -y build-essential cmake libopenblas-dev liblapack-dev libopenblas-dev liblapack-dev

ENV CMAKE_BUILD_PARALLEL_LEVEL=4

RUN python -m venv venv
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Runner
FROM python:3.12-slim AS runner

WORKDIR /app

# Install runtime dependency: libopenblas.so.0 is provided by libopenblas-base.
RUN apt-get update && apt-get install -y build-essential cmake libopenblas-dev liblapack-dev libopenblas-dev liblapack-dev

RUN mkdir -p /tmp/model /tmp/huggingface /tmp/.cache /tmp/.gradio \
    && chmod -R 777 /tmp/model /tmp/huggingface /tmp/.cache /tmp/.gradio

ENV HF_HOME=/tmp/huggingface
ENV HUGGINGFACE_HUB_CACHE=/tmp/huggingface
ENV XDG_CACHE_HOME=/tmp/.cache
ENV GRADIO_CACHE_DIR=/tmp/.gradio

COPY --from=builder /app/venv venv

COPY app.py models.py test_functions.py ./
COPY examples/ /app/examples/
COPY assets/ /app/assets/

ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

EXPOSE 7000

CMD ["python", "app.py"]
