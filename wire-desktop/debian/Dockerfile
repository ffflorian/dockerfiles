FROM debian:stretch
RUN apt-get update
RUN apt-get install -y --no-install-recommends alien curl git make g++ g++-multilib libc6-dev libreadline6-dev
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm@latest
COPY run.sh /
