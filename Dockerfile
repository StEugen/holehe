FROM python:3.11-slim-bullseye

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir "httpx[http2]>=0.23.3"
COPY . /opt/holehe
WORKDIR /opt/holehe
RUN pip install requests
RUN pip install --no-cache-dir .

ENTRYPOINT ["holehe"]
