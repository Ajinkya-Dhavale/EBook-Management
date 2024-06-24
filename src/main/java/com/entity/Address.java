package com.entity;

public class Address {
	
	@Override
	public String toString() {
		return "Address [user_id=" + user_id + ", userName=" + userName + ", userEmail=" + userEmail + ", userPhone="
				+ userPhone + ", userAddress=" + userAddress + ", userLandmark=" + userLandmark + ", userCity="
				+ userCity + ", userState=" + userState + ", userPincode=" + userPincode + "]";
	}
	
	
	private int user_id;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userAddress;
	private String userLandmark;
	private String userCity;
	private String userState;
	private String userPincode;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserLandmark() {
		return userLandmark;
	}
	public void setUserLandmark(String userLandmark) {
		this.userLandmark = userLandmark;
	}
	public String getUserCity() {
		return userCity;
	}
	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}
	public String getUserState() {
		return userState;
	}
	public void setUserState(String userState) {
		this.userState = userState;
	}
	public String getUserPincode() {
		return userPincode;
	}
	public void setUserPincode(String userPincode) {
		this.userPincode = userPincode;
	}
	
	
	
}
