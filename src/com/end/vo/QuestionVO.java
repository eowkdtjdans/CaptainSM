package com.end.vo;

public class QuestionVO {
	int q_idx;
	String q_id;
	String q_name;
	String q_phone;
	String q_date;
	String q_subject;
	String q_content;
	String q_review_count;
	
	public String getQ_review_count() {
		return q_review_count;
	}
	public void setQ_review_count(String q_review_count) {
		this.q_review_count = q_review_count;
	}
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	public String getQ_id() {
		return q_id;
	}
	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}
	public String getQ_name() {
		return q_name;
	}
	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}
	public String getQ_phone() {
		return q_phone;
	}
	public void setQ_phone(String q_phone) {
		this.q_phone = q_phone;
	}	
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	@Override
	public String toString() {
		return "QuestionVO [q_idx=" + q_idx + ", q_id=" + q_id + ", q_name=" + q_name + ", q_phone=" + q_phone
				+ ", q_date=" + q_date + ", q_subject=" + q_subject + ", q_content=" + q_content + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
