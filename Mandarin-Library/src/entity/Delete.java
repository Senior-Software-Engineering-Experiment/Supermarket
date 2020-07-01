package entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Delete {
	private int bookNo;
	private String librarianUsername;
	private Timestamp deleteTime;
	private String title;
	private String author;
	

	public Delete() {
		super();
	}

	public Delete(int bookNo, String librarianUsername, Timestamp deleteTime) {
		super();
		this.bookNo = bookNo;
		this.librarianUsername = librarianUsername;
		this.deleteTime = deleteTime;
	}

	public Delete(int bookNo, String librarianUsername, Timestamp deleteTime, String title, String author) {
		super();
		this.bookNo = bookNo;
		this.librarianUsername = librarianUsername;
		this.deleteTime = deleteTime;
		this.title = title;
		this.author = author;
	}


	public int getBookNo() {
		return bookNo;
	}


	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}


	public String getLibrarianUsername() {
		return librarianUsername;
	}


	public void setLibrarianUsername(String librarianUsername) {
		this.librarianUsername = librarianUsername;
	}


	public Timestamp getDeleteTime() {
		return deleteTime;
	}


	public void setDeleteTime(Timestamp deleteTime) {
		this.deleteTime = deleteTime;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}

	
}
