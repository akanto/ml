package com.akanto.ml.spark;

import java.util.ArrayList;
import java.util.List;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.Function;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HelloSpark {

    private static final Logger log = LoggerFactory.getLogger(HelloSpark.class);

    private static final int NUM_SAMPLES = 1000 * 1000;

    public static void main(String[] args) throws Exception {

        log.info("****************** Start hello Spark ******************");
        SparkConf sparkConf = new SparkConf();

        sparkConf.setMaster("local[*]");

        sparkConf.setAppName("My Pi Example");
        JavaSparkContext sc = new JavaSparkContext(sparkConf);

        List<Integer> l = new ArrayList<>(NUM_SAMPLES);
        for (int i = 0; i < NUM_SAMPLES; i++) {
            l.add(i);
        }

        long count = sc.parallelize(l).filter(new Function<Integer, Boolean>() {
            public Boolean call(Integer i) {
                double x = Math.random();
                double y = Math.random();
                return x * x + y * y < 1;
            }
        }).count();

        log.info("****************** Pi is roughly: {} ******************", 4.0 * count / NUM_SAMPLES);

    }
}
