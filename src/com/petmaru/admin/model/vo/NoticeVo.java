package com.petmaru.admin.model.vo;

import java.sql.Date;

public class NoticeVo {
	private int Notice_No;
	private String Notice_Title;
	private String Notice_Writer;
	private String Notice_Content;
	private Date Notice_Regdate;
	private int Notice_Hit;
	private String Notice_File;
	
	@Override
	public String toString() {
		return "Notice [Notice_No=" + Notice_No + ", Notice_Title=" + Notice_Title + ", Notice_Writer=" + Notice_Writer
				+ ", Notice_Content=" + Notice_Content + ", Notice_Regdate=" + Notice_Regdate + ", Notice_Hit="
				+ Notice_Hit + ", Notice_File=" + Notice_File + "]";
	}

	public int getNotice_No() {
		return Notice_No;
	}

	public void setNotice_No(int notice_No) {
		Notice_No = notice_No;
	}

	public String getNotice_Title() {
		return Notice_Title;
	}

	public void setNotice_Title(String notice_Title) {
		Notice_Title = notice_Title;
	}

	public String getNotice_Writer() {
		return Notice_Writer;
	}

	public void setNotice_Writer(String notice_Writer) {
		Notice_Writer = notice_Writer;
	}

	public String getNotice_Content() {
		return Notice_Content;
	}

	public void setNotice_Content(String notice_Content) {
		Notice_Content = notice_Content;
	}

	public Date getNotice_Regdate() {
		return Notice_Regdate;
	}

	public void setNotice_Regdate(Date notice_Regdate) {
		Notice_Regdate = notice_Regdate;
	}

	public int getNotice_Hit() {
		return Notice_Hit;
	}

	public void setNotice_Hit(int notice_Hit) {
		Notice_Hit = notice_Hit;
	}

	public String getNotice_File() {
		return Notice_File;
	}

	public void setNotice_File(String notice_File) {
		Notice_File = notice_File;
	}
	
}
