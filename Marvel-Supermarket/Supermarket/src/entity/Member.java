package entity;

public class Member {
	private int memberNo;
	private String describe;
	private String memberName;
	private String picture;

	public Member() {
		super();
	}

	/**
	 * @param memberNo
	 * @param describe
	 */
	public Member(int memberNo, String describe, String memberName,String picture) {
		super();
		this.memberNo = memberNo;
		this.describe = describe;
		this.memberName = memberName;
		this.picture = picture;
	}

	/**
	 * @return the memberNo
	 */
	public int getMemberNo() {
		return memberNo;
	}

	public String getMemberName() {
		return memberName;
	}
	
	public String getPicture() {
		return picture;
	}
	/**
	 * @return the describe
	 */
	public String getDescribe() {
		return describe;
	}

	/**
	 * @param memberNo the memberNo to set
	 */
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	/**
	 * @param describe the describe to set
	 */
	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;

	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
}
