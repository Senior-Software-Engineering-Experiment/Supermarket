package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import entity.Book;
import entity.Borrow;
import entity.BorrowRecord;
import utils.DBHelper;

public class BorrowDAO {
	private BorrowDAO() {
	}

	public static BorrowDAO getInstance() {
		return new BorrowDAO();
	}

	public static void update(int bookno, Boolean bool, Timestamp returntime) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "update borrow set isreturned=?,returntime=? where bookNo= ?";
			PreparedStatement ps = c.prepareStatement(sql);
			
			ps.setBoolean(1, bool);
			ps.setTimestamp(2, returntime);
			ps.setInt(3, bookno);
			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int getlendnum(String readerno) {
		int total = 0;
		String const_s = "\'" + readerno + "\'";
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from borrow where isreturned is false and readerno="+const_s ;

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
	
	public void add(Borrow borrow) {

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "insert into borrow values(?,?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

			ps.setInt(1, borrow.getBookNo());
			ps.setString(2, borrow.getReaderNo());
			ps.setTimestamp(3, borrow.getBorrowTime());
			ps.setBoolean(4, borrow.isReturned());
			ps.setTimestamp(5, borrow.getShouldReturnTime());
			ps.setTimestamp(6, borrow.getReturnTime());

			ps.execute();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				int bookNo = rs.getInt(1);
				borrow.setBookNo(bookNo);
			}

			DBHelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Borrow get(int bookNo) {
		String const_s = "\'" + bookNo + "\'";
		Borrow borrow = new Borrow();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from borrow where bookNo = " + const_s;

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				borrow = new Borrow();
				String sbookno = rs.getString("bookno");
				String readerno = rs.getString("readerno");
				String sborrowtime = rs.getString("borrowtime");
				String sisreturned = rs.getString("isreturned");
				String sshouldreturntime = rs.getString("shouldreturntime");
				String sretuentime = rs.getString("returntime");
				int bookno = Integer.parseInt(sbookno);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Timestamp borrowtime = Timestamp.valueOf(sborrowtime);
				Timestamp shouldreturntime = Timestamp.valueOf(sshouldreturntime);
				Boolean isreturned = Boolean.parseBoolean(sisreturned);
				borrow.setBookNo(bookno);
				borrow.setReaderNo(readerno);
				borrow.setBorrowTime(borrowtime);
				borrow.setReturned(isreturned);
				borrow.setShouldReturnTime(shouldreturntime);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return borrow;
	}
	//luohaonan删除
		public void delete(String bookNo,Timestamp borrowData) {
	    	try {

				Connection c = DBHelper.getInstance().getConnection();

				Statement s = c.createStatement();

				String sql = "delete  from borrow where bookno = \'" + bookNo +"\'and borrowtime = \'" + borrowData +"\'";
				
				s.execute(sql);

				DBHelper.closeConnection(c, s, null);
		} catch (Exception e) {
				e.printStackTrace();
			}
	    }
		
		//luohaonan
		public List<BorrowRecord> all(String readerno) {
			List<BorrowRecord> borrows = new ArrayList<BorrowRecord>();
			try {
				Connection c = DBHelper.getInstance().getConnection();
				String sql = "select * from borrow,book where borrow.bookNo=book.bookNo  and borrow.readerno = '"
						+ readerno + "' order by borrow.bookNo ";
				PreparedStatement ps = c.prepareStatement(sql);
				
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
	                 
					int bookNo = rs.getInt("bookNo");
					String title = rs.getString("title");
					String author = rs.getString("author");
					String readerNo = readerno;
					
					Timestamp borrowTime = rs.getTimestamp("borrowTime");
					boolean isReturned = rs.getBoolean("isreturned");
					String sIsReturned = "YES";
					if(!isReturned) sIsReturned = "NO";
					Timestamp ingShouldReturnTime = rs.getTimestamp("shouldReturnTime");
					Timestamp ingReturnTime = rs.getTimestamp("returnTime");
					
					BorrowRecord borrow = new BorrowRecord(bookNo, title, author, readerNo, borrowTime,sIsReturned,ingShouldReturnTime, ingReturnTime);
					borrows.add(borrow);
				}
				DBHelper.closeConnection(c, ps, rs);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return borrows;
		}
		
		//周炳林
		public int getIngTotal(String readerno) {
			int ingTotal = 0;

			try {

				Connection c = DBHelper.getInstance().getConnection();

				Statement s = c.createStatement();

				String sql = "select count(*) from borrow where isReturned=false and readerno = '" + readerno + "'";
				ResultSet rs = s.executeQuery(sql);
				while (rs.next()) {
					ingTotal = rs.getInt(1);
				}
				DBHelper.closeConnection(c, s, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return ingTotal;
		}

		public int getFinishTotal(String readerno) {
			int finishTotal = 0;

			try {

				Connection c = DBHelper.getInstance().getConnection();

				Statement s = c.createStatement();

				String sql = "select count(*) from borrow where isReturned=true and readerno = '" + readerno + "'";
				ResultSet rs = s.executeQuery(sql);
				while (rs.next()) {
					finishTotal = rs.getInt(1);
				}
				DBHelper.closeConnection(c, s, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return finishTotal;
		}

		public List<Borrow> ing(String readerno) {
			List<Borrow> ingBooks = new ArrayList<Borrow>();

			try {
				Connection c = DBHelper.getInstance().getConnection();
				String sql = "select * from borrow,book where borrow.bookNo=book.bookNo and borrow.isreturned=false and borrow.readerno = '"
						+ readerno + "' order by borrow.bookNo ";
				PreparedStatement ps = c.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();

				while (rs.next()) {

					int ingBookNo = rs.getInt("bookNo");
					String ingTitle = rs.getString("title");
					String ingAuthor = rs.getString("author");
					String ingReaderNo = readerno;
					Timestamp ingBorrowTime = rs.getTimestamp("borrowTime");
					boolean isReturned = false;
					Timestamp ingShouldReturnTime = rs.getTimestamp("shouldReturnTime");
					Timestamp ingReturnTime = rs.getTimestamp("returnTime");
					Borrow ingBook = new Borrow(ingBookNo, ingTitle, ingAuthor, ingReaderNo, ingBorrowTime, isReturned,
							ingShouldReturnTime, ingReturnTime);
					ingBooks.add(ingBook);
				}
				DBHelper.closeConnection(c, ps, rs);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return ingBooks;
		}

		public List<Borrow> finish(String readerno) {
			List<Borrow> finishBooks = new ArrayList<Borrow>();

			try {
				Connection c = DBHelper.getInstance().getConnection();
				String sql = "select * from borrow,book where borrow.bookNo=book.bookNo and borrow.isreturned=true and borrow.readerno = '"
						+ readerno + "' order by borrow.bookNo ";
				PreparedStatement ps = c.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();

				while (rs.next()) {

					int ingBookNo = rs.getInt("bookNo");
					String ingTitle = rs.getString("title");
					String ingAuthor = rs.getString("author");
					String ingReaderNo = readerno;
					Timestamp ingBorrowTime = rs.getTimestamp("borrowTime");
					boolean isReturned = false;
					Timestamp ingShouldReturnTime = rs.getTimestamp("shouldReturnTime");
					Timestamp ingReturnTime = rs.getTimestamp("returnTime");
					Borrow finishBook = new Borrow(ingBookNo, ingTitle, ingAuthor, ingReaderNo, ingBorrowTime, isReturned,
							ingShouldReturnTime, ingReturnTime);
					finishBooks.add(finishBook);
				}
				DBHelper.closeConnection(c, ps, rs);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return finishBooks;
		}

		public List<Borrow> overTimeBook(String readerno, int dayfine) {
			List<Borrow> overTimeBooks = new ArrayList<Borrow>();
			Timestamp now = new Timestamp(System.currentTimeMillis());
			long t1 = now.getTime();
			try {
				Connection c = DBHelper.getInstance().getConnection();
				String sql = "select * from borrow,book where borrow.bookNo=book.bookNo and borrow.isreturned=false and borrow.readerno = '"
						+ readerno + "' order by borrow.bookNo ";
				PreparedStatement ps = c.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					Timestamp shouldreturn = rs.getTimestamp("shouldReturnTime");
					long t2 = shouldreturn.getTime();

					if (t1 > t2) {
						int fine = (int) ((t1 - t2) / (1000 * 60 * 60 * 24)) * dayfine;

						int ingBookNo = rs.getInt("bookNo");
						String ingTitle = rs.getString("title");
						String ingAuthor = rs.getString("author");
						String ingReaderNo = readerno;
						Timestamp ingBorrowTime = rs.getTimestamp("borrowTime");
						boolean isReturned = false;
						Timestamp ingShouldReturnTime = rs.getTimestamp("shouldReturnTime");
						Timestamp ingReturnTime = rs.getTimestamp("returnTime");
						Borrow overTimeBook = new Borrow(ingBookNo, ingTitle, ingAuthor, ingReaderNo, ingBorrowTime,
								isReturned, ingShouldReturnTime, ingReturnTime, fine);
						overTimeBooks.add(overTimeBook);

					}
				}
				DBHelper.closeConnection(c, ps, rs);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return overTimeBooks;
		}
		
		public ArrayList<Borrow> showFinish(ArrayList<Borrow> finish,int pageNum) {
			ArrayList<Borrow> showBooks = new ArrayList<Borrow>();
			int count = 5;
			int start = (pageNum-1)*count;
			if(finish==null) {
				return null;
			}else if(pageNum<1) {
				return null;
			}else {
				int i = 1;
				for(Borrow borrow : finish) {
					if(i>start&&i<=start+count) {
						showBooks.add(borrow);
					}
					i++;
				}
			}
			return showBooks;
		}
}
