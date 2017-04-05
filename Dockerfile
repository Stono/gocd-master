FROM centos:7 
MAINTAINER Karl Stoney <me@karlstoney.com> 
ENV LANG=en_US.utf8
ENV GO_NOTIFY_CONF /etc/go_notify.conf
ENV GO_VERSION=17.3.0

COPY gocd.repo /etc/yum.repos.d
RUN yum -y -q install git mercurial subversion openssh-clients bash unzip java-1.8.0-openjdk go-server-$GOCD_VERSION* && \
    yum -y -q clean all

EXPOSE 8153 8154

COPY scripts/* /usr/local/bin/
CMD ["/usr/local/bin/run_go.sh"]
