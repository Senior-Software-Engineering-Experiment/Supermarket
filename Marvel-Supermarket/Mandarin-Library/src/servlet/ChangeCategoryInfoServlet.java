package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import dao.CategoryDAO;
import entity.Book;
import entity.Category;

/**
 * Servlet implementation class ChangeCategoryServlet
 */
@WebServlet("/ChangeCategoryInfoServlet")
public class ChangeCategoryInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryDAO categoryDAO = CategoryDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeCategoryInfoServlet() {
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
        
        String name = request.getParameter("thisName");
        int categoryid = Integer.parseInt(request.getParameter("thisCategoryNo"));
        Category newCategory = categoryDAO.get(categoryid);
        newCategory.setCategoryNo(categoryid);
        newCategory.setCategoryName(name);
        System.out.println(newCategory.getCategoryNo());
        categoryDAO.update(newCategory);
        request.getRequestDispatcher("library.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
