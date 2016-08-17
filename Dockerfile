FROM python:3
MAINTAINER Lasse Pommerenke

ENV REFRESHED_AT 2016-08-17

ENV SRV_DIR=//srv
ENV WORKING_DIR=//srv/pelican
ENV PORT=8000

ADD ./files $SRV_DIR
WORKDIR $WORKING_DIR
RUN mkdir output content cache
VOLUME ["$WORKING_DIR/"]

RUN pip install -r requirements.txt
RUN chmod +x $SRV_DIR/develop_server.sh

EXPOSE $PORT
CMD $SRV_DIR/develop_server.sh restart $PORT
