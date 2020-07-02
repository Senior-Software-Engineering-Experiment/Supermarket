package servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import dao.CategoryDAO;
import dao.DeleteDAO;
import dao.LocationDAO;
import dao.ReaderDAO;
import entity.Book;
import entity.Category;
import entity.Delete;
import entity.Location;
import entity.Reader;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class DisplayBookServlet
 */
@WebServlet("/DisplayDeleteServlet")
public class DisplayDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DeleteDAO deleteDAO = DeleteDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        List<Delete> deletes = deleteDAO.list();
       
        Iterator<Delete> it = deletes.iterator();
     
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        
        System.out.println(1);
        while(it.hasNext()) {
        	System.out.println(1);
        	Delete delete = (Delete) it.next();
        	jsonObject.put("bookNo", delete.getBookNo());
        	jsonObject.put("title", delete.getTitle());
        	jsonObject.put("author", delete.getAuthor());
        	jsonObject.put("librarianUsername", delete.getLibrarianUsername());
        	jsonObject.put("deleteTime", delete.getDeleteTime().toString());
        	jsonArray.add(jsonObject);
        	 
        }
 
        response.getWriter().print(jsonArray.toString());
	}

}
