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

import dao.PostDAO;
import entity.Post;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ReaderPostInitServlet
 */
@WebServlet("/ReaderPostInitServlet")
public class ReaderPostInitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostDAO postDAO = PostDAO.getInstance();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReaderPostInitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); 
        response.setCharacterEncoding("UTF-8");
        
        int pageNum = Integer.valueOf(request.getParameter("pageNum"));
		List<Post> posts1 = PostDAO.list();
		List<Post> posts = PostDAO.showPosts(posts1,pageNum);
		JSONArray jsonArray = new JSONArray();
		
		int totalPageNum = posts1.size()%10 == 0 ? posts1.size()/10 :posts1.size()/10 + 1;
		JSONObject jsont = new JSONObject();
		jsont.accumulate("totalPageNum", totalPageNum);
		jsonArray.add(jsont);
		
		for(int i=0;i<posts.size();i++)
		{
			JSONObject json = new JSONObject();
			Post post=posts.get(i);
			json.accumulate("postno",post.getPostno());
			String posttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(post.getPosttime());
			json.accumulate("posttime",posttime);
			json.accumulate("title", post.getTitle());
			json.accumulate("content", post.getContent());
			json.accumulate("librarianno", post.getLibrarianno());
			jsonArray.add(json);
		}
		PrintWriter out =response.getWriter();
		out.print(jsonArray.toString());
		System.out.println(jsonArray);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); 
        response.setCharacterEncoding("UTF-8");
        
        int postno = Integer.valueOf(request.getParameter("postno"));
        Post post = PostDAO.get(postno);
        JSONObject json = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        json.accumulate("post", post);
        jsonArray.add(json);
        PrintWriter out =response.getWriter();
		out.print(jsonArray);
		System.out.println(jsonArray);
		out.flush();
		out.close();
        
	}

}
