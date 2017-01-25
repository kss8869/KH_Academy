package course;

public class ImgDTO {
	private int idx;
	private int localnum;
	private String localname;
	private String filename;
	
	public ImgDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ImgDTO(int idx, int localnum, String localname, String filename) {
		super();
		this.idx = idx;
		this.localnum = localnum;
		this.localname = localname;
		this.filename = filename;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getLocalnum() {
		return localnum;
	}

	public void setLocalnum(int localnum) {
		this.localnum = localnum;
	}

	public String getLocalname() {
		return localname;
	}

	public void setLocalname(String localname) {
		this.localname = localname;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}	
	
}
