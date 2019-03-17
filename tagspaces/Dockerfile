FROM node:10-slim

RUN set -ex; \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        git && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 -b v3.1.1 https://github.com/tagspaces/tagspaces.git && \
    cd tagspaces && \
    yarn --network-timeout 100000 install && \
    yarn --network-timeout 100000 install-ext

WORKDIR /tagspaces

EXPOSE 3000

CMD [ "yarn", "run-web" ]
