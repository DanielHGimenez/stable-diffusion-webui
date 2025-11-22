FROM ubuntu:22.04

ENV python_cmd="python3.11"

WORKDIR /app

COPY . /app/
RUN chmod -R o+rw /app/
RUN chmod o+x /app/entrypoint.sh

RUN apt update
RUN apt install wget git python3 python3-venv gcc python3-dev libgl1 libglib2.0-0 -y

RUN useradd -u 8877 app
RUN usermod -aG sudo app
USER app

RUN python3 -m venv venv/

ENTRYPOINT [ "/app/entrypoint.sh" ]
