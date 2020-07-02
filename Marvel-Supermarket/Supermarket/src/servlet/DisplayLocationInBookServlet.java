package servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LocationDAO;
import entity.Location;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class DisplayLocationInBookServlet
 */
@WebServlet("/DisplayLocationInBookServlet")
public class DisplayLocationInBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LocationDAO locationDAO = LocationDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayLocationInBookServlet() {
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
        List<Location> allLocations = locationDAO.list();
        Iterator it = allLocations.iterator();
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        while(it.hasNext()) {
        	Location location = (Location) it.next();
        	jsonObject.put("locationName", location.getLocationName());
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
