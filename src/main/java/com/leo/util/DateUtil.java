package com.leo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by LT on 2015-03-28.
 */
public class DateUtil {
    private static SimpleDateFormat sdf = new SimpleDateFormat();

    public static int getAgeByBirthday(Date birth) {
        Calendar calendar = Calendar.getInstance();
        if (calendar.before(birth)) {
            throw new IllegalArgumentException("生日不能大于当前日期");
        }
        int nowY = calendar.get(Calendar.YEAR),
                nowM = calendar.get(Calendar.MONTH)+1,
                nowD = calendar.get(Calendar.DAY_OF_MONTH);
        calendar.setTime(birth);
        int age = nowY - calendar.get(Calendar.YEAR),
                birthM = calendar.get(Calendar.MONTH)+1,
                birthD = calendar.get(Calendar.DAY_OF_MONTH);
        if(nowM < birthM) {
            age--;
        }else if (nowM == birthM && nowD <birthD) {
            age--;
        }
        return age;
    }

    public static String format(Date date,String pattern){
        sdf.applyPattern(pattern);
        return sdf.format(date);
    }

    public static Date str2Date(String date,String pattern){
        sdf.applyPattern(pattern);
        try {
            return sdf.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Date sql2Util(java.sql.Date date){
        return new Date(date.getTime());
    }

    public static java.sql.Date util2Sql(Date date){
        return new java.sql.Date(date.getTime());
    }
}
