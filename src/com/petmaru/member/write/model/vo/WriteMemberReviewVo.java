package com.petmaru.member.write.model.vo;

public class WriteMemberReviewVo {
	// REVIEW_NO 				NUMBER 			PRIMARY KEY,
	// REVIEW_PRODUCT_CATEGORY 	CHAR(1) 		CHECK(REVIEW_PRODUCT_CATEGORY IN ('C', 'A', 'T', 'H', 'B', 'F')),
	// REVIEW_PRODUCT_NO 		NUMBER 			REFERENCES PRODUCT(PRODUCT_NO),
	// REVIEW_TITLE 			VARCHAR2(300) 	NOT NULL,
	// REVIEW_CONTENT 			VARCHAR2(2000) 	NOT NULL,
	// REVIEW_DATE 				TIMESTAMP 		DEFAULT SYSDATE,
	// REVIEW_WRITER 			VARCHAR2(500) 	REFERENCES MEMBER(MEMBER_ID),
	// REVIEW_BUY 				CHAR(1) 		CHECK(REVIEW_BUY IN('Y','N'))
	// REVIEW_IMAGE_URL 		VARCHAR2(500) 	UNIQUE
	private int reviewNo; 
	private char reviewProductCategoey;
	private int reviewProductNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewDate;//String, to_Date(). to_character
	private String reviewWriter;
	private char reviewBuy;
	private String reviewImageUrl;
	
	@Override
	public String toString() {
		return "WriteMemberReviewVo [reviewNo=" + reviewNo + ", reviewProductCategoey=" + reviewProductCategoey
				+ ", reviewProductNo=" + reviewProductNo + ", reviewTitle=" + reviewTitle + ", reviewContent="
				+ reviewContent + ", reviewDate=" + reviewDate + ", reviewWriter=" + reviewWriter + ", reviewBuy="
				+ reviewBuy + ", reviewImageUrl=" + reviewImageUrl + "]";
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

	public String getReviewImageUrl() {
		return reviewImageUrl;
	}

	public void setReviewImageUrl(String reviewImageUrl) {
		this.reviewImageUrl = reviewImageUrl;
	}
}
