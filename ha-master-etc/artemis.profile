ARTEMIS_HOME='/opt/amq/amq-broker-7.10.0'
ARTEMIS_INSTANCE='/opt/amq/broker'
ARTEMIS_DATA_DIR='/opt/amq/broker/data'
ARTEMIS_ETC_DIR='/opt/amq/broker/etc'
ARTEMIS_OOME_DUMP='/opt/amq/broker/log/oom_dump.hprof'

ARTEMIS_INSTANCE_URI='file:/opt/amq/broker/'
ARTEMIS_INSTANCE_ETC_URI='file:/opt/amq/broker/etc/'

HAWTIO_ROLE='amq'

# Java Opts
if [ -z "$JAVA_ARGS" ]; then
    JAVA_ARGS="-Dorg.apache.activemq.SERIALIZABLE_PACKAGES=\"*\" -XX:+PrintClassHistogram -XX:+UseG1GC -XX:+UseStringDeduplication -Xms512M -Xmx2G -Dhawtio.disableProxy=true -Dhawtio.realm=activemq -Dhawtio.offline=true -Dhawtio.rolePrincipalClasses=org.apache.activemq.artemis.spi.core.security.jaas.RolePrincipal -Djolokia.policyLocation=${ARTEMIS_INSTANCE_ETC_URI}jolokia-access.xml "
fi

if [ "$1" = "run" ]; then :
fi
