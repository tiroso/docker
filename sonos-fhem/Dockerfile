FROM perl:5.20
COPY 00_SONOS.pm /usr/src/myapp/00_SONOS.pm

RUN cpanm LWP::Simple
RUN cpanm LWP::UserAgent
RUN cpanm SOAP::Lite
RUN cpanm HTTP::Request
RUN cpanm XML::Parser::Lite

WORKDIR /usr/src/myapp
CMD echo "Starte SONOS"
CMD perl ./00_SONOS.pm 4711 1 1
#CMD [ "perl", "./your-daemon-or-script.pl" ]
