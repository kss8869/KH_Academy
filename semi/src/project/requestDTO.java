package project;

import java.sql.Date;
public class requestDTO {
	
	private int idx;
	private int touridx;
	private String id;
	private String guidelocal;
	private String content;
	private Date requestdate;
	private Date comdate;
	//기본생성자
	public requestDTO(){}
	
	
	public requestDTO(int idx, int touridx, String id, String guidelocal, String content,Date requestdate, Date comdate) {
		super();
		this.idx = idx;
		this.touridx = touridx;
		this.id = id;
		this.guidelocal = guidelocal;
		this.content = content;
		this.requestdate = requestdate;
		this.comdate = comdate;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getTouridx() {
		return touridx;
	}
	public void setTouridx(int touridx) {
		this.touridx = touridx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGuidelocal() {
		return guidelocal;
	}
	public void setGuidelocal(String guidelocal) {
		this.guidelocal = guidelocal;
	}
	public Date getRequestdate() {
		return requestdate;
	}
	public void setRequestdate(Date requestdate) {
		this.requestdate = requestdate;
	}
	public Date getComdate() {
		return comdate;
	}
	public void setComdate(Date comdate) {
		this.comdate = comdate;
	}
	
	
	
}
