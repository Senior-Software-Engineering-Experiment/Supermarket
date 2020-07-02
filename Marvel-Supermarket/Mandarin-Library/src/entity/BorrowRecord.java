package entity;

import java.sql.Timestamp;

import javax.websocket.Encoder.Text;

//import sun.util.calendar.BaseCalendar.Date;

public class BorrowRecord {
	private int bookNo;
	private String title;
	private String author;
	private String readerNo;
	private Timestamp borrowTime;
	private String isReturned;
	private Timestamp shouldReturnTime;
	private Timestamp returnTime;
	private String price;
	
	
	
    public BorrowRecord() {
		
	}
	public void setPrice(String price) {
		this.price = price;
	}

	public String getPrice() {
		return price;
	}
	
	public BorrowRecord(int bookno,String title,String author, String readerno,Timestamp borrowtime,String isreturned,Timestamp shouldreturntime,Timestamp returntime) {
		super();
		this.bookNo    = bookno;
		this.title     = title;
		this.author    = author;
		this.readerNo  = readerno;
		this.borrowTime= borrowtime;
		this.isReturned= isreturned;
		this.shouldReturnTime = shouldreturntime;
		this.returnTime = returntime;

   	}
    
    public BorrowRecord(int bookno,String title,String author,String readerno,Timestamp borrowtime,String isreturned,Timestamp shouldreturntime,Timestamp returntime,String price) {
		super();
		this.bookNo    = bookno;
		this.title     = title;
		this.author    = author;
		this.readerNo  = readerno;
		this.borrowTime= borrowtime;
		this.isReturned= isreturned;
		this.shouldReturnTime = shouldreturntime;
		this.returnTime = returntime;
		this.price=price;
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


	public String getIsReturned() {
		return isReturned;
	}

	public void setIsReturned(String isReturned) {
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

	
}
