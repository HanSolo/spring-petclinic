#!/bin/bash

# Enable checkpoint compression (will reduce restore time a bit)
# export CRAC_CRIU_OPTS=--compress
# future version will support -XX:CRaCEngine=warp, -XX:CRaCEngine=criu and -XX:CRaCEngine=simengine

START_TIME=$(date +%s%3N)
java -DSTART_TIME=$START_TIME -Dspring.context.checkpoint=onRefresh -XX:CRaCCheckpointTo=./tmp_auto_checkpoint_criu -jar build/libs/spring-petclinic-3.3.0.jar
