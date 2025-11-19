#!/bin/bash

START_TIME=$(date +%s%3N)

java -DSTART_TIME=$START_TIME -Dspring.aot.enabled=true -XX:SharedArchiveFile=./appcdsaot/app-cds.jsa -jar ./appcdsaot/spring-petclinic-3.3.0/spring-petclinic-3.3.0.jar
