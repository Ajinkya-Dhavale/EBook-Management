package com.entity;

public class Contact {
	private String user_name;
	private String user_email;
	private String user_phone;
	private String user_message;
	
	@Override
	public String toString() {
		return "Contact [user_name=" + user_name + ", user_email=" + user_email + ", user_phone=" + user_phone
				+ ", user_message=" + user_message + "]";
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_message() {
		return user_message;
	}
	public void setUser_message(String user_message) {
		this.user_message = user_message;
	}	
}

