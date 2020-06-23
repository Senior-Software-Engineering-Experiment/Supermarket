package servlet;

import java.io.IOException;
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
 * Servlet implementation class BookSearch
 */
@WebServlet("/BookSearchServlet")
public class BookSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private BookDAO bookdao = BookDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchServlet() {
        
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
		String type1 = request.getParameter("sort");
		String content = request.getParameter("searchContent");
		List<Book> books = bookdao.list(type1,content);
        Iterator it = books.iterator();
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        while(it.hasNext()) {
        	Book book = (Book) it.next();
        	jsonObject.put("bookName", book.getTitle());
        	jsonObject.put("bookAuthor", book.getAuthor());
        	jsonObject.put("bookISBN", book.getISBN());
        	jsonObject.put("bookCategory", book.getCategory());
        	System.out.println(book.getCategory());
        	jsonObject.put("bookLocation", book.getLocation());
        	jsonObject.put("bookNo", book.getBookNo());
        	jsonArray.add(jsonObject);
        }
        response.getWriter().print(jsonArray.toString());
	}

}
