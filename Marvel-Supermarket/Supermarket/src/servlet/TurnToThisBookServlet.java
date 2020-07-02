package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.tools.JavaFileObject;

import dao.BookDAO;
import entity.Book;
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;

/**
 * Servlet implementation class TurnToThisBookServlet
 */
@WebServlet("/TurnToThisBookServlet")
public class TurnToThisBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookDAO bookDAO = BookDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TurnToThisBookServlet() {
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
        int bookid = Integer.valueOf(request.getParameter("thisBookNo"));
        JSONObject jsonObject = new JSONObject();
        Book thisBook = bookDAO.get(bookid);
        int bookID = thisBook.getBookNo();
        String title = thisBook.getTitle();
        String author = thisBook.getAuthor();
        String language = thisBook.getLanguage();
        String price = thisBook.getPrice();
        String date = thisBook.getTime();
        String brief = thisBook.getBrief();
        String publisher = thisBook.getPublish();
        String category = thisBook.getCategory();
        String location = thisBook.getLocation();
        jsonObject.put("bookNo", bookID);
        jsonObject.put("title", title);
        jsonObject.put("author", author);
        jsonObject.put("language", language);
        jsonObject.put("price", price);
        jsonObject.put("date", date);
        jsonObject.put("brief", brief);
        jsonObject.put("publisher", publisher);
        jsonObject.put("location", location);
        jsonObject.put("category", category);
        //String author = thisBook.getAuthor();
        response.getWriter().print(jsonObject.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
