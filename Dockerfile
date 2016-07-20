FROM java:7

RUN mkdir -p /var/subsonic/standalone
RUN wget "http://subsonic.org/download/subsonic-6.0-standalone.tar.gz"
RUN tar xvfz subsonic-6.0-standalone.tar.gz -C /var/subsonic/standalone

COPY startup.sh /var/subsonic/standalone/
RUN chmod 755 /var/subsonic/standalone/startup.sh

EXPOSE 4040
ENTRYPOINT ["/var/subsonic/standalone/startup.sh"]