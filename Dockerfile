FROM python:3.7.0-slim-stretch
MAINTAINER Gabe Sinkin <gsinkin@earnup.com>

RUN apt-get update && \
  apt-get install -yy \
  default-libmysqlclient-dev \
  libpq-dev \
  python-dev \
  telnet \
  unixodbc \
  unixodbc-dev \
  wget && \
  rm -rf /var/apt/cache/*

WORKDIR /usr/local/earnup

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

ENV DATABASE_URI= \
  CONFIG_ENV= \
  AWS_REGION=us-west-2 \
  REDIS_HOST= \
  REDIS_PORT=6379 \
  JOB_NAME= \
  PORT=5000

EXPOSE $PORT

ENTRYPOINT ["sh", "-c", "/usr/local/earnup/entrypoint.sh", "${JOB_NAME}"]
