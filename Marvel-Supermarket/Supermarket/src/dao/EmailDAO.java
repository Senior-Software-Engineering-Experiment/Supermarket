package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Timestamp;


import utils.DBHelper;

public class EmailDAO {

	private EmailDAO() {

	}

	public static EmailDAO getInstance() {
		return new EmailDAO();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map emailAndbookNo() {
		List<String> emails = new ArrayList<String>();
		List<Integer> bookNos = new ArrayList<Integer>();
		List<String> titles = new ArrayList<String>();
		List<Integer> days = new ArrayList<Integer>();
		Map map = new HashMap();
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select email,book.bookno,title,shouldreturntime from book,reader,borrow where reader.readerno = borrow.readerno and isreturned = false and borrow.bookno = book.bookno";
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String email = rs.getString("email");
				int bookno = rs.getInt("bookNo");
				String title = rs.getString("title");
				Timestamp shouldreturntime = rs.getTimestamp("shouldreturntime");
				long t2 = shouldreturntime.getTime();
				Timestamp nowtime = new Timestamp(System.currentTimeMillis());
				long t1 = nowtime.getTime();
				
				if( t1 - t2 >= -259200000 ) {
				emails.add(email);
				bookNos.add(bookno);
				titles.add(title);
				int day = (int) ((t1 - t2) / (1000 * 60 * 60 * 24));
				
				if(day >= 0) {
					day++;
				} else {
					day--;
				}
                days.add(day);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("emails", emails);
		map.put("bookNos", bookNos);
		map.put("titles", titles);
		map.put("days", days);
		return map;
	}

}
