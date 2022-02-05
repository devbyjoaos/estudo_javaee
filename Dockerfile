FROM jboss/wildfly:latest

RUN /opt/jboss/wildfly/bin/add-user.sh admin Admin#70365 --silent

ENV JAVA_TTL_CACHE 60

ENV POSTGRES_DRIVER_VERSION=42.2.12
ENV DB_HOST 127.0.0.1
ENV DB_PORT 5432
ENV DB_USER postgres
ENV DB_PASS postgres
ENV DB_NAME books
ENV DATASOURCE_NAME car
ENV DATASOURCE_JNDI java:/car

ADD configuration ${JBOSS_HOME}/standalone/configuration/
ADD app-configuration.cli app-configuration.cli
ADD install.sh install.sh
RUN ./install.sh



ADD build/libs/javaee-1.0-SNAPSHOT.war /deployments/ROOT.war