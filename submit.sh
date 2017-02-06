#!/bin/bash

cd
git clone https://github.com/akanto/ml.git
cd ml
git checkout cuda

./gradlew clean build fatjar


cd /usr/hdp/current/spark-client
time ./bin/spark-submit --class com.akanto.ml.spark.MnistSpark --master yarn-client --num-executors 3 --driver-memory 2048m --executor-memory 1224m --executor-cores 1 --conf spark.yarn.driver.memoryOverhead=1024 --conf "spark.executor.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=750000000"  --conf "spark.driver.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=1000000000" --conf spark.yarn.executor.memoryOverhead=1024 /home/spark/ml/build/libs/ml.jar

# Used image: https://aws.amazon.com/marketplace/pp/B00FYCDDTE

# nvidia-smi -l 1

# nvidia-smi -q | head
# salt '*' cmd.run 'nvidia-smi -q | head'


#./bin/spark-submit --class com.akanto.ml.spark.HelloSpark --master yarn-client --num-executors 8 --driver-memory 512m --executor-memory 512m --executor-cores 1 /tmp/ml-0.0.1-SNAPSHOT.jar

# ./bin/spark-submit --class com.akanto.ml.spark.MnistSpark --master yarn-client --num-executors 4 --driver-memory 4048m --executor-memory 3024m --executor-cores 1 --conf "spark.executor.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=5700000000 -Dorg.bytedeco.javacpp.maxphysicalbytes=5700000000"  --conf "spark.driver.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=5700000000 -Dorg.bytedeco.javacpp.maxphysicalbytes=5700000000" --conf spark.locality.wait=0 --conf spark.yarn.driver.memoryOverhead=6096 --conf spark.yarn.executor.memoryOverhead=6096 /tmp/ml.jar

# ./bin/spark-submit --class com.akanto.ml.spark.MnistSpark --master yarn-client --num-executors 24 --driver-memory 2048m --executor-memory 1024m --executor-cores 1 --conf spark.yarn.driver.memoryOverhead=2048 --conf spark.yarn.executor.memoryOverhead=2048 /tmp/ml.jar
  ./bin/spark-submit --class com.akanto.ml.spark.MnistSpark --master yarn-client --num-executors 8 --driver-memory 2048m --executor-memory 1224m --executor-cores 1 --conf spark.yarn.driver.memoryOverhead=2048 --conf spark.yarn.executor.memoryOverhead=2048 /tmp/ml.jar

#Works:
./bin/spark-submit --class com.akanto.ml.spark.MnistSpark --master yarn-client --num-executors 8 --driver-memory 2048m --executor-memory 1224m --executor-cores 1 --conf spark.yarn.driver.memoryOverhead=2048 --conf "spark.executor.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=1000000000"  --conf "spark.driver.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=1000000000" --conf spark.yarn.executor.memoryOverhead=2048 /tmp/ml.jar

Ez a jo
./bin/spark-submit --class com.akanto.ml.spark.MnistSpark --master yarn-client --num-executors 3 --driver-memory 2048m --executor-memory 1224m --executor-cores 1 --conf spark.yarn.driver.memoryOverhead=1024 --conf "spark.executor.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=750000000"  --conf "spark.driver.extraJavaOptions=-Dorg.bytedeco.javacpp.maxbytes=1000000000" --conf spark.yarn.executor.memoryOverhead=1024 /home/spark/ml/build/libs/ml.jar


cd
git clone https://github.com/akanto/ml.git
cd ml
git checkout cuda

cp -r salt/gpu /srv/salt/

#
salt '*' state.apply gpu
salt '*' cmd.run 'yum -y update'
salt -G 'hostgroup:worker' cmd.run 'reboot'
reboot


salt '*' cmd.run 'nvidia-smi -q | head'
salt -G 'hostgroup:worker' cmd.run 'nvidia-smi -q | head'


vi src/main/java/com/akanto/ml/spark/MnistSpark.java



sudo salt -G 'hostgroup:worker' cmd.run 'reboot'
sudo reboot

sudo salt '*' cmd.run 'nvidia-smi -q | head'