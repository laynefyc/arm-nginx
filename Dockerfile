############################################################

# Dockerfile to build Nginx container images

# Based on Hypriot

############################################################

FROM resin/rpi-raspbian:latest
MAINTAINER Layne Fyc <layne.fyc@gmail.com>

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
	        ca-certificates \
			        gettext-base \
					    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
