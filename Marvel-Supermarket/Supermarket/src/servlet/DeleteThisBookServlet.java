package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import dao.DeleteDAO;
import entity.Book;
import entity.Delete;

/**
 * Servlet implementation class DeleteThisBookServlet
 */
@WebServlet("/DeleteBookServlet")
public class DeleteThisBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookDAO bookDAO = BookDAO.getInstance();
    DeleteDAO deleteDAO=DeleteDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteThisBookServlet() {
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
        
        int bookid = Integer.parseInt(request.getParameter("deleteBookNo"));
        Book book=bookDAO.get(bookid);
        Timestamp deletetime = new Timestamp(new Date().getTime());
        String librarianNo = (String) request.getSession().getAttribute("userName");
        
        String author=book.getAuthor();
        String title=book.getTitle();
        Delete delete=new Delete(bookid,librarianNo,deletetime,title,author);
        deleteDAO.add(delete);
        bookDAO.delete(bookid);
        
        //request.getRequestDispatcher("library.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
