package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LocationDAO;

import entity.Location;

/**
 * Servlet implementation class ChangeLocationInfoServlet
 */
@WebServlet("/ChangeLocationInfoServlet")
public class ChangeLocationInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LocationDAO locationDAO = LocationDAO.getInstance();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeLocationInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String name = request.getParameter("thisLocationName");
        int locationid = Integer.parseInt(request.getParameter("thisLocationNo"));
        Location newLocation = locationDAO.get(locationid);
        newLocation.setLocationNo(locationid);
        newLocation.setLocationName(name);
        System.out.println(newLocation.getLocationNo());
        locationDAO.update(newLocation);
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
