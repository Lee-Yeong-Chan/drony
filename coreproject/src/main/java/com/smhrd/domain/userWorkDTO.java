package com.smhrd.domain;
public class userWorkDTO {
	private int tuw_idx;
	private int w_idx;
	private String user_id;
	public userWorkDTO(int w_idx, String user_id) {
		super();
		this.w_idx = w_idx;
		this.user_id = user_id;
	}
	public userWorkDTO(int tuw_idx) {
		super();
		this.tuw_idx = tuw_idx;
	}
	public int getTuw_idx() {
		return tuw_idx;
	}
	public void setTuw_idx(int tuw_idx) {
		this.tuw_idx = tuw_idx;
	}
	public int getW_idx() {
		return w_idx;
	}
	public void setW_idx(int w_idx) {
		this.w_idx = w_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}