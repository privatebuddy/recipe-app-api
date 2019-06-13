FROM python:3
MAINTAINER SASIN SIRISKAOWKUL

ENV PYTHONUNBUFFERED 1

# Run requirement for pip
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY app /app

# For Security so Docker image won't run using root
#RUN adduser -D user
#USER user