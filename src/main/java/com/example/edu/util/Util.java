package com.example.edu.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

public class Util {

    public static String get32uuid(){
        return UUID.randomUUID().toString().replace("-", "");
    }


    public static String getCurrentTime(){
        LocalDateTime time = LocalDateTime.now();
        return time.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }
}
