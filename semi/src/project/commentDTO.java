package project;
import java.sql.Date;
public class commentDTO {
	private int rnum;
	private int idx;
	private int boardidx;
	private String id;
	private String content;
	private Date comdate;
	//기본 생성자
	public commentDTO(){}
	//인자생성자
	
	public int getIdx() {
		return idx;
	}

	public commentDTO(int rnum,int idx, int boardidx, String id, String content, Date comdate) {
		super();
		this.idx = idx;
		this.boardidx = boardidx;
		this.id = id;
		this.content = content;
		this.comdate = comdate;
		this.rnum = rnum;
	}
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getBoardidx() {
		return boardidx;
	}

	public void setBoardidx(int boardidx) {
		this.boardidx = boardidx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getComdate() {
		return comdate;
	}

	public void setComdate(Date comdate) {
		this.comdate = comdate;
	}
	
	
}
