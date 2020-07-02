package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Category;
import entity.Location;
import utils.DBHelper;

public class LocationDAO {
	private LocationDAO() {
	}

	public static LocationDAO getInstance() {
		return new LocationDAO();
	}

	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from location";

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

	
	
	public void add(Location location) {

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "insert into location values(?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setInt(1, location.getLocationNo());
			ps.setString(2, location.getLocationName());
			
			ps.execute();
			
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				int bNo = rs.getInt(1);
				location.setLocationNo(bNo);
			}

			DBHelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void update(Location location) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			
			String sql = "update location set Locationname= ? where locationNo= ?";
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setString(1, location.getLocationName());			
			ps.setInt(2,location.getLocationNo() );
			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void delete(int locationNo) {
		String const_s = "\'" + locationNo + "\'";
		
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete from location where locationNo = " + const_s;

			s.execute(sql);

			DBHelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Location get(int locationNo) {
		String const_s = "\'" + locationNo + "\'";
		Location location=new Location();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();
			
			String sql = "select * from location where locationNo = " + const_s;

			ResultSet rs = s.executeQuery(sql);
			
			if (rs.next()) {
				location = new Location();
				String locationname = rs.getString("locationname");
				
				
				location.setLocationName(locationname);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return location;
	}

	public List<Location> list(int pageNum) {
		List<Location> locations = new ArrayList<Location>();
		
		int count = 10;
		int start = (pageNum -1) * count;

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from location order by locationno limit " + count + " offset " + start;

			PreparedStatement ps = c.prepareStatement(sql);
			

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Location location = new Location();
				int locationNo = rs.getInt(1);
				String locationname = rs.getString(2);
				
				location.setLocationNo(locationNo);
				location.setLocationName(locationname);
				
				locations.add(location);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return locations;
	}
	
	public List<Location> list() {
		List<Location> locations = new ArrayList<Location>();
		
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from location order by locationno";

			PreparedStatement ps = c.prepareStatement(sql);
			

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Location location = new Location();
				int locationNo = rs.getInt(1);
				String locationname = rs.getString(2);
				
				location.setLocationNo(locationNo);
				location.setLocationName(locationname);
				
				locations.add(location);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return locations;
	}
	
	public List<Location> getLocations() {
		List<Location> locations = new ArrayList<Location>();

		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from Location";
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Location location = new Location();
				int locationNo = rs.getInt(1);
				String locationName = rs.getString(2);
				
				
				location.setLocationNo(locationNo);
				location.setLocationName(locationName);
				
				locations.add(location);

			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return locations;
	}
}
