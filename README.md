## arm-nginx
This is my first arm images. I create it base on Hypriot.

1. download path file
    
    ````bash
    git clone git@github.com:laynefyc/arm-nginx.git
    ````

2. start nginx

    ````bash
    cd arm-nginx
    
    docker run -d -it -p 80:80 \
    -v `pwd`/www:/www  \
    -v `pwd`/config:/etc/nginx/sites-enabled \
    -v `pwd`/logs:/var/log/nginx \
    laynefyc/arm_nginx
    ````

## Source url
* git url: [arm-nginx](https://github.com/laynefyc/arm-nginx/)

* Dockerfile source: [arm-nginx](https://github.com/laynefyc/arm-nginx/blob/master/Dockerfile)

* Dockerfile code

    ````docker
    FROM resin/rpi-raspbian:latest
    MAINTAINER Layne Fyc <layne.fyc@gmail.com>

    RUN apt-get update \
         && apt-get install -y nginx \
         && apt-get -y clean


    RUN ln -sf /dev/stdout /var/log/nginx/access.log \
        && ln -sf /dev/stderr /var/log/nginx/error.log

    EXPOSE 80 443
    
    CMD ["nginx", "-g", "daemon off;"]

