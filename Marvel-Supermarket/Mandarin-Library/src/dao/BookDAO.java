package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import entity.Bookstate;

import entity.Book;
import utils.DBHelper;

public class BookDAO {
	private BookDAO() {
	}

	public static BookDAO getInstance() {
		return new BookDAO();
	}

	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from book";

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

	public int getMax() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select max(bookno) from book";

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

	public void add(Book book) {

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "insert into book values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);

			ps.setInt(1, book.getBookNo());
			ps.setString(2, book.getTitle());
			ps.setString(3, book.getAuthor());
			ps.setString(4, book.getLanguage());
			ps.setString(5, book.getPrice());
			ps.setString(6, book.getTime());
			ps.setString(7, book.getPublish());
			ps.setString(8, book.getBrief());
			ps.setString(9, book.getISBN());
			ps.setString(10, book.getCategory());
			ps.setString(11, book.getLocation());

			ps.execute();

			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				int bNo = rs.getInt(1);
				book.setBookNo(bNo);
			}

			DBHelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	public void update(Book book) {
		try {

			Connection c = DBHelper.getInstance().getConnection();


			String sql = "update book set title= ?, author= ?, language= ?, price= ?, time= ?, publish= ? , brief= ? , ISBN= ? ,category= ?,location=? where bookNo= ?";
			PreparedStatement ps = c.prepareStatement(sql);

			ps.setString(1, book.getTitle());
			ps.setString(2, book.getAuthor());
			ps.setString(3, book.getLanguage());
			ps.setString(4, book.getPrice());
			ps.setString(5, book.getTime());
			ps.setString(6, book.getPublish());
			ps.setString(7, book.getBrief());
			ps.setString(8, book.getISBN());
			ps.setString(9, book.getCategory());
			ps.setString(10, book.getLocation());
			ps.setInt(11, book.getBookNo());
			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void delete(int bookNo) {
		String const_s = "\'" + bookNo + "\'";

		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete from book where bookNo = " + const_s;

			s.execute(sql);

			DBHelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Book get(int bookNo) {
		String const_s = "\'" + bookNo + "\'";
		Book book=new Book();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from book where bookNo = " + const_s;

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				book = new Book();
				String title = rs.getString("title");
				String author = rs.getString("author");
				String language = rs.getString("language");
				String price = rs.getString("price");
				String time = rs.getString("time");
				String publish = rs.getString("publish");
				String brief = rs.getString("brief");
				String ISBN = rs.getString("ISBN");
				String category = rs.getString("category");
				String location = rs.getString("location");

				book.setBookNo(bookNo);
				book.setTitle(title);
				book.setAuthor(author);
				book.setLanguage(language);
				book.setPrice(price);
				book.setTime(time);
				book.setPublish(publish);
				book.setBrief(brief);
				book.setISBN(ISBN);
				book.setCategory(category);
				book.setLocation(location);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}

	/*
	public List<Book> list() {
		return list(0, Short.MAX_VALUE);
	}
	*/
	
	public List<Book> list(int start, int count) {
		List<Book> books = new ArrayList<Book>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from book order by bookno limit " + count + " offset " + start;

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Book book = new Book();
				int bookNo = rs.getInt(1);
				String title = rs.getString(2);
				String author = rs.getString(3);
				String language = rs.getString(4);
				String price = rs.getString(5);
				String time = rs.getString(6);
				String publish = rs.getString(7);
				String brief = rs.getString(8);
				String ISBN = rs.getString(9);
				String category = rs.getString(10);
				String location = rs.getString(11);

				book.setBookNo(bookNo);
				book.setTitle(title);
				book.setAuthor(author);
				book.setLanguage(language);
				book.setPrice(price);
				book.setTime(time);
				book.setPublish(publish);
				book.setBrief(brief);
				book.setISBN(ISBN);
				book.setCategory(category);
				book.setLocation(location);
				books.add(book);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return books;
	}
	
	public List<Book> list(int pageNum) {
		List<Book> books = new ArrayList<Book>();
		
		int count = 10;
		int start = (pageNum - 1) * count;

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from book order by bookno limit " + count + " offset " + start;

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Book book = new Book();
				int bookNo = rs.getInt(1);
				String title = rs.getString(2);
				String author = rs.getString(3);
				String language = rs.getString(4);
				String price = rs.getString(5);
				String time = rs.getString(6);
				String publish = rs.getString(7);
				String brief = rs.getString(8);
				String ISBN = rs.getString(9);
				String category = rs.getString(10);
				String location = rs.getString(11);
				
				book.setBookNo(bookNo);
				book.setTitle(title);
				book.setAuthor(author);
				book.setLanguage(language);
				book.setPrice(price);
				book.setTime(time);
				book.setPublish(publish);
				book.setBrief(brief);
				book.setISBN(ISBN);
				book.setCategory(category);
				book.setLocation(location);
				books.add(book);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return books;
	}




	public List<Book> lendlist(String sort,String content) {

		List<Book> books = new ArrayList<Book>();

		String bookCategory = "\'" + sort + "\'";
		String bookContent = "\'%" + content + "%\'";

		
		try {

			Connection c = DBHelper.getInstance().getConnection();
			String sql = null;
			if(sort.equals("title")) {
				sql = "select * from book where bookno  in (SELECT bookno from borrow where isreturned is NOT TRUE) and title like " + bookContent + " order by bookNo asc";
				
			}else if(sort.equals("author")) {
				sql =  "select * from book where bookno  in (SELECT bookno from borrow where isreturned is NOT TRUE) and author like "+ bookContent + " order by bookNo asc";
				
			}else if(sort.equals("category")) {
				sql =  "select * from book where bookno  in (SELECT bookno from borrow where isreturned is NOT TRUE) and category like "+ bookContent + " order by bookNo asc";
				
			}else if(sort.equals("bookNo")) {
				int bookNo=Integer.parseInt(sort);
				sql =  "select * from book where bookno  in (SELECT bookno from borrow where isreturned is NOT TRUE) and bookNo = "+ bookContent;
				
			}
			
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Book book = new Book();
				String bookNo1 = rs.getString("bookNo");
				int bookNo=Integer.parseInt(bookNo1);
				String title = rs.getString("title");
				String author = rs.getString("author");
				String ISBN = rs.getString("ISBN");
				String price = rs.getString("price");
				String category = rs.getString("category");
				String time = rs.getString("time");
				String location = rs.getString("location");
				String brief = rs.getString("brief");
				//boolean isCheck = rs.getBoolean("isCheck");
				book.setBookNo(bookNo);
				book.setTitle(title);
				book.setAuthor(author);
				book.setISBN(ISBN);
				book.setPrice(price);
				book.setCategory(category);
				book.setTime(time);
				book.setLocation(location);
				book.setBrief(brief);
				books.add(book);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return books;
	}

	
	public List<Bookstate> unlendlist(String sort,String content) {

		List<Bookstate> books = new ArrayList<Bookstate>();

		String bookCategory = "\'" + sort + "\'";
		String bookContent = "\'%" + content + "%\'";
		try {

			Connection c = DBHelper.getInstance().getConnection();
			String sql = null;
			if(sort.equals("title")) {
				sql = "select * from book left join(select bookno as bool FROM reserve)as state on book.bookno = state.bool where book.bookno  not in (SELECT bookno from borrow where isreturned is NOT TRUE) and title like " + bookContent + "order by book.bookNo asc";
				System.out.println(1);
			}else if(sort.equals("author")) {
				sql =  "select * from book where bookno not in (SELECT bookno from borrow where isreturned is not TRUE) and author like "+ bookContent + " order by bookNo asc";
				System.out.println(2);
			}else if(sort.equals("category")) {
				sql =  "select * from book where bookno not in (SELECT bookno from borrow where isreturned is not TRUE) and category like "+ bookContent + " order by bookNo asc";
				System.out.println(2);
			}else if(sort.equals("ISBN")) {
				sql =  "select * from book where bookno not in (SELECT bookno from borrow where isreturned is not TRUE) and ISBN like "+ bookContent + " order by bookNo asc";
				System.out.println(2);
			}
			System.out.println(sql);
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Bookstate book = new Bookstate();
				String bookNo1 = rs.getString("bookNo");
				int bookNo=Integer.parseInt(bookNo1);
				String title = rs.getString("title");
				String author = rs.getString("author");
				String ISBN = rs.getString("ISBN");
				String price = rs.getString("price");
				String category = rs.getString("category");
				String time = rs.getString("time");
				String location = rs.getString("location");
				String brief = rs.getString("brief");
				String bool = rs.getString("bool");
				//boolean isCheck = rs.getBoolean("isCheck");
				book.setBookNo(bookNo);
				book.setTitle(title);
				book.setAuthor(author);
				book.setISBN(ISBN);
				book.setPrice(price);
				book.setCategory(category);
				book.setTime(time);
				book.setLocation(location);
				book.setBrief(brief);
				if(bool==null) {
					book.setstate(0);
				}else {book.setstate(1);}
				books.add(book);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return books;
	}

	
	public List<Book> list(String sort,String content) {

		List<Book> books = new ArrayList<Book>();

		String bookCategory = "\'" + sort + "\'";
		String bookContent = "\'%" + content + "%\'";

		
		try {

			Connection c = DBHelper.getInstance().getConnection();
			String sql = new String();
			if(sort.equals("title")) {
				sql = "select * from book  where title like" + bookContent + " order by bookNo asc";
			
			}else if(sort.equals("author")) {
				sql = "select * from book  where author like" + bookContent + " order by bookNo asc";
			
			}else if(sort.equals("category")) {
				sql = "select * from book  where category like" + bookContent + " order by bookNo asc";
			
			}else if(sort.equals("ISBN")) {
				sql = "select * from book  where isbn like" + bookContent + " order by bookNo asc";
			
			}
		
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Book book = new Book();
				int bookNo = rs.getInt("bookNo");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String ISBN = rs.getString("ISBN");
				String price = rs.getString("price");
				String category = rs.getString("category");
				String time = rs.getString("time");
				String location = rs.getString("location");
				String brief = rs.getString("brief");
			
				//boolean isCheck = rs.getBoolean("isCheck");
				book.setBookNo(bookNo);
				book.setTitle(title);
				book.setAuthor(author);
				book.setISBN(ISBN);
				book.setPrice(price);
				book.setCategory(category);
				book.setTime(time);
				book.setLocation(location);
				book.setBrief(brief);
				books.add(book);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return books;
	}
	public List<Book> list(String type1,String name,String content) {

		List<Book> books = new ArrayList<Book>();

		String bookCategory = "\'" + type1 + "\'";
		String bookContent = "\'%" + content + "%\'";
		try {

			Connection c = DBHelper.getInstance().getConnection();
			String sql = null;
			if(type1.equals("")&&name.equals("title")) {
				sql = "select * from book  where title like" + bookContent + " order by bookNo asc";
			}else if(type1.equals("")&&name.equals("author")) {
				sql = "select * from book  where author like" + bookContent + " order by bookNo asc";
			}else if(!type1.equals("")) {
				if(name.equals("title")) {
					sql = "select * from book  where category =" + bookCategory +  "and title like "+ bookContent +" order by bookNo asc";
				}else if(name.equals("author")) {
					sql = "select * from book  where category =" + bookCategory +  "and author like "+ bookContent +" order by bookNo asc";
				}
			}
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Book book = new Book();
				int bookNo = rs.getInt("bookNo");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String ISBN = rs.getString("ISBN");
				String price = rs.getString("price");
				String category = rs.getString("category");
				String time = rs.getString("time");
				String location = rs.getString("location");
				String brief = rs.getString("brief");
				if(brief.length()>60) {
					brief = brief.substring(0,60)+"...";
				}
				book.setBookNo(bookNo);
				book.setTitle(title);
				book.setAuthor(author);
				book.setISBN(ISBN);
				book.setPrice(price);
				book.setCategory(category);
				book.setTime(time);
				book.setLocation(location);
				book.setBrief(brief);
				books.add(book);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int i=0;i<books.size();i++){
            for(int j=i+1;j<books.size();j++){
                if(books.get(i).getISBN().equals(books.get(j).getISBN())){
                    books.remove(j);
                    j--;
                }
            }
        }
		return books;
	}

	public List<Book> list(List<Book> books, int pageNum) {
		List<Book> showBooks = new ArrayList<Book>();
		int count = 3;
		int start = (pageNum-1)*count;
		if(books==null) {
			return null;
		}else if(pageNum<1) {
			return null;
		}else {
			int i = 1;
			for(Book book : books) {
				if(i>start&&i<=start+count) {
					showBooks.add(book);
				}
				i++;
			}
		}
		return showBooks;
	}
	
	public List<Book> list(String bISBN) {

		List<Book> books = new ArrayList<Book>();

		String bookISBN = "\'" + bISBN + "\'";
		try {

			Connection c = DBHelper.getInstance().getConnection();
			String sql = null;
			sql = "select * from book  where ISBN = " + bookISBN + " order by bookNo asc";
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Book book = new Book();
				int bookNo = rs.getInt("bookNo");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String ISBN = rs.getString("ISBN");
				String Price = rs.getString("Price");
				String category = rs.getString("category");
				String time = rs.getString("time");
				String location = rs.getString("location");
				String brief = rs.getString("brief");
				if(brief.length()>60) {
					brief = brief.substring(0,60)+"...";
				}
				book.setBookNo(bookNo);
				book.setTitle(title);
				book.setAuthor(author);
				book.setISBN(ISBN);
				book.setPrice(Price);
				book.setCategory(category);
				book.setTime(time);
				book.setLocation(location);
				book.setBrief(brief);
				books.add(book);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return books;
	}
	
	public void updateCategory(String categoryName, String lastName) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			Statement s = c.createStatement();
			String sql = "UPDATE book set category='" + categoryName + "' where category = '" + lastName + "'";
			s.execute(sql);
			DBHelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateLocation(String locationName, String lastName) {
		try {
			Connection c = DBHelper.getInstance().getConnection();
			Statement s = c.createStatement();
			String sql = "UPDATE book set location='" + locationName + "' where location = '" + lastName + "'";
			s.execute(sql);
			DBHelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Book> showUnlend(int pageNum){
		List<Book> books = new ArrayList<Book>();
		int count = 10;
		int start = (pageNum - 1) * count;
		
		try {

			Connection c = DBHelper.getInstance().getConnection();
			String sql = null;
			
			sql =  "select * from book where bookno not in (SELECT bookno from borrow where isreturned is not TRUE) order by bookNo limit " + count + " offset " + start;
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Book book = new Book();
				String bookNo1 = rs.getString("bookNo");
				int bookNo=Integer.parseInt(bookNo1);
				String title = rs.getString("title");
				String author = rs.getString("author");
				String ISBN = rs.getString("ISBN");
				String price = rs.getString("price");
				String category = rs.getString("category");
				String time = rs.getString("time");
				String location = rs.getString("location");
				String brief = rs.getString("brief");
				//boolean isCheck = rs.getBoolean("isCheck");
				book.setBookNo(bookNo);
				book.setTitle(title);
				book.setAuthor(author);
				book.setISBN(ISBN);
				book.setPrice(price);
				book.setCategory(category);
				book.setTime(time);
				book.setLocation(location);
				book.setBrief(brief);
				books.add(book);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return books;
	}
	
	public int getNumOFUnlend() {
		int allUnlend = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();
			String sql = null;
			sql =  "select count(*) from book where bookno not in (SELECT bookno from borrow where isreturned is not TRUE)";
			PreparedStatement ps = c.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) allUnlend = rs.getInt(1);
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return allUnlend;
	}


}