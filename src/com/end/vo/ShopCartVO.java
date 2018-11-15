package com.end.vo;

import java.util.List;

public class ShopCartVO {
	
	private String cart_idx, c_id, name;
	private int number,cart_quant;
	
	private String num,	category, p_name, p_company, p_image_s, p_image_l, p_content, p_date;
	private int p_price, p_saleprice;
	
	private int totalprice;
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(String cart_idx) {
		this.cart_idx = cart_idx;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getCart_quant() {
		return cart_quant;
	}
	public void setCart_quant(int cart_quant) {
		this.cart_quant = cart_quant;
		totalprice = p_saleprice * cart_quant;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_company() {
		return p_company;
	}
	public void setP_company(String p_company) {
		this.p_company = p_company;
	}
	public String getP_image_s() {
		return p_image_s;
	}
	public void setP_image_s(String p_image_s) {
		this.p_image_s = p_image_s;
	}
	public String getP_image_l() {
		return p_image_l;
	}
	public void setP_image_l(String p_image_l) {
		this.p_image_l = p_image_l;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_saleprice() {
		return p_saleprice;
	}
	public void setP_saleprice(int p_saleprice) {
		this.p_saleprice = p_saleprice;
	}
	
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	
	@Override
	public String toString() {
		return "ShopCartVO [cart_idx=" + cart_idx + ", c_id=" + c_id + ", name=" + name + ", number=" + number
				+ ", cart_quant=" + cart_quant + ", num=" + num + ", category=" + category + ", p_name=" + p_name
				+ ", p_company=" + p_company + ", p_image_s=" + p_image_s + ", p_image_l=" + p_image_l + ", p_content="
				+ p_content + ", p_date=" + p_date + ", p_price=" + p_price + ", p_saleprice=" + p_saleprice
				+ ", totalprice=" + totalprice + "]";
	}
	
}
