package com.example.answer.component;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
    public static String getLocalTime(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
        Date date = new Date();
        String s = simpleDateFormat.format(date);
        return s;
    }
}
