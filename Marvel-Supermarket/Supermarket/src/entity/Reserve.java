package entity;

import java.sql.Timestamp;

public class Reserve {

	private int bookNo;
	private String readerNo;
	private Timestamp reserveTime;

	public Reserve() {
		super();
	}

	public Reserve(int bookNo, String readerNo, Timestamp date2) {
		this.bookNo = bookNo;
		this.readerNo = readerNo;
		this.reserveTime = date2;
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

	public Timestamp getReserveTime() {
		return reserveTime;
	}

	public void setReserveTime(Timestamp reserveTime) {
		this.reserveTime = reserveTime;
	}

}
