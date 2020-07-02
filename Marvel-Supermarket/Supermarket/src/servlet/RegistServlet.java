package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.events.StartDocument;



import dao.ManageDAO;
import entity.Librarian;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class TaskListServlet
 */
@WebServlet("/RegistServlet")

public class RegistServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ManageDAO  manageDAO =ManageDAO.getInstance();
	
	public RegistServlet() {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String lUserName = request.getParameter("lUserName");
		String lName = request.getParameter("lName");
		String lSex = request.getParameter("lSex");
		String lTel = request.getParameter("lTel");
		String lEmail = request.getParameter("lEmail");
		String lPassword="00010001";
		
		JSONObject jsonObject = new JSONObject();
		
		boolean check=manageDAO.check(lUserName);
		if(check) {
			Librarian librarian = new Librarian(lUserName,lPassword,lName,lSex,lTel,lEmail);
			manageDAO.add(librarian);
			jsonObject.put("isOk", true);
		}else {
			jsonObject.put("isOk", false);
		}
		
		response.getWriter().print(jsonObject.toString());

	}

}

