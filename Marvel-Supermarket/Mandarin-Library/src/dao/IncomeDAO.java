package dao;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import entity.*;
import utils.DBHelper;

public class IncomeDAO {

	private IncomeDAO() {
	}

	public static IncomeDAO getInstance() {
		return new IncomeDAO();
	}

	public void add(Income income) {

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "insert into income values(?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

			ps.setDate(1, income.getDay());
			ps.setInt(2, income.getTotalfine());
			ps.setInt(3, income.getTotaldeposit());

			ps.execute();
			ResultSet rs = ps.getGeneratedKeys();

			DBHelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Incomegroup getTodayIncome() {
		Incomegroup total = new Incomegroup();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			String sdate = sdf.format(sqlDate);
			String const_s = "\'" + sdate + "\'";

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from income where day = " + const_s;

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				String day = rs.getString("day");
				String totalfine = rs.getString("totalfine");
				String totaldeposit = rs.getString("totaldeposit");
				int fine = Integer.parseInt(totalfine);
				int desposit = Integer.parseInt(totaldeposit);
				int income = fine + desposit;
				total.setIncome(income);
				total.setFine(fine);
				total.setDeposit(desposit);
				// total="�����룺"+totalincome+"�������룺"+totalfine+"��֤�����룺"+totaldeposit;
				// total=2;
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}

	public static List<Incomegroup> getMonthIncome(String syear) {

		List<Incomegroup> list = new ArrayList<Incomegroup>();
		try {
			int year = Integer.parseInt(syear);

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select  date_part('y', day) as year,\r\n" + "date_part('month', day) as month,\r\n"
					+ "sum(totalfine) as fine,\r\n" + "sum(totaldeposit) as deposit\r\n" + "from income\r\n"
					+ "where date_part('y', day)=" + year + "\r\n"
					+ "GROUP BY date_part('y', day),date_part('month', day) ORDER BY date_part('month', day) ";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				String sqlyear = rs.getString("year");
				String sqlmonth = rs.getString("month");
				String totalfine = rs.getString("fine");
				String totaldeposit = rs.getString("deposit");
				int fine = Integer.parseInt(totalfine);
				int desposit = Integer.parseInt(totaldeposit);
				int income = fine + desposit;
				Incomegroup group = new Incomegroup();
				group.setYear(sqlyear);
				group.setMonth(sqlmonth);
				group.setIncome(income);
				group.setFine(fine);
				group.setDeposit(desposit);
				list.add(group);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Incomegroup> getWeekIncome(String syear) {

		List<Incomegroup> list = new ArrayList<Incomegroup>();
		try {
			int year = Integer.parseInt(syear);

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select \r\n" + "				year,\r\n" + "				week,\r\n"
					+ "				sum(totalfine) AS fine,\r\n" + "				sum(totaldeposit) AS deposit\r\n"
					+ "from\r\n" + "		(\r\n" + "					select \r\n"
					+ "					EXTRACT( YEAR from DAY) AS year,\r\n"
					+ "					EXTRACT( week from DAY) AS week,\r\n" + "					totalfine,\r\n"
					+ "					totaldeposit\r\n" + "					FROM income\r\n"
					+ "					where EXTRACT( YEAR from DAY)=" + year + "\r\n" + "					) AS A\r\n"
					+ "					GROUP BY year,week\r\n" + "					ORDER BY year,week";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				String sqlyear = rs.getString("year");
				String sqlweek = rs.getString("week");
				String totalfine = rs.getString("fine");
				String totaldeposit = rs.getString("deposit");
				int fine = Integer.parseInt(totalfine);
				int desposit = Integer.parseInt(totaldeposit);
				int income = fine + desposit;
				Incomegroup group = new Incomegroup();
				group.setYear(sqlyear);
				group.setWeek(sqlweek);
				group.setIncome(income);
				group.setFine(fine);
				group.setDeposit(desposit);
				list.add(group);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Incomegroup> getMonthdayIncome(String syear, String smonth) {

		List<Incomegroup> list = new ArrayList<Incomegroup>();
		try {
			int year = Integer.parseInt(syear);
			int month = Integer.parseInt(smonth);

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select  date_part('d', day) as day,\r\n" + "totalfine as fine,\r\n"
					+ "totaldeposit as deposit\r\n" + "from income\r\n" + "where date_part('y', day)=" + year
					+ "and date_part('month', day)=" + month + "\r\n" + "ORDER BY date_part('d', day)";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				String sqlday = rs.getString("day");
				String totalfine = rs.getString("fine");
				String totaldeposit = rs.getString("deposit");
				int fine = Integer.parseInt(totalfine);
				int desposit = Integer.parseInt(totaldeposit);
				int income = fine + desposit;
				Incomegroup group = new Incomegroup();
				group.setDay(sqlday);
				group.setYear(syear);
				group.setMonth(smonth);
				group.setIncome(income);
				group.setFine(fine);
				group.setDeposit(desposit);
				list.add(group);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Incomegroup updateTodayIncome(int deposit) {
		Incomegroup total = new Incomegroup();
		Incomegroup t = getTodayIncome();
		int oldDeposit = t.getDeposit();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			String sdate = sdf.format(sqlDate);
			String const_s = "\'" + sdate + "\'";

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "update income set totaldeposit=? where day = " + const_s;
			PreparedStatement ps = c.prepareStatement(sql);

			ps.setInt(1, oldDeposit + deposit);
			ps.execute();

			DBHelper.closeConnection(c, ps,null);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	public Incomegroup decreaseTodayIncome(int deposit) {
		Incomegroup total = new Incomegroup();
		Incomegroup t = getTodayIncome();
		int oldDeposit = t.getDeposit();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			String sdate = sdf.format(sqlDate);
			String const_s = "\'" + sdate + "\'";

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "update income set totaldeposit=? where day = " + const_s;
			PreparedStatement ps = c.prepareStatement(sql);

			ps.setInt(1, oldDeposit - deposit);
			ps.execute();

			DBHelper.closeConnection(c, ps,null);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}

}
