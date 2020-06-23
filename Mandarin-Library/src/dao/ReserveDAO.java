package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import entity.Reserve;
import utils.DBHelper;


public class ReserveDAO {

	private ReserveDAO() {
	}

	public static ReserveDAO getInstance() {
		return new ReserveDAO();
	}

	public void add(Reserve reserve) {

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "insert into reserve values(?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

			ps.setInt(1, reserve.getBookNo());
			ps.setString(2, reserve.getReaderNo());
			ps.setTimestamp(3, reserve.getReserveTime());

			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();

			DBHelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(int bookNo) {

		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete from reserve where bookNo = " + bookNo;

			s.execute(sql);

			DBHelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean isreserve(int bookNo) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select bookNo from reserve where bookNo = " + bookNo;
              
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			if(rs.next()) {
				DBHelper.closeConnection(c, ps, rs);
				return true;
			} else {
				DBHelper.closeConnection(c, ps, rs);
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Reserve> ing() {
		List<Reserve> ingReserves = new ArrayList<Reserve>();

		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from reserve order by reserveTime";
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				int ingBookNo = rs.getInt("bookNo");
				String ingReaderNo = rs.getString("readerNo");
                Timestamp ingReserveTime = rs.getTimestamp("reserveTime");
                Reserve ingReserve = new Reserve(ingBookNo,  ingReaderNo, ingReserveTime);
                ingReserves.add(ingReserve);
			}
			DBHelper.closeConnection(c, ps, rs);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ingReserves;
	}
	
	public void execture()  {
		/**
		 * 用于检测数据库失效订单并删除
		 * @DisallowConcurentExecution 这个注释标明上个任务未执行完不会执行下一个任务
		 */
		long EFFTIVE_TIME = 7200000;
		
		ReserveDAO reserveDAO = new ReserveDAO();
		Queue<Reserve> queue = new LinkedList<Reserve>();
		
		//将数据库预约订单按预定时间顺序加入到队列
		ArrayList<Reserve> ingList = new ArrayList<Reserve>(reserveDAO.ing());
		if(!ingList.isEmpty()) {
			for(Reserve o : ingList) {
				queue.offer(o);
			}
		}
		
		//获取队列的头元素，检测头订单是否失效
	    Reserve element = queue.peek();
	    while(element != null) {
	    	//获取时间差
	    	Long diff = this.checkReserveTime(element);
	    	if(diff != null && diff>= EFFTIVE_TIME) {
	    		int bookNo = element.getBookNo();
	    		reserveDAO.delete(bookNo);
	    		//弹出队列
	    		queue.poll();
	    		//取下一个元素
	    		element = queue.peek();
	    	} else if (diff < EFFTIVE_TIME) {
	    		try {
					//等待检测
	    			Thread.sleep(EFFTIVE_TIME - diff);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
	    	}
	    	
	    }
	}
	
	public Long checkReserveTime(Reserve reserve) {
		/**
		 * 获取下单时间和现在的时间差
		 */
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Long diff = null;
		if(reserve != null) {
			Date createTime = reserve.getReserveTime();
			try {
				diff = dateFormat.parse(dateFormat.format(date)).getTime() - dateFormat.parse(dateFormat.format(createTime)).getTime();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//返回值为毫秒
		return diff;
		
	}
}
