package course;

public class DongdaemoonPlaceDTO {
	private int idx;
	private String place;
	private String addr;
	
	public DongdaemoonPlaceDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DongdaemoonPlaceDTO(int idx, String place, String addr) {
		super();
		this.idx = idx;
		this.place = place;
		this.addr = addr;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
}
