package com.ptmind.api.base.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by zhanhh. Date : 2015/7/27,13:18
 */
public class RegularMatchTools {

    /**
     * 检测邮箱 格式如：mayun@163.com
     */
    public static boolean checkEmail(String str) {
        Pattern p = Pattern.compile("\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+");
        Matcher m = p.matcher(str);
        boolean b = m.matches();
        return b;
    }

    /**
     * 检测密码 1 可以全数字 2 可以全字母 3 可以全特殊字符(~!@#$%^&*.) 4 三种的组合 5 可以是任意两种的组合 6 长度6-20
     */
    public static boolean checkPassword(String str) {
        Pattern p = Pattern.compile("[0-9a-zA-Z(?=[\\x21-\\x7e]+)]{6,20}$");
        Matcher m = p.matcher(str);
        boolean b = m.matches();
        return b;
    }

    /**
     * 检测url地址
     * @param url
     * @return
     */
    public static boolean checkUrl(String url) {
        Pattern p = Pattern.compile("^(http:\\/\\/|https:\\/\\/)?([\\w\\-]+\\.)+[\\w\\-]+(\\/[\\w\\-\\.\\/?\\@\\%\\!\\&=\\+\\~\\:\\#\\;\\,]*)?");
        Matcher m = p.matcher(url);
        boolean b = m.matches();
        return b;
    }

}
