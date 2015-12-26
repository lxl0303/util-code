package com.ptmind.api.base.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by zhanhh. Date : 2015/7/22,16:50
 */
public class TelephoneValidate {


    /**
     * str为被验证的字符: 仅能输入数字、－（其他字符无法输入）; true-字符格式正确 ； false-字符格式错误
     */
    public static boolean checkNumber(String str) {
        Pattern p = Pattern.compile("^[0-9-]+$");
        Matcher m = p.matcher(str);
        boolean b = m.matches();
        return b;
    }

}
