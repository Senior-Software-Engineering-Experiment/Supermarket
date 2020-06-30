package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LocationDAO;
import entity.Location;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class TurnToThisLocationServlet
 */
@WebServlet("/TurnToThisLocationServlet")
public class TurnToThisLocationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LocationDAO locationDAO = LocationDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TurnToThisLocationServlet() {
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
        int locationid = Integer.valueOf(request.getParameter("thisLocationNo"));
        
        JSONObject jsonObject = new JSONObject();
        Location thisLocation = locationDAO.get(locationid);
        
        String locationName = thisLocation.getLocationName();
        
        jsonObject.put("locationNo", locationid);
       
        jsonObject.put("locationName", locationName);
        
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
