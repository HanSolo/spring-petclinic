#!/bin/bash

START_TIME=$(($(date +'%s * 1000 + %-N / 1000000')))

#java -Xshare:off -XX:DumpLoadedClassList=app-cds.lst -cp build/libs/spring-petclinic-3.3.0.jar PetClinicApplication

java -Xshare:off -XX:DumpLoadedClassList=app-cds.lst -jar build/libs/spring-petclinic-3.3.0.jar
