#!/bin/bash

JAVA_HOME=/usr/lib/jvm/semeru-25.jdk
PATH=$PATH:$JAVA_HOME/bin:$JAVA_HOME/lib

START_TIME=$(date +%s%3N)
java -DSTART_TIME=$START_TIME -XX:CRaCRestoreFrom=./tmp_auto_checkpoint_instanton
