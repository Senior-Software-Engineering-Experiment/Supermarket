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
 * Servlet implementation class AddLocationServlet
 */
@WebServlet("/AddLocationServlet")
public class AddLocationServlet extends HttpServlet {
private LocationDAO  locationDAO =LocationDAO.getInstance();
	

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        int locationNo = locationDAO.getTotal() + 1;
		String floor = request.getParameter("Floor");
		String shelf = request.getParameter("Shelf");
		String area = request.getParameter("Area");
		String locationName=floor+"-"+shelf+"-"+area;
		Location location=new Location();
		location.setLocationNo(locationNo);
		location.setLocationName(locationName);
		locationDAO.add(location);
		request.getRequestDispatcher("library.jsp").forward(request, response);
	}

}
