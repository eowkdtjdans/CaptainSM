package com.end.vo;

public class ShopOrderVO {
	private int phone,phone_receiver,
				deliveryFee,total,order_date;
	private String id,name,mail,receiver,site,message,payMeans;
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public int getPhone_receiver() {
		return phone_receiver;
	}
	public void setPhone_receiver(int phone_receiver) {
		this.phone_receiver = phone_receiver;
	}
	public int getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getOrder_date() {
		return order_date;
	}
	public void setOrder_date(int order_date) {
		this.order_date = order_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getPayMeans() {
		return payMeans;
	}
	public void setPayMeans(String payMeans) {
		this.payMeans = payMeans;
	}
	@Override
	public String toString() {
		return "OrderVO [phone=" + phone + ", phone_receiver=" + phone_receiver
				+ ", deliveryFee=" + deliveryFee + ", total=" + total + ", order_date=" + order_date
				+ ", id=" + id + ", name=" + name + ", mail=" + mail + ", receiver=" + receiver + ", site=" + site
				+ ", message=" + message + ", payMeans=" + payMeans + "]";
	}
	
	
	
	
	
	
				
				

}
