#!/bin/bash

START_TIME=$(date +%s%3N)
java -DSTART_TIME=$START_TIME -XX:CRaCRestoreFrom=./tmp_auto_checkpoint_liberica
