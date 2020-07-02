package entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Post {
	private int postno;
	private Timestamp posttime;
	private String title;
	private String content;
	private String  librarianno;
	
	public Post() {
		super();
	}

	public Post(int postno, Timestamp posttime, String title, String content, String  librarianno) {
		super();
		this.postno = postno;
		this.posttime = posttime;
		this.title = title;
		this.content = content;
		this.librarianno = librarianno;
	}

	public int getPostno() {
		return postno;
	}

	public void setPostno(int postno) {
		this.postno = postno;
	}

	public Timestamp getPosttime() {
		return posttime;
	}

	public void setPosttime(Timestamp posttime) {
		this.posttime = posttime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLibrarianno() {
		return librarianno;
	}

	public void setLibrarianno(String librarianno) {
		this.librarianno = librarianno;
	}
}
