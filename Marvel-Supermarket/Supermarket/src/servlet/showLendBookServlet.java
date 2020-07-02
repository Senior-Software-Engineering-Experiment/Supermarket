package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import entity.Book;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class showLendBookServlet
 */
@WebServlet("/showLendBookServlet")
public class showLendBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    BookDAO bookDAO = BookDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showLendBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		List<Book> books = bookDAO.showUnlend(pageNum);
		int totalPageNum = 1;
		int bookNum = bookDAO.getNumOFUnlend();
		Iterator it = books.iterator();
		if(bookNum % 10 == 0)
	    totalPageNum = bookNum / 10;
	    else totalPageNum = bookNum / 10 + 1;
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("totalPage", totalPageNum);
		JSONArray jsonArray = new JSONArray();
		jsonArray.add(jsonObject);
		if(it.hasNext()) {
        	while(it.hasNext()) {
            	Book book = (Book) it.next();
            	jsonObject.put("title", book.getTitle());
            	jsonObject.put("author", book.getAuthor());
            	jsonObject.put("category", book.getCategory());
            	jsonObject.put("location", book.getLocation());
            	jsonObject.put("ISBN", book.getISBN());
            	jsonObject.put("bookNo", book.getBookNo());
            	jsonObject.put("totalPage", totalPageNum);
            	jsonArray.add(jsonObject);
            }
        }
		response.getWriter().print(jsonArray.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
