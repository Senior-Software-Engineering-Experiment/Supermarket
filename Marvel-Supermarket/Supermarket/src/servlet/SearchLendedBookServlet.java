package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.BookDAO;
import entity.Book;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class SearchLendedBookServlet
 */
@WebServlet("/SearchLendedBookServlet")
public class SearchLendedBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDAO bookDAO = BookDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchLendedBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); 
        response.setCharacterEncoding("UTF-8");
        
		String type1 = request.getParameter("sort");
		String content = request.getParameter("searchContent");
		
		List<Book> books = bookDAO.lendlist(type1,content);
		
		JSONArray jsonObject=JSONArray.fromObject(books);
		PrintWriter out =response.getWriter();
		out.print(jsonObject);
		
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
