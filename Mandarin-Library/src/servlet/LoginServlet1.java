package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LoginDAO;

/**
 * Servlet implementation class LoginServlet1
 */
@WebServlet("/LoginServlet1")
/**
 * �û���Ϣ��֤
 */

public class LoginServlet1 extends HttpServlet {

	private static final long serialVersionUID = 1L;
	//private LoginDAO loginDao = LoginDAO.getInstance();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LoginDAO loginDAO = LoginDAO.getInstance();
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		boolean b = loginDAO.getat(userName, password);
		boolean c = loginDAO.getatNo(userName);

		if (b) {
			request.getSession().setAttribute("userName", userName);
			//request.getRequestDispatcher("admin.jsp").forward(request, response);
			response.sendRedirect(request.getContextPath()+"/admin.jsp");
		} else if (!c) {
			request.setAttribute("allTrue", true);
			request.setAttribute("rNoError", true);
			request.setAttribute("rPassError", false);
			request.getRequestDispatcher("loginAdmin.jsp").forward(request, response);
		} else {
			request.setAttribute("allTrue", true);
			request.setAttribute("rNoError", false);
			request.setAttribute("rPassError", true);
			request.getRequestDispatcher("loginAdmin.jsp").forward(request, response);
		}
	}
}
