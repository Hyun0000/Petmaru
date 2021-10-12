package com.petmaru.member.model.vo;

public class MemberVo {
	private String member_id;
	private String member_name;
	private String member_pwd;
	private String member_phone;
	private String member_address;
	private String member_regdate;
	private char member_gender; // vo -char, db-char(1)
	private int member_point;
	private String member_email;

	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_name=" + member_name + ", member_pwd=" + member_pwd
				+ ", member_phone=" + member_phone + ", member_address=" + member_address + ", member_regdate="
				+ member_regdate + ", member_gender=" + member_gender + ", member_point=" + member_point
				+ ", member_email=" + member_email + "]";
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_pw() {
		return member_pwd;
	}

	public void setMember_pw(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_regdate() {
		return member_regdate;
	}

	public void setMember_regdate(String member_regdate) {
		this.member_regdate = member_regdate;
	}

	public char getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(char member_gender) {
		this.member_gender = member_gender;
	}

	public int getMember_point() {
		return member_point;
	}

	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
}
