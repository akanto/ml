#!/bin/bash

buid_app() {
  ./gradlew clean build fatjar
}

submit_app() {
  /usr/hdp/current/spark-client/bin/spark-submit --class com.akanto.ml.spark.MnistSpark --master yarn-client --num-executors 3 --driver-memory 2048m --executor-memory 1224m --executor-cores 1 --conf spark.yarn.driver.memoryOverhead=1024 --conf "spark.executor.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=750000000" --conf "spark.driver.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=1000000000" --conf spark.yarn.executor.memoryOverhead=1024 /home/spark/ml/build/libs/ml.jar
}

main() {
    #buid_app
    submit_app
}

[[ "$0" == "$BASH_SOURCE" ]] && main "$@"