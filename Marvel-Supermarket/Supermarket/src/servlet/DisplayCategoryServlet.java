package servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDAO;
import entity.Category;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;



/**
 * Servlet implementation class DisplayCategoryServlet
 */
@WebServlet("/DisplayCategoryServlet")
public class DisplayCategoryServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	CategoryDAO categoryDAO = CategoryDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayCategoryServlet() {
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
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        int categoryNum = 0;
        List<Category> categorys = categoryDAO.list(pageNum);
        List<Category> allCategorys = categoryDAO.list();
        Iterator it = categorys.iterator();
        categoryNum = allCategorys.size();
        int totalPageNum;
        if(categoryNum % 10 == 0)
        totalPageNum = categoryNum / 10;
        else totalPageNum = categoryNum / 10 + 1;
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        if(it.hasNext()) {
        	while(it.hasNext()) {
            	Category category = (Category) it.next();
            	jsonObject.put("categoryName", category.getCategoryName());
            	jsonObject.put("categoryNo", category.getCategoryNo());
            	jsonObject.put("totalPage", totalPageNum);
            	jsonArray.add(jsonObject);
            }
            response.getWriter().print(jsonArray.toString());
        }
        else {
        	jsonObject.put("categoryName", "null");
        	jsonObject.put("categoryNo", "null");
        	jsonObject.put("totalPage", 1);
        	jsonArray.add(jsonObject);
        	response.getWriter().print(jsonArray.toString());
        }
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
