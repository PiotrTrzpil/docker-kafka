FROM wurstmeister/kafka:0.10.0.0

ADD log4j.properties /opt/kafka_2.11-0.10.0.0/config/log4j.properties

ADD http://central.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.5/jmx_prometheus_javaagent-0.5.jar /usr/app/jmx_prometheus_javaagent.jar

ADD prometheus-config.yml /usr/app/prometheus-config.yml

RUN sed -i 's#while netstat#export KAFKA_OPTS=\nexport KAFKA_JMX_OPTS=\nwhile netstat#g' /usr/bin/start-kafka.sh
