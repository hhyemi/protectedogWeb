package org.protectedog.common;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	
	public static void mailSend(String title, String content, String receiver) {
		
		String user="protectedog@gmail.com";
		String password="#protectedog1";
		
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com"); 
		prop.put("mail.smtp.port", 465); 
		prop.put("mail.smtp.auth", "true"); 
		prop.put("mail.smtp.ssl.enable", "true"); 
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session=Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
	    try {
	        MimeMessage message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(user));
	        String messageUI;
	        messageUI = "<!DOCTYPE html>" 
	        + "<html>"
	        + "<head>"
	        + "<meta charset=UTF-8>"
	        + "</head>"
	        + "<body>"
	        + "<div style=\"margin-top: 0px; color: #666666; background: #f6f5f1; font-size: 13px; padding: 20px; width: 600px;\" >"
	        + "<div style=\"width: 80%; max-width: 800px; border: 1px solid #dddddd; padding: 20px; margin-right: 0px!important; margin-left: 30px; \">"
	        + "<div align=\"center\">"
	        + "<img src=\"http://192.168.0.19:8080/resources/file/others/favicon.png\" width=\"30px;\" height=\"30px;\" /><br/>"
	        + "<b>보호할개</b>" 
	        + "</div>"
	        + "<p/>"
	        + "<table style=\"display: inline-block; width: 100%; max-width: 750px; margin: 20px auto; border: 0px; background: #ffffff; border-radius: 5px; box-shadow: 0 1px 0 #b5b6b7; border: 1px solid #e8e9ea; margin-top: 5px\">"
	        + "<tbody>"
	        + "<tr>"
	        + "<td style=\"display:inline-block;     margin: 15px 15px 20px 15px;     padding-bottom: 10px;     font-size: 15px;     color: #37353a; no-repeat;     min-height: 32px;     font-weight: bold;     text-indent: 15px;     line-height: 32px; border-bottom: 1px solid #e8e9ea; width: 450px\">이메일 인증 번호 안내 입니다.</td>"
	        + "</tr>"
	        + "<tr>"
	        + "<td style=\"display:block;     width:80%;     max-width: 685px;     background:#ededed;     padding: 10px 20px;     margin: 0 auto;     margin-top: 20px;     border-radius: 5px;\"> "
	        + "<p style=\" display:inline-block;     width:100%;     max-width: 180px;     font-size: 14px;     color:#333333;     font-weight:bold;\">· 인증 번호 </p>"
	        + "							<p style=\" display: inline-block;     width: 100%;     font-size: 14px;     color: #333333;     font-weight:bold; \">" + content + "</p><p/>"
	        + "</td>"
	        + "</tr>"
	        +					"<tr>"
	        +						"<td style=\"height: 20px;\">"
	        +						"</td>"
	        +					"</tr>"
			+ "</tbody>" + "</table>"
			+ "<table style=\" display:inline-block;     width:100%;     max-width: 750px;     margin:20pxauto;     background:#f6f5f1; \">"
			+ "<tbody>" + "</tbody>" + "</table>"
			+ "<table style=\"display:inline-block;     width:100%;     max-width: 750px;     margin:0pxauto;     background:#ffffff;     border-radius:5px;     box-shadow:0 1px 0 #b5b6b7; padding-top:10px; border:1px solid #e8e9ea;\">"
			+ "<tr>"
			+ "<td style=\" display:inline-block;     font-size: 12.5px;     color:#999999;     margin: 0 0 0 15px;     line-height: 25px;     padding: 0 20px 10px 20px; width: 420px; text-align: center;\" >"
			+ "<pre style=\"white-space:pre-wrap;     word-break:break-word;     width:100%;     max-width: 750px;\">copyrightⓒ #protected</pre>"
			+ "</td>" + "</tr>" + "</tbody>" + "</table>" + "</div>"
			+ "</div>" + "</body>" + "</html>";
	        
	        
	    
	        //�����ڸ����ּ�
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); 

	        // ���� ����
	        message.setSubject(title); 

	        // ���� ����
	        message.setText(content);
	        message.setHeader("content-Type", "text/html");

	        message.setContent(messageUI,"text/html; charset=UTF-8");

	        // ���� ����
	        Transport.send(message);
	        
	        System.out.println("message sent successfully...");
	        
	    } catch (AddressException e) {
	        e.printStackTrace();
	    } catch (MessagingException e) {
	        e.printStackTrace();
	    }
		
	}
	
	
}
