FROM python:2.7-alpine
MAINTAINER ssages@outbrain.com

ADD .  /app

RUN pip install -r /app/requirements.txt

EXPOSE 8080

WORKDIR /app

CMD ["python", "src/main.py"]
