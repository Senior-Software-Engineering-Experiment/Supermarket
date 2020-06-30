package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

import dao.LibrarianLoginDAO;
import dao.MailSendDAO;
import dao.ReaderDAO;
import entity.Reader;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ForgotPassServlet
 */
@WebServlet("/ForgotPassServlet")
public class ForgotPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LibrarianLoginDAO librarianDAO = LibrarianLoginDAO.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgotPassServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		ReaderDAO readerDAO = ReaderDAO.getInstance();
		String code = getStr();
		JSONObject jsonObject = new JSONObject();
		String userName = request.getParameter("username");
		String userEmail = request.getParameter("email");
		
		if (userName.length() == 8) {
			boolean fit = librarianDAO.forgotPass(userName, userEmail);
			if (fit) {
				String to = userEmail;// 
				String from = "1040345070@qq.com";
				Properties properties = System.getProperties();
				properties.put("mail.smtp.hpst", "smtp.qq.com");
				properties.put("mail.smtp.auth", "true");
				Session session = Session.getDefaultInstance(properties);
				try {
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(from));
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
					message.setSubject("Your Code");
					message.setSentDate(new Date());
					message.setText(code);
					Transport transport = session.getTransport("smtp");
					transport.connect("smtp.qq.com", "1040345070", "mlfonleawphsbbda");// ��֤��QQ�Լ�������֤���루��QQ���룩
					transport.sendMessage(message, message.getAllRecipients());
					transport.close();
					jsonObject.put("userName", userName);
					jsonObject.put("allRight", true);
					jsonObject.put("accountFitEmail", true);
					jsonObject.put("accountType", true);
					jsonObject.put("code", code);
					response.getWriter().print(jsonObject.toString());
				} catch (MessagingException mex) {
					mex.printStackTrace();
				}

			} else {
				// 
				jsonObject.put("allRight", true);
				jsonObject.put("accountFitEmail", false);
				jsonObject.put("accountType", true);
				response.getWriter().print(jsonObject.toString());
			}

		} else if (userName.length() == 11) {
			boolean fit = false;
			Reader reader = readerDAO.getReader(userName);
			if(reader.getEmail().equalsIgnoreCase(userEmail)) {
				fit= true;
			}
			if(fit) {
				code= "0";
				MailSendDAO sendmail = MailSendDAO.getInstance();
	            boolean send = 	sendmail.sendMail(userEmail, reader.getReaderPassword());
	            jsonObject.put("userName", userName);
				jsonObject.put("allRight", true);
				jsonObject.put("accountFitEmail", true);
				jsonObject.put("accountType", true);
				jsonObject.put("code", code);
				response.getWriter().print(jsonObject.toString());
	            
	            //request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
			else {
				// 
				jsonObject.put("allRight", true);
				jsonObject.put("accountFitEmail", false);
				jsonObject.put("accountType", true);
				response.getWriter().print(jsonObject.toString());
			}
			// 
		} else {
			// 
			jsonObject.put("allright", true);
			jsonObject.put("accountFitEmail", true);
			jsonObject.put("accountType", false);
			response.getWriter().print(jsonObject.toString());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public String getStr(){
		String randomStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        StringBuffer sb = new StringBuffer();
        Random random = new Random();
        for(int i=0;i<6;i++){
            sb.append(randomStr.charAt(random.nextInt(randomStr.length())));
        }
        return sb.toString();
    }

}
