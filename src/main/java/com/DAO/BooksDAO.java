package com.DAO;

import java.util.List;

import com.entity.Books;

public interface BooksDAO {
	public boolean add_book(Books b);
	public List<Books> getBooks();
	public Books getBookById(int id);
	public boolean updateBook(Books b);
	public boolean deleteBook(int id);
	public List<Books> getNewBooks();
	public List<Books> getRecentBooks();
	public List<Books> getOldBooks();
	public List<Books> getAllRecentBooks();
	public List<Books> getAllNewBooks();
	public List<Books> getAllOldBooks();
	public List<Books> getOldBookByUser(String user_email);
	
	public List<Books> getBookBySearch(String ch);
	
	
}
