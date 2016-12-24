#!/bin/bash

scp -i ~/.ssh/seq-master.pem build/libs/ml-0.0.1-SNAPSHOT.jar cloudbreak@172.21.250.109:/tmp/ml-0.0.1-SNAPSHOT.jar
scp -i ~/.ssh/seq-master.pem build/libs/ml.jar cloudbreak@172.21.250.109:/tmp/ml.jar

# cd /usr/hdp/current/spark-client
#./bin/spark-submit --class com.akanto.ml.spark.HelloSpark --master yarn-client --num-executors 8 --driver-memory 512m --executor-memory 512m --executor-cores 1 /tmp/ml-0.0.1-SNAPSHOT.jar

# ./bin/spark-submit --class com.akanto.ml.spark.MnistSpark --master yarn-client --num-executors 4 --driver-memory 4048m --executor-memory 3024m --executor-cores 1 --conf "spark.executor.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=5700000000 -Dorg.bytedeco.javacpp.maxphysicalbytes=5700000000"  --conf "spark.driver.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=5700000000 -Dorg.bytedeco.javacpp.maxphysicalbytes=5700000000" --conf spark.locality.wait=0 --conf spark.yarn.driver.memoryOverhead=6096 --conf spark.yarn.executor.memoryOverhead=6096 /tmp/ml.jar

# ./bin/spark-submit --class com.akanto.ml.spark.MnistSpark --master yarn-client --num-executors 24 --driver-memory 2048m --executor-memory 1024m --executor-cores 1 --conf spark.yarn.driver.memoryOverhead=2048 --conf spark.yarn.executor.memoryOverhead=2048 /tmp/ml.jar
  ./bin/spark-submit --class com.akanto.ml.spark.MnistSpark --master yarn-client --num-executors 8 --driver-memory 2048m --executor-memory 1224m --executor-cores 1 --conf spark.yarn.driver.memoryOverhead=2048 --conf spark.yarn.executor.memoryOverhead=2048 /tmp/ml.jar

#Works:
./bin/spark-submit --class com.akanto.ml.spark.MnistSpark --master yarn-client --num-executors 8 --driver-memory 2048m --executor-memory 1224m --executor-cores 1 --conf spark.yarn.driver.memoryOverhead=2048 --conf "spark.executor.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=1000000000"  --conf "spark.driver.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=1000000000" --conf spark.yarn.executor.memoryOverhead=2048 /tmp/ml.jar

./bin/spark-submit --class com.akanto.ml.spark.MnistSpark --master yarn-client --num-executors 8 --driver-memory 2048m --executor-memory 1224m --executor-cores 1 --conf spark.yarn.driver.memoryOverhead=1024 --conf "spark.executor.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=500000000"  --conf "spark.driver.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=500000000" --conf spark.yarn.executor.memoryOverhead=1024 /tmp/ml.jar