FROM node:10
RUN apt-get update
RUN apt-get install -y libgtk2.0-0 libx11-xcb1 libxtst6 libxss1 libgconf-2-4 libnss3 libasound2
COPY run.sh /
RUN chmod +x /run.sh
RUN npm i -g yarn@latest
