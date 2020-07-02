package entity;

public class Location {
	private String locationName;
    int locationNo;
	public Location(String locationName, int locationNo) {
		super();
		this.locationName = locationName;
		this.locationNo = locationNo;
	}
	public Location() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

}
