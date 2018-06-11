FROM debian:jessie
ARG BRANCH
ENV REPOSITORY="https://github.com/wireapp/wire-desktop"
RUN apt-get update
RUN apt-get install -y curl git make g++ alien g++-multilib libc6-dev
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm@latest
RUN git clone "${REPOSITORY}" "wire-desktop"
WORKDIR "wire-desktop"
RUN if [ ! -z "${BRANCH}" ]; then git checkout "${BRANCH}"; fi
RUN npm install --unsafe-perm
RUN npm run build:linux
