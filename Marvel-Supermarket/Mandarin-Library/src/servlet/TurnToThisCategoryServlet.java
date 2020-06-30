package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import entity.Book;
import entity.Category;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class TurnToThisCategoryServlet
 */
@WebServlet("/TurnToThisCategoryServlet")
public class TurnToThisCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryDAO categoryDAO = CategoryDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TurnToThisCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        int categoryid = Integer.valueOf(request.getParameter("thisCategoryNo"));
        
        JSONObject jsonObject = new JSONObject();
        Category thisCategory = categoryDAO.get(categoryid);
        
        String categoryName = thisCategory.getCategoryName();
        
        jsonObject.put("categoryNo", categoryid);
       
        jsonObject.put("categoryName", categoryName);
        
        response.getWriter().print(jsonObject.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
