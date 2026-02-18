# Build stage for creating the automatic checkpoint
FROM azul/zulu-openjdk:25-jdk-crac-latest AS builder
LABEL authors="Han Solo"

# Create folder for the checkpoint
RUN mkdir -p /opt/checkpoint

# Copy the petclinic jar file to the container
COPY build/libs/spring-petclinic-4.0.0.jar /opt/app/spring-petclinic-4.0.0.jar

# Start PetClinic with automatic checkpoint and suppress exit code 137 to be able to continue the build
RUN java -Dspring.context.checkpoint=onRefresh -XX:CRaCEngine=warp -XX:CPUFeatures=generic -XX:CRaCCheckpointTo=/opt/checkpoint -jar /opt/app/spring-petclinic-4.0.0.jar || if [ $? -eq 137 ]; then return 0; else return 1; fi



# Runtime stage (Copy the petclinic.jar and checkpoint from the builder stage)
FROM azul/zulu-openjdk:25-jdk-crac-latest
LABEL authors="Han Solo"

# Create folder for the checkpoint
RUN mkdir -p /opt/checkpoint

# Copy the petclinic jar from the builder
COPY --from=builder /opt/app/spring-petclinic-4.0.0.jar /opt/app/spring-petclinic-4.0.0.jar

# Copy the checkpoint file from the builder
COPY --from=builder /opt/checkpoint/core.img /opt/checkpoint/core.img

# Restore the petclinic from the checkpoint
RUN java -XX:CRaCEngine=warp -XX:CRaCRestoreFrom=/opt/checkpoint -XX:+CRaCIgnoreRestoreIfUnavailable -jar /opt/app/spring-petclinic-4.0.0.jar
#ENTRYPOINT ["java","-XX:CRaCEngine=warp -XX:CRaCRestoreFrom=/opt/checkpoint -XX:+CRaCIgnoreRestoreIfUnavailable -jar", "/opt/app/spring-petclinic-4.0.0.jar" ]