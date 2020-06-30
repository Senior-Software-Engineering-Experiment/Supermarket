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
 * Servlet implementation class IncomeHistoryServlet
 */
@WebServlet("/IncomeHistoryServlet")
public class IncomeHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IncomeDAO incomedao = IncomeDAO.getInstance();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IncomeHistoryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); 
        response.setCharacterEncoding("UTF-8");
        
        String year = request.getParameter("year");
        List<Incomegroup> incomegroup=IncomeDAO.getMonthIncome(year);
        JSONArray jsonObject=JSONArray.fromObject(incomegroup);
		PrintWriter out =response.getWriter();
		out.print(jsonObject);
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
