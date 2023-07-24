package com.smhrd.domain;
public class expertDroneDTO {
	private int dr_idx;
	private String dr_model;
	private String dr_maker;
	private String dr_serial;
	private String dr_desc;
	private String dr_img;
	private String exp_id;
	public expertDroneDTO() {
		super();
	}
	public expertDroneDTO(int dr_idx) {
		super();
		this.dr_idx = dr_idx;
	}
	public expertDroneDTO(int dr_idx, String dr_model, String dr_maker, String dr_serial, String dr_desc,
			String dr_img) {
		super();
		this.dr_idx = dr_idx;
		this.dr_model = dr_model;
		this.dr_maker = dr_maker;
		this.dr_serial = dr_serial;
		this.dr_desc = dr_desc;
		this.dr_img = dr_img;
	}
	public expertDroneDTO(int dr_idx, String dr_model, String dr_maker, String dr_serial, String dr_desc, String dr_img,
			String exp_id) {
		super();
		this.dr_idx = dr_idx;
		this.dr_model = dr_model;
		this.dr_maker = dr_maker;
		this.dr_serial = dr_serial;
		this.dr_desc = dr_desc;
		this.dr_img = dr_img;
		this.exp_id = exp_id;
	}
	public String getExp_id() {
		return exp_id;
	}
	public void setExp_id(String exp_id) {
		this.exp_id = exp_id;
	}
	public int getDr_idx() {
		return dr_idx;
	}
	public void setDr_idx(int dr_idx) {
		this.dr_idx = dr_idx;
	}
	public String getDr_model() {
		return dr_model;
	}
	public void setDr_model(String dr_model) {
		this.dr_model = dr_model;
	}
	public String getDr_maker() {
		return dr_maker;
	}
	public void setDr_maker(String dr_maker) {
		this.dr_maker = dr_maker;
	}
	public String getDr_serial() {
		return dr_serial;
	}
	public void setDr_serial(String dr_serial) {
		this.dr_serial = dr_serial;
	}
	public String getDr_desc() {
		return dr_desc;
	}
	public void setDr_desc(String dr_desc) {
		this.dr_desc = dr_desc;
	}
	public String getDr_img() {
		return dr_img;
	}
	public void setDr_img(String dr_img) {
		this.dr_img = dr_img;
	}
}