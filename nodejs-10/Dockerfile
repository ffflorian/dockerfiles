FROM node:10
ARG REPOSITORY
ARG BRANCH
RUN git clone "${REPOSITORY}" cloned
WORKDIR cloned
RUN if [ ! -z "${BRANCH}" ]; then git checkout "${BRANCH}"; fi
RUN yarn
RUN yarn test
