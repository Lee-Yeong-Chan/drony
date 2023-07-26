package com.smhrd.domain;
public class mypageDTO {
	private String w_title;
	private String status_memo;
	private String created_at;
	private int status_idx;
	private int w_idx;
	public mypageDTO(String status_memo, int status_idx) {
		super();
		this.status_memo = status_memo;
		this.status_idx = status_idx;
	}
	public mypageDTO(String w_title, String status_memo, String created_at, int status_idx) {
		super();
		this.w_title = w_title;
		this.status_memo = status_memo;
		this.created_at = created_at;
		this.status_idx = status_idx;
	}
	public mypageDTO() {
		super();
	}
	public mypageDTO(String w_title, String status_memo, String created_at) {
		super();
		this.w_title = w_title;
		this.status_memo = status_memo;
		this.created_at = created_at;
	}
	public int getW_idx() {
		return w_idx;
	}
	public void setW_idx(int w_idx) {
		this.w_idx = w_idx;
	}
	public int getStatus_idx() {
		return status_idx;
	}
	public void setStatus_idx(int status_idx) {
		this.status_idx = status_idx;
	}
	public String getW_title() {
		return w_title;
	}
	public void setW_title(String w_title) {
		this.w_title = w_title;
	}
	public String getStatus_memo() {
		return status_memo;
	}
	public void setStatus_memo(String status_memo) {
		this.status_memo = status_memo;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
}