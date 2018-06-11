FROM fedora:28
ARG REPOSITORY
ARG BRANCH
RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -
RUN yum -y install git nodejs make gcc-c++ glibc-devel.i686 libstdc++.i686 bzip2-libs compat-readline6
RUN ln -s /usr/lib64/libbz2.so.1.0.6 /usr/lib64/libbz2.so.1.0
RUN git clone "${REPOSITORY}" cloned
WORKDIR cloned
RUN if [ ! -z "${BRANCH}" ]; then git checkout "${BRANCH}"; fi
RUN npm i -g npm@latest
RUN npm install --unsafe-perm
RUN npm run build:linux
