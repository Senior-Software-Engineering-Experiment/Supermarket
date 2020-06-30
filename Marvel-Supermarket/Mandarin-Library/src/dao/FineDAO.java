package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Admin;
import entity.Fine;
import utils.DBHelper;

public class FineDAO {
	private FineDAO() {
		
	}
	
	public static FineDAO getInstance() {
		return new FineDAO();
	}
	
	public void read(Fine fine) throws SQLException{
		Connection c=DBHelper.getInstance().getConnection();
		
		Statement s=c.createStatement();
		
		String sql="select * from fine";
		ResultSet rs=s.executeQuery(sql);
		while(rs.next()) {
			fine.setBookFine(rs.getInt(1));
			fine.setReturnPeriod(rs.getInt(2));
			fine.setSecurityDesposit(rs.getInt(3));

		}
	}
	
	public Fine get() {
		Fine fine=new Fine();
		try {
			Connection c=DBHelper.getInstance().getConnection();
			
			Statement s=c.createStatement();
			
			String sql="select * from fine";
			
			ResultSet rs = s.executeQuery(sql);
			
			if(rs.next()) {
				fine = new Fine();
				int bookFine=rs.getInt("BookFine");
				int returnPeriod=rs.getInt("ReturnPeriod");
				int securityDesposit=rs.getInt("SecurityDesposit");
				
				fine.setBookFine(bookFine);
				fine.setReturnPeriod(returnPeriod);
				fine.setSecurityDesposit(securityDesposit);
			}
			DBHelper.closeConnection(c, s, rs);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return fine;
		
	}
	
	public void update(Fine fine) {

		try {
			
			Connection c=DBHelper.getInstance().getConnection();

			String sql="update Fine set BookFine=?,ReturnPeriod=?,SecurityDesposit=?";
			PreparedStatement ps=c.prepareStatement(sql);
			ps.setInt(1, fine.getBookFine());
			ps.setInt(2, fine.getReturnPeriod());
			ps.setInt(3, fine.getSecurityDesposit());
			ps.execute();
			fine.toString();
			DBHelper.closeConnection(c, ps, null);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getFine() {

		int fine = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			// String sql = "select count(*) from accept,currentLogin where
			// accept.sNo=currentLogin.currentNo and accept.isCompleted=false";
			String sql = "select bookfine from fine";
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				fine = rs.getInt(1);
			}
			DBHelper.closeConnection(c, s, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fine;
	}

}
