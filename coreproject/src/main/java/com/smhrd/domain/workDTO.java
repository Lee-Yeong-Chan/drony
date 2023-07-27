package com.smhrd.domain;
public class workDTO {
	private int w_idx;
	private String w_title;
	private String w_content;
	private String w_file;
	private String exp_id;
	private String created_at;
	private int w_price;
	private String w_kind;
	private String w_img;
	public workDTO(int w_idx, String w_title, String w_content, String w_file, int w_price, String w_kind,
			String w_img) {
		super();
		this.w_idx = w_idx;
		this.w_title = w_title;
		this.w_content = w_content;
		this.w_file = w_file;
		this.w_price = w_price;
		this.w_kind = w_kind;
		this.w_img = w_img;
	}
	public workDTO(String w_title, String w_content, String w_file, String exp_id, int w_price, String w_kind,
			String w_img) {
		super();
		this.w_title = w_title;
		this.w_content = w_content;
		this.w_file = w_file;
		this.exp_id = exp_id;
		this.w_price = w_price;
		this.w_kind = w_kind;
		this.w_img = w_img;
	}
	public workDTO(String exp_id) {
		super();
		this.exp_id = exp_id;
	}
	public workDTO(int w_idx) {
		super();
		this.w_idx = w_idx;
	}
	public workDTO() {
		super();
	}
	public workDTO(int w_idx, String w_title, String w_content, String w_file, String exp_id,
			String created_at, int w_price) {
		super();
		this.w_idx = w_idx;
		this.w_title = w_title;
		this.w_content = w_content;
		this.w_file = w_file;
		this.exp_id = exp_id;
		this.created_at = created_at;
		this.w_price = w_price;
	}
	public workDTO(int w_idx, String w_title, String w_content, String w_file, String exp_id,
			String created_at, int w_price, String w_kind, String w_img) {
		super();
		this.w_idx = w_idx;
		this.w_title = w_title;
		this.w_content = w_content;
		this.w_file = w_file;
		this.exp_id = exp_id;
		this.created_at = created_at;
		this.w_price = w_price;
		this.w_kind = w_kind;
		this.w_img = w_img;
	}
	public String getW_kind() {
		return w_kind;
	}
	public void setW_kind(String w_kind) {
		this.w_kind = w_kind;
	}
	public String getW_img() {
		return w_img;
	}
	public void setW_img(String w_img) {
		this.w_img = w_img;
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
}