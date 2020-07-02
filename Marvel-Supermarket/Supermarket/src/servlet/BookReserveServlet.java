package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReserveDAO;
import entity.Reserve;

/**
 * Servlet implementation class BookReserveServlet
 */
@WebServlet("/BookReserveServlet")
public class BookReserveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ReserveDAO reserveDAO = ReserveDAO.getInstance();
    public BookReserveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        int bookNo = Integer.parseInt(request.getParameter("bookNo"));
        //System.out.println(bookNo);
        
        //获取session中的readerNo
        String readerNo = String.valueOf(request.getSession().getAttribute("userName"));
        //System.out.println(readerNo);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long time = System.currentTimeMillis();
        String time2 = dateFormat.format(time);
        java.util.Date date = new java.util.Date();
		try {
			date = dateFormat.parse(time2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}       
        
        java.sql.Timestamp date2 = new java.sql.Timestamp(date.getTime());   
        Reserve reserve = new Reserve(bookNo, readerNo, date2);
        reserveDAO.add(reserve);
        
        /*用来测试时间差
        String ss = "2019-9-25 19:53:00";
        Long datez = null;
		try {
			datez = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ss).getTime();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        date2.setTime(datez);
        reserve = new Reserve(1, "1", date2);
        System.out.println(reserveDAO.checkReserveTime(reserve));
        */
        
        
        response.sendRedirect("index.jsp");
	}

}
