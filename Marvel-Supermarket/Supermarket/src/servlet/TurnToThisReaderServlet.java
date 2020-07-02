package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReaderDAO;
import entity.Book;
import entity.Reader;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class TurnToThisReaderServlet
 */
@WebServlet("/TurnToThisReaderServlet")
public class TurnToThisReaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ReaderDAO readerDAO = ReaderDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TurnToThisReaderServlet() {
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
        String readerNo = request.getParameter("changeReader");
        JSONObject jsonObject = new JSONObject();
        Reader thisReader = readerDAO.get(readerNo);
        String account = thisReader.getReaderNo();
        String name = thisReader.getReaderName();
        String password = thisReader.getReaderPassword();
        String email = thisReader.getEmail();
        jsonObject.put("account", account);
        jsonObject.put("name", name);
        jsonObject.put("password", password);
        jsonObject.put("email", email);
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
