package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.Formatter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IncomeDAO;
import dao.ReaderDAO;
import dao.FineDAO;
import entity.Book;
import entity.Fine;
import entity.Income;
import entity.Reader;
import entity.Incomegroup;
/**
 * Servlet implementation class ReaderManageServlet
 */
@WebServlet("/ReaderManageServlet")
public class ReaderManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReaderDAO readerDAO = ReaderDAO.getInstance();
    private IncomeDAO incomeDAO = IncomeDAO.getInstance();
    private FineDAO fineDAO = FineDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReaderManageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String readerNo = request.getParameter("accout");
		String readerName = request.getParameter("name");
		String readerPassword = request.getParameter("password");
		String email = request.getParameter("email");
		int readerFine = 0;
		Reader reader = new  Reader(readerNo,readerName,readerPassword,email,readerFine);
		readerDAO.add(reader);
		
		//拿到书籍保证金
		Fine fine = fineDAO.get();
		int deposit = fine.getSecurityDesposit();
		incomeDAO.updateTodayIncome(deposit);
	}
    
   
}



