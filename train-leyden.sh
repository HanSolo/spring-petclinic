#!/bin/bash

# Start Petclinic with previous stored aot cache

START_TIME=$(($(date +'%s * 1000 + %-N / 1000000')))
java -DSTART_TIME=$START_TIME -Dspring.aot.enabled=true -XX:AOTCacheOutput=app.aot -jar leyden/spring-petclinic-3.3.0/spring-petclinic-3.3.0.jar

# ALTERNATIVE WAY TO TRAIN
#java -DSTART_TIME=$START_TIME -Dspring.aot.enabled=true -XX:AOTMode=record -XX:AOTConfiguration=aot-config.json -jar leyden/spring-petclinic-3.3.0/spring-petclinic-3.3.0.jar

# NEEDS TO BE FOLLOWED UP BY THIS TO CREATE AOT CACHE
#java -cp leyden/spring-petclinic-3.3.0/spring-petclinic-3.3.0.jar -XX:AOTMode=create -XX-AOTConfiguration:aot-config.json -XX:AOTCache=aot-cache.jsa -Xlog:class+path=info
