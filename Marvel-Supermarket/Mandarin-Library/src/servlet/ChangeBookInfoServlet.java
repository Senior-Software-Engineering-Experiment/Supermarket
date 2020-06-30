package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import entity.Book;

/**
 * Servlet implementation class ChangeBookInfoServlet
 */
@WebServlet("/ChangeBookInfoServlet")
public class ChangeBookInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookDAO bookDAO = BookDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeBookInfoServlet() {
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
        request.setCharacterEncoding("UTF-8");
        
        String title = request.getParameter("bookTitle");
        System.out.println(title);
        String author = request.getParameter("bookAuthor");
        String category = request.getParameter("bookCategory");
        String language = request.getParameter("bookLanguage");
        String price = request.getParameter("bookPrice");
        String date = request.getParameter("bookDate");
        String publisher = request.getParameter("bookPublisher");
        String brief = request.getParameter("bookBrief");
        String location = request.getParameter("bookLocation");
        int bookid = Integer.parseInt(request.getParameter("bookNo"));
        Book newBook = bookDAO.get(bookid);
        newBook.setTitle(title);
        newBook.setAuthor(author);
        newBook.setCategory(category);
        newBook.setLanguage(language);
        newBook.setPrice(price);
        newBook.setTime(date);
        newBook.setPublish(publisher);
        newBook.setBrief(brief);
        newBook.setLocation(location);
        bookDAO.update(newBook);
        request.getRequestDispatcher("library.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
