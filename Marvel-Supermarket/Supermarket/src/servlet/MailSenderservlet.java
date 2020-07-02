package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import allen.MailSender;


/**
 * Servlet implementation class MailSenderservlet
 */
public class MailSenderservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private MailSender sender;
	private Thread t;
	public void init()throws ServletException{
		sender = new MailSender();
		
		//从web.xml中获取参数（现在使用的是定义默认参数）
		/*String server = getInitParameter("server");
		String port = getInitParameter("port");
		String address = getInitParameter("address");
		String username = getInitParameter("username");
		String password = getInitParameter("password");
		if(server == null || port == null || address == null || username == null 
				|| password == null) {
			System.out.println("web.xml出错");
			return;
		}*/
		
		String time = getInitParameter("time");
		if(time != null) {
			sender.setTime(Integer.parseInt(time));
		}
		String validate = getInitParameter("validate");
		if(validate != null) {
			sender.setValidate(Boolean.valueOf(validate).booleanValue());
		}
		t = new Thread(sender);
		t.start();
	}
	public void destroy() {
		sender.stop();
		try {
			t.join(1000);
			System.out.println("邮件发送线程未停止");
		} catch (Exception e) {

		}
	}


}
