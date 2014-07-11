FROM platformer/tomcat7
MAINTAINER Janaka Wickramasinghe <janaka.w@platformer.com>

RUN sed -i 's/archive.ubuntu.com/mirror.orionvm.com.au/g' /etc/apt/sources.list
RUN apt-get -qq update
RUN apt-get -qqy install unzip

ADD jasper_5.6.0-start.sh /usr/local/bin/jasper_5.6.0-start.sh
ADD install_jasper_5.6.0.sh /usr/local/bin/install_jasper_5.6.0.sh
RUN chmod +x /usr/local/bin/jasper_5.6.0-start.sh
RUN chmod +x /usr/local/bin/install_jasper_5.6.0.sh

WORKDIR /tmp
ADD jasperreports-server-cp-5.6.0-bin.zip /tmp/jasperreports-server-cp-5.6.0-bin.zip
RUN unzip /tmp/jasperreports-server-cp-5.6.0-bin.zip
ADD default_master.properties /tmp/jasperreports-server-cp-5.6.0-bin/buildomatic/default_master.properties

CMD ["/usr/local/bin/jasper_5.6.0-start.sh"]

EXPOSE 8080
