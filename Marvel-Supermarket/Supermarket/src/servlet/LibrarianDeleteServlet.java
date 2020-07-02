package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.ManageDAO;
import entity.Librarian;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/LibrarianDeleteServlet")
public class LibrarianDeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private ManageDAO librarianmanagedao = ManageDAO.getInstance();
	
	public LibrarianDeleteServlet() {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("dUserName");
		System.out.print(userName);
		
		librarianmanagedao.delete(userName);

		PrintWriter out = response.getWriter();
		out.write(userName);

	}
}
