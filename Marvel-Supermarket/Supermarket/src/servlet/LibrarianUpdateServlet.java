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

@WebServlet("/LibrarianUpdateServlet")
public class LibrarianUpdateServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private ManageDAO librarianmanagedao = ManageDAO.getInstance();
	
	public LibrarianUpdateServlet() {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("eid");
		
		String newName = request.getParameter("newName");
		String newSex = request.getParameter("newSex");
		String newEmail = request.getParameter("newEmail");
		String newTelep = request.getParameter("newTelep");
		
		Librarian newLibrarian=new Librarian();
		
		newLibrarian.setlUserName(userName);
		newLibrarian.setlName(newName);
		newLibrarian.setlSex(newSex);
		newLibrarian.setlEmail(newEmail);
		newLibrarian.setlTel(newTelep);
		librarianmanagedao.update(newLibrarian);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("newL",newLibrarian);

		PrintWriter out = response.getWriter();
		out.write(jsonObject.toString());

	}
}
