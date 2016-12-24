package com.akanto.cpp;

import static org.bytedeco.javacpp.avformat.av_register_all;

import java.util.ArrayList;
import java.util.List;

import org.bytedeco.javacpp.LongPointer;


public class CppTest {

    public static void main(String[] args) throws Exception {
        av_register_all();
        try {
            List<LongPointer> lpList = new ArrayList<>();
            //Loader.load(); // crashes with UnsatisfiedLinkError
            for (int i = 0; i < 10000; i++) {
                LongPointer lp = new LongPointer(1000000);
                lpList.add(lp);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }

}