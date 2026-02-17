# Build stage
FROM azul/zulu-openjdk:25-jdk-crac-latest AS builder
LABEL authors="hansolo"
RUN apt-get update -y
RUN mkdir -p /opt/crac-files
COPY build/libs/spring-petclinic-4.0.0.jar /opt/app/spring-petclinic-4.0.0.jar

#RUN java -XX:CRaCEngine=warp -XX:CRaCCheckpointTo=/opt/crac-files -XX:CPUFeatures=ignore -jar /opt/app/crac5-25.0.0.jar

COPY startup.sh .
CMD ["/bin/bash","-c","./startup.sh"]


# Runtime stge
FROM azul/zulu-openjdk:25-jdk-crac-latest
LABEL authors="hansolo"
RUN apt-get update -y
RUN mkdir -p /opt/crac-files
COPY --from=builder /opt/app/spring-petclinic-4.0.0.jar /opt/app/spring-petclinic-4.0.0.jar
COPY --from=builder /opt/crac-files/.* /opt/crac-files
RUN java -XX:CRaCRestoreFrom=/opt/crac-files -XX:+CRaCIgnoreRestoreIfUnavailable -jar /opt/app/spring-petclinic-4.0.0.jar
