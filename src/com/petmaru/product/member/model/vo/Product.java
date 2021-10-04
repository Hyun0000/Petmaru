package com.petmaru.product.member.model.vo;

import java.sql.Date;

public class Product {
	private int productNo;
	private char productCategory;
	private String productName;
	private String productImgUrl;
	private String com;
	private int price;
	private int amount;
	private Date date;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public char getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(char productCategory) {
		this.productCategory = productCategory;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductImgUrl() {
		return productImgUrl;
	}
	public void setProductImgUrl(String productImgUrl) {
		this.productImgUrl = productImgUrl;
	}
	public String getCom() {
		return com;
	}
	public void setCom(String com) {
		this.com = com;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "[productNo=" + productNo + ", productCategory=" + productCategory + ", productName="
				+ productName + ", productImgUrl=" + productImgUrl + ", com=" + com + ", price=" + price + ", amount="
				+ amount + ", date=" + date + "]";
	}
	
	// 페이징 체크용 method
	public String toStrings() {
		return "[productNo=" + productNo + ", productCategory=" + productCategory + ", productName="
				+ productName + ", com=" + com + ", price=" + price + ", amount="
				+ amount + "]";
	}
}
