package project;

import java.sql.Date;

public class tourlistDTO {
	private int idx;
	private String title;
	private String content;
	private String guide;
	private String filename;
	private Date tourdate;
	private Date comdate;
	private int maxpeople;
	public tourlistDTO(){}

	
	public tourlistDTO(int idx, String title, String content, String guide, String filename, Date tourdate, Date comdate, int maxpeople) {
		super();
		
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.guide = guide;
		this.filename = filename;
		this.tourdate = tourdate;
		this.comdate = comdate;
		this.maxpeople = maxpeople;
	}


	public int getMaxpeople() {
		return maxpeople;
	}


	public void setMaxpeople(int maxpeople) {
		this.maxpeople = maxpeople;
	}


	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Date getTourdate() {
		return tourdate;
	}

	public void setTourdate(Date tourdate) {
		this.tourdate = tourdate;
	}

	public Date getComdate() {
		return comdate;
	}

	public void setComdate(Date comdate) {
		this.comdate = comdate;
	}
	
}
