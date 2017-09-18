package com.zip4s.pets.dto;

import java.sql.Date;

public class CustomerDTO {
	private String id;
	private String pw;
	private String cname;
	private String addr;
	private String phone;
	private Date create_date;
	
	public CustomerDTO(){
	}
	
   public CustomerDTO(String cname, String id, String pw, String phone, String addr,Date create_date){
		  setName(cname);
		  setId(id);
	      setPw(pw);
	      setAddr(addr);
	      setPhone(phone);
	      setCreate_date(create_date);
	   }

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getCname() {
		return cname;
	}
	public void setName(String cname) {
		this.cname = cname;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	@Override
	public String toString() {
		return "CustomerDTO [id=" + id + ", pw=" + pw + ", cname=" + cname + ", addr=" + addr + ", phone=" + phone
				+ ", create_date=" + create_date + "]";
	}
}
