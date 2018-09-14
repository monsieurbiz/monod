FROM node:8.12.0-jessie

RUN apt-get update && \
    apt-get install -y git

USER node

WORKDIR /app

CMD [ "npm", "start" ]
