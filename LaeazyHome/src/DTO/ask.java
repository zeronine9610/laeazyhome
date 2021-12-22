package DTO;

import java.sql.Timestamp;

public class ask {

	int qnum;
	String id;
	int qcate_num;
	String qtitle;
	String qcontent;
	Timestamp qregdate;
	String answeryn;
	
	String ans_content;
	Timestamp ans_regdate;
	
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public Timestamp getQregdate() {
		return qregdate;
	}
	public void setQregdate(Timestamp qregdate) {
		this.qregdate = qregdate;
	}
	public int getQcate_num() {
		return qcate_num;
	}
	public void setQcate_num(int qcate_num) {
		this.qcate_num = qcate_num;
	}
	public String getAnsweryn() {
		return answeryn;
	}
	public void setAnsweryn(String answeryn) {
		this.answeryn = answeryn;
	}
	public String getAns_content() {
		return ans_content;
	}
	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}
	public Timestamp getAns_regdate() {
		return ans_regdate;
	}
	public void setAns_regdate(Timestamp ans_regdate) {
		this.ans_regdate = ans_regdate;
	}
	 
}
