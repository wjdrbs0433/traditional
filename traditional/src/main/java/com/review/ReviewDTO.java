package com.review;

public class ReviewDTO {
	private long reviewBoardNum;
	private String productCode;
	private String reviewContent;
	private String regDate;
	private double star;
	private int bestOrNot;
	private int reviewWriteOrNot;
	private int hitCount;
	private int orderDetailNum;
	private String reviewer;
	private String image;
	private String productName;
	private String orderDate;
	private String mName;
	private int mNum;
	private int orderNum;
	
	
	
	
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public long getReviewBoardNum() {
		return reviewBoardNum;
	}
	public void setReviewBoardNum(long reviewBoardNum) {
		this.reviewBoardNum = reviewBoardNum;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public int getBestOrNot() {
		return bestOrNot;
	}
	public void setBestOrNot(int bestOrNot) {
		this.bestOrNot = bestOrNot;
	}
	public int getReviewWriteOrNot() {
		return reviewWriteOrNot;
	}
	public void setReviewWriteOrNot(int reviewWriteOrNot) {
		this.reviewWriteOrNot = reviewWriteOrNot;
	}
	
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(int orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public String getReviewer() {
		return reviewer;
	}
	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}
	
	
}
