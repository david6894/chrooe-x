FROM node:slim

WORKDIR /home/choreouser

EXPOSE 3060

COPY . /home/choreouser/

ENV PM2_HOME=/tmp

RUN apt update &&\
    apt install --only-upgrade linux-libc-dev &&\
    apt-get install -y iproute2 vim netcat-openbsd curl openssl coreutils &&\
    npm install -g pm2 &&\
    addgroup --gid 10001 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10001 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\
    chmod +x index.js swith server web &&\
    npm install

CMD [ "node", "index.js" ]

USER 10001
