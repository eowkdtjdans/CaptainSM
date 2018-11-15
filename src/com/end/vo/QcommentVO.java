package com.end.vo;

public class QcommentVO {
	int qc_idx;
	String qc_id,qc_name,qc_phone,qc_date,q_idx,qc_content;
	
	public int getQc_idx() {
		return qc_idx;
	}
	public void setQc_idx(int qc_idx) {
		this.qc_idx = qc_idx;
	}
	public String getQc_id() {
		return qc_id;
	}
	public void setQc_id(String qc_id) {
		this.qc_id = qc_id;
	}
	public String getQc_name() {
		return qc_name;
	}
	public void setQc_name(String qc_name) {
		this.qc_name = qc_name;
	}
	public String getQc_phone() {
		return qc_phone;
	}
	public void setQc_phone(String qc_phone) {
		this.qc_phone = qc_phone;
	}
	public String getQc_date() {
		return qc_date;
	}
	public void setQc_date(String qc_date) {
		this.qc_date = qc_date;
	}
	public String getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(String q_idx) {
		this.q_idx = q_idx;
	}
	public String getQc_content() {
		return qc_content;
	}
	public void setQc_content(String qc_content) {
		this.qc_content = qc_content;
	}
	@Override
	public String toString() {
		return "QcommentVO [qc_idx=" + qc_idx + ", qc_id=" + qc_id + ", qc_name=" + qc_name + ", qc_phone=" + qc_phone
				+ ", qc_date=" + qc_date + ", q_idx=" + q_idx + ", qc_content=" + qc_content + "]";
	}

	
	
}
