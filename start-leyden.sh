#!/bin/bash

# Start Petclinic with previous stored aot cache

START_TIME=$(date +%s%3N)
java -DSTART_TIME=$START_TIME -Dspring.aot.enabled=true -XX:AOTCache=app.aot -jar leyden/spring-petclinic-3.3.0/spring-petclinic-3.3.0.jar

