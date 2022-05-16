#syntax=docker/dockerfile:1
FROM centos:centos7

COPY nginx.repo /etc/yum.repos.d/
COPY nginx.conf /etc/nginx/nginx.conf
COPY ./package/web /usr/share/nginx/html
COPY ./package/frame_service /frame_service

RUN yum install -q -y  yum-utils && yum install -q -y nginx

EXPOSE 80/tcp

CMD nginx&&cd /frame_service&&./frame