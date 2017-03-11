FROM gocd/gocd-server:17.2.0
MAINTAINER Karl Stoney <me@karlstoney.com> 

COPY scripts/* /usr/local/bin/
CMD ["/usr/local/bin/run_go.sh"]
