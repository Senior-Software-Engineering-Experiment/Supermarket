package entity;

import java.sql.Timestamp;


public class Borrow {
	private int bookNo;
	private String title;
	private String author;
	private String readerNo;
	private Timestamp borrowTime;
	private boolean isReturned;
	private Timestamp shouldReturnTime;
	private Timestamp returnTime;
	private String price;
	private int fine;
	
	
	
    public Borrow() {
		
	}
    
    public int getFine() {
		return fine;
	}

	public void setFine(int fine) {
		this.fine = fine;
	}
	

	public Borrow(int bookno,String readerno,Timestamp borrowtime,boolean isreturned,Timestamp shouldreturntime,Timestamp returntime,String price) {
		super();
		this.bookNo    = bookno;
		//this.title     = title;
		//this.author    = author;
		this.readerNo  = readerno;
		this.borrowTime= borrowtime;
		this.isReturned= isreturned;
		this.shouldReturnTime = shouldreturntime;
		this.returnTime = returntime;
		this.price = price;
		this.fine=0;
   	}
	
	public Borrow(int bookno,String title,String author, String readerno,Timestamp borrowtime,boolean isreturned,Timestamp shouldreturntime,Timestamp returntime,String price) {
		super();
		this.bookNo    = bookno;
		this.title     = title;
		this.author    = author;
		this.readerNo  = readerno;
		this.borrowTime= borrowtime;
		this.isReturned= isreturned;
		this.shouldReturnTime = shouldreturntime;
		this.returnTime = returntime;
		this.price = price;
		this.fine=0;
   	}
    
    public Borrow(int bookno,String title,String author,String readerno,Timestamp borrowtime,boolean isreturned,Timestamp shouldreturntime,Timestamp returntime,int fine) {
		super();
		this.bookNo    = bookno;
		this.title     = title;
		this.author    = author;
		this.readerNo  = readerno;
		this.borrowTime= borrowtime;
		this.isReturned= isreturned;
		this.shouldReturnTime = shouldreturntime;
		this.returnTime = returntime;
		this.fine=fine;
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

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getReaderNo() {
		return readerNo;
	}

	public void setReaderNo(String readerNo) {
		this.readerNo = readerNo;
	}

	public Timestamp getBorrowTime() {
		return borrowTime;
	}

	public void setBorrowTime(Timestamp borrowTime) {
		this.borrowTime = borrowTime;
	}

	public boolean isReturned() {
		return isReturned;
	}

	public void setReturned(boolean isReturned) {
		this.isReturned = isReturned;
	}

	public Timestamp getShouldReturnTime() {
		return shouldReturnTime;
	}

	public void setShouldReturnTime(Timestamp shouldReturnTime) {
		this.shouldReturnTime = shouldReturnTime;
	}

	public Timestamp getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(Timestamp returnTime) {
		this.returnTime = returnTime;
	}
	public void setPrice(String price) {
		this.price = price;
	}

	public String getPrice() {
		return price;
	}

	
}
