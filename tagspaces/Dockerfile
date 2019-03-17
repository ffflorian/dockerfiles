FROM node:10-slim

RUN set -ex; \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        git && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/tagspaces/tagspaces.git && \
    cd tagspaces && \
    yarn && \
    yarn install-ext

WORKDIR /tagspaces

EXPOSE 3000

CMD [ "yarn", "run-web" ]
