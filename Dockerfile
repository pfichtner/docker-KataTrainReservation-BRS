FROM python:3.3.6-alpine

MAINTAINER pfichtner "https://github.com/pfichtner"

RUN apk update 
RUN apk add git

WORKDIR /opt/
RUN git clone -b master https://github.com/emilybache/KataTrainReservation.git
WORKDIR /opt/KataTrainReservation/booking_reference_service

RUN pip install cherrypy

CMD ["python", "booking_reference_service.py"]

