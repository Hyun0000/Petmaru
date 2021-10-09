package com.petmaru.member.model.vo;

import java.sql.Date;

public class Member {
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	private String memberId;
	private String memberName;
	private String memberPw;
	private String memberPhone;
	private String memberAdress;
	private int memberBirth;
	private String memberEmail;
	private char memberGender;
	private int memberPoint;
	private Date memberRegdate;
	
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberName=" + memberName + ", memberPw=" + memberPw
				+ ", memberPhone=" + memberPhone + ", memberAdress=" + memberAdress + ", memberBirth=" + memberBirth
				+ ", memberEmail=" + memberEmail + ", memberGender=" + memberGender + ", memberPoint=" + memberPoint
				+ ", memberRegdate=" + memberRegdate + "]";
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberAdress() {
		return memberAdress;
	}
	public void setMemberAdress(String memberAdress) {
		this.memberAdress = memberAdress;
	}
	public int getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(int memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public char getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(char memberGender) {
		this.memberGender = memberGender;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public Date getMemberRegdate() {
		return memberRegdate;
	}
	public void setMemberRegdate(Date memberRegdate) {
		this.memberRegdate = memberRegdate;
	}
}


