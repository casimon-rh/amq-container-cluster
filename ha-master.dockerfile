FROM registry.access.redhat.com/ubi8/openjdk-11-runtime@sha256:88599a17f9d463f8b2a2d9a03f6216d20e25370174b0b9556351c986ee0aa9fa
COPY amq-broker-7.10.0-bin.zip .
RUN unzip amq-broker-7.10.0-bin.zip && amq-broker-7.10.0/bin/artemis create broker --user redhat --password openshift --allow-anonymous && \
  chmod -R "g+rwX" broker && \
  chown -R jboss:root broker
COPY ha-master-etc/* broker/etc/
CMD ["broker/bin/artemis", "run"]