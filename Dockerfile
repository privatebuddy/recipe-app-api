FROM python:3.7-alpine
MAINTAINER SASIN SIRISKAOWKUL

ENV PYTHONUNBUFFERED 1

# Run requirement for pip
COPY ./requirements.txt /requirements.txt

# Run Install Postgres Client
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps gcc libc-dev linux-headers postgresql-dev

# Run Install All Requirement for Django Project
RUN pip install -r /requirements.txt

# Remove Temp
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY app /app

# For Security so Docker image won't run using root
#RUN adduser -D user
#USER user