#!/bin/bash

BATCH_ROOT=/usr/local/batch_app
BATCH_JAR=tavi-medtronic-batch.jar
REPORT_PATH=/usr/local/batch_app/reports
CONFIG_PATH=/usr/local/batch_app/config
PG_MODE=9
FROM_TIME=20010101120000

# バッチアプリケーション起動
java -jar ${BATCH_ROOT}/${BATCH_JAR} \
	3 \
	super_admin \
	cfcd208495d565ef66e7dff9f98764da \
	10 \
	${REPORT_PATH} \
	${CONFIG_PATH} \
	${PG_MODE} \
	${FROM_TIME}

