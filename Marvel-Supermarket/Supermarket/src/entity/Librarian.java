package entity;

public class Librarian {
    private String lUserName;
	private String lName;
	private String lSex;
	private String lEmail;
	private String lTel;
	private String lPassword;
	


public Librarian(String lUserName, String lPassword, String lName, String lSex, String lTel, String lEmail) {
		super();
		this.lUserName = lUserName;
		this.lName = lName;
		this.lSex = lSex;
		this.lTel = lTel;
		this.lEmail = lEmail;
		this.lPassword = lPassword;
	}


public  Librarian() {
	
}


public  Librarian(String lUserName, String lName) {
	
}


public String getlUserName() {
	return lUserName;
}



public void setlUserName(String lUserName) {
	this.lUserName = lUserName;
}



public String getlName() {
	return lName;
}



public void setlName(String lName) {
	this.lName = lName;
}



public String getlSex() {
	return lSex;
}



public void setlSex(String lSex) {
	this.lSex = lSex;
}



public String getlEmail() {
	return lEmail;
}



public void setlEmail(String lEmail) {
	this.lEmail = lEmail;
}



public String getlTel() {
	return lTel;
}



public void setlTel(String lTel) {
	this.lTel = lTel;
}

public String getlPassword() {
	return lPassword;
}



public void setlPassword(String lPassword) {
	this.lPassword = lPassword;
}




}