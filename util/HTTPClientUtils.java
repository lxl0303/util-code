package com.ptmind.ptengine.api.dataCenter.util;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/**
 * httpclient工具类
 * @author <a href="mailto:huanhuan.zhan@ptthink.com">詹欢欢</a>
 * @since 2016/3/2 - 19:55
 */
public class HTTPClientUtils {
    private static final Logger logger = LoggerFactory.getLogger(HTTPClientUtils.class);

    public String getRequest(String url) throws IOException {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpEntity entity = null;
        String returnValue = "";
        try {
            HttpGet httpGet = new HttpGet(url);
            CloseableHttpResponse response = httpclient.execute(httpGet);

            try {
                logger.debug(response.getStatusLine() + "");
                entity = response.getEntity();
                // do something useful with the response body
                returnValue = EntityUtils.toString(entity);
                logger.debug("data return from mongo back :" + returnValue);
                // and ensure it is fully consumed
                EntityUtils.consume(entity);
                return returnValue;
            } catch (Exception e) {
                logger.error("http request get method error ! ", e);
            } finally {
                response.close();
            }
        } catch (Exception e) {
            logger.error("http request get method error ! ", e);
        } finally {
            httpclient.close();
        }
        return null;
    }

}
