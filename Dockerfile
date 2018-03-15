FROM node:carbon-alpine

RUN apk --update add git openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY package.json /opt/resource/package.json
COPY package-lock.json /opt/resource/package-lock.json
WORKDIR /opt/resource
RUN npm install

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*