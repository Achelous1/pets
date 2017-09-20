package com.zip4s.pets.dto;

public class ProductDTO {

	private int pno;
	private String item;
	private String name;
	private int price;
	private String pimg;
	private String pimg2;

	private int qty; // 주문수량

	public ProductDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductDTO(int pno, String item, String name, int price, String pimg, String pimg2, int qty) {
		super();
		this.pno = pno;
		this.item = item;
		this.name = name;
		this.price = price;
		this.pimg = pimg;
		this.pimg2 = pimg2;
		this.qty = qty;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPimg() {
		return pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
	}

	public String getPimg2() {
		return pimg2;
	}

	public void setPimg2(String pimg2) {
		this.pimg2 = pimg2;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "ProductDTO [pno=" + pno + ", item=" + item + ", name=" + name + ", price=" + price + ", pimg=" + pimg
				+ ", pimg2=" + pimg2 + ", qty=" + qty + "]";
	}

}
