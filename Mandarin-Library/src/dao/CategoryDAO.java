package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;




import entity.Category;
import entity.Reader;
import utils.DBHelper;

public class CategoryDAO {
	private CategoryDAO() {
	}

	public static CategoryDAO getInstance() {
		return new CategoryDAO();
	}

	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from category";

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

	
	
	public void add(Category category) {

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "insert into category values(?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setInt(1, category.getCategoryNo());
			ps.setString(2, category.getCategoryName());
			
			ps.execute();
			
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				int bNo = rs.getInt(1);
				category.setCategoryNo(bNo);
			}

			DBHelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void update(Category category) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			
			String sql = "update category set categoryname= ? where categoryNo= ?";
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(1, category.getCategoryName());			
			ps.setInt(2,category.getCategoryNo() );
			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void delete(int categoryNo) {
		String const_s = "\'" + categoryNo + "\'";
		
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete from category where categoryNo = " + const_s;

			s.execute(sql);

			DBHelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Category get(int categoryNo) {
		String const_s = "\'" + categoryNo + "\'";
		Category category=new Category();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();
			
			String sql = "select * from category where categoryNo = " + const_s;

			ResultSet rs = s.executeQuery(sql);
			
			if (rs.next()) {
				category = new Category();
				String categoryname = rs.getString("categoryname");
				
				
				category.setCategoryName(categoryname);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}
	
	public List<Category> list(){
		List<Category> categorys = new ArrayList<Category>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from category order by categoryno";

			PreparedStatement ps = c.prepareStatement(sql);
			

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Category category = new Category();
				int categoryNo = rs.getInt(1);
				String categoryname = rs.getString(2);
				
				category.setCategoryNo(categoryNo);
				category.setCategoryName(categoryname);
				
				categorys.add(category);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categorys;
	}

	public List<Category> list(int pageNum) {
		List<Category> categorys = new ArrayList<Category>();
		
		int count = 10;
		int start = (pageNum - 1) * count; 

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from category order by categoryno limit " + count + " offset " + start;

			PreparedStatement ps = c.prepareStatement(sql);
			

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Category category = new Category();
				int categoryNo = rs.getInt(1);
				String categoryname = rs.getString(2);
				
				category.setCategoryNo(categoryNo);
				category.setCategoryName(categoryname);
				
				categorys.add(category);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categorys;
	}

    public List<Category> getCategorys() {
		List<Category> categorys = new ArrayList<Category>();

		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from Category";
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Category category = new Category();
				int categoryNo = rs.getInt(1);
				String categoryName = rs.getString(2);
				
				
				category.setCategoryNo(categoryNo);
				category.setCategoryName(categoryName);
				
				categorys.add(category);

			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categorys;
	}
}
