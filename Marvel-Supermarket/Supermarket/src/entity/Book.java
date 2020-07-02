package entity;

public class Book {
	private int bookNo;
	private String title;
	private String author;	
	private String language;
	private String price;
	private String time;
	private String publish;
	private String brief;
	private String ISBN;
	private String category;
	private String location;
	
	public Book() {
		super();
	}
	
	

	public Book(int bookNo, String title, String author, String language, String price, String time, String publish,
			String brief, String iSBN, String category, String location) {
		super();
		this.bookNo = bookNo;
		this.title = title;
		this.author = author;
		this.language = language;
		this.price = price;
		this.time = time;
		this.publish = publish;
		this.brief = brief;
		ISBN = iSBN;
		this.category = category;
		this.location = location;
	}



	public String getLanguage() {
		return language;
	}



	public void setLanguage(String language) {
		this.language = language;
	}



	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPublish() {
		return publish;
	}

	public void setPublish(String publish) {
		this.publish = publish;
	}


	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	
	
}
