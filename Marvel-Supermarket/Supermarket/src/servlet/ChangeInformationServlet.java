package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dao.ReaderDAO;


@WebServlet("/ChangeInformationServlet")
public class ChangeInformationServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");

		String email = req.getParameter("email");
		String name = req.getParameter("name");
		String readerno = String.valueOf(req.getSession().getAttribute("userName"));
		System.out.println(readerno);
		ReaderDAO readerDAO = ReaderDAO.getInstance();
		readerDAO.changeReaderemail(readerno, email);
		readerDAO.changeReadername(readerno, name);
		
	}
}


