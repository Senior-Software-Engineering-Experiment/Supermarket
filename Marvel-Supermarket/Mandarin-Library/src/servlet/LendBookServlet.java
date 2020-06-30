package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.function.Predicate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.DBHelper;
import dao.BookDAO;
import dao.BorrowDAO;
import dao.FineDAO;
import entity.*;

/**
 * Servlet implementation class LendBookServlet
 */
@WebServlet("/LendBookServlet")
public class LendBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BookDAO bookDAO = BookDAO.getInstance();
	private BorrowDAO borrowDAO = BorrowDAO.getInstance();
	private FineDAO fineDAO = FineDAO.getInstance();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String sbookno = request.getParameter("bookno");
		String readerno = request.getParameter("readerno");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Fine fine = fineDAO.get();
		int day = fine.getReturnPeriod();

		Timestamp sqlborrowtime = new Timestamp(new Date().getTime());
		System.out.println(sqlborrowtime);
		System.out.println(sqlborrowtime.getTime());
		System.out.println(day);
		Timestamp sqlshouldreturntime = new Timestamp(sqlborrowtime.getTime() + (long)day * 24 * 60 * 60 * 1000);
		
		System.out.println(sqlshouldreturntime);
		if (sbookno == null || readerno == null) {
			response.getWriter().write(
					"<script>alert('Bookno and reader cannot be empty!');window.location.href='library.jsp'</script>");
		} else {
			int bookno = Integer.parseInt(sbookno);
			Book book1 = bookDAO.get(bookno);
			int lendnum = borrowDAO.getlendnum(readerno);
			if (lendnum >= 3) {
				response.getWriter().write(
						"<script>alert('The lended books are more than three!');window.location.href='library.jsp'</script>");
			} else {
				Borrow borrow = new Borrow(bookno, readerno, sqlborrowtime, false, sqlshouldreturntime, null);
				borrowDAO.add(borrow);
				response.sendRedirect("library.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
