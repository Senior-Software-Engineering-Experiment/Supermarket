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
 * Servlet implementation class DisplayLocationServlet
 */
@WebServlet("/DisplayLocationServlet")
public class DisplayLocationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LocationDAO locationDAO = LocationDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayLocationServlet() {
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
        
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        int locationNum = 0;
        List<Location> locations = locationDAO.list(pageNum);
        locationNum = locationDAO.getTotal();
        Iterator it = locations.iterator();
        int totalPageNum;
        if(locationNum % 10 == 0)
        totalPageNum = locationNum / 10;
        else totalPageNum = locationNum / 10 + 1;
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        if(it.hasNext()) {
        	while(it.hasNext()) {
            	Location location = (Location) it.next();
            	jsonObject.put("locationName", location.getLocationName());
            	jsonObject.put("locationNo", location.getLocationNo());
            	jsonObject.put("totalPage", totalPageNum);
            	jsonArray.add(jsonObject);
            }
            response.getWriter().print(jsonArray.toString());
        }
        else {
        	jsonObject.put("locationName", "null");
        	jsonObject.put("locationNo", "null");
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
