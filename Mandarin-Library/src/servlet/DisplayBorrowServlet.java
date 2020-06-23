package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.BorrowDAO;
import dao.ReaderDAO;
import entity.Book;
import entity.Reader;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import entity.Borrow;
import entity.BorrowRecord;

/**
 * Servlet implementation class DisplayBorrowServlet
 */
@WebServlet("/DisplayBorrowServlet")
public class DisplayBorrowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BorrowDAO borrowDAO = BorrowDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayBorrowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String readerNo = request.getParameter("borrowReader");
        List<BorrowRecord> borrows = borrowDAO.all(readerNo);
        Iterator it = borrows.iterator();
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        
        while(it.hasNext()) {
        	BorrowRecord borrowRec = (BorrowRecord) it.next();
        	jsonObject.put("bookTitle", borrowRec.getTitle());
        	jsonObject.put("bookAuthor", borrowRec.getAuthor());
        	String borrowTime = "";
        	DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        	borrowTime = sdf.format(borrowRec.getBorrowTime());
        	jsonObject.put("borrowTime", borrowTime);
        	jsonObject.put("fine", borrowRec.getFine());
        	jsonObject.put("isReturned", borrowRec.getIsReturned());
        	jsonObject.put("bookNo", borrowRec.getBookNo());
        	jsonArray.add(jsonObject);
        }
        response.getWriter().print(jsonArray.toString());
		
	}

}
