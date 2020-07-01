package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReaderDAO;
import entity.Reader;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Changepasswordservlet
 */
@WebServlet("/Changepasswordservlet")
public class Changepasswordservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Changepasswordservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
  
		String password = req.getParameter("oldpassword");
		String readerno = String.valueOf(req.getSession().getAttribute("userName"));
		
		
		ReaderDAO readerDAO = ReaderDAO.getInstance();
		Reader reader = readerDAO.getReader(readerno);	
		if(reader.getReaderPassword().equals(password)){
			String newpassword = req.getParameter("newpassword");
			readerDAO.changePassword(readerno, newpassword);
	
		}
		
		
	}
}
