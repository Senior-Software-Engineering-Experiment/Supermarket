package entity;

public class Reader {
    private String readerNo ;  //编号
    private String readerName; //用户名
    private String readerPassword;  //密码
    private String email;    //邮箱
    private int readerFine;  //罚金
    
	public Reader() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Reader(String readerNo,String readerName, String readerPassword, String email, int readerFine) {
		super();
		this.readerNo = readerNo;
		this.readerName = readerName;
		this.readerPassword = readerPassword;
		this.email = email;
		this.readerFine = readerFine;
	}

	public String getReaderNo() {
		return readerNo;
	}

	public void setReaderNo(String readerNo) {
		this.readerNo = readerNo;
	}

	public String getReaderName() {
		return readerName;
	}

	public void setReaderName(String readerName) {
		this.readerName = readerName;
	}

	public String getReaderPassword() {
		return readerPassword;
	}

	public void setReaderPassword(String readerPassword) {
		this.readerPassword = readerPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getReaderFine() {
		return readerFine;
	}

	public void setReaderFine(int readerFine) {
		this.readerFine = readerFine;
	}
    
	
}
