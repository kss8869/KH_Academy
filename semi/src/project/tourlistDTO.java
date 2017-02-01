package project;

import java.sql.Date;

public class tourlistDTO {
	
	 private int idx;
	 private String localname;
	 private int readnum;
	 
	public tourlistDTO (){}
	
	
	public tourlistDTO(int idx, String localname, int readnum) {
		super();
		this.idx = idx;
		this.localname = localname;
		this.readnum = readnum;
	}


	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getLocalname() {
		return localname;
	}

	public void setLocalname(String localname) {
		this.localname = localname;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}
	
	
}
