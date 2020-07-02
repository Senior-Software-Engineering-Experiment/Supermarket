package entity;

public class Admin {
	private String aNo;
	private String aPassword;
	public Admin(String aNo,String aPassword) {
		super();
		this.aNo=aNo;
		this.aPassword=aPassword;
	}
	public Admin() {
		// TODO Auto-generated constructor stub
	}
	public String getANo() {
		return aNo;
	}
	public void setANo(String ano) {
		this.aNo = ano;
	}
	public String getAPassword() {
		return aPassword;
	}
	public void setAPassword(String apassword) {
		this.aPassword = apassword;
	}

}