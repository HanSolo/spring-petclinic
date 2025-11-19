#!/bin/bash

START_TIME=$(date +%s%3N)
java -DSTART_TIME=$START_TIME -jar build/libs/spring-petclinic-3.3.0.jar
