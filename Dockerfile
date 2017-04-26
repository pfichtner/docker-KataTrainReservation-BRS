FROM ubuntu:latest

MAINTAINER pfichtner "https://github.com/pfichtner"

RUN apt-get update && apt-get install -y \
  git \
  python3-cherrypy3

WORKDIR /opt/
RUN git clone -b master https://github.com/emilybache/KataTrainReservation.git
WORKDIR /opt/KataTrainReservation/booking_reference_service

# bind to 0.0.0.0 instead of 127.0.0.1
RUN sed -i '/"server.socket_port"/a cherrypy.config.update({"server.socket_host" : "0.0.0.0"})' booking_reference_service.py

CMD ["python3", "booking_reference_service.py"]

