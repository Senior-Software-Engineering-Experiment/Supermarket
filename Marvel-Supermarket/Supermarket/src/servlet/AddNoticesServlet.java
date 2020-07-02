package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostDAO;
import entity.Post;

/**
 * Servlet implementation class AddNoticesServlet
 */
@WebServlet("/AddNoticesServlet")
public class AddNoticesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostDAO postDAO = PostDAO.getInstance();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNoticesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String librarianNo = (String) request.getSession().getAttribute("userName"); 
		String title = request.getParameter("nname");
		String content = request.getParameter("ncontent");
		String spostNo = request.getParameter("postNo");
		int postNo = PostDAO.getMax()+1;//Integer.parseInt(spostNo);
		Timestamp posttime = new Timestamp(new Date().getTime());
		Post post = new Post(postNo,posttime,title,content,librarianNo);
		postDAO.add(post);
		System.out.println("successssssssssssssssss!"+postNo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
