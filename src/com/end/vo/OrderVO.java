package com.end.vo;

public class OrderVO {
	private int phone, phone_receiver, deliveryfee, total, o_idx;
	private String id, name, order_date, mail, receiver, site, message, paymeans;
	
	private int o_begin, o_end;
	
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
	public int getDeliveryfee() {
		return deliveryfee;
	}
	public void setDeliveryfee(int deliveryfee) {
		this.deliveryfee = deliveryfee;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getO_idx() {
		return o_idx;
	}
	public void setO_idx(int o_idx) {
		this.o_idx = o_idx;
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
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
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
	public String getPaymeans() {
		return paymeans;
	}
	public void setPaymeans(String paymeans) {
		this.paymeans = paymeans;
	}
	public int getO_begin() {
		return o_begin;
	}
	public void setO_begin(int o_begin) {
		this.o_begin = o_begin;
	}
	public int getO_end() {
		return o_end;
	}
	public void setO_end(int o_end) {
		this.o_end = o_end;
	}
	
	@Override
	public String toString() {
		return "OrderListVO [phone=" + phone + ", phone_receiver=" + phone_receiver + ", deliveryfee=" + deliveryfee
				+ ", total=" + total + ", o_idx=" + o_idx + ", id=" + id + ", name=" + name + ", order_date="
				+ order_date + ", mail=" + mail + ", receiver=" + receiver + ", site=" + site + ", message=" + message
				+ ", paymeans=" + paymeans + ", o_begin=" + o_begin + ", o_end=" + o_end + "]";
	}
	
}
