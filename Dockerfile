############################################################

# Dockerfile to build Nginx container images

# Based on Hypriot

############################################################

FROM resin/rpi-raspbian:latest
MAINTAINER Layne Fyc <layne.fyc@gmail.com>

RUN apt-get update \
     && apt-get install -y nginx \
	      && apt-get -y clean

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
