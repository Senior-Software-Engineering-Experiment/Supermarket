package entity;

public class Fine {
	private int bookFine;
	private int returnPeriod;
	private int securityDesposit;
	
	public Fine() {
		
	}
	
	public Fine(int bookFine,int returnPeriod,int securityDesposit) {
		super();
		this.bookFine=bookFine;
		this.returnPeriod=returnPeriod;
		this.securityDesposit=securityDesposit;
		
	}

	public int getBookFine() {
		return bookFine;
	}

	public void setBookFine(int string) {
		this.bookFine = string;
	}

	public int getReturnPeriod() {
		return returnPeriod;
	}

	public void setReturnPeriod(int returnPeriod) {
		this.returnPeriod = returnPeriod;
	}

	public int getSecurityDesposit() {
		return securityDesposit;
	}

	public void setSecurityDesposit(int securityDesposit) {
		this.securityDesposit = securityDesposit;
	}
	
	
}
