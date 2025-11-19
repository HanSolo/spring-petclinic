#!/bin/bash

START_TIME=$(($(date +'%s * 1000 + %-N / 1000000')))
java -DSTART_TIME=$START_TIME -XX:CRaCEngine=simengine -XX:CRaCRestoreFrom=./tmp_auto_checkpoint
