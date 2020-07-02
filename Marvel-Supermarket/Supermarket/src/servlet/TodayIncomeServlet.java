package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IncomeDAO;
import entity.Incomegroup;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class TodayIncomeServlet
 */
@WebServlet("/TodayIncomeServlet")
public class TodayIncomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IncomeDAO incomedao = IncomeDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodayIncomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        Incomegroup todayincome=new Incomegroup();
        todayincome=IncomeDAO.getTodayIncome();
        List<Incomegroup> list=new ArrayList<Incomegroup>();
        list.add(todayincome);
        JSONArray jsonObject=JSONArray.fromObject(list);
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
