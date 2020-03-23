#!/bin/bash

# 環境ファイルの読み込み
. $(dirname $0)/batch.env

# 現在の日付設定
if [ $# -ne 1 ]; then
    currentDate=`date +"%Y%m%d"`
else
    currentDate=$1
fi

CONFIG_PATH=/usr/local/batch_app/config
MAKER_TYPE=1

# バッチアプリケーション起動
java -jar ${BATCH_ROOT}/${BATCH_JAR} 2 ${currentDate} ${CONFIG_PATH} ${MAKER_TYPE} > /dev/null 2>&1
