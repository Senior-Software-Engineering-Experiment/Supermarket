package allen;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.mail.HtmlEmail;

import dao.EmailDAO;

public class MailSender implements Runnable {

	@SuppressWarnings("unused")
	private int time = 86400000; // 扫描数据库时间间隔，单位毫秒
	private long lastTime = 0;
	private boolean flag = true; // 停止线程标记
	private String server = "smtp.qq.com"; // SMTP服务器地址
	private String port = "465"; // SMTP服务器端口
	private String address = "18125136@qq.com";
	private String username = "18125136";
	private String password = "ldtyaodveirzbjfd";
	@SuppressWarnings("unused")
	private boolean validate = true;
	@SuppressWarnings("unused")
	private File root = null;

	// MailConfigManager manager = MailConfigManager.getInstance();
	public MailSender() {

	}

	public void setTime(int time) {
		this.time = time;
	}

	public void setServer(String server) {
		this.server = server;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setValidate(boolean validate) {
		this.validate = validate;
	}

	private boolean sendMail(String emailNo, Integer bookno, String title, Integer day) {
		HtmlEmail email = new HtmlEmail();
		try {
			email.setHostName(server);
			email.setSSLOnConnect(true);
			email.setSslSmtpPort(port);
			email.addTo(emailNo);
			email.setFrom(address);
			email.setAuthentication(username, password);
			email.setSubject("Return Remind");
			
			if(day<0 && day!=-1) {
				email.setMsg("Title:《"  + title + "》\n" + "BookNo:" + bookno + "\n" + "This book will expire in " + -day + " days.");
			} else if(day==-1){
				email.setMsg("Title:《"  + title + "》\n" + "BookNo:" + bookno + "\n" + "This book will expire in " + -day + " day.");
			} else if(day==1) {
				email.setMsg("Title:《"  + title + "》\n" + "BookNo:" + bookno + "\n" + "This book has expired " + day + " day.");
			} else {
				email.setMsg("Title:《"  + title + "》\n" + "BookNo:" + bookno + "\n" + "This book has expired " + day + " days.");
			}
			
			email.send();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void sendData() {
		EmailDAO emailDAO = EmailDAO.getInstance();

		Map map = emailDAO.emailAndbookNo();
		List<String> emails = (List<String>) map.get("emails");
		List<Integer> booknos = (List<Integer>) map.get("bookNos");		
		List<String> titles = (List<String>) map.get("titles");
		List<Integer> days = (List<Integer>) map.get("days");
		
		int index = emails.size();
		int Count = 0;
		String email = "";
		Integer bookno = 0;
		String title = "";
		Integer day = 0;
		
		for (; Count < index; Count++) {
			email = emails.get(Count);
			bookno = booknos.get(Count);
			title = titles.get(Count);
			day = days.get(Count);
			sendMail(email, bookno, title, day);
		}
	}

	public void run() {

		while (flag) {// 服务器停止时退出线程
			long k = new Date().getTime() - lastTime;
			if (k < -1000) {// 防止系统修改时间
				lastTime = new Date().getTime();
				continue;
			}
			if (k > 86400000) {
				System.out.println("1");
				sendData();
				lastTime = new Date().getTime();
			}
			try {
				System.out.println("2");
				Thread.sleep(86400000);
			} catch (Exception e) {

			}
		}
	}

	public void stop() {
		flag = false;
	}

	public void setRoot(File root) {
		this.root = root;
	}
}
