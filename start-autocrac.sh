#!/bin/bash

START_TIME=$(($(date +'%s * 1000 + %-N / 1000000')))
java -DSTART_TIME=$START_TIME -Dspring.context.checkpoint=onRefresh -XX:CRaCCheckpointTo=./tmp_checkpoint -jar build/libs/spring-petclinic-3.2.0.jar
