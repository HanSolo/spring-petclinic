# Build stage
FROM azul/zulu-openjdk:25-jdk-crac-latest AS builder
LABEL authors="Han Solo"
#RUN apt-get update -y

# Create folder for the checkpoint
RUN mkdir -p /opt/crac-files

# Copy the petclinic jar file to the container
COPY build/libs/spring-petclinic-4.0.0.jar /opt/app/spring-petclinic-4.0.0.jar

# Start PetClinic with automatic checkpoint and suppress exit code 137 to be able to continue the build
RUN java -Dspring.context.checkpoint=onRefresh -XX:CRaCEngine=warp -XX:CPUFeatures=ignore -XX:CRaCCheckpointTo=/opt/crac-files -jar /opt/app/spring-petclinic-4.0.0.jar || if [ $? -eq 137 ]; then return 0; else return 1; fi



# Runtime stage
FROM azul/zulu-openjdk:25-jdk-crac-latest
LABEL authors="Han Solo"
#RUN apt-get update -y

# Create folder for the checkpoint
RUN mkdir -p /opt/crac-files

# Copy the petclinic jar from the builder
COPY --from=builder /opt/app/spring-petclinic-4.0.0.jar /opt/app/spring-petclinic-4.0.0.jar

# Copy the checkpoint file from the builder
COPY --from=builder /opt/crac-files/core.img /opt/crac-files/core.img

# Restore the petclinic from the checkpoint
RUN java -XX:CRaCRestoreFrom=/opt/crac-files -XX:+CRaCIgnoreRestoreIfUnavailable -jar /opt/app/spring-petclinic-4.0.0.jar
