package servlet;

import java.io.IOException;
import java.util.function.Predicate;

import javax.security.auth.PrivateCredentialPermission;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import entity.Fine;

/**
 * Servlet implementation class DeleteReaderServlet
 */
@WebServlet("/DeleteReaderServlet")
public class DeleteReaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReaderDAO readerDAO = ReaderDAO.getInstance();
	private FineDAO fineDAO = FineDAO.getInstance();
	private IncomeDAO incomeDAO = IncomeDAO.getInstance();

	public DeleteReaderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String deleteReader = request.getParameter("lastReaderAcc");
		System.out.println(deleteReader);
		readerDAO.delete(deleteReader);

		// 拿到书籍保证金
		Fine fine = fineDAO.get();
		int deposit = fine.getSecurityDesposit();
		incomeDAO.decreaseTodayIncome(deposit);
	}

}
