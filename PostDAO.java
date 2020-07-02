package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import entity.*;
import utils.DBHelper;

public class PostDAO {

	public PostDAO() {
	}

	public static PostDAO getInstance() {
		return new PostDAO();
	}
	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from post";

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
	
	public static int getMax() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select max(postno) from post";

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
	
	public void add(Post post) {

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "insert into post values(?,?,?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

			ps.setInt(1, post.getPostno());
			ps.setTimestamp(2, post.getPosttime());
			ps.setString(3, post.getTitle());
			ps.setString(4, post.getContent());
			//改动
			//ps.setString(5, post.getLibrarianno());

			ps.execute();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				int pNo = rs.getInt(1);
				post.setPostno(pNo);
			}

			DBHelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void update(Post post) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "update post set posttime= ?, title= ?, content= ?,  where postno= ?";
			PreparedStatement ps = c.prepareStatement(sql);

			ps.setTimestamp(1, post.getPosttime());
			ps.setString(2, post.getTitle());
			ps.setString(3, post.getContent());
			//改动
			//ps.setString(4, post.getLibrarianno());
			ps.setInt(5, post.getPostno());
			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public void delete(int postno) {
		String const_s = "\'" + postno + "\'";

		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "delete from post where postno = " + const_s;

			s.execute(sql);

			DBHelper.closeConnection(c, s, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Post get(int postno) {
		String const_s = "\'" + postno + "\'";
		Post post = new Post();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from post where postno = " + const_s;

			ResultSet rs = s.executeQuery(sql);

			if (rs.next()) {
				post = new Post();
				String sposttime = rs.getString("posttime");
				String title = rs.getString("title");
				String content = rs.getString("content");
				//改动
				//String librarianno = rs.getString("librarianno");
				
				Timestamp posttime = Timestamp.valueOf(sposttime);
				
				
				post.setPostno(postno);;
				post.setPosttime(posttime);
				post.setTitle(title);
				post.setContent(content);
				//改动
				//post.setLibrarianno(librarianno);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}
	
	public static List<Post> list() {
		return list(0, Short.MAX_VALUE);
	}
	
	public static List<Post> list(int start, int count) {
		List<Post> posts = new ArrayList<Post>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from post order by postno";

			PreparedStatement ps = c.prepareStatement(sql);
			

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Post post = new Post();
				int postno = rs.getInt(1);
				Timestamp posttime = rs.getTimestamp(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				//改动
				//String librarianno=rs.getString(5);
				
				post.setPostno(postno);
				post.setPosttime(posttime);
				post.setTitle(title);
				post.setContent(content);
				//改动
				//post.setLibrarianno(librarianno);
				
			    posts.add(post);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return posts;
	}
	
	public static List<Post> list(String sort,String content) {

		List<Post> posts = new ArrayList<Post>();

		String postCategory = "\'" + sort + "\'";
		String postContent = "\'%" + content + "%\'";

		try {

			Connection c = DBHelper.getInstance().getConnection();
			String sql = null;
			if(sort.equals("PostNo")) {
				sql = "select * from post where title like " + postContent +"or content like " + postContent + " order by postNo asc";
			
			}else if(sort.equals("Post Time First")) {
				sql =  "\"select * from post where title like " + postContent +"or content like " + postContent + "  order by posttime asc";
				
			}else if(sort.equals("Recently Post First")) {
				sql =  "\"select * from post where title like " + postContent +"or content like " + postContent + "  order by posttime desc";
				
			}
	
			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Post post = new Post();
				String postNo1 = rs.getString("postno");
				int postNo=Integer.parseInt(postNo1);
				String sposttime = rs.getString("posttime");
				Timestamp posttime = Timestamp.valueOf(sposttime);
				String title = rs.getString("title");
				String scontent = rs.getString("content");
				//改动
				//String librarianNo = rs.getString("librarianno");
				
			
				
				//boolean isCheck = rs.getBoolean("isCheck");
				post.setPostno(postNo);
				post.setPosttime(posttime);
				post.setTitle(title);
				post.setContent(scontent);
				//改动
				//post.setLibrarianno(librarianNo);
				posts.add(post);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return posts;
	}

	public static List<Post> showPosts(List<Post> post1, int pageNum) {
		List<Post> posts = new ArrayList<Post>();
		int count = 10;
		int index = count*(pageNum-1);
		for(int i = index;i<index+count&i<post1.size();i++) {
			posts.add(post1.get(i));
		}
		return posts;
	}
	
}
