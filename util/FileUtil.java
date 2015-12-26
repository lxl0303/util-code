package com.ptmind.api.base.util;

import java.io.*;
import java.util.logging.Logger;

/**
 * Created by zhanhh.
 * Date : 2015/8/18,11:02
 */
public class FileUtil {
    static Logger logger = Logger.getLogger(FileUtil.class.getSimpleName());

    /**
     * 输出文件到磁盘
     * @param path
     * @param strOld
     */
    public static void outputWriteFile(String path, String strOld) {
        try {
            OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(path), "utf-8");
            out.write(strOld);
            out.flush();
            out.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 读取文件
     * @param filePath
     * @return
     */
    public static StringBuffer readFile(String filePath) {
        StringBuffer sb = new StringBuffer();
        try {
            String encoding = "UTF-8";
            File file = new File(filePath);
            //判断文件是否存在
            if (file.isFile() && file.exists()) {
                InputStreamReader read = new InputStreamReader(new FileInputStream(file), encoding);//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;
                while ((lineTxt = bufferedReader.readLine()) != null) {
                    sb.append(lineTxt + "\n");
                }
                read.close();
            } else {
                System.out.println("找不到指定的文件 " + filePath);
            }
        } catch (Exception e) {
            System.out.println("读取文件内容出错");
            e.printStackTrace();
        }
        return sb;
    }

    /**
     * 从输入流中读取文件
     * @param ips
     * @return
     */
    public static StringBuffer readFile(InputStream ips) {
        StringBuffer sb = new StringBuffer();
        try {
            String e = "UTF-8";
            InputStreamReader read = new InputStreamReader(ips, e);
            BufferedReader bufferedReader = new BufferedReader(read);
            String lineTxt = null;

            while((lineTxt = bufferedReader.readLine()) != null) {
                sb.append(lineTxt + "\n");
            }
            read.close();
        } catch (Exception var7) {
            System.out.println("读取文件内容出错");
            var7.printStackTrace();
        }
        return sb;
    }


    /**
     * 写文件到磁盘，不覆盖文件中的原有内容，而是追加到原有内容后
     * @param dirPath  目录路径
     * @param fileName 文件名称
     * @param content 要写入的内容
     */
    public static void append(String dirPath,String fileName,String content)throws IOException{
        File file = createFile(dirPath,fileName);
        OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(file,true), "utf-8");
        out.write(content);
        out.flush();
        out.close();
    }

    /**
     * 写文件到磁盘，覆盖文件中的原有内容
     * @param dirPath  目录路径
     * @param fileName 文件名称
     * @param content 要写入的内容
     */
    public static void write(String dirPath,String fileName,String content)throws IOException{
        File file = createFile(dirPath,fileName);
        OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(file,false), "utf-8");
        out.write(content);
        out.flush();
        out.close();
    }

    /**
     * 如果要写入的文件的不存在，则创建该文件
     * @param dirPath 目录路径
     * @param fileName 文件名称
     */
    public static File createFile(String dirPath,String fileName)throws IOException{
        File dir = new File(dirPath);
        if(!dir.exists()){
            dir.mkdirs();
        }
        File file = new File(dirPath,fileName);
        logger.info("dirPath:"+dirPath+"|fileName:"+fileName);
        logger.info("-----------------the result of create file :"+file.createNewFile());
        return file;
    }

}
