package com.jing.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    public Date stringToDate(String str) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
        Date date = sdf.parse(str);
        return  date;
    }
    public void main(String[] argus) throws ParseException {
        String str = "2017-11-2";
        System.out.println(stringToDate(str));
    }
}
