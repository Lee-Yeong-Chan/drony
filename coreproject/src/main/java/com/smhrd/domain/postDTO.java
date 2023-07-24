package com.smhrd.domain;
public class postDTO {
	private int w_idx;
	private String w_title;
	private String w_content;
	private String w_file;
	private int w_view;
	private String exp_id;
	private String created_at;
	private int w_price;
	private String user_id;
	public postDTO() {
		super();
	}
	public postDTO(int w_idx) {
		super();
		this.w_idx = w_idx;
	}
	public postDTO(int w_idx, String w_title, String w_content, String w_file, int w_view, String exp_id,
			String created_at, int w_price, String user_id) {
		super();
		this.w_idx = w_idx;
		this.w_title = w_title;
		this.w_content = w_content;
		this.w_file = w_file;
		this.w_view = w_view;
		this.exp_id = exp_id;
		this.created_at = created_at;
		this.w_price = w_price;
		this.user_id = user_id;
	}
	public int getW_idx() {
		return w_idx;
	}
	public void setW_idx(int w_idx) {
		this.w_idx = w_idx;
	}
	public String getW_title() {
		return w_title;
	}
	public void setW_title(String w_title) {
		this.w_title = w_title;
	}
	public String getW_content() {
		return w_content;
	}
	public void setW_content(String w_content) {
		this.w_content = w_content;
	}
	public String getW_file() {
		return w_file;
	}
	public void setW_file(String w_file) {
		this.w_file = w_file;
	}
	public int getW_view() {
		return w_view;
	}
	public void setW_view(int w_view) {
		this.w_view = w_view;
	}
	public String getExp_id() {
		return exp_id;
	}
	public void setExp_id(String exp_id) {
		this.exp_id = exp_id;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public int getW_price() {
		return w_price;
	}
	public void setW_price(int w_price) {
		this.w_price = w_price;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}