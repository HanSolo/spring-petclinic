#!/bin/bash

# Semeru supports org.crac which makes it possible to use -XX:CRaCCheckpointTo and also jcmd

JAVA_HOME=/usr/lib/jvm/semeru-25.jdk
PATH=$PATH:$JAVA_HOME/bin:$JAVA_HOME/lib

START_TIME=$(date +%s%3N)
java -DSTART_TIME=$START_TIME -Dspring.context.checkpoint=onRefresh -XX:CRaCCheckpointTo=./tmp_auto_checkpoint_instanton -jar build/libs/spring-petclinic-3.3.0.jar
