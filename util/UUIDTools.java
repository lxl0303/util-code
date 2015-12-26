package com.ptmind.api.base.util;

import java.util.Random;

/**
 * Created by zhanhh. Date : 2015/7/21,22:34
 */
public class UUIDTools {

    public static long createUUID() {
        String time = System.currentTimeMillis() + "";
        String random = random(3);
        return Long.parseLong(time + random);
    }

    /**
     * 获取count个随机数
     *
     * @param count 随机数个数
     */
    public static String random(int count) {
        StringBuffer sb = new StringBuffer();
        String str = "0123456789";
        Random r = new Random();
        for (int i = 0; i < count; i++) {
            int num = r.nextInt(str.length());
            sb.append(str.charAt(num));
            str = str.replace((str.charAt(num) + ""), "");
        }
        return sb.toString();
    }

    /**
     * 获取count个随机字母
     *
     * @param count 随机数个数
     */
    public static String randomLetters(int count) {
        StringBuffer sb = new StringBuffer();
        String str = "abcdefghijklmnopqrstuvwxyz";
        Random r = new Random();
        for (int i = 0; i < count; i++) {
            int num = r.nextInt(str.length());
            sb.append(str.charAt(num));
            str = str.replace((str.charAt(num) + ""), "");
        }
        return sb.toString();
    }

    /**
     * 生成数字+字母的APIKEY
     */
    public static String generateApikey(){
        String time = System.currentTimeMillis() + "";
        return time+randomLetters(8);
    }
}
