package com.end.vo;

public class ReviewDataVO {

	private String r_idx, r_id, r_title, r_phone, r_date, r_content, r_view_count, r_image_s, r_image_l;

	public String getR_idx() {
		return r_idx;
	}

	public void setR_idx(String r_idx) {
		this.r_idx = r_idx;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_phone() {
		return r_phone;
	}

	public void setR_phone(String r_phone) {
		this.r_phone = r_phone;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_view_count() {
		return r_view_count;
	}

	public void setR_view_count(String r_view_count) {
		this.r_view_count = r_view_count;
	}

	public String getR_image_s() {
		return r_image_s;
	}

	public void setR_image_s(String r_image_s) {
		this.r_image_s = r_image_s;
	}

	public String getR_image_l() {
		return r_image_l;
	}

	public void setR_image_l(String r_image_l) {
		this.r_image_l = r_image_l;
	}

	@Override
	public String toString() {
		return "ReviewDataVO [r_idx=" + r_idx + ", r_id=" + r_id + ", r_title=" + r_title + ", r_phone=" + r_phone
				+ ", r_date=" + r_date + ", r_content=" + r_content + ", r_view_count=" + r_view_count + ", r_image_s="
				+ r_image_s + ", r_image_l=" + r_image_l + "]";
	}

	
	
	
}
