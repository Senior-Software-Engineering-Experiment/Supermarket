package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import dao.PostDAO;
import entity.Book;
import entity.Post;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class DisplayNoticesServlet
 */
@WebServlet("/DisplayNoticesServlet")
public class DisplayNoticesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostDAO postDAO = PostDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayNoticesServlet() {
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
        
		String type1 = request.getParameter("sort");
		String postcontent = request.getParameter("content");
		List<Post> posts = PostDAO.list(type1, postcontent);
		
		JSONArray jsonArray = new JSONArray();
		for(int i=0;i<posts.size();i++)
		{
			JSONObject json = new JSONObject();
			Post post=posts.get(i);
			json.accumulate("postno",post.getPostno());
			json.accumulate("posterNo",post.getLibrarianno());
			String posttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(post.getPosttime());
			json.accumulate("posttime",posttime);
			json.accumulate("title", post.getTitle());
			json.accumulate("content", post.getContent());
			json.accumulate("librarianno", post.getLibrarianno());
			jsonArray.add(json);
		}
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
