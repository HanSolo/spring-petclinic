#!/bin/bash

START_TIME=$(date +%s%3N)

java -Xshare:off -DSTART_TIME=$START_TIME -jar exploded/spring-petclinic-3.3.0.jar
