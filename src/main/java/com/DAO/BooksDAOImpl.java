package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



import com.entity.Books;

public class BooksDAOImpl implements BooksDAO
{
	Connection conn;
	
	public BooksDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean add_book(Books b) {
		boolean f=false;
		try {
			String sql="insert into books(book_name,book_author,book_price,book_category,book_status,book_photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,b.getBook_name());
			ps.setString(2,b.getBook_author());
			ps.setString(3,b.getBook_price());
			ps.setString(4,b.getBook_category());
			ps.setString(5,b.getBook_status());
			ps.setString(6,b.getBook_photo());
			ps.setString(7,b.getEmail());
			
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Books> getBooks() {
		List<Books> list=new ArrayList<Books>();
		Books b;
		try 
		{
			String sql="select * from books";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet set=ps.executeQuery();
			while(set.next())
			{
				b=new Books();
				b.setBook_id(set.getInt(1));
				b.setBook_name(set.getString(2));
				b.setBook_author(set.getString(3));
				b.setBook_price(set.getString(4));
				b.setBook_category(set.getString(5));
				b.setBook_status(set.getString(6));
				b.setBook_photo(set.getString(7));
				b.setEmail(set.getString(8));
				
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Books getBookById(int id) {
		Books b=null;
		
		try {
			String sql="select * from books where book_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			ResultSet set=ps.executeQuery();
			
			while(set.next())
			{
				b=new Books();
				b.setBook_id(set.getInt(1));
				b.setBook_name(set.getString(2));
				b.setBook_author(set.getString(3));
				b.setBook_price(set.getString(4));
				b.setBook_category(set.getString(5));
				b.setBook_status(set.getString(6));
				b.setBook_photo(set.getString(7));
				b.setEmail(set.getString(8));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}

	@Override
	public boolean updateBook(Books b) {
		boolean f=false;
		try {
			String sql="update books set book_name=?,book_author=?,book_price=?,book_status=? where book_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,b.getBook_name());
			ps.setString(2, b.getBook_author());
			ps.setString(3,b.getBook_price());
			ps.setString(4,b.getBook_status());
			ps.setInt(5,b.getBook_id());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return f;
	}

	@Override
	public boolean deleteBook(int id) {
		boolean f=false;
		try {
			String sql="delete from books where book_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Books> getNewBooks() {
		List<Books> list =new ArrayList<Books>();
		try {
			String sql="select * from books where book_category=? and book_status=? order by book_id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet set=ps.executeQuery();
			int i=1;
			Books b;
			while(set.next() && i<=4)
			{
				b=new Books();
				b.setBook_id(set.getInt(1));
				b.setBook_name(set.getString(2));
				b.setBook_author(set.getString(3));
				b.setBook_price(set.getString(4));
				b.setBook_category(set.getString(5));
				b.setBook_status(set.getString(6));
				b.setBook_photo(set.getString(7));
				b.setEmail(set.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Books> getRecentBooks() {
		List<Books> list =new ArrayList<Books>();
		try {
			String sql="select * from books where  book_status=? order by book_id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet set=ps.executeQuery();
			int i=1;
			Books b;
			while(set.next() && i<=4)
			{
				b=new Books();
				b.setBook_id(set.getInt(1));
				b.setBook_name(set.getString(2));
				b.setBook_author(set.getString(3));
				b.setBook_price(set.getString(4));
				b.setBook_category(set.getString(5));
				b.setBook_status(set.getString(6));
				b.setBook_photo(set.getString(7));
				b.setEmail(set.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Books> getOldBooks() {
		List<Books> list =new ArrayList<Books>();
		try {
			String sql="select * from books where book_category=? and book_status=? order by book_id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet set=ps.executeQuery();
			int i=1;
			Books b;
			while(set.next() && i<=4)
			{
				b=new Books();
				b.setBook_id(set.getInt(1));
				b.setBook_name(set.getString(2));
				b.setBook_author(set.getString(3));
				b.setBook_price(set.getString(4));
				b.setBook_category(set.getString(5));
				b.setBook_status(set.getString(6));
				b.setBook_photo(set.getString(7));
				b.setEmail(set.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Books> getAllNewBooks() {
		List<Books> list =new ArrayList<Books>();
		try {
			String sql="select * from books where book_category=? and book_status=? order by book_id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet set=ps.executeQuery();
			Books b;
			while(set.next())
			{
				b=new Books();
				b.setBook_id(set.getInt(1));
				b.setBook_name(set.getString(2));
				b.setBook_author(set.getString(3));
				b.setBook_price(set.getString(4));
				b.setBook_category(set.getString(5));
				b.setBook_status(set.getString(6));
				b.setBook_photo(set.getString(7));
				b.setEmail(set.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Books> getAllRecentBooks() {
		List<Books> list =new ArrayList<Books>();
		try {
			String sql="select * from books where  book_status=? order by book_id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet set=ps.executeQuery();
			Books b;
			while(set.next())
			{
				b=new Books();
				b.setBook_id(set.getInt(1));
				b.setBook_name(set.getString(2));
				b.setBook_author(set.getString(3));
				b.setBook_price(set.getString(4));
				b.setBook_category(set.getString(5));
				b.setBook_status(set.getString(6));
				b.setBook_photo(set.getString(7));
				b.setEmail(set.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Books> getAllOldBooks() {
		List<Books> list =new ArrayList<Books>();
		try {
			String sql="select * from books where book_category=? and book_status=? order by book_id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet set=ps.executeQuery();
			Books b;
			while(set.next() )
			{
				b=new Books();
				b.setBook_id(set.getInt(1));
				b.setBook_name(set.getString(2));
				b.setBook_author(set.getString(3));
				b.setBook_price(set.getString(4));
				b.setBook_category(set.getString(5));
				b.setBook_status(set.getString(6));
				b.setBook_photo(set.getString(7));
				b.setEmail(set.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Books> getOldBookByUser(String user_email) {
		List<Books> list=new ArrayList<Books>();
		Books b;
		try 
		{ 
			String sql="select * from books where email=? and book_category=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, user_email);
			ps.setString(2, "Old");
			ResultSet set=ps.executeQuery();
			while(set.next())
			{
				b=new Books();
				b.setBook_id(set.getInt(1));
				b.setBook_name(set.getString(2));
				b.setBook_author(set.getString(3));
				b.setBook_price(set.getString(4));
				b.setBook_category(set.getString(5));
				b.setBook_status(set.getString(6));
				b.setBook_photo(set.getString(7));
				b.setEmail(set.getString(8));
				
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Books> getBookBySearch(String ch) {
		List<Books> list =new ArrayList<Books>();
		try {
			String sql = "SELECT * FROM books WHERE (LOWER(book_name) LIKE ? OR LOWER(book_author) LIKE ? OR LOWER(book_price) LIKE ? OR LOWER(book_category) LIKE ?) AND book_status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + ch.toLowerCase() + "%");
			ps.setString(2, "%" + ch.toLowerCase() + "%");
			ps.setString(3, "%" + ch.toLowerCase() + "%");
			ps.setString(4, "%" + ch.toLowerCase() + "%");
			ps.setString(5, "Active");
			ResultSet set = ps.executeQuery();

			int i=1;
			Books b;
			while(set.next())
			{
				b=new Books();
				b.setBook_id(set.getInt(1));
				b.setBook_name(set.getString(2));
				b.setBook_author(set.getString(3));
				b.setBook_price(set.getString(4));
				b.setBook_category(set.getString(5));
				b.setBook_status(set.getString(6));
				b.setBook_photo(set.getString(7));
				b.setEmail(set.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
