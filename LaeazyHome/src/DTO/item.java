package DTO;

import java.sql.Timestamp;

public class item {
	private int prcode;
	private String prname;
	private int category_code;
	private String prbrand; 
	private String prcontent;
	private String primg;
	private int prprice;
	private String hashtag;
	private Timestamp regdate;
	private String useyn;
	
	public int getPrcode() {
		return prcode;
	}
	public void setPrcode(int prcode) {
		this.prcode = prcode;
	}
	public String getPrname() {
		return prname;
	}
	public void setPrname(String prname) {
		this.prname = prname;
	}
	public int getCategory_code() {
		return category_code;
	}
	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}
	public String getPrbrand() {
		return prbrand;
	}
	public void setPrbrand(String prbrand) {
		this.prbrand = prbrand;
	}
	public String getPrcontent() {
		return prcontent;
	}
	public void setPrcontent(String prcontent) {
		this.prcontent = prcontent;
	}
	public String getPrimg() {
		return primg;
	}
	public void setPrimg(String primg) {
		this.primg = primg;
	}
	public int getPrprice() {
		return prprice;
	}
	public void setPrprice(int prprice) {
		this.prprice = prprice;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	
	
}
