package com.petmaru.member.write.model.vo;

import java.sql.*;

public class WriteMemberBoardVo {
	private int board_no;
	private String board_title;
	private String board_content;
	private String board_writer;
	private Date board_date;
	private int board_comment;
	private int board_hit;
	
	public WriteMemberBoardVo() {
	}

	@Override
	public String toString() {
		return "WriteMemberBoardVo [board_no=" + board_no + ", board_title=" + board_title + ", board_content="
				+ board_content + ", board_writer=" + board_writer + ", board_date=" + board_date + ", board_comment="
				+ board_comment + ", board_hit=" + board_hit + "]";
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public int getBoard_comment() {
		return board_comment;
	}

	public void setBoard_comment(int board_comment) {
		this.board_comment = board_comment;
	}

	public int getBoard_hit() {
		return board_hit;
	}

	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	
	
}
