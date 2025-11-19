#!/bin/bash

# Make sure you set the current JVM to zing21 first
# First run -XX:ProfileLogOut=zing-first-run.log
# Second run -XX:ProfileLogIn=zing-first-run.log -XX:ProfileLogOut=zing-profile.log

START_TIME=$(($(date +'%s * 1000 + %-N / 1000000')))
java -DSTART_TIME=$START_TIME -XX:ProfileLogIn=zing-first-run.log -XX:ProfileLogOut=zing-profile.log -jar build/libs/spring-petclinic-3.3.0.jar
