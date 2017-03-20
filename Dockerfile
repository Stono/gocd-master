FROM gocd/gocd-server:17.2.0
MAINTAINER Karl Stoney <me@karlstoney.com> 

ENV GO_NOTIFY_CONF /etc/go_notify.conf

RUN update-ca-certificates -f 
RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure
COPY scripts/* /usr/local/bin/
CMD ["/usr/local/bin/run_go.sh"]
