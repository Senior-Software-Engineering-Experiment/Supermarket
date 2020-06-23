package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.ClientProtocolException;

import dao.DoubanAPI;
import dao.GoogleAPI;
//import dao.GoogleAPI;
import entity.Book;

/**
 * Servlet implementation class InputISBNServlet
 */
@WebServlet("/InputISBNServlet")
public class InputISBNServlet extends HttpServlet {
	private DoubanAPI doubanAPI = DoubanAPI.getInstance();

	private GoogleAPI googleAPI = GoogleAPI.getInstance();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClientProtocolException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String bISBN = request.getParameter("bISBN");

		Book book = new Book();
		book = doubanAPI.searchByISBN(bISBN);
		//book = googleAPI.searchByISBN(bISBN);
		request.setAttribute("title", book.getTitle());
		request.setAttribute("author", book.getAuthor());
		request.setAttribute("language", book.getLanguage());
		request.setAttribute("price", book.getPrice());
		request.setAttribute("time", book.getTime());
		request.setAttribute("publisher", book.getPublish());
		request.setAttribute("brief", book.getBrief());
		request.setAttribute("ISBN", bISBN);

		RequestDispatcher rd = request.getRequestDispatcher("ISBNBook.jsp");
		rd.forward(request, response);

	}

}
