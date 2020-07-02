package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import dao.ReserveDAO;
import entity.Book;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class BookSearch
 */
@WebServlet("/ReaderBookSearchServlet")
public class ReaderBookSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private BookDAO bookDAO = BookDAO.getInstance();
	private ReserveDAO reserveDAO = ReserveDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReaderBookSearchServlet() {
        
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("application/json; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        int bookNum = 0;
        int totalPageNum;
        
        String type1 = request.getParameter("type1");
		String type2 = request.getParameter("type2");
		String content = request.getParameter("searchContent");
		List<Book> books = bookDAO.list(type1,type2,content);
		List<Book> showBooks = bookDAO.list(books,pageNum);
		List<Boolean> isreserves = new ArrayList<Boolean>();
		for(Book book:showBooks) {
			int bookNo = book.getBookNo();
			isreserves.add(reserveDAO.isreserve(bookNo));
		}
		Iterator<Book> it = showBooks.iterator();
		bookNum = books.size();
		if(bookNum%3==0) {
			totalPageNum = bookNum / 3;
		}else {
			totalPageNum = bookNum / 3 + 1;
		}
		JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        int is = 0;
        while(it.hasNext()) {
        	Book book = (Book) it.next();
        	jsonObject.put("bookNo", book.getBookNo());
        	jsonObject.put("bookTitle", book.getTitle());
        	jsonObject.put("bookAuthor", book.getAuthor());
        	jsonObject.put("bookCategory", book.getCategory());
        	jsonObject.put("bookBrief", book.getBrief());
        	jsonObject.put("bookISBN", book.getISBN());
        	jsonObject.put("bookLocation", book.getLocation());
        	jsonObject.put("bookPrice", book.getPrice());
        	jsonObject.put("bookPublish", book.getPublish());
        	jsonObject.put("bookTime", book.getTime());
        	jsonObject.put("totalPage", totalPageNum);
        	jsonObject.put("isReserve", isreserves.get(is++));
        	jsonArray.add(jsonObject);
        }
        response.getWriter().print(jsonArray.toString());
		
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("application/json; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String ISBN = request.getParameter("ISBN");
        
		List<Book> books = bookDAO.list(ISBN);
		List<Boolean> isreserves = new ArrayList<Boolean>();
		for(Book book:books) {
			int bookNo = book.getBookNo();
			isreserves.add(reserveDAO.isreserve(bookNo));
		}
		Iterator<Book> it = books.iterator();
		JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        int is = 0;
        while(it.hasNext()) {
        	Book book = (Book) it.next();
        	jsonObject.put("bookNo", book.getBookNo());
        	jsonObject.put("bookTitle", book.getTitle());
        	jsonObject.put("bookAuthor", book.getAuthor());
        	jsonObject.put("bookCategory", book.getCategory());
        	jsonObject.put("bookBrief", book.getBrief());
        	jsonObject.put("bookISBN", book.getISBN());
        	jsonObject.put("bookLocation", book.getLocation());
        	jsonObject.put("bookPrice", book.getPrice());
        	jsonObject.put("bookPublish", book.getPublish());
        	jsonObject.put("bookTime", book.getTime());
        	jsonObject.put("isReserve", isreserves.get(is++));
        	jsonArray.add(jsonObject);
        }
        response.getWriter().print(jsonArray.toString());
		
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
                 
		String type1 = request.getParameter("type1");
		String type2 = request.getParameter("type2");
		String content = request.getParameter("searchContent");
		List<Book> books = bookDAO.list(type1,type2,content);
		ArrayList<Boolean> isreserves = new ArrayList<Boolean>();
		for(Book book:books) {
			int bookNo = book.getBookNo();
			isreserves.add(reserveDAO.isreserve(bookNo));
		}
		request.setAttribute("books", books);
		request.setAttribute("isreserves", isreserves);
		request.getRequestDispatcher("bookSearch.jsp").forward(request,response);
		
	}*/
	

}
