package com.end.vo;

public class RCommentVO {
	
	private String rc_idx, rc_id, rc_name, rc_phone, rc_date, r_idx, rc_content, rc_pwd;

	public String getRc_idx() {
		return rc_idx;
	}

	public void setRc_idx(String rc_idx) {
		this.rc_idx = rc_idx;
	}

	public String getRc_id() {
		return rc_id;
	}

	public void setRc_id(String rc_id) {
		this.rc_id = rc_id;
	}

	public String getRc_name() {
		return rc_name;
	}

	public void setRc_name(String rc_name) {
		this.rc_name = rc_name;
	}

	public String getRc_phone() {
		return rc_phone;
	}

	public void setRc_phone(String rc_phone) {
		this.rc_phone = rc_phone;
	}

	public String getRc_date() {
		return rc_date;
	}

	public void setRc_date(String rc_date) {
		this.rc_date = rc_date;
	}

	public String getR_idx() {
		return r_idx;
	}

	public void setR_idx(String r_idx) {
		this.r_idx = r_idx;
	}

	public String getRc_content() {
		return rc_content;
	}

	public void setRc_content(String rc_content) {
		this.rc_content = rc_content;
	}

	public String getRc_pwd() {
		return rc_pwd;
	}

	public void setRc_pwd(String rc_pwd) {
		this.rc_pwd = rc_pwd;
	}

	public RCommentVO(String rc_idx, String rc_id, String rc_name, String rc_phone, String rc_date, String r_idx,
			String rc_content, String rc_pwd) {
		super();
		this.rc_idx = rc_idx;
		this.rc_id = rc_id;
		this.rc_name = rc_name;
		this.rc_phone = rc_phone;
		this.rc_date = rc_date;
		this.r_idx = r_idx;
		this.rc_content = rc_content;
		this.rc_pwd = rc_pwd;
	}
	
	
	
	public RCommentVO() {
		super();
	}

	@Override
	public String toString() {
		return "RCommentVO [rc_idx=" + rc_idx + ", rc_id=" + rc_id + ", rc_name=" + rc_name + ", rc_phone=" + rc_phone
				+ ", rc_date=" + rc_date + ", r_idx=" + r_idx + ", rc_content=" + rc_content + ", rc_pwd=" + rc_pwd
				+ "]";
	}

}
