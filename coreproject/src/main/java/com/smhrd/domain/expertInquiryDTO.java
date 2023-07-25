package com.smhrd.domain;
public class expertInquiryDTO {
	private int inq_idx;
	private String inq_title;
	private String inq_content;
	private String inq_file;
	private String created_at;
	private String exp_id;
	public expertInquiryDTO(String inq_title, String inq_content, String inq_file, String exp_id) {
		super();
		this.inq_title = inq_title;
		this.inq_content = inq_content;
		this.inq_file = inq_file;
		this.exp_id = exp_id;
	}
	public expertInquiryDTO(int inq_idx, String inq_title, String inq_content, String inq_file) {
		super();
		this.inq_idx = inq_idx;
		this.inq_title = inq_title;
		this.inq_content = inq_content;
		this.inq_file = inq_file;
	}
	public expertInquiryDTO() {
		super();
	}
	public expertInquiryDTO(String exp_id) {
		super();
		this.exp_id = exp_id;
	}
	public expertInquiryDTO(int inq_idx) {
		super();
		this.inq_idx = inq_idx;
	}
	public expertInquiryDTO(int inq_idx, String inq_title, String inq_content, String inq_file, String created_at,
			String exp_id) {
		super();
		this.inq_idx = inq_idx;
		this.inq_title = inq_title;
		this.inq_content = inq_content;
		this.inq_file = inq_file;
		this.created_at = created_at;
		this.exp_id = exp_id;
	}
	public int getInq_idx() {
		return inq_idx;
	}
	public void setInq_idx(int inq_idx) {
		this.inq_idx = inq_idx;
	}
	public String getInq_title() {
		return inq_title;
	}
	public void setInq_title(String inq_title) {
		this.inq_title = inq_title;
	}
	public String getInq_content() {
		return inq_content;
	}
	public void setInq_content(String inq_content) {
		this.inq_content = inq_content;
	}
	public String getInq_file() {
		return inq_file;
	}
	public void setInq_file(String inq_file) {
		this.inq_file = inq_file;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUser_id() {
		return exp_id;
	}
	public void setUser_id(String exp_id) {
		this.exp_id = exp_id;
	}
	
}