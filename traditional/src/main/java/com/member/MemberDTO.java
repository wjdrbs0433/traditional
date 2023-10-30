package com.member;

public class MemberDTO {
	private int mnum;
	private String mid;
	private String mpwd;
	private String mname;
	private String mrnum;
	private String mtel;
	private String mphone;
	private String memail;
	private String Field;
	private String Field2;
	private int adminOrNot;
	private String mregdate;

	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMrnum() {
		return mrnum;
	}
	public void setMrnum(String mrnum) {
		this.mrnum = mrnum;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getField() {
		return Field;
	}
	public void setField(String field) {
		Field = field;
	}
	public String getField2() {
		return Field2;
	}
	public void setField2(String field2) {
		Field2 = field2;
	}
	public int getAdminOrNot() {
		return adminOrNot;
	}
	public void setAdminOrNot(int adminOrNot) {
		this.adminOrNot = adminOrNot;
	}
	
	public String getMregdate() {
		return mregdate;
	}
	
	public void setMregdate(String mregdate) {
		this.mregdate = mregdate;
	}
	
}
