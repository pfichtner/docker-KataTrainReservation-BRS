FROM python:3.3.6-alpine

MAINTAINER pfichtner "https://github.com/pfichtner"

RUN apk update 
RUN apk add git
RUN pip install cherrypy

WORKDIR /opt/
RUN git clone -b master https://github.com/emilybache/KataTrainReservation.git
WORKDIR /opt/KataTrainReservation/booking_reference_service

# bind to 0.0.0.0 instead of 127.0.0.1
RUN sed -i '/"server.socket_port"/i \    cherrypy.config.update({"server.socket_host" : "0.0.0.0"})' booking_reference_service.py

CMD ["python3", "booking_reference_service.py"]

