package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Librarian;
import entity.Admin;
import utils.DBHelper;

public class AdminDAO {
	
	private AdminDAO() {
		
	}
	
	public static AdminDAO getInstance() {
		return new AdminDAO();
	}

	public void change(String pass) throws SQLException{
		Connection c=DBHelper.getInstance().getConnection();
		
		Statement s=c.createStatement();
		
		String sql="update adminlock set alpassword ='"+pass+"'";
		s.execute(sql);
		DBHelper.closeConnection(c, s, null);
	}
	
	public boolean check(String pass) {
		boolean t=false;
		try {
			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select alpassword from adminlock";
			ResultSet rs = s.executeQuery(sql);

			while (rs.next()) {
				String password = rs.getString(1);
				t=pass.equals(password);
			}

			DBHelper.closeConnection(c, s, rs);
           
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	
	}
	
	public void read(Admin admin, String aNo) throws SQLException{
		Connection c=DBHelper.getInstance().getConnection();
		
		Statement s=c.createStatement();
		
		String sql="select * from adminlock where aLNo =  \'"+aNo+"\'";
		ResultSet rs=s.executeQuery(sql);
		while(rs.next()) {
			admin.setANo(rs.getString(1));
			admin.setAPassword(rs.getString(2));
		}
	}
	
}
