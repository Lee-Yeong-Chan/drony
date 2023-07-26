package com.smhrd.domain;
public class droneCompanyDTO {
	private int dc_idx;
	private String dc_name;
	private String dc_addr;
	private String dc_tel;
	private String dc_kind;
	private String dc_info;
	private String dc_img;
	private String dc_homepage;
	public droneCompanyDTO() {
		super();
	}
	public droneCompanyDTO(int dc_idx) {
		super();
		this.dc_idx = dc_idx;
	}
	public droneCompanyDTO(int dc_idx, String dc_name, String dc_addr, String dc_tel, String dc_kind, String dc_info,
			String dc_img, String dc_homepage) {
		super();
		this.dc_idx = dc_idx;
		this.dc_name = dc_name;
		this.dc_addr = dc_addr;
		this.dc_tel = dc_tel;
		this.dc_kind = dc_kind;
		this.dc_info = dc_info;
		this.dc_img = dc_img;
		this.dc_homepage = dc_homepage;
	}
	public int getDc_idx() {
		return dc_idx;
	}
	public void setDc_idx(int dc_idx) {
		this.dc_idx = dc_idx;
	}
	public String getDc_name() {
		return dc_name;
	}
	public void setDc_name(String dc_name) {
		this.dc_name = dc_name;
	}
	public String getDc_addr() {
		return dc_addr;
	}
	public void setDc_addr(String dc_addr) {
		this.dc_addr = dc_addr;
	}
	public String getDc_tel() {
		return dc_tel;
	}
	public void setDc_tel(String dc_tel) {
		this.dc_tel = dc_tel;
	}
	public String getDc_kind() {
		return dc_kind;
	}
	public void setDc_kind(String dc_kind) {
		this.dc_kind = dc_kind;
	}
	public String getDc_info() {
		return dc_info;
	}
	public void setDc_info(String dc_info) {
		this.dc_info = dc_info;
	}
	public String getDc_img() {
		return dc_img;
	}
	public void setDc_img(String dc_img) {
		this.dc_img = dc_img;
	}
	public String getDc_homepage() {
		return dc_homepage;
	}
	public void setDc_homepage(String dc_homepage) {
		this.dc_homepage = dc_homepage;
	}
	
}