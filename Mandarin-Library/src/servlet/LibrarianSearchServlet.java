package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.ManageDAO;
import entity.Librarian;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/LibrarianSearchServlet")
public class LibrarianSearchServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private ManageDAO librarianmanagedao = ManageDAO.getInstance();
	
	public LibrarianSearchServlet() {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("type");
		String content = request.getParameter("searchContent");
		List<Librarian> librarians = librarianmanagedao.list(type, content);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("librarianList", librarians);

		JSONArray jsonArray = new JSONArray();
        jsonArray.add(jsonObject);
		System.out.println(jsonObject);
		PrintWriter out = response.getWriter();
		out.write(jsonArray.toString());

		//JSONArray jsonList=JSONArray.fromObject(librarians);
		
		//Librarian st=new Librarian();
		//st=librarians.get(0);
		//System.out.print(st.getlEmail());
		//PrintWriter out = response.getWriter();
		
		//System.out.print(jsonList);
		//out.flush();
	}
}

