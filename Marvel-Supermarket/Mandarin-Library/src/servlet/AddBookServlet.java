package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;


import entity.Book;


/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {

	private BookDAO  bookDAO =BookDAO.getInstance();
	

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        int bookNo = bookDAO.getMax() + 1;
		String title = request.getParameter("bName");
		String bAuthor = request.getParameter("bAuthor");
		String bPrice = request.getParameter("bPrice");
		String bLanguage = request.getParameter("bLanguage");
		String bTime = request.getParameter("bTime");
		String bPublish = request.getParameter("bPublish");
		String bBrief = request.getParameter("bBrief");
		String bISBN = request.getParameter("bISBN");
		String bCategory = request.getParameter("bCategory");
		String bLocation = request.getParameter("bLocation");
		int number=Integer.parseInt(request.getParameter("bNumber"));
		int number1=number;
		Book book = new Book();
		book.setBookNo(bookNo);
		book.setTitle(title);
		book.setAuthor(bAuthor);
		book.setLanguage(bLanguage);
		book.setPrice(bPrice);
		book.setTime(bTime);
		book.setPublish(bPublish);
		book.setBrief(bBrief);
		book.setISBN(bISBN);
		book.setCategory(bCategory);
		book.setLocation(bLocation);

		while(number!=0) {
		bookDAO.add(book);
		bookNo=bookNo+1;
		book.setBookNo(bookNo);
		number--;}
		request.setAttribute("title", title);
		request.setAttribute("author", bAuthor);
		request.setAttribute("language", bLanguage);
		request.setAttribute("price", bPrice);
		request.setAttribute("time", bTime);
		request.setAttribute("publisher", bPublish);
		request.setAttribute("ISBN", bISBN);
		request.setAttribute("category", bCategory);
		request.setAttribute("location", bLocation);
		request.setAttribute("brief", bBrief);
		request.setAttribute("bookno", bookNo-number1);
		request.setAttribute("number", number1);
		RequestDispatcher rd = request.getRequestDispatcher("ShowBook.jsp");
		rd.forward(request, response);

	}

}