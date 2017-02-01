package project;
import java.sql.Date;
public class boardDTO {
	
	private int rnum;
	private int idx;
	private int requestidx;
	private String id;
	private String subject;
	private String content;
	private String guideid;
	private Date comdate;

	//기본생성자
	public boardDTO(){}
	

	public boardDTO(int rnum,int idx, int requestidx, String id, String subject, String content, String guideid, Date comdate) {
		super();
		this.rnum = rnum;
		this.idx = idx;
		this.requestidx = requestidx;
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.guideid = guideid;
		this.comdate = comdate;
	}


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getRequestidx() {
		return requestidx;
	}

	public void setRequestidx(int requestidx) {
		this.requestidx = requestidx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGuideid() {
		return guideid;
	}

	public void setGuideid(String guideid) {
		this.guideid = guideid;
	}

	public Date getComdate() {
		return comdate;
	}

	public void setComdate(Date comdate) {
		this.comdate = comdate;
	}
	
	
}
