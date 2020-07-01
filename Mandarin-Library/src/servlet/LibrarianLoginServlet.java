package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LibrarianLoginDAO;

/**
 * Servlet implementation class ReaderLoginServlet
 */
@WebServlet("/LibrarianLoginServlet")
public class LibrarianLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LibrarianLoginDAO  LibrarianLoginDAO = dao.LibrarianLoginDAO.getInstance();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LibrarianLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		//System.out.println(userName+';'+password);
		boolean lNo = LibrarianLoginDAO.getlNo(userName);
		boolean test=LibrarianLoginDAO.get(userName,password);
		
		if(test) {
			request.getSession().setAttribute("userName", userName);
			request.getRequestDispatcher("library.jsp").forward(request, response);
		}else if(!lNo){
			request.setAttribute("allTrue", true);
			request.setAttribute("lNoError", true);
			request.setAttribute("lPassError", false);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else {
			request.setAttribute("allTrue", true);
			request.setAttribute("lNoError", false);
			request.setAttribute("lPassError", true);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}

}
