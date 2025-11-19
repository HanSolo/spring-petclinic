#!/bin/bash

START_TIME=$(date +%s%3N)

#java -DSTART_TIME=$START_TIME -XX:SharedArchiveFile=app-cds.jsa -cp build/libs/spring-petclinic-3.3.0.jar PetClinicApplication

#java -DSTART_TIME=$START_TIME -XX:SharedArchiveFile=app-cds.jsa -jar build/libs/spring-petclinic-3.3.0.jar

java -DSTART_TIME=$START_TIME -XX:SharedArchiveFile=./appcds/app-cds.jsa -jar ./appcds/spring-petclinic-3.3.0/spring-petclinic-3.3.0.jar
