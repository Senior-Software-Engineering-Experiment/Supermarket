package servlet;

import java.io.IOException;
import java.util.Iterator;
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
 * Servlet implementation class DisplayCategoryInBookServlet
 */
@WebServlet("/DisplayCategoryInBookServlet")
public class DisplayCategoryInBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryDAO categoryDAO = CategoryDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayCategoryInBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        List<Category> allCategorys = categoryDAO.list();
        Iterator it = allCategorys.iterator();
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        while(it.hasNext()) {
        	Category category = (Category) it.next();
        	jsonObject.put("categoryName", category.getCategoryName());
        	jsonArray.add(jsonObject);
        }
        response.getWriter().print(jsonArray.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
