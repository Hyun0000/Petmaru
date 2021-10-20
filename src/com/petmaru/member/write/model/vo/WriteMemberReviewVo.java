package com.petmaru.member.write.model.vo;

public class WriteMemberReviewVo {
	private int reviewNo; 
	private char reviewProductCategoey;
	private int reviewProductNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewDate;//String, to_Date(). to_character
	private String reviewWriter;
	private char reviewBuy;
	
	@Override
	public String toString() {
		return "WriteMemberReviewVo [reviewNo=" + reviewNo + ", reviewProductCategoey=" + reviewProductCategoey
				+ ", reviewProductNo=" + reviewProductNo + ", reviewTitle=" + reviewTitle + ", reviewContent="
				+ reviewContent + ", reviewDate=" + reviewDate + ", reviewWriter=" + reviewWriter + ", reviewBuy="
				+ reviewBuy + "]";
	}

	public WriteMemberReviewVo() {
		// TODO Auto-generated constructor stub
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public char getReviewProductCategoey() {
		return reviewProductCategoey;
	}

	public void setReviewProductCategoey(char reviewProductCategoey) {
		this.reviewProductCategoey = reviewProductCategoey;
	}

	public int getReviewProductNo() {
		return reviewProductNo;
	}

	public void setReviewProductNo(int reviewProductNo) {
		this.reviewProductNo = reviewProductNo;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public char getReviewBuy() {
		return reviewBuy;
	}

	public void setReviewBuy(char reviewBuy) {
		this.reviewBuy = reviewBuy;
	}
}
