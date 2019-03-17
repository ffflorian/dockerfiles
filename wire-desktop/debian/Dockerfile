FROM node:10-slim

RUN set -ex; \
    apt-get update && \
    apt-get install --no-install-recommends -y \
    alien curl git make g++ g++-multilib libc6-dev libreadline6

COPY run.sh /
