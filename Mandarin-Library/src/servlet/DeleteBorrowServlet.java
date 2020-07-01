package servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dao.BorrowDAO;

/**
 * Servlet implementation class DeleteBorrwServlet
 */
@WebServlet("/DeleteBorrowServlet")
public class DeleteBorrowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private BorrowDAO borrowDAO = BorrowDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBorrowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("lhn2");
		
		String borrowBookNo = request.getParameter("borrowBookNo");
		Timestamp borrowData = Timestamp.valueOf(request.getParameter("borrowData"));
		System.out.println(borrowBookNo);
		borrowDAO.delete(borrowBookNo,borrowData);
		response.sendRedirect("borrowRecord.jsp");
	}

}
