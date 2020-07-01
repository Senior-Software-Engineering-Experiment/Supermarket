package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReaderDAO;
import entity.Reader;

/**
 * Servlet implementation class ChangeReaderServlet
 */
@WebServlet("/ChangeReaderServlet")
public class ChangeReaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReaderDAO readerDAO = ReaderDAO.getInstance();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeReaderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String lastReaderAcc =  request.getParameter("lastReaderAcc");
		String thisReaderAcc =  request.getParameter("thisReaderAcc");
		String readerName = request.getParameter("changeReaderName");
		String readerPassword = request.getParameter("changeReaderPassword");
		String email = request.getParameter("changeReaderEmail");
		Reader reader = new Reader();
		reader.setReaderNo(thisReaderAcc);
		reader.setReaderName(readerName);
		reader.setReaderPassword(readerPassword);
		reader.setEmail(email);
		readerDAO.update(reader, lastReaderAcc);
    }

}
