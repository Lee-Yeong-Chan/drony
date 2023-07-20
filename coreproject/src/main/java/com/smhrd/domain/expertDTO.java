package com.smhrd.domain;
public class expertDTO {
	private String exp_id;
	private String exp_pw;
	private String exp_name;
	private String exp_email;
	private String exp_phone;
	private String bno;
	private String company_name;
	private String company_addr;
	private String working_area;
	private String working_field;
	public expertDTO() {
		super();
	}
	public expertDTO(String exp_id, String exp_pw) {
		super();
		this.exp_id = exp_id;
		this.exp_pw = exp_pw;
	}
	public expertDTO(String exp_id, String exp_pw, String exp_name, String exp_email, String exp_phone, String bno,
			String company_name, String company_addr, String working_area, String working_field) {
		super();
		this.exp_id = exp_id;
		this.exp_pw = exp_pw;
		this.exp_name = exp_name;
		this.exp_email = exp_email;
		this.exp_phone = exp_phone;
		this.bno = bno;
		this.company_name = company_name;
		this.company_addr = company_addr;
		this.working_area = working_area;
		this.working_field = working_field;
	}
	public String getExp_id() {
		return exp_id;
	}
	public void setExp_id(String exp_id) {
		this.exp_id = exp_id;
	}
	public String getExp_pw() {
		return exp_pw;
	}
	public void setExp_pw(String exp_pw) {
		this.exp_pw = exp_pw;
	}
	public String getExp_name() {
		return exp_name;
	}
	public void setExp_name(String exp_name) {
		this.exp_name = exp_name;
	}
	public String getExp_email() {
		return exp_email;
	}
	public void setExp_email(String exp_email) {
		this.exp_email = exp_email;
	}
	public String getExp_phone() {
		return exp_phone;
	}
	public void setExp_phone(String exp_phone) {
		this.exp_phone = exp_phone;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_addr() {
		return company_addr;
	}
	public void setCompany_addr(String company_addr) {
		this.company_addr = company_addr;
	}
	public String getWorking_area() {
		return working_area;
	}
	public void setWorking_area(String working_area) {
		this.working_area = working_area;
	}
	public String getWorking_field() {
		return working_field;
	}
	public void setWorking_field(String working_field) {
		this.working_field = working_field;
	}
}