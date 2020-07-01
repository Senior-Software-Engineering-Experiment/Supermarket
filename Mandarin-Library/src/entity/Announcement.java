package entity;

public class Announcement {
	private int AncNo;
	private String AncName;
	private String time;
	private String content;//公告内容
	
	public Announcement() {
		super();
	}
	
	
	public Announcement(int ancNo, String anName, String time, String content) {
		super();
		AncNo = ancNo;
		AncName = anName;
		this.time = time;
		this.content = content;
	}


	public int getAncNo() {
		return AncNo;
	}
	public void setAncNo(int ancNo) {
		AncNo = ancNo;
	}
	public String getAnName() {
		return AncName;
	}
	public void setAnName(String ancName) {
		AncName = ancName;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
