package com.end.vo;

public class DogVO {
	private String d_name, d_type, d_intro, d_fur, d_size, d_title, d_img1, d_img2, d_img3, c_id;
	private int d_idx, d_age, d_weight, d_height;
	
	private int d_begin, d_end;

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getD_name() {
		return d_name;
	}

	public void setD_name(String d_name) {
		this.d_name = d_name;
	}

	public String getD_type() {
		return d_type;
	}

	public void setD_type(String d_type) {
		this.d_type = d_type;
	}

	public String getD_intro() {
		return d_intro;
	}

	public void setD_intro(String d_intro) {
		this.d_intro = d_intro;
	}

	public String getD_fur() {
		return d_fur;
	}

	public void setD_fur(String d_fur) {
		this.d_fur = d_fur;
	}

	public String getD_size() {
		return d_size;
	}

	public void setD_size(String d_size) {
		this.d_size = d_size;
	}

	public String getD_title() {
		return d_title;
	}

	public void setD_title(String d_title) {
		this.d_title = d_title;
	}

	public String getD_img1() {
		return d_img1;
	}

	public void setD_img1(String d_img1) {
		this.d_img1 = d_img1;
	}

	public String getD_img2() {
		return d_img2;
	}

	public void setD_img2(String d_img2) {
		this.d_img2 = d_img2;
	}

	public String getD_img3() {
		return d_img3;
	}

	public void setD_img3(String d_img3) {
		this.d_img3 = d_img3;
	}

	public int getD_idx() {
		return d_idx;
	}

	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}

	public int getD_age() {
		return d_age;
	}

	public void setD_age(int d_age) {
		this.d_age = d_age;
	}

	public int getD_weight() {
		return d_weight;
	}

	public void setD_weight(int d_weight) {
		this.d_weight = d_weight;
	}

	public int getD_height() {
		return d_height;
	}

	public void setD_height(int d_height) {
		this.d_height = d_height;
	}

	public int getD_begin() {
		return d_begin;
	}

	public void setD_begin(int d_begin) {
		this.d_begin = d_begin;
	}

	public int getD_end() {
		return d_end;
	}

	public void setD_end(int d_end) {
		this.d_end = d_end;
	}

	@Override
	public String toString() {
		return "DogVO [d_name=" + d_name + ", d_type=" + d_type + ", d_intro=" + d_intro + ", d_fur=" + d_fur
				+ ", d_size=" + d_size + ", d_title=" + d_title + ", d_img1=" + d_img1 + ", d_img2=" + d_img2
				+ ", d_img3=" + d_img3 + ", c_id=" + c_id + ", d_idx=" + d_idx + ", d_age=" + d_age + ", d_weight="
				+ d_weight + ", d_height=" + d_height + ", d_begin=" + d_begin + ", d_end=" + d_end + "]";
	}
	
}
