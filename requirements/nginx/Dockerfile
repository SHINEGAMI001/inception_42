FROM debian:bullseye

RUN apt-get update -y && apt install -y \
	nginx openssl


RUN openssl req -x509 -nodes -days 365 -newkey \
	rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=MR/ST=Martil/L=Tetouan/O=42/OU=42/CN=hlachhab.42.fr"

COPY /tools/nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]