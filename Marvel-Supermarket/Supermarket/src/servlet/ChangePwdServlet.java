package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDAO;
import entity.Admin;
import net.sf.json.JSONObject;
import utils.DBHelper;

/**
 * Servlet implementation class ChangePwdServlet
 */
@WebServlet("/ChangePwdServlet")
/**
 * �û���Ϣ��֤
 */
 
public class ChangePwdServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private AdminDAO  admin = AdminDAO.getInstance();

	public ChangePwdServlet() {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
		
        String oldPass = request.getParameter("oldP");
		String password = request.getParameter("newP");
		System.out.println(oldPass);
		
		JSONObject jsonObject = new JSONObject();
		try {
			boolean b=admin.check(oldPass);
			System.out.println(b);
			if(!b){
				//request.setAttribute("True", true);
				//request.setAttribute("Error", true);
				//request.getRequestDispatcher("admin.jsp").forward(request, response);
				jsonObject.put("result", b);
				
			}else {
				jsonObject.put("result", b);
				admin.change(password);
				//response.getWriter().write("<script>alert('Change your password successfully！'); window.location.href='admin.jsp'</script>");
				//response.sendRedirect("admin.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		System.out.println(jsonObject);
		PrintWriter out = response.getWriter();
		out.write(jsonObject.toString());
		
	}
}

