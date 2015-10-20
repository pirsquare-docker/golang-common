FROM centos:6.6
MAINTAINER Ryan Liao <pirsquare.ryan@gmail.com>

RUN yum -y update; \
yum install -y gcc gcc-g++ git make mercurial openssl-devel wget tar xz xz-libs sudo

WORKDIR /opt

RUN wget -O /opt/go1.4.1.src.tar.gz https://storage.googleapis.com/golang/go1.4.1.src.tar.gz \
&& cd /opt && tar xzf go1.4.1.src.tar.gz -C /opt  \
&& cd /opt/go/src && ./all.bash

ADD files/golang.sh /etc/profile.d/golang.sh

RUN chmod 755 /etc/profile.d/golang.sh && /etc/profile.d/golang.sh

RUN go get golang.org/x/tools/cmd/... && go get golang.org/x/tools/cmd/godoc





