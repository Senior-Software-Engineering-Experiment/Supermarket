package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LibrarianLoginDAO;
import entity.Librarian;
import entity.Location;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class RecoverLibPassServlet
 */
@WebServlet("/RecoverLibPassServlet")
public class RecoverLibPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LibrarianLoginDAO librarianDAO = LibrarianLoginDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecoverLibPassServlet() {
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
        String libName = request.getParameter("recoveringLibName");
        String libPass = request.getParameter("libNewPass");
        String originPass = librarianDAO.getLibPass(libName);
        JSONObject jsonObject = new JSONObject();
        if(originPass.contentEquals(libPass)) {
        	jsonObject.put("status",false);
        	response.getWriter().print(jsonObject.toString());
        }
        else {
        	jsonObject.put("status",true);
        	librarianDAO.updateLibrarian(libName, libPass);
        	response.getWriter().print(jsonObject.toString());
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
