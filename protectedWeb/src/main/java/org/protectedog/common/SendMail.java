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

	        //荐脚磊皋老林家
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); 

	        // 皋老 力格
	        message.setSubject(title); 

	        // 皋老 郴侩
	        message.setText(content);   

	        // 皋老 傈价
	        Transport.send(message);
	        
	        System.out.println("message sent successfully...");
	        
	    } catch (AddressException e) {
	        e.printStackTrace();
	    } catch (MessagingException e) {
	        e.printStackTrace();
	    }
		
	}
	
	
}
