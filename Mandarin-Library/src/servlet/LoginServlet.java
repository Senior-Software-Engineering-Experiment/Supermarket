package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LoginDAO;

/**
 * Servlet implementation class ReaderLoginServlet
 */

//此Servlet名叫LoginServlet，Librarian和Reader的登录都通过这个进行。
//统一Librarian和Reader登录
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDAO loginDAO = dao.LoginDAO.getInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		if (userName.length() < 4) {
			boolean aNo = loginDAO.getaNo(userName);
			boolean atest = loginDAO.geta(userName, password);

			if (atest) {
				request.getSession().setAttribute("userName", userName);
				request.getRequestDispatcher("loginAdmin.jsp").forward(request, response);
			} else if (!aNo) {
				request.setAttribute("allTrue", true);
				request.setAttribute("rNoError", true);
				request.setAttribute("rPassError", false);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				request.setAttribute("allTrue", true);
				request.setAttribute("rNoError", false);
				request.setAttribute("rPassError", true);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} else if (userName.length() == 11) {
			boolean rNo = loginDAO.getrNo(userName);
			boolean test = loginDAO.get(userName, password);

			if (test) {
				request.getSession().setAttribute("userName", userName);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else if (!rNo) {
				request.setAttribute("allTrue", true);
				request.setAttribute("rNoError", true);
				request.setAttribute("rPassError", false);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				request.setAttribute("allTrue", true);
				request.setAttribute("rNoError", false);
				request.setAttribute("rPassError", true);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} else {
			boolean lNo = loginDAO.getlNo(userName);
			boolean test = loginDAO.getl(userName, password);

			if (test) {
				request.getSession().setAttribute("userName", userName);
				request.getRequestDispatcher("library.jsp").forward(request, response);
			} else if (!lNo) {
				request.setAttribute("allTrue", true);
				request.setAttribute("rNoError", true);
				request.setAttribute("rPassError", false);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				request.setAttribute("allTrue", true);
				request.setAttribute("rNoError", false);
				request.setAttribute("rPassError", true);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
	}

}
