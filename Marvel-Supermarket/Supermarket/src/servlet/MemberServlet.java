package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.MemberDAO;
import entity.Member;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDAO memberdao = MemberDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
		List<Member> members = memberdao.get();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("members", members);
		response.getWriter().print(jsonObject.toString());
	}
/*	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
		List<Member> members = memberdao.get();
		//JSONObject jsonObject = new JSONObject();
		request.setAttribute("init","ok");
		request.setAttribute("members", members);
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}
*/
}
