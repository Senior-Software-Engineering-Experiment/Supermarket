package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.LocationDAO;

/**
 * Servlet implementation class DeleteLocationServlet
 */
@WebServlet("/DeleteLocationServlet")
public class DeleteLocationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LocationDAO locationDAO = LocationDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteLocationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        int bookid = Integer.parseInt(request.getParameter("deleteLocationNo"));
        locationDAO.delete(bookid);
        response.sendRedirect("library.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
