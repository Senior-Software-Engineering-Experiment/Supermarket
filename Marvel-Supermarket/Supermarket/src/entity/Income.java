package entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Income {
	private Date day;
	private int totalfine;
	private int totaldeposit;
	
	public Income() {
		super();
	}

	public Income(Date day, int totalfine, int totaldeposit) {
		super();
		this.day = day;
		this.totalfine = totalfine;
		this.totaldeposit = totaldeposit;
		
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public int getTotalfine() {
		return totalfine;
	}

	public void setTotalfine(int totalfine) {
		this.totalfine = totalfine;
	}

	public int getTotaldeposit() {
		return totaldeposit;
	}

	public void setTotaldeposit(int totaldeposit) {
		this.totaldeposit = totaldeposit;
	}
}
