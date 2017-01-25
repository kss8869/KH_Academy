package semi.join;

import java.sql.Date;

public class JoinDTO {
	
	private int idx;
	private String id;
	private String pwd;
	private String name;
	private String email;
	Date joindate;
	private int grade;
	private int count;
	private String question;
	private String answer;
	
	
	
	public JoinDTO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public JoinDTO(int idx, String id, String pwd, String name, String email, Date joindate, int grade, int count,
			String question, String answer) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.joindate = joindate;
		this.grade = grade;
		this.count = count;
		this.question = question;
		this.answer = answer;
	}



	public int getIdx() {
		return idx;
	}



	public void setIdx(int idx) {
		this.idx = idx;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPwd() {
		return pwd;
	}



	public void setPwd(String pwd) {
		this.pwd = pwd;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public Date getJoindate() {
		return joindate;
	}



	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}



	public int getGrade() {
		return grade;
	}



	public void setGrade(int grade) {
		this.grade = grade;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public String getQuestion() {
		return question;
	}



	public void setQuestion(String question) {
		this.question = question;
	}



	public String getAnswer() {
		return answer;
	}



	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	

}
