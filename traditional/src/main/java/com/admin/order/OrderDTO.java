package com.admin.order;

public class OrderDTO {
	private long orderNum;//
	// 딜리버리DTO 타입에 따라 변경 필요
	private long deliveryNum;
	private String orderDate;//
	private long orderPrice;//
	private long totalPrice;//
	private String orderRequire;

	private long shippingFee;
	private String orderStatus;
	private long mNum;
	
	
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	public long getDeliveryNum() {
		return deliveryNum;
	}
	public void setDeliveryNum(long deliveryNum) {
		this.deliveryNum = deliveryNum;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public long getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(long orderPrice) {
		this.orderPrice = orderPrice;
	}
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getOrderRequire() {
		return orderRequire;
	}
	public void setOrderRequire(String orderRequire) {
		this.orderRequire = orderRequire;
	}
	public long getShippingFee() {
		return shippingFee;
	}
	public void setShippingFee(long shippingFee) {
		this.shippingFee = shippingFee;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public long getmNum() {
		return mNum;
	}
	public void setmNum(long mNum) {
		this.mNum = mNum;
	}
	
	
	
}
