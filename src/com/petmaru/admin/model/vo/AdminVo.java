package com.petmaru.admin.model.vo;

public class AdminVo {

	private String admin_ID;
	private String admin_pwd;
	private String admin_Email;
	private String admin_name;
	private String admin_phone;

	public AdminVo() {
	
	}
	@Override
	public String toString() {
		return "Admin [admin_ID=" + admin_ID + ", admin_pwd=" + admin_pwd + ", admin_Email=" + admin_Email
				+ ", admin_name=" + admin_name + ", admin_phone=" + admin_phone + "]";
	}

	public String getAdmin_ID() {
		return admin_ID;
	}

	public void setAdmin_ID(String admin_ID) {
		this.admin_ID = admin_ID;
	}

	public String getAdmin_pwd() {
		return admin_pwd;
	}

	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}

	public String getAdmin_Email() {
		return admin_Email;
	}

	public void setAdmin_Email(String admin_Email) {
		this.admin_Email = admin_Email;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getAdmin_phone() {
		return admin_phone;
	}

	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}

	public AdminVo(String admin_ID, String admin_pwd, String admin_Email, String admin_name, String admin_phone) {
		super();
		this.admin_ID = admin_ID;
		this.admin_pwd = admin_pwd;
		this.admin_Email = admin_Email;
		this.admin_name = admin_name;
		this.admin_phone = admin_phone;
	}
}
