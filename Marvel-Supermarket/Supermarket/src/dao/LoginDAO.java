package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import entity.Admin;
import entity.Librarian;
import entity.Reader;
import utils.DBHelper;

public class LoginDAO {
	private LoginDAO() {
	}

	public static LoginDAO getInstance() {
		return new LoginDAO();
	}
	
	public boolean geta(String aNo,String aPassword) {
		Admin admin = new Admin();
		boolean t=false;
		try {

			admin = new Admin("1","1");
			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from adminaccount where aNo ='" + aNo +"'";
			ResultSet rs = s.executeQuery(sql);

			while (rs.next()) {
	
				String ano = rs.getString(1);
				String pass = rs.getString(2);
				
				admin.setANo(ano);
				admin.setAPassword(pass);
				t=aPassword.equals(admin.getAPassword());

			}

			DBHelper.closeConnection(c, s, rs);
           
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	
	}
	
	public boolean getaNo(String aNo) {
		boolean t=false;
		try {
			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from adminaccount where aNo ='" + aNo +"'";
			ResultSet rs = s.executeQuery(sql);

			while (rs.next()) {
				String pass = rs.getString(2);
				t=!(pass==null);
			}

			DBHelper.closeConnection(c, s, rs);
           
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	
	}
	
	public boolean getat(String alNo,String alPassword) {
		Admin admin = new Admin();
		boolean t=false;
		try {

			admin = new Admin("1","1");
			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from AdminLock where alNo ='" + alNo + "'" ;
			ResultSet rs = s.executeQuery(sql);

			while (rs.next()) {
						
				String pass = rs.getString(2);
				String ano = rs.getString(1);
				admin.setANo(ano);
				admin.setAPassword(pass);
				//t=ano.equals(admin.getANo());
				t=alPassword.equals(admin.getAPassword());
			}

			DBHelper.closeConnection(c, s, rs);
           
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	
	}
	public boolean getatNo(String alNo) {
		boolean t=false;
		try {
			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from AdminLock where alNo ='" + alNo +"'";
			ResultSet rs = s.executeQuery(sql);

			while (rs.next()) {
				String pass = rs.getString(2);
				t=!(pass.equals(null));
			}

			DBHelper.closeConnection(c, s, rs);
           
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	
	}
	
	public boolean get(String rNo, String rPassword) {
		Reader reader = new Reader();
		boolean t = false;
		if (rNo.length() != 11 || rNo.equals("")) {
			return t;
		} else {
			try {

				Connection c = DBHelper.getInstance().getConnection();

				Statement s = c.createStatement();

				String sql = "select * from reader where readerno ='" + rNo + "'";
				ResultSet rs = s.executeQuery(sql);

				while (rs.next()) {

					String rno = rs.getString(1);
					String rpass = rs.getString(3);
					reader.setReaderNo(rno);
					reader.setReaderPassword(rpass);
					t = rPassword.equals(reader.getReaderPassword());
				}

				DBHelper.closeConnection(c, s, rs);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return t;
		}

	}


	public boolean getrNo(String userName) {
		boolean test = true;
		String rno = "";
		if (userName.length() != 11 || userName.equals("")) {
			return !test;
		} else {
			try {

				Connection c = DBHelper.getInstance().getConnection();

				Statement s = c.createStatement();

				String sql = "select * from reader where readerno ='" + userName + "'";
				ResultSet rs = s.executeQuery(sql);

				while (rs.next()) {

					rno = rs.getString(1);
				}

				DBHelper.closeConnection(c, s, rs);

			} catch (Exception e) {
				e.printStackTrace();
			}
			if (rno.equals("")) {
				test = false;
			}
			return test;
		}
	}
	
	
	public boolean getl(String lNo, String lPassword) {
		Librarian librarian = new Librarian();
		boolean t = false;
		if (lNo.length() != 8 || lNo.equals("")) {
			return t;
		} else {
			try {

				Connection c = DBHelper.getInstance().getConnection();

				Statement s = c.createStatement();

				String sql = "select * from librarian where lusername ='" + lNo + "'";
				ResultSet rs = s.executeQuery(sql);

				while (rs.next()) {

					String lno = rs.getString(1);
					String lpass = rs.getString(2);
				
					
					librarian.setlName(lno);
					librarian.setlPassword(lpass);
					t = lPassword.equals(lpass);
					//System.out.println(lno + ',' + lpass);
					//System.out.println(t);
				}

				DBHelper.closeConnection(c, s, rs);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return t;
		}

	}

	public boolean getlNo(String userName) {
		boolean test = true;
		String lno = "";
		if (userName.length() != 8 || userName.equals("")) {
			return !test;
		} else {
			try {

				Connection c = DBHelper.getInstance().getConnection();

				Statement s = c.createStatement();

				String sql = "select * from librarian where lusername ='" + userName + "'";
				ResultSet rs = s.executeQuery(sql);

				while (rs.next()) {

					lno = rs.getString(1);
				}

				DBHelper.closeConnection(c, s, rs);

			} catch (Exception e) {
				e.printStackTrace();
			}
			if (lno.equals("")) {
				test = false;
			}
			return test;
		}
	}
}
