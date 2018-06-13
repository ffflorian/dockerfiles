FROM debian:jessie
RUN apt-get update
RUN apt-get install -y curl git make g++ alien g++-multilib libc6-dev
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm@latest
COPY run.sh /
