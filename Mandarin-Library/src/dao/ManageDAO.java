package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Librarian;
import utils.DBHelper;

public class ManageDAO {
	
	private ManageDAO() {
		
	}
	
	public static ManageDAO getInstance() {
		return new ManageDAO();
	}
	
	public boolean check(String username) {
		String const_l="\'"+username+"\'";
		boolean check = false;
		
		try {
			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();
			
			String sql="select * from librarian where lUserName="+const_l;
			
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			
			
			if(rs.next()) {
				check = false;
			}else {
				check = true;
			}
			
			DBHelper.closeConnection(c, ps, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	public int getTotal() {
		int total=0;
		try {
			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();
			
			String sql = "select count(*) from librarian";
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
	
	public void add(Librarian librarian) {

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "insert into librarian values(?,?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, librarian.getlUserName());
			ps.setString(2, "00010001");
			ps.setString(3, librarian.getlName());
			ps.setString(4, librarian.getlSex());
			ps.setString(5, librarian.getlTel());
			ps.setString(6, librarian.getlEmail());
			
			ps.execute();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				String lUserName = rs.getString(1);
				librarian.setlUserName(lUserName);
			}

			DBHelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void update(Librarian librarian) {
		try {
			Connection c =DBHelper.getInstance().getConnection();
			
			String sql="update librarian set lName=?, lSex=?,lTel=?,lEmail=? where lUserName=?";
			PreparedStatement ps=c.prepareStatement(sql);
			
			ps.setString(1, librarian.getlName());
			ps.setString(2, librarian.getlSex());
			ps.setString(3, librarian.getlTel());
			ps.setString(4, librarian.getlEmail());
			ps.setString(5, librarian.getlUserName());
			
			ps.execute();
			
			DBHelper.closeConnection(c, ps, null);			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Librarian> librarian(){
		return librarian(0,Short.MAX_VALUE);
	}
	
	public List<Librarian> list(String type,String content){
		List<Librarian> libs = new ArrayList<Librarian>();
		
		String lcontent = "\'"+ content + "\'";
		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = null;
			if(type.equals("userName")) {
				sql="select * from librarian where lUserName like "+lcontent+" order by lUserName asc";
			}else if(type.equals("name")) {
				sql="select * from librarian where lName like "+lcontent+" order by lUserName asc";
			}
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Librarian librarian = new Librarian();
				String username=rs.getString("lUserName");
				String name=rs.getString("lName");
				String sex=rs.getString("lSex");
				String email=rs.getString("lEmail");
				String tel=rs.getString("lTel");
				librarian.setlUserName(username);
				librarian.setlName(name);
				librarian.setlSex(sex);
				librarian.setlEmail(email);
				librarian.setlTel(tel);
				libs.add(librarian);			
			}
			DBHelper.closeConnection(c, ps, rs); 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return libs;
	}
	
	public List<Librarian> librarian(int start, int count){
		List<Librarian> librarians =new ArrayList<Librarian>();
		
		try {
			Connection c =DBHelper.getInstance().getConnection();
			String sql="select * from librarian";
			PreparedStatement ps=c.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				String lUserName=rs.getString("lUserName");
				String lName=rs.getString("lName");
				String lSex=rs.getString("lSex");
				String lTel=rs.getString("lTel");
				String lEmail=rs.getString("lEmail");
				String lPassword=rs.getString("lPassword");
				Librarian librarian=new Librarian(lUserName,lPassword,lName,lSex,lTel,lEmail);
				librarians.add(librarian);
			}
			DBHelper.closeConnection(c, ps, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return librarians;
	}
	
	public Librarian search(String content) {

		Librarian lib = new Librarian();

		String bookContent = "\'" + content + "\'";
		System.out.println(bookContent);
		try {

			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from librarian where lusername =" + bookContent ;
			System.out.println(sql);
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String lusername = rs.getString("lusername");
				String lname = rs.getString("lname");
				String lsex = rs.getString("lsex");
				String ltel = rs.getString("ltel");
				String lemail = rs.getString("lemail");
				System.out.println(lusername);
				System.out.println(lname);
				System.out.println(lsex);
				System.out.println(ltel);
				System.out.println(lemail);
				//boolean isCheck = rs.getBoolean("isCheck");
				lib.setlUserName(lusername);
				lib.setlName(lname);
				lib.setlSex(lsex);
				lib.setlTel(ltel);
				lib.setlEmail(lemail);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lib;
	}
	
	public void delete(String lUserName) {
		String const_l="\'"+lUserName+"\'";
		
		try {
			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();
			
			String sql="delete from librarian where lUserName="+const_l;
			
			s.execute(sql);
			
			DBHelper.closeConnection(c, s, null);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Librarian get(String lUserName) {
		String const_l ="\'" + lUserName +"\'";
		Librarian librarian=new Librarian();
		try {
			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();
			
			String sql = "select * from librarian where lUserName = " + const_l;

			ResultSet rs = s.executeQuery(sql); 
			
			if(rs.next()) {
				librarian = new Librarian();
				String lName=rs.getString("lName");
				String lSex=rs.getString("lSex");
				String lTel=rs.getString("lTel");
				String lEmail=rs.getString("lEmail");
				
				librarian.setlUserName(lUserName);
				librarian.setlName(lName);
				librarian.setlSex(lSex);
				librarian.setlTel(lTel);
				librarian.setlEmail(lEmail);
			}
			
			DBHelper.closeConnection(c, s, rs);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return librarian;
	}
	
	public List<Librarian> list(List<Librarian> librarians, int pageNum) {
		List<Librarian> show = new ArrayList<Librarian>();
		int count = 9;
		int start = (pageNum-1)*count;
		if(librarians==null) {
			return null;
		}else if(pageNum<1) {
			return null;
		}else {
			int i = 1;
			for(Librarian librarian : librarians) {
				if(i>start&&i<=start+count) {
					show.add(librarian);
				}
				i++;
			}
		}
		return show;
	}
}

