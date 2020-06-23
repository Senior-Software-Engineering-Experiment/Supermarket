package servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReaderDAO;
import entity.Book;
import entity.Reader;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class DisplayReaderServlet
 */
@WebServlet("/DisplayReaderServlet")
public class DisplayReaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ReaderDAO readerDAO = ReaderDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayReaderServlet() {
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
        int readerNum = 0;
        List<Reader> readers = readerDAO.getReaders(pageNum);
        readerNum = readerDAO.getTotal();
        Iterator it = readers.iterator();
        int totalPageNum = 1;
        if(readerNum % 10 == 0)
        totalPageNum = readerNum / 10;
        else totalPageNum = readerNum / 10 + 1;
        JSONObject jsonObject = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        if(it.hasNext()) {
        	while(it.hasNext()) {
        		Reader reader = (Reader) it.next();
        		jsonObject.put("readerNo", reader.getReaderNo());
        		jsonObject.put("readerName", reader.getReaderName());
        		jsonObject.put("readerPassword", reader.getReaderPassword());
        		jsonObject.put("readerEmail", reader.getEmail());
        		jsonObject.put("readerFine", reader.getReaderFine());
        		jsonObject.put("totalPage", totalPageNum);
        		jsonArray.add(jsonObject);
        	}
        	response.getWriter().print(jsonArray.toString());
        } else {
        	jsonObject.put("readerNo", "null");
    		jsonObject.put("readerName", "null");
    		jsonObject.put("readerPassword", "null");
    		jsonObject.put("readerEmail", "null");
    		jsonObject.put("readerFine", "null");
    		jsonObject.put("totalPage", "null");
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
