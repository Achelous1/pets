package com.zip4s.pets.dto;

public class CartDTO {
	
	private int cno;
	private int pno;
	private int qty;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	@Override
	public String toString() {
		return "CartDTO [cno=" + cno + ", pno=" + pno + ", qty=" + qty + "]";
	}
	
	
}