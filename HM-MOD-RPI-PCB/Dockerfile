FROM armhf/alpine

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update \
		gnupg \
		raspberrypi \
		raspberrypi-libs \
		raspberrypi-dev \
		socat && \ 
		rm -rf /var/cache/apk/*
  
  ENTRYPOINT ["bash","/entrypoint.sh"]
