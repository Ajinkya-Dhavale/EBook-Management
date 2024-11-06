package com.entity;

public class Books
{
	int book_id;
	String book_name;
	String book_author;
	String book_price;
	String book_category;
	String book_status;
	String book_photo;
	String email;

	public Books(String book_name, String book_author, String book_price, String book_category, String book_status,
			String book_photo,String email) {
		this.book_name = book_name;
		this.book_author = book_author;
		this.book_price = book_price;
		this.book_category = book_category;
		this.book_status = book_status;
		this.book_photo = book_photo;
		this.email = email;
	}


	public Books() {
		
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
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

	public String getBook_price() {
		return book_price;
	}

	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}

	public String getBook_category() {
		return book_category;
	}

	public void setBook_category(String book_category) {
		this.book_category = book_category;
	}

	public String getBook_status() {
		return book_status;
	}

	public void setBook_status(String book_status) {
		this.book_status = book_status;
	}

	public String getBook_photo() {
		return book_photo;
	}

	public void setBook_photo(String book_photo) {
		this.book_photo = book_photo;
	}
	
	
	@Override
	public String toString() {
		return "Books [book_id=" + book_id + ", book_name=" + book_name + ", book_author=" + book_author
				+ ", book_price=" + book_price + ", book_category=" + book_category + ", book_status=" + book_status
				+ ", book_photo=" + book_photo + ", email=" + email + "]";
	}
}
