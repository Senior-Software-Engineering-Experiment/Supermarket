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
import dao.ManageDAO;
import dao.AdminDAO;
import entity.Admin;
import entity.Fine;
import entity.Librarian;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/AdminServlet")

public class AdminServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AdminDAO adminDAO = AdminDAO.getInstance();
	private ManageDAO librarianManageDAO = ManageDAO.getInstance();
	private FineDAO fineDAO = FineDAO.getInstance();

	public AdminServlet() {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		//String aLNo = adminDAO.findCurrentLogin();
		String aLNo = (String) request.getSession().getAttribute("userName");
		
		Admin admin = new Admin();
		try {
			adminDAO.read(admin, aLNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Fine fine = new Fine();
		try {
			fineDAO.read(fine);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("admin", admin);
		request.setAttribute("fine", fine);
		// request.setAttribute("iii", "111");

		JSONObject jsonObjectA = new JSONObject();
		JSONObject jsonObjectB = new JSONObject();
		jsonObjectA.put("admin", aLNo);
		jsonObjectB.put("fine", fine);

		int start = 0;
		int count = 5;

		try {
			start = Integer.parseInt(request.getParameter("start"));
		} catch (NumberFormatException e) {
		}

		int next = start + count;
		int pre = start - count;

		int ingTotal = librarianManageDAO.getTotal();

		int last;
		if (0 == ingTotal % count)
			last = ingTotal - count;
		else
			last = ingTotal - ingTotal % count;

		pre = pre < 0 ? 0 : pre;
		next = next > last ? last : next;

		List<Librarian> librarians = librarianManageDAO.librarian(start, count);
		JSONObject jsonObjectL = new JSONObject();
		jsonObjectL.put("Librarians", librarians);

		JSONArray jsonArray = new JSONArray();
		jsonArray.add(jsonObjectA);
		jsonArray.add(jsonObjectB);
		jsonArray.add(jsonObjectL);
		PrintWriter out = response.getWriter();
		out.write(jsonArray.toString());
	}

}
