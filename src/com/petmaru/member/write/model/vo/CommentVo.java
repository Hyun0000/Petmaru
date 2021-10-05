package com.petmaru.member.write.model.vo;

import java.sql.Date;

public class CommentVo {
	private String commentWriter;
	private String commentContent;
	private char commentCategory;
	private Date commentDate;
	private int commentContentNo;
	private int commentLevel;
	private int commentStep;
	
	public CommentVo() {
		// TODO Auto-generated constructor stub
	}
	
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public char getCommentCategory() {
		return commentCategory;
	}
	public void setCommentCategory(char commentCategory) {
		this.commentCategory = commentCategory;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public int getCommentContentNo() {
		return commentContentNo;
	}
	public void setCommentContentNo(int commentContentNo) {
		this.commentContentNo = commentContentNo;
	}
	public int getCommentLevel() {
		return commentLevel;
	}
	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}
	public int getCommentStep() {
		return commentStep;
	}
	public void setCommentStep(int commentStep) {
		this.commentStep = commentStep;
	}

	@Override
	public String toString() {
		return "CommentVo [commentWriter=" + commentWriter + ", commentContent=" + commentContent + ", commentCategory="
				+ commentCategory + ", commentDate=" + commentDate + ", commentContentNo=" + commentContentNo
				+ ", commentLevel=" + commentLevel + ", commentStep=" + commentStep + "]";
	}
}
