package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReaderDAO;
import entity.Reader;

/**
 * Servlet implementation class ReaderSearchServlet
 */
@WebServlet("/ReaderSearchServlet")
public class ReaderSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReaderDAO readerDAO = ReaderDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReaderSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
		String content = request.getParameter("searchReaderContent");//接口
		
		List<Reader> readers = readerDAO.list(content);
		
		request.setAttribute("readers", readers);
		
		request.setAttribute("init", "iii");
		request.getRequestDispatcher("library.jsp").forward(request,response);
	}


}
