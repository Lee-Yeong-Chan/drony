package com.smhrd.domain;
public class chatDTO {
	private int chat_idx;
	private int cr_idx;
	private String talker;
	private String talk;
	private String created_at;
	private String ch_file;
	public chatDTO() {
		super();
	}
	public chatDTO(int cr_idx, String talker, String talk) {
		super();
		this.cr_idx = cr_idx;
		this.talker = talker;
		this.talk = talk;
	}
	public chatDTO(int chat_idx, int cr_idx, String talker, String talk, String created_at, String ch_file) {
		super();
		this.chat_idx = chat_idx;
		this.cr_idx = cr_idx;
		this.talker = talker;
		this.talk = talk;
		this.created_at = created_at;
		this.ch_file = ch_file;
	}
	public int getChat_idx() {
		return chat_idx;
	}
	public void setChat_idx(int chat_idx) {
		this.chat_idx = chat_idx;
	}
	public int getCr_idx() {
		return cr_idx;
	}
	public void setCr_idx(int cr_idx) {
		this.cr_idx = cr_idx;
	}
	public String getTalker() {
		return talker;
	}
	public void setTalker(String talker) {
		this.talker = talker;
	}
	public String getTalk() {
		return talk;
	}
	public void setTalk(String talk) {
		this.talk = talk;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getCh_file() {
		return ch_file;
	}
	public void setCh_file(String ch_file) {
		this.ch_file = ch_file;
	}
}