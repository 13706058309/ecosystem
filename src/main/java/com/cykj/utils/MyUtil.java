package com.cykj.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyUtil {
    public static String getFoatTime(Date date){
        SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");
        return f.format(date);
    }

    public static String getDetailFoatTime(Date date){
        SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return f.format(date);
    }
}
