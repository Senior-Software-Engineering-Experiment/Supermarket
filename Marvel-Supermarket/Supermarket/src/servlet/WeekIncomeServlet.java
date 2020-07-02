package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.sql.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.*;
import entity.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * Servlet implementation class WeekIncomeServlet
 */
@WebServlet("/WeekIncomeServlet")
public class WeekIncomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IncomeDAO incomedao = IncomeDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WeekIncomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); 
        response.setCharacterEncoding("UTF-8");
        String wyear = request.getParameter("wyear");
       
        List<Incomegroup> incomegroup=IncomeDAO.getWeekIncome(wyear);
        JSONArray jsonObject=JSONArray.fromObject(incomegroup);
		PrintWriter out =response.getWriter();
		
		out.print(jsonObject);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
