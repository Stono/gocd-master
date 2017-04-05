FROM centos:7 
MAINTAINER Karl Stoney <me@karlstoney.com> 
ENV GO_NOTIFY_CONF /etc/go_notify.conf
COPY gocd.repo /etc/yum.repos.d

RUN yum -y -q install java-1.8.0-openjdk
ENV GO_VERSION=17.3.0
RUN yum -y -q install go-server-$GOCD_VERSION*

COPY scripts/* /usr/local/bin/
CMD ["/usr/local/bin/run_go.sh"]
