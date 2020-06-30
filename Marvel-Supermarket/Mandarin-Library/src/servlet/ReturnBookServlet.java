package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import dao.BorrowDAO;
import entity.Borrow;
import entity.Book;

/**
 * Servlet implementation class ReturnBookServlet
 */
@WebServlet("/ReturnBookServlet")
public class ReturnBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDAO bookDAO = BookDAO.getInstance();
	private BorrowDAO borrowDAO = BorrowDAO.getInstance();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		// 得到任务类别
		String sbookno = request.getParameter("bookno");
		int bookno = Integer.parseInt(sbookno);
		Timestamp returntime = new Timestamp(new Date().getTime()); 
		Borrow borrow = new Borrow();
		Boolean bool = true;
		Boolean check =false;
		borrow=borrowDAO.get(bookno);
		BorrowDAO.update(bookno, bool, returntime);
		response.getWriter().write("<script>alert('return successfully！');window.location.href='library.jsp'</script>");
	
	}

}
