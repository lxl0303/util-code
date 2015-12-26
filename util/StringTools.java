package com.ptmind.api.base.util;

import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class StringTools {

    /**
     * 导出时　替换系统　不能命名的符号－－>　/\:*?""<>|  ==> replacement
     *
     * @param str         传入的文件文件名
     * @param replacement 　　替换成的字符
     */
    public static String replaceAllSystemChar(String str, String replacement) {
        str = str.replaceAll("/", replacement)
                .replaceAll("\\\\", replacement)
                .replaceAll("\\*", replacement)
                .replaceAll("\\?", replacement)
                .replaceAll(":", replacement)
                .replaceAll("\"", replacement)
                .replaceAll("<", replacement)
                .replaceAll(">", replacement)
                .replaceAll("\\|", replacement);
        return str;
    }

    /**
     * 替换特殊字符 "->&quot;
     */
    public static String filterHtml(String input) {
        if (input == null) {
            return null;
        }
        if (input.length() == 0) {
            return input;
        }
        input = input.replace("&", "&amp;");
        input = input.replace("<", "&lt;");
        input = input.replace(">", "&gt;");
        input = input.replace(" ", "&nbsp;");
        input = input.replace("'", "&#39;");
        input = input.replace("\"", "&quot;");
        input = input.replace("\r\n", "<br>");
        return input.replace("\n", "<br>");
    }

    /**
     * 替换特殊字符 &quot;->"
     */
    public static String oppositeFilterHtml(String input) {
        if (input == null) {
            return null;
        }
        if (input.length() == 0) {
            return input;
        }
        input = input.replace("&amp;", "&");
        input = input.replace("&lt;", "<");
        input = input.replace("&gt;", ">");
        input = input.replace("&nbsp;", " ");
        input = input.replace("&#39;", "'");
        return input = input.replace("&quot;", "\"");
    }

    /**
     * 导出替换特殊字符 &quot;->"
     */
    public static String selectHtml(String output) {
        if (output == null) {
            return null;
        }
        if (output.length() == 0) {
            return output;
        }
        return output.replace("&quot;", "-").replace("/", "-").replace(":", "-").replace("?", "-").replace("\\", "-").replace("%", "-").replace("*", "-").replace(
                "&lt;", "-").replace("&gt;", "-").replace(";", "-").replace(",", "，");

    }

    /**
     * URL 头部是否包含HTTP:// 如不包含则添加
     *
     * @param url 需要操作的URL
     */
    public static String addHttp(String url) {
        String result = null;
        if (StringUtils.isNotBlank(url)) {
            if (url.startsWith("http://") || url.startsWith("https://")) {
                result = url;
            } else {
                result = "http://" + url;
            }
        }
        return result;
    }

    /**
     * 将\ 转换成 \\ 讲 ' 转换成 \' 提供用户设置后台字符过滤
     * <p>
     * // \\  \'
     */
    public static String convert(String str) {
        if (StringUtils.isNotBlank(str)) {
            str = str.replace("\\", "\\\\");
            str = str.replace("'", "\\'");
        } else {
            str = "";
        }
        return str;
    }

    /**
     * 用于邮件换行 \r\n -> <br>
     */
    public static String newLine(String str) {
        return str.replace("\r\n", "<br>");
    }

    public static void main(String[] args) {
        //		System.out.println(newLine("asdf\r\n"));
    }

    /**
     * 过滤CV和页面组的url 前端数据库不变 后台数据库因原数据已转码 录入也需要转 只有正则加()
     *
     * @param flag 不为空表示正则   ""表示前后完全匹配
     *
     * @return 2013年3月6日, PM 04:47:54
     */
    public static String filterCVGroupUrl(String input, String flag) {

        if (input == null) {
            return null;
        }
        if (input.length() == 0) {
            return input;
        }

        return input;


        // 如果是正则 加括号  else 不加
        //        if(StringUtils.isBlank(flag)){
        //        	 input = input.replace("\"", "%22");
        //             input = input.replace("'", "%27");
        //             input = input.replace("=", "%3D");
        //             return input = input.replace(",", "%2C");
        //        }else{
        //        	 input = input.replace("\"", "(%22)");
        //             input = input.replace("'", "(%27)");
        //             input = input.replace("=", "(%3D)");
        //             return input = input.replace(",", "(%2C)");
        //        }
        //input.replace("\\", "(%5C)");
    }

    /**
     * 全部URl部分
     */
    public static String setUrl(String url) {
        String result = url;
        /*try {
			result = java.net.URLEncoder.encode(url,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return url;
		}
		result = result.replace("%3F", "?");*/
        return result;
    }

    public static String getUrl(String url) {
        String result = url;
		/*try {
			result = java.net.URLDecoder.decode(url, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return url;
		}*/
        if (StringUtils.isNotBlank(result)) {
            result = result.replace("\"", "&quot;");
        }
        return result;
    }

    /**
     * 根据URL和过滤器获取生成的文件名
     *
     * @param url    页面URL
     * @param filter 过滤器条件
     */
    public static String getExportName(String url, String filter) {

        if (StringUtils.isBlank(url)) {
            return url;
        }

        // 有过滤器
        if (StringUtils.isNotBlank(filter)) {

        } else {

        }
        return url;
    }

    /**
     * 去除分隔符内容的重复
     *
     * @param filter 字符串
     * @param s      分隔符
     *
     * @return 不重复字符串
     */
    public static String getDifString(String filter, String s) {
        if (org.apache.commons.lang.StringUtils.isBlank(filter)) {
            return filter;
        }
        String result = "";
        String[] str = filter.split(s);
        List<String> list = new ArrayList<String>();
        Set<String> set = new HashSet<String>();
        for (String string : str) {
            set.add(string);
        }
        list.addAll(set);
        for (int i = 0; i < list.size(); i++) {
            result += list.get(i);
            if (i != list.size() - 1) {
                result += s;
            }
        }
        return result;
    }

}
