#!/bin/bash

if [ -d "/opt/crac-files" ]; then
  echo "/opt/crac-files exists"
  if [ -n "$(find /opt/crac-files -prune -empty -type d 2>/dev/null)" ]
  then
    echo "No checkpoint found, start petclinic"
    java -Dspring.context.checkpoint=onRefresh -XX:CRaCEngine=warp -XX:CRaCTraceStartupTime=true -XX:CRaCCheckpointTo=/opt/crac-files -XX:CPUFeatures=ignore -jar /opt/app/spring-petclinic-4.0.0.jar
  else
    echo "Checkpoint found, restore petclinic from checkpoint"
    java -XX:+CRaCIgnoreRestoreIfUnavailable -XX:+CRaCTraceStartupTime -XX:CRaCRestoreFrom=/opt/crac-files -jar /opt/app/spring-petclinic-4.0.0.jar
  fi
else
  echo "/opt/crac-files does not exist"
fi
#java -Dspring.context.checkpoint=onRefresh -XX:CRaCEngine=warp -XX:CRaCCheckpointTo=/opt/crac-files -XX:CPUFeatures=ignore -jar /opt/app/spring-petclinic-4.0.0.jar