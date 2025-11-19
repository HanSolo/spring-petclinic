#!/bin/bash

START_TIME=$(($(date +'%s * 1000 + %-N / 1000000')))

#java -Xshare:dump -XX:SharedClassListFile=app-cds.lst -XX:SharedArchiveFile=app-cds.jsa -cp build/libs/spring-petclinic-3.3.0.jar PetClinicApplication

java -Xshare:dump -XX:SharedClassListFile=app-cds.lst -XX:SharedArchiveFile=app-cds.jsa -jar build/libs/spring-petclinic-3.3.0.jar
