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
import dao.CategoryDAO;
import dao.LocationDAO;
import dao.ReaderDAO;
import entity.Book;
import entity.Category;
import entity.Location;
import entity.Reader;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class DisplayBookServlet
 */
@WebServlet("/DisplayBookServlet")
public class DisplayBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookDAO bookDAO = BookDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        int bookNum = 0;
        List<Book> books = bookDAO.list(pageNum);
        bookNum = bookDAO.getTotal();
        Iterator it = books.iterator();
        int totalPageNum;
        if(bookNum % 10 == 0)
        totalPageNum = bookNum / 10;
        else totalPageNum = bookNum / 10 + 1;
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        if(it.hasNext()) {
        	while(it.hasNext()) {
            	Book book = (Book) it.next();
            	jsonObject.put("bookName", book.getTitle());
            	jsonObject.put("bookAuthor", book.getAuthor());
            	jsonObject.put("bookCategory", book.getCategory());
            	jsonObject.put("bookLocation", book.getLocation());
            	jsonObject.put("bookISBN", book.getISBN());
            	jsonObject.put("bookNo", book.getBookNo());
            	jsonObject.put("totalPage", totalPageNum);
            	jsonArray.add(jsonObject);
            }
            response.getWriter().print(jsonArray.toString());
        } else {
        	jsonObject.put("bookName", "null");
        	jsonObject.put("bookAuthor", "null");
        	jsonObject.put("bookCategory", "null");
        	jsonObject.put("bookLocation", "null");
        	jsonObject.put("bookISBN", "null");
        	jsonObject.put("bookNo", "null");
        	jsonObject.put("totalPage", 1);
        	jsonArray.add(jsonObject);
        	response.getWriter().print(jsonArray.toString());
        }
        
	}

}
