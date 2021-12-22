package DTO;

import java.sql.Timestamp;

public class cart {
	private int cartcode;
	private String id;
	private int prcode;
	private int quantity;
	private Timestamp indate;
	private String prname;
	private int prprice;
	private String primg;
	private int total;
	private int alltotal;
	
	public int getCartcode() {
		return cartcode;
	}
	public void setCartcode(int cartcode) {
		this.cartcode = cartcode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPrcode() {
		return prcode;
	}
	public void setPrcode(int prcode) {
		this.prcode = prcode;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	public String getPrname() {
		return prname;
	}
	public void setPrname(String prname) {
		this.prname = prname;
	}
	public int getPrprice() {
		return prprice;
	}
	public void setPrprice(int prprice) {
		this.prprice = prprice;
	}
	public String getPrimg() {
		return primg;
	}
	public void setPrimg(String primg) {
		this.primg = primg;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getAlltotal() {
		return alltotal;
	}
	public void setAlltotal(int alltotal) {
		this.alltotal = alltotal;
	}
	
}
