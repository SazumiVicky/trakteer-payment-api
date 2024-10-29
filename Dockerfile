FROM node:latest
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

RUN apt-get update && apt-get install -y haproxy && apt-get clean
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

EXPOSE 80
CMD ["sh", "-c", "service haproxy start && node server.js"]