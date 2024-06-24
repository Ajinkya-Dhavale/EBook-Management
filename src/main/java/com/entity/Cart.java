package com.entity;

public class Cart {
	@Override
	public String toString() {
		return "Cart [cart_id=" + cart_id + ", book_id=" + book_id + ", user_id=" + user_id + ", book_name=" + book_name
				+ ", book_author=" + book_author + ", book_price=" + book_price + ", total_price=" + total_price + "]";
	}
	private int cart_id;
	private int book_id;
	private int user_id;
	private String book_name;
	private String book_author;
	private Double book_price;
	private Double total_price;
	
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public Double getBook_price() {
		return book_price;
	}
	public void setBook_price(Double book_price) {
		this.book_price = book_price;
	}
	public Double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Double total_price) {
		this.total_price = total_price;
	}
}
