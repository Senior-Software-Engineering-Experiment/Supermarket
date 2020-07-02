package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BorrowDAO;
import dao.FineDAO;
import entity.Borrow;
import entity.Reader;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import dao.ReaderDAO;


/**
 * Servlet implementation class PersonInformationServlet
 */
@WebServlet("/PersonInformationServlet")

public class PersonInformationServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3521459949118518106L;
	private BorrowDAO borrowDAO = BorrowDAO.getInstance();
	private FineDAO fineDAO = FineDAO.getInstance();
	private ReaderDAO readerDAO = ReaderDAO.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        int bookShowNum = 0;
        int totalPageNum;
        
        String username = String.valueOf(request.getSession().getAttribute("userName"));
		Reader reader = readerDAO.getReader(username);
		
		ArrayList<Borrow> ingBooks = new ArrayList<Borrow>(borrowDAO.ing(username));
		
		ArrayList<Borrow> finishBooks = new ArrayList<Borrow>(borrowDAO.finish(username));
		
		
        
		int dayfine = fineDAO.getFine();
		ArrayList<Borrow> overTimeBooks = new ArrayList<Borrow>(borrowDAO.overTimeBook(username,dayfine));
		ArrayList<Borrow> showFinishBooks = borrowDAO.showFinish(finishBooks, pageNum);
		int fine=0;
		for (Borrow borrow : overTimeBooks){
			fine= fine +borrow.getFine();
		}
		bookShowNum = finishBooks.size();
		if(bookShowNum%5==0) {
			totalPageNum = bookShowNum / 5;
		}else {
			totalPageNum = bookShowNum / 5 + 1;
		}
		
		JSONObject jsonobject = new JSONObject();
		JSONObject jsonreader = new JSONObject();
		JSONObject jsoningBooks = new JSONObject();
		JSONObject jsonshowFinishBooks = new JSONObject();
		JSONObject jsonoverTimeBooks = new JSONObject();
		JSONObject jsontotalPageNum = new JSONObject();
		JSONObject jsonfine = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        jsonreader.put("reader", reader);
        jsonArray.add(jsonreader);
        jsoningBooks.put("ingBooks", ingBooks);
        jsonArray.add(jsoningBooks);
        jsonshowFinishBooks.put("showFinishBooks", showFinishBooks);
        jsonArray.add(jsonshowFinishBooks);
        jsonoverTimeBooks.put("overTimeBooks", overTimeBooks);
        jsonArray.add(jsonoverTimeBooks);
        jsontotalPageNum.put("totalPageNum", totalPageNum);
        jsonArray.add(jsontotalPageNum);
        jsonfine.put("fine", fine);
        jsonArray.add(jsonfine);
        
        
        jsonobject.put("reader", reader);
        jsonobject.put("ingBooks", ingBooks);
        jsonobject.put("showFinishBooks", showFinishBooks);
        jsonobject.put("overTimeBooks", overTimeBooks);
        jsonobject.put("totalPageNum", totalPageNum);
        jsonobject.put("fine", fine);
        response.getWriter().print(jsonobject.toString());
	}
	/*
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		

		String username = String.valueOf(request.getSession().getAttribute("userName"));
		Reader reader = readerDAO.getReader(username);
		request.setAttribute("reader", reader);
	

		ArrayList<Borrow> ingBooks = new ArrayList<Borrow>(borrowDAO.ing(username));

		request.setAttribute("ingBooks", ingBooks);

		ArrayList<Borrow> finishBooks = new ArrayList<Borrow>(borrowDAO.finish(username));
		request.setAttribute("finishBooks",  finishBooks);
		
        int dayfine = fineDAO.getFine();
		ArrayList<Borrow> overTimeBooks = new ArrayList<Borrow>(borrowDAO.overTimeBook(username,dayfine));

		request.setAttribute("overTimeBooks",  overTimeBooks);
		
		
		int fine=0;
		for (Borrow borrow : overTimeBooks){
			fine= fine +borrow.getFine();
		}
		request.setAttribute("fine",  fine);
		request.getRequestDispatcher("personInformation.jsp").forward(request, response);
	}*/

}
