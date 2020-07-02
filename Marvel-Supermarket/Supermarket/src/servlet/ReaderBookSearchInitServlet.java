package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import entity.Category;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ReaderBookSearchInitServlet
 */
@WebServlet("/ReaderBookSearchInitServlet")
public class ReaderBookSearchInitServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private CategoryDAO categorydao = CategoryDAO.getInstance();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReaderBookSearchInitServlet() {
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        List<Category> categorys = categorydao.list();
        JSONObject jsonObject = new JSONObject();
        jsonObject.accumulate("categorys", categorys);
        
        
        response.getWriter().print(jsonObject.toString());
	}

	

}
