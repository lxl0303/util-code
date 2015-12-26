package com.ptmind.api.base.util;

import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 请求HTTP数据
 *
 * @author ts
 */
public class HttpDataTools {

    private static Logger logger = LoggerFactory.getLogger(HttpDataTools.class);

    /**
     * 发送and读取远程URL内容 ,并返回 json对像
     *
     * @param values 要发送的对像
     */
    public static JSONObject sendDataPost(String strURL, String encode, String values) throws Exception {
        JSONObject json = null;

        HttpURLConnection conn = null;
        DataOutputStream dos = null;
        ByteArrayOutputStream baos = null;
        InputStream in = null;
        InputStreamReader inReader = null;
        BufferedReader reader = null;
        try {

            URL url = new URL(strURL);
            conn = (HttpURLConnection) url.openConnection();
            // conn.setRequestProperty("Charset", encode);
            // conn.setRequestProperty("Content-Length",
            // String.valueOf(values.getBytes().length));
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");// application/octet-stream
            // application/x-www-form-urlencoded
            conn.setConnectTimeout(10000);
            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            conn.setUseCaches(false);
            conn.connect();

            dos = new DataOutputStream(conn.getOutputStream());

            dos.writeBytes(values);
            dos.flush();
            dos.close();

            String encoding = conn.getContentEncoding();

            in = conn.getInputStream();

            int len = -1;
            byte[] buffer = new byte[1024];
            baos = new ByteArrayOutputStream();
            while ((len = in.read(buffer)) != -1) {
                baos.write(buffer, 0, len);
            }

            byte[] data = baos.toByteArray();

            String value = null;
            if (encoding != null) {
                value = new String(data, encoding);
            } else {
                value = new String(data, encode);

            }
            if (Constants.DEBUG) {
                // System.out.println(value);
            }
            json = JSONObject.fromObject(value); // JSONTools.string2JSONObject(value);

        } catch (Exception e) {
            throw e;
        } finally {
            if (baos != null) {
                try {
                    baos.close();
                } catch (IOException e) {
                }
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                }
            }
            if (inReader != null) {
                try {
                    inReader.close();
                } catch (IOException e) {
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                }
            }
            if (conn != null) {
                conn.disconnect();
            }

        }

        return json;
    }

    /**
     * 向指定URL发送GET方法的请求
     *
     * @param url   发送请求的URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     *
     * @return URL 所代表远程资源的响应结果
     */
    public static JSONObject sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = StringUtils.isBlank(param) ? url : (url + "?" + param);
            logger.info("----------get请求url：");
            logger.info(urlNameString);
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        JSONObject json = JSONObject.fromObject(result);

        return json;
    }

    /**
     * 以流的方式发送and读取远程URL内容 ,并返回 json对像
     *
     * @param requestType : 请求类型get , post , put , delete
     * @param values      要发送的对像
     */
    public static JSONObject sendData(String strURL, String requestType, String values, final String userPwdKey) throws Exception {
        String encode = "UTF-8";
        if (Constants.DEBUG) {
            logger.info("----------print request url:");
            logger.info(values);
        }
        //生成token
        String token = TokenForNodejs.encrypt(System.currentTimeMillis() + "", userPwdKey);

        JSONObject json = null;
        //		if (values == null) return json;

        HttpURLConnection conn = null;
        DataOutputStream dos = null;
        ByteArrayOutputStream baos = null;
        InputStream in = null;
        InputStreamReader inReader = null;
        BufferedReader reader = null;
        try {
            URL url = new URL(strURL);
            conn = (HttpURLConnection) url.openConnection();
            if (encode != null) { conn.setRequestProperty("Charset", encode); }
            conn.setRequestProperty("Content-Length", String.valueOf(values.getBytes().length));
            // application/x-www-form-urlencoded , application/octet-stream,MediaType.APPLICATION_JSON
            conn.setRequestProperty("Content-Type", MediaType.APPLICATION_JSON);
            //请求头里加入token校验
            if (StringUtils.isNotBlank(token)) {
                conn.setRequestProperty("token", token);
            }
            conn.setConnectTimeout(10000);
            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setRequestMethod(requestType);
            conn.setUseCaches(false);
            conn.connect();

            dos = new DataOutputStream(conn.getOutputStream());
            if (encode != null) {
                dos.write(values.getBytes(encode));
            } else {
                dos.write(values.getBytes());
            }
            dos.flush();
            dos.close();

            String encoding = conn.getContentEncoding();

			/*if (Constants.DEBUG) {
                logger.info(new String("----------打印请求参数:".getBytes(encode),"UTF-8"));
				logger.info(new String(values.getBytes(encode),"UTF-8"));
			}*/

            in = conn.getInputStream();

            int len = -1;
            byte[] buffer = new byte[1024];
            baos = new ByteArrayOutputStream();
            while ((len = in.read(buffer)) != -1) {
                baos.write(buffer, 0, len);
            }

            byte[] data = baos.toByteArray();

            String value = null;
            if (encoding != null) {
                value = new String(data, encoding);
            } else {
                value = new String(data);

            }

            //			if (encode != null) {
            //				value = new String(data, encode);
            //			} else {
            //				value = new String(data);
            //			}
            // value = new String(data,"utf-8");
            if (Constants.DEBUG) {
                logger.info("----------print response data:");
                logger.info(value);
            }
            json = JSONObject.fromObject(value);

        } catch (Exception e) {
            throw e;
        } finally {
            if (baos != null) {
                try {
                    baos.close();
                } catch (IOException e) {
                }
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                }
            }
            if (inReader != null) {
                try {
                    inReader.close();
                } catch (IOException e) {
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                }
            }
            if (conn != null) {
                conn.disconnect();
            }

        }

        return json;
    }

    /**
     * get请求
     */
    public static JSONObject sendData(String getURL) throws Exception {
        Response response = null;
        JSONObject json = null;
        try {
            System.out.println("----------模拟浏览器GET请求：" + getURL);

            Client client = ClientBuilder.newClient();
            WebTarget target = client.target(getURL);
            response = target.request().get();
            String value = response.readEntity(String.class);
            //打印返回的json数据
            System.out.println("----------打印返回数据:");
            System.out.println(value);
            json = JSONObject.fromObject(value);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (response != null) {
                response.close();//关闭连接
            }
        }
        return json;
    }

    /**
     * get请求
     */
    public static JSONObject get(String getURL) throws Exception {
        Response response = null;
        JSONObject json = null;
        try {
            logger.info("----------simulation browser request url ：" + getURL);

            Client client = ClientBuilder.newClient();
            WebTarget target = client.target(getURL);
            response = target.request().get();
            String value = response.readEntity(String.class);
            //打印返回的json数据
            logger.info("----------print response data :");
            logger.info(value);
            json = JSONObject.fromObject(value);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (response != null) {
                response.close();//关闭连接
            }
        }
        return json;
    }

    public static String sendDataReturnString(String strURL, String encode, String values) throws Exception {
        String result = null;
        if (values == null) { return result; }

        HttpURLConnection conn = null;
        DataOutputStream dos = null;
        ByteArrayOutputStream baos = null;
        InputStream in = null;
        InputStreamReader inReader = null;
        BufferedReader reader = null;
        try {
            URL url = new URL(strURL);
            conn = (HttpURLConnection) url.openConnection();
            if (encode != null) { conn.setRequestProperty("Charset", encode); }
            conn.setRequestProperty("Content-Length", String.valueOf(values.getBytes().length));
            conn.setRequestProperty("Content-Type", "application/octet-stream");// application/octet-stream
            // application/x-www-form-urlencoded
            conn.setConnectTimeout(10000);
            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            conn.setUseCaches(false);
            conn.connect();

            if (Constants.DEBUG) {
                System.out.println(values);
            }

            dos = new DataOutputStream(conn.getOutputStream());
            if (encode != null) {
                dos.write(values.getBytes(encode));
            } else {
                dos.write(values.getBytes());
            }
            dos.flush();
            dos.close();

            String encoding = conn.getContentEncoding();

            in = conn.getInputStream();

            int len = -1;
            byte[] buffer = new byte[1024];
            baos = new ByteArrayOutputStream();
            while ((len = in.read(buffer)) != -1) {
                baos.write(buffer, 0, len);
            }

            byte[] data = baos.toByteArray();

            String value = null;
            // if (encoding != null) {
            // value = new String(data,encoding);
            // } else {
            // value = new String(data);
            //
            // }

            if (encode != null) {
                result = new String(data, encode);
            } else {
                result = new String(data);
            }
            // value = new String(data,"utf-8");
            if (Constants.DEBUG) {
                System.out.println(result);
            }

        } catch (Exception e) {
            throw e;
        } finally {
            if (baos != null) {
                try {
                    baos.close();
                } catch (IOException e) {
                }
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                }
            }
            if (inReader != null) {
                try {
                    inReader.close();
                } catch (IOException e) {
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                }
            }
            if (conn != null) {
                conn.disconnect();
            }

        }

        return result;
    }

    public static JSONObject sendFileData(String url, File file) {

        JSONObject result = null;

        if (!file.exists() || !file.isFile()) {
            return null;
        }

        HttpURLConnection con = null;
        BufferedReader reader = null;
        OutputStream out = null;
        FileInputStream fis = null;
        DataInputStream in = null;
        try {

            URL urlObj = new URL(url);
            // 连接
            con = (HttpURLConnection) urlObj.openConnection();

            con.setRequestMethod("POST");
            con.setDoInput(true);
            con.setDoOutput(true);
            con.setUseCaches(false);

            // 设置请求头信息
            con.setRequestProperty("Connection", "Keep-Alive");
            con.setRequestProperty("Charset", Constants.DATA_ENCODE);

            // 设置边界
            String boundary = "----------" + System.currentTimeMillis();
            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);

            // 请求正文信息

            // 第一部分：
            StringBuilder sb = new StringBuilder();
            sb.append("--");
            sb.append(boundary);
            sb.append("\r\n");
            sb.append("Content-Disposition: form-data;name=\"file\";filename=\"" + file.getName() + "\"\r\n");
            sb.append("Content-Type:application/octet-stream\r\n\r\n");

            byte[] head = sb.toString().getBytes(Constants.DATA_ENCODE);

            // 获得输出流
            out = new DataOutputStream(con.getOutputStream());
            // 输出表头
            out.write(head);

            // 文件正文
            fis = new FileInputStream(file);
            in = new DataInputStream(fis);
            int bytes = 0;
            byte[] bufferOut = new byte[1024];
            while ((bytes = in.read(bufferOut)) != -1) {
                out.write(bufferOut, 0, bytes);
            }

            // 结尾部分
            byte[] foot = ("\r\n--" + boundary + "--\r\n").getBytes(Constants.DATA_ENCODE);

            out.write(foot);
            out.flush();

            StringBuffer buffer = new StringBuffer();

            reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String line = null;
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
            if (Constants.DEBUG) {
                System.out.println(buffer);
            }
            result = JSONObject.fromObject(buffer.toString());
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                }
            }
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                }
            }
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                }
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                }
            }
            if (con != null) {
                con.disconnect();
            }

        }

        return result;

    }

    private static String map2JSON(Map<String, Object> values) throws UnsupportedEncodingException {
        JSONObject json = JSONObject.fromObject(values);// JSONTools.map2JSONObject(values);
        return json.toString();
    }

    private static String map2String(Map<String, Object> values, String encode) throws UnsupportedEncodingException {
        StringBuilder bd = new StringBuilder();
        Iterator<String> it = values.keySet().iterator();
        while (it.hasNext()) {
            String key = it.next();
            Object value = values.get(key);
            if (value != null) {
                bd.append(URLEncoder.encode(key, encode));
                bd.append("=");
                bd.append(URLEncoder.encode(value.toString(), encode));
                bd.append("&");
            }
        }
        return bd.toString();
    }

    /**
     * 读取远程URL的内容
     *
     * @param urlCode 被读取页面的编码
     */
    public static String sendData(String strURL, String urlCode) throws Exception {

        StringBuffer value = new StringBuffer();

        URLConnection conn = null;
        InputStream in = null;
        InputStreamReader inReader = null;
        BufferedReader reader = null;
        try {
            URL url = new URL(strURL);
            conn = url.openConnection();
            conn.setConnectTimeout(6000);
            in = conn.getInputStream();

            inReader = new InputStreamReader(in, urlCode);
            reader = new BufferedReader(inReader);

            String line = reader.readLine();

            while (line != null) {
                value.append(line);
                line = reader.readLine();
            }

        } catch (Exception e) {
            throw e;
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                }
            }
            if (inReader != null) {
                try {
                    inReader.close();
                } catch (IOException e) {
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                }
            }

        }

        return value.toString();
    }

    /**
     * 以流的方式发送and读取远程URL内容 ,并返回 json对像
     *
     * @param values 要发送的对像()
     */
    public static JSONObject sendData(String strURL, String requestMethod, String values) throws Exception {
        String encode = "UTF-8";
        //生成token
        String token = TokenForNodejs.encrypt(System.currentTimeMillis() + "", "avxrr@!<>$!5645");

        JSONObject json = null;
        //		if (values == null) return json;

        HttpURLConnection conn = null;
        DataOutputStream dos = null;
        ByteArrayOutputStream baos = null;
        InputStream in = null;
        InputStreamReader inReader = null;
        BufferedReader reader = null;
        try {
            URL url = new URL(strURL);
            conn = (HttpURLConnection) url.openConnection();
            if (encode != null) { conn.setRequestProperty("Charset", encode); }
            conn.setRequestProperty("Content-Length", String.valueOf(values.getBytes().length));
            // application/x-www-form-urlencoded , application/octet-stream,MediaType.APPLICATION_JSON
            conn.setRequestProperty("Content-Type", MediaType.APPLICATION_JSON);
            //请求头里加入token校验
            if (StringUtils.isNotBlank(token)) {
                conn.setRequestProperty("token", token);
            }
            conn.setConnectTimeout(10000);
            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setRequestMethod(requestMethod);
            conn.setUseCaches(false);
            conn.connect();

            if (Constants.DEBUG) {
                System.out.println("----------请求url:");
                System.out.println(strURL);
                System.out.println("----------打印请求参数:");
                System.out.println(values);
            }

            dos = new DataOutputStream(conn.getOutputStream());
            if (encode != null) {
                dos.write(values.getBytes(encode));
            } else {
                dos.write(values.getBytes());
            }
            dos.flush();
            dos.close();

            String encoding = conn.getContentEncoding();

            in = conn.getInputStream();

            int len = -1;
            byte[] buffer = new byte[1024];
            baos = new ByteArrayOutputStream();
            while ((len = in.read(buffer)) != -1) {
                baos.write(buffer, 0, len);
            }

            byte[] data = baos.toByteArray();

            String value = null;
            // if (encoding != null) {
            // value = new String(data,encoding);
            // } else {
            // value = new String(data);
            //
            // }

            if (encode != null) {
                value = new String(data, encode);
            } else {
                value = new String(data);
            }
            // value = new String(data,"utf-8");
            if (Constants.DEBUG) {
                System.out.println("----------打印返回数据:");
                System.out.println(value);
            }
            json = JSONObject.fromObject(value);

        } catch (Exception e) {
            throw e;
        } finally {
            if (baos != null) {
                try {
                    baos.close();
                } catch (IOException e) {
                }
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                }
            }
            if (inReader != null) {
                try {
                    inReader.close();
                } catch (IOException e) {
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                }
            }
            if (conn != null) {
                conn.disconnect();
            }

        }

        return json;
    }

}
