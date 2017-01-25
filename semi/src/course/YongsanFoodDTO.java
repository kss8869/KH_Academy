package course;

public class YongsanFoodDTO {
	private int idx;
	private String rname;
	private String menu;
	private String addr;
	private String tel;
	
	public YongsanFoodDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public YongsanFoodDTO(int idx, String rname, String menu, String addr, String tel) {
		super();
		this.idx = idx;
		this.rname = rname;
		this.menu = menu;
		this.addr = addr;
		this.tel = tel;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
		
}
