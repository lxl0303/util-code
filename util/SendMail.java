package com.ptmind.api.base.util;

import org.apache.commons.lang.StringUtils;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.File;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;
import java.util.Vector;

/**
 * Title: 使用javamail发送邮件 Description: 演示如何使用javamail包发送电子邮件。这个实例可发送多附件
 *
 * @version 1.0
 */
public class SendMail {

    private String to;// 收件人
    private String from;// 发件人
    private String host;// smtp主机
    private String username;
    private String password;
    private String filename;// 附件文件名
    private String filePath;// 所有附件(文件之间以逗号区分)
    private String subject;// 邮件主题
    private String content;// 邮件正文
    Vector file = new Vector();// 附件文件集合

    /**
     * <br> 方法说明：默认构造器 <br> 输入参数： <br> 返回类型：
     */
    public SendMail() {
    }

    /**
     * <br> 方法说明：构造器，提供直接的参数传入 <br> 输入参数： <br> 返回类型：
     */
    public SendMail(String to, String from, String smtpServer, String username,
                    String password, String subject, String content) {
        this.to = to;
        this.from = from;
        this.host = smtpServer;
        this.username = username;
        this.password = password;
        this.subject = subject;
        this.content = content;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Vector getFile() {
        return file;
    }

    public void setFile(Vector file) {
        this.file = file;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    /**
     * <br> 方法说明：把主题转换为中文 <br> 输入参数：String strText <br> 返回类型：
     */
    public String transferChinese(String strText) {
        //		try {
        //			strText = MimeUtility.encodeText(new String(strText.getBytes(),"UTF-8"), "UTF-8", "B");
        //		} catch (Exception e) {
        //			e.printStackTrace();
        //		}
        return strText;
    }

    /**
     * <br> 方法说明：往附件组合中添加附件 <br> 输入参数： <br> 返回类型：
     */
    public void attachfile() {
        if (StringUtils.isNotBlank(filePath)) {
            String[] pathArr = filePath.replace("，", ",").split(",");
            File testFile = null;
            for (String p : pathArr) {
                //若路径有效，文件存在，加入附件组合
                if (StringUtils.isNotBlank(p)) {
                    testFile = new File(p);
                    if (testFile.exists()) {
                        file.addElement(p);
                    }
                }
            }
        }
    }

    /**
     * <br> 方法说明：发送邮件 <br> 输入参数： <br> 返回类型：boolean 成功为true，反之为false
     */
    public boolean sendMail() {

        // 构造mail session
        Properties props = System.getProperties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props,
                new Authenticator() {
                    public PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            // 构造MimeMessage 并设定基本的值
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            subject = transferChinese(subject);
            msg.setSubject(subject);

            // 构造Multipart
            Multipart mp = new MimeMultipart();

            // 向Multipart添加正文
            MimeBodyPart mbpContent = new MimeBodyPart();
            mbpContent.setText(content);
            // 向MimeMessage添加（Multipart代表正文）
            mp.addBodyPart(mbpContent);

            // 向Multipart添加附件(所有附件路径按逗号分割，放到数组里)
            attachfile();

            Enumeration efile = file.elements();
            while (efile.hasMoreElements()) {

                MimeBodyPart mbpFile = new MimeBodyPart();
                filename = efile.nextElement().toString();
                FileDataSource fds = new FileDataSource(filename);
                mbpFile.setDataHandler(new DataHandler(fds));
                mbpFile.setFileName(fds.getName());
                // 向MimeMessage添加（Multipart代表附件）
                mp.addBodyPart(mbpFile);

            }

            file.removeAllElements();
            // 向Multipart添加MimeMessage
            msg.setContent(mp);
            msg.setSentDate(new Date());
            // 发送邮件
            Transport.send(msg);

        } catch (MessagingException mex) {
            mex.printStackTrace();
            Exception ex = null;
            if ((ex = mex.getNextException()) != null) {
                ex.printStackTrace();
            }
            return false;
        }
        return true;
    }

    //	/**
    //	 * <br>
    //	 * 方法说明：主方法，用于测试 <br>
    //	 * 输入参数： <br>
    //	 * 返回类型：
    //	 */
    //	public static void main(String[] args) {
    //		SendMail sendmail = new SendMail();
    //		sendmail.setHost("smtp.163.com");//接受者的邮箱设置619816998@qq.com
    //		sendmail.setUsername("huan1987_z");//发送者的邮箱用户名
    //		sendmail.setPassword("Zhan3&huan$@!");//发送者的邮箱密码
    //		sendmail.setTo("619816998@qq.com");//接收者
    //		sendmail.setFrom("huan1987_z@163.com");//发送者
    //		sendmail.setSubject("测试邮件主题");
    //		sendmail.setContent("你好这是一个带多附件的测试2！");
    //		sendmail.attachfile("c:/attachment1.txt");
    //		sendmail.attachfile("c:/attachment2.txt");
    //		sendmail.sendMail();
    //
    //	}
}// end