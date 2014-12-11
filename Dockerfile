FROM debian:jessie
MAINTAINER Dan Sowter "daniels@everydayhero.com.au"
ENV REFRESHED_AT 2014-12-11

ADD http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb /influxdb_latest_amd64.deb
RUN mkdir -p /opt/influxdb/shared/data && \
    dpkg -i /influxdb_latest_amd64.deb && \
    rm -rf /opt/influxdb/shared/data

ADD config /config

EXPOSE 8083 8086 25826 4444
ENTRYPOINT ["/usr/bin/influxdb"]
CMD ["-config=/config/config.toml"]
