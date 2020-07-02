package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Reader;

import utils.DBHelper;

public class ReaderDAO {
	
	public static ReaderDAO getInstance() {
		  return new ReaderDAO();
	   }
	
	public Reader get(String readerNo) {
		Reader reader = new Reader();
		try {
			Connection c = DBHelper.getInstance().getConnection();
			Statement s = c.createStatement();
			String sql = "select * from Reader where readerno = '" + readerNo + "'";
			ResultSet rs = s.executeQuery(sql);
			while(rs.next()) {
				reader.setReaderNo(rs.getString(1));
				reader.setReaderName(rs.getString(2));
				reader.setReaderPassword(rs.getString(3));
				reader.setEmail(rs.getString(4));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return reader;
	}
	
	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from Reader";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				total = rs.getInt(1);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	//娣诲姞璇昏�呰处鎴风殑鍑芥暟
	public void add(Reader reader) {
 	   //AcceptDAO acceptDAO = AcceptDAO.getInstance();
 	   try {
 		   Connection c = DBHelper.getInstance().getConnection();
 		   String sql = "insert into Reader values(?,?,?,?,?)" ; 
 		   PreparedStatement ps = c.prepareStatement(sql);
 		   
			   ps.setString(1, reader.getReaderNo());
			   ps.setString(2, reader.getReaderName());
			   ps.setString(3, reader.getReaderPassword());
			   ps.setString(4, reader.getEmail());
			   ps.setInt(5, reader.getReaderFine());
			   
			   ps.execute();
			   ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				String readerNo = rs.getString(1);
				reader.setReaderNo(readerNo);
			}
			DBHelper.closeConnection(c, ps, rs);
 	   } catch (Exception e) {
			e.printStackTrace();
		}
    }
    
	
	//鍒犻櫎璇昏�呰处鎴风殑鍑芥暟
    public void delete(String readerNo) {
    	
    	try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete  from Reader where readerno = \'" + readerNo +"\'";
			
			s.execute(sql);

			DBHelper.closeConnection(c, s, null);
	} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    
    public List<Reader> getReaders(int pageNum) {
		List<Reader> readers = new ArrayList<Reader>();
		
		int count = 10;
		int start = (pageNum - 1) * count;

		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from Reader limit " + count + " offset " + start;
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Reader reader = new Reader();
				String readerNo = rs.getString(1);
				String readerName = rs.getString(2);
				String readerPassword = rs.getString(3);
				String readerEmail = rs.getString(4);
				
				int readerFine = rs.getInt(5);
				
				reader.setReaderNo(readerNo);
				reader.setReaderName(readerName);
				reader.setReaderPassword(readerPassword);
				reader.setEmail(readerEmail);
				reader.setReaderFine(readerFine);
				readers.add(reader);

			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return readers;
	}
    
    public void update(Reader reader,String lastReaderNo)
    {
    	try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "update Reader set  readerno = ? , readername = ? ,readerpassword = ? , email = ?  where readerNo = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, reader.getReaderNo());
			ps.setString(2, reader.getReaderName());
			ps.setString(3, reader.getReaderPassword());
			ps.setString(4, reader.getEmail());
			ps.setString(5, lastReaderNo);
			ps.execute();
			DBHelper.closeConnection(c, ps, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    public List<Reader> list(String content) {

		List<Reader> readers = new ArrayList<Reader>();

		String readerContent = "\'%" + content + "%\'";

		
		try {

			Connection c = DBHelper.getInstance().getConnection();
			String sql = new String();
			sql = "select * from reader  where readerno like" + readerContent + " order by readerno asc";
			
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Reader reader = new Reader();
				String  readerno = rs.getString("readerno");
				String  readername = rs.getString("readername");
				String  readerpassword = rs.getString("readerpassword");
				String  email = rs.getString("email");
				int  readerfine = rs.getInt("readerfine");
				reader.setReaderNo(readerno);
				reader.setReaderPassword(readerpassword);
				reader.setEmail(email);
				reader.setReaderFine(readerfine);
				readers.add(reader);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return readers;
	}
    
    public Reader getReader(String username) {
    	Reader reader = new Reader();
    	try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from Reader where readerNo = '" + username +"'";
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String readerNo = rs.getString(1);
				String readerName = rs.getString(2);
				String readerPassword = rs.getString(3);
				String readerEmail = rs.getString(4);
				Integer readerFine = rs.getInt(5);
				
				reader.setReaderNo(readerNo);
				reader.setReaderName(readerName);
				reader.setReaderPassword(readerPassword);
				reader.setEmail(readerEmail);
				reader.setReaderFine(readerFine);

			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reader;
	}
    public void changeReaderemail(String readerno,String email){
    	try {
			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql ="update reader set email ='"+email+"'where readerno = '"+readerno+"'";
			s.executeUpdate(sql);

			DBHelper.closeConnection(c, s, null);
           
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    public void changePassword(String readerno,String password){
    	try {
			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql ="update reader set readerpassword ='"+password+"'where readerno = '"+readerno+"'";
			s.executeUpdate(sql);

			DBHelper.closeConnection(c, s, null);
           
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    public void changeReadername(String readerno,String name){
    	try {
			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql ="update reader set ReaderName ='"+name+"'where readerno = '"+readerno+"'";
			s.executeUpdate(sql);
			DBHelper.closeConnection(c, s, null);
           
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}
