FROM gocd/gocd-server:17.2.0
MAINTAINER Karl Stoney <me@karlstoney.com> 

# Fix bug with logs, see https://github.com/gocd/gocd/issues/3246
RUN ln -sf /var/log/go-server/go-server.out.log /var/log/go-server/go-server.log

ADD run_go.sh /usr/local/bin
CMD ["/usr/local/bin/run_go.sh"]
