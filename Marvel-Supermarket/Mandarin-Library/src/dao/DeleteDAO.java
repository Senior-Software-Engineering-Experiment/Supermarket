package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import entity.Borrow;
import entity.Delete;
import entity.Reader;
import utils.DBHelper;

public class DeleteDAO {
	
	private DeleteDAO() {
	}

	public static DeleteDAO getInstance() {
		return new DeleteDAO();
	}
	
	public void add(Delete delete) {

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "insert into deleterec values(?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

			ps.setInt(1, delete.getBookNo());
			ps.setString(2, delete.getLibrarianUsername());
			ps.setTimestamp(3,delete.getDeleteTime());
			ps.setString(4,delete.getAuthor());
			ps.setString(5,delete.getTitle());
        		ps.execute();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				int bookNo = rs.getInt(1);
				delete.setBookNo(bookNo);
			}

			DBHelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 public List<Delete> list() {

			List<Delete> deletes = new ArrayList<Delete>();

			try {

				Connection c = DBHelper.getInstance().getConnection();
				String sql = new String();
				sql = "select * from deleterec order by bookno asc";
				
				PreparedStatement ps = c.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					Delete delete = new Delete();
					int  bookno = rs.getInt("bookno");
					String  librarianname = rs.getString("librarianUsername");
					Timestamp  deletetime = rs.getTimestamp("deletetime");
					String title = rs.getString("title");
					String author = rs.getString("author");
					
					delete.setBookNo(bookno);
					//reader.setReaderName(readername);
					delete.setLibrarianUsername(librarianname);
					delete.setDeleteTime(deletetime);
					delete.setTitle(title);
					delete.setAuthor(author);
					deletes.add(delete);
				}
				DBHelper.closeConnection(c, ps, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return deletes;
		}
	
}
