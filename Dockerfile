FROM node:8

WORKDIR /app

RUN useradd -ms /bin/bash aws-es-kibana
RUN chown aws-es-kibana:aws-es-kibana /app
RUN mkdir -p /root/.aws && touch /root/.aws/credentials

COPY package.json /app
RUN npm install
COPY index.js /app

EXPOSE 9200

ENTRYPOINT ["node", "index.js"]
