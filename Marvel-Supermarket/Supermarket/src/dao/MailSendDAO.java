package dao;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import org.apache.commons.mail.HtmlEmail;

/**
 * @author lenovo
 *
 */
public class MailSendDAO {
     
	public static MailSendDAO getInstance() {
		  return new MailSendDAO(); 
	}
	    	
	    	
	    public boolean sendMail(String emailNo, String password) {
	    	
				String to =emailNo;// 
				String from = "2295298208@qq.com";//  ˴   д      ֤  QQ      
				Properties properties = System.getProperties();
				properties.put("mail.smtp.host", "smtp.qq.com");
				properties.put("mail.smtp.auth", "true");
				Session session = Session.getDefaultInstance(properties);
				try {
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(from));
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
					message.setSubject("Retrieve Password");
					message.setSentDate(new Date());
					message.setText("Dear reader,your password is "+password);
					Transport transport = session.getTransport("smtp");
					transport.connect("smtp.qq.com", "2295298208", "peksbxmhblcvdifd");					transport.sendMessage(message, message.getAllRecipients());
					transport.close();
					return true;
					
				} catch (MessagingException mex) {
					mex.printStackTrace();
					return false;
				}
	
		
	    	}
}
