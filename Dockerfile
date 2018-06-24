FROM arm32v7/node:6
MAINTAINER mKeRix

# Install the required packages
RUN apt-get update && apt-get install -y bluetooth bluez libbluetooth-dev libudev-dev libusb-1.0-0-dev

# Copy room-assistant
ADD . /room-assistant

# Build room-assistant
WORKDIR /room-assistant
RUN rm -Rf node_modules && npm install -q --production

# Expose config volume
VOLUME ["room-assistant/config"]

CMD ["node", "index.js"]
