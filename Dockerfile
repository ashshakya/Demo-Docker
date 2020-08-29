# Command for building the container sending the build arguments.
# docker-compose up --build -d

FROM python:3.8-alpine

ENV PYTHONUNBUFFERED 1

# RUN apt-get update
RUN apk update

# We have to add `phab.renewbuy.com` hosts entry before running each 
# command because adding it once doesn't carry it forward to the images 
# that are built after this one.
RUN mkdir /code

WORKDIR /code

ADD requirements.txt /code/requirements.txt

RUN echo "Installing Requirements"; \
    # Install python project requirements.
    pip install -r /code/requirements.txt -U

# Copy all the code.
COPY . /code/
