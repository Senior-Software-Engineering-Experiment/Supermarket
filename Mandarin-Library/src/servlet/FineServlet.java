package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FineDAO;
import entity.Fine;
import net.sf.json.JSONObject;


@WebServlet("/FineServlet")

public class FineServlet extends HttpServlet {
	
	private FineDAO fine=FineDAO.getInstance();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");


		Fine std = new Fine();
		
		request.setAttribute("std", std);
		
		String bookFine=request.getParameter("BF");
		String returnPeriod=request.getParameter("RP");
		String securityDesposit=request.getParameter("SD");
		
		int bookfine = 0;
		int returnperiod = 0;
		int securitydesposit = 0;
		try {

		    bookfine = Integer.parseInt(bookFine);
		    returnperiod = Integer.parseInt(returnPeriod);
		    securitydesposit = Integer.parseInt(securityDesposit);

		} catch (NumberFormatException e) {

		    e.printStackTrace();

		}
		std.setBookFine(bookfine);
		std.setReturnPeriod(returnperiod);
		std.setSecurityDesposit(securitydesposit);
		fine.update(std);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("changedFine", std);
		
		PrintWriter out = response.getWriter();
		out.write(jsonObject.toString());
		
		//request.getRequestDispatcher("admin.jsp").forward(request, response);
		
	}
		
}
