#!/bin/bash

START_TIME=$(date +%s%3N)
java -DSTART_TIME=$START_TIME -XX:CRaCEngine=warp -XX:CRaCRestoreFrom=./tmp_manual_checkpoint_warp_no_compression
