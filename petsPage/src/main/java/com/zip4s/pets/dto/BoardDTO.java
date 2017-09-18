package com.zip4s.pets.dto;

import java.sql.Timestamp;

public class BoardDTO {
	private int bno;
	private String subject;
	private String id;
	private String pw;
	private String content;
	private Timestamp write_date;
	private int read_cnt;

	private int ref;
	private int step;
	private int lev;
	private int step2;

	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int bno, String subject, String id, String pw, String content, Timestamp write_date, int read_cnt,
			int ref, int step, int lev, int step2) {
		super();
		this.bno = bno;
		this.subject = subject;
		this.id = id;
		this.pw = pw;
		this.content = content;
		this.write_date = write_date;
		this.read_cnt = read_cnt;
		this.ref = ref;
		this.step = step;
		this.lev = lev;
		this.step2 = step2;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public int getRead_cnt() {
		return read_cnt;
	}

	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getStep2() {
		return step2;
	}

	public void setStep2(int step2) {
		this.step2 = step2;
	}

	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", subject=" + subject + ", id=" + id + ", pw=" + pw + ", content=" + content
				+ ", write_date=" + write_date + ", read_cnt=" + read_cnt + ", ref=" + ref + ", step=" + step + ", lev="
				+ lev + ", step2=" + step2 + "]";
	}

}
