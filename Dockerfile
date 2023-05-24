# Use LTS Node.js slim image
FROM node:slim

# Video support dependency
RUN apt-get update && apt-get install -y ffmpeg wget

# Install NPM dependencies and copy the project
WORKDIR /teddit
COPY package.json package-lock.json ./
RUN npm ci --omit=optional
COPY src/ ./
COPY config.js.template ./config.js

# RUN find ./static/ -type d -exec chmod -R 777 {} \;

EXPOSE 8080

CMD npm start
