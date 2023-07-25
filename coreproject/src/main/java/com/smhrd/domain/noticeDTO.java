package com.smhrd.domain;
public class noticeDTO {
	private int notice_idx;
	private String notice_title;
	private String notice_content;
	private String notice_file;
	private String created_at;
	public noticeDTO(String notice_title, String notice_content, String notice_file) {
		super();
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_file = notice_file;
	}
	public noticeDTO() {
		super();
	}
	public noticeDTO(int notice_idx) {
		super();
		this.notice_idx = notice_idx;
	}
	public noticeDTO(int notice_idx, String notice_title, String notice_content, String notice_file,
			String created_at) {
		super();
		this.notice_idx = notice_idx;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_file = notice_file;
		this.created_at = created_at;
	}
	public noticeDTO(int notice_idx, String notice_title, String notice_content, String notice_file) {
		super();
		this.notice_idx = notice_idx;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_file = notice_file;
	}
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
}