package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import entity.Librarian;
import utils.DBHelper;

public class LibrarianLoginDAO {
	public LibrarianLoginDAO() {
	}

	public static LibrarianLoginDAO getInstance() {
		return new LibrarianLoginDAO();
	}
	
	public void updateLibrarian(String libName, String libPassword) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			Statement s = c.createStatement();
			String sql = "update librarian set lpassword = '" + libPassword + "' where lusername = '" + libName + "'";
			ResultSet rs = s.executeQuery(sql);
			DBHelper.closeConnection(c, s, rs);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getLibPass(String libName) {
		String password = null;
		try {
			Connection c = DBHelper.getInstance().getConnection();
			Statement s = c.createStatement();
			String sql = "select * from librarian where lusername ='" + libName + "'";
			ResultSet rs = s.executeQuery(sql);
			while(rs.next()) {
				int userName = rs.getInt(1);
				password = rs.getString(2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return password;
	}

	public boolean get(String lName, String lPassword) {
		Librarian librarian = new Librarian();
		boolean t = false;
		if (lName.length() != 8 || lName.equals("")) {
			return t;
		} else {
			try {

				Connection c = DBHelper.getInstance().getConnection();

				Statement s = c.createStatement();

				String sql = "select * from librarian where lusername ='" + lName + "'";
				ResultSet rs = s.executeQuery(sql);

				while (rs.next()) {

					int lno = rs.getInt(1);
					String lpass = rs.getString(2);
					librarian.setlName(lName);
					librarian.setlPassword(lpass);
					t = lPassword.equals(librarian.getlPassword());
		
				}

				DBHelper.closeConnection(c, s, rs);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return t;
		}

	}

	public boolean forgotPass(String librarianName, String librarianEmail) {
		boolean fit = false;
		if (librarianName.length() != 8 || librarianName.equals("")) {
			return fit;
		} else {
			try {

				Connection c = DBHelper.getInstance().getConnection();

				Statement s = c.createStatement();

				String sql = "select * from librarian where lusername = '" + librarianName + "'";
				ResultSet rs = s.executeQuery(sql);

				while (rs.next()) {
					String libEmail = rs.getString(6);
					fit = libEmail.equals(librarianEmail);
				}

				DBHelper.closeConnection(c, s, rs);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return fit;
		}
	}

	public boolean getlNo(String userName) {
		boolean test = true;
		String lno = "";
		String username = userName;
		if (username.length() != 8 || username.equals("")) {
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
