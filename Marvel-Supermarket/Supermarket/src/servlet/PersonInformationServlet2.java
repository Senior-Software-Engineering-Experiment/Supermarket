package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BorrowDAO;
import dao.FineDAO;
import dao.ReaderDAO;
import entity.Borrow;
import entity.Reader;


/**
 * Servlet implementation class PersonInformationServlet
 */
@WebServlet("/PersonInformationServlet2")

public class PersonInformationServlet2 extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3521459949118518106L;
	private BorrowDAO borrowDAO = BorrowDAO.getInstance();
	private FineDAO fineDAO = FineDAO.getInstance();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		request.setAttribute("iii", "111");
		
		/**
		 * add here
		 */
		ReaderDAO readerDAO = ReaderDAO.getInstance();
		String readerno = String.valueOf(request.getSession().getAttribute("userName"));
		Reader reader = readerDAO.getReader(readerno);
		request.setAttribute("reader",  reader);
		

		
		request.getRequestDispatcher("personInformation.jsp").forward(request, response);
	}

}