package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostDAO;
import entity.Post;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class DisplayGivenNoticesServlet
 */
@WebServlet("/DisplayGivenNoticesServlet")
public class DisplayGivenNoticesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostDAO postDAO = PostDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayGivenNoticesServlet() {
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
        
        String librarianNo = (String) request.getSession().getAttribute("userName"); 
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int postNo = Integer.parseInt(request.getParameter("editPostNo"));
		Timestamp posttime = new Timestamp(new Date().getTime());
		Post post = new Post(postNo,posttime,title,content,librarianNo);
		//postDAO.update(post);
		JSONArray jsonArray = new JSONArray();
		JSONObject json = new JSONObject();
		Post oddPost=new Post();
		oddPost=PostDAO.get(postNo);
		json.accumulate("title",oddPost.getTitle());
		json.accumulate("content",oddPost.getContent());
		jsonArray.add(json);
		PrintWriter out =response.getWriter();
		out.print(jsonArray);
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
