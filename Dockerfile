ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

RUN apk add --no-cache python git make g++ bluez libusb libusb-dev
RUN wget https://nodejs.org/dist/v6.11.5/node-v6.11.5-linux-arm64.tar.gz
RUN tar -xzvf *.gz
RUN cp -R node-v6.11.5-linux-arm64/* /usr/local/

COPY . /room-assistant
WORKDIR /room-assistant
RUN npm install --production && ln -s /data/options.json config/local.json

CMD [ "node", "index.js" ]
