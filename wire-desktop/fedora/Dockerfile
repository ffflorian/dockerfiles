FROM fedora:28
RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -
RUN yum -y install alien bzip2-libs gcc-c++ git glibc-devel.i686 libstdc++.i686 compat-readline6 make nodejs xz
RUN ln -s /usr/lib64/libbz2.so.1.0.6 /usr/lib64/libbz2.so.1.0
RUN npm i -g npm@latest
COPY run.sh /
