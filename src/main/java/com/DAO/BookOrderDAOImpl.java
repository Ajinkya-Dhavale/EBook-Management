package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_order;

public class BookOrderDAOImpl implements BookOrderDAO{
	Connection conn;

	public BookOrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public int getOrderNo() {
		int i=1;
		try {
			String sqlString="select * from book_orders";
			PreparedStatement pStatement=conn.prepareStatement(sqlString);
			ResultSet set=pStatement.executeQuery();
			while(set.next())
			{
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public boolean saveOrder(List<Book_order> blist) {
		boolean f=false;
		try {
			String sql="insert into book_orders(user_id,user_name,user_email,address,phone,book_name,book_author,book_price,payment,`current_time`, `current_date`) values(?,?,?,?,?,?,?,?,?,?,?)";		
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(sql);
			
			for(Book_order b:blist)
			{
				ps.setInt(1, b.getUser_id());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getUserEmail());
				ps.setString(4, b.getUserAddress());
				ps.setString(5, b.getUserPhone());
				ps.setString(6, b.getBook_name());
				ps.setString(7, b.getBook_author());
				ps.setString(8, b.getBook_price());
				ps.setString(9, b.getPaymentType());
				ps.setString(10, b.getCurrent_time());
				ps.setString(11, b.getCurrent_date());
				ps.addBatch();
			}
			ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Book_order> getBook(int id) {
		List<Book_order> list=new ArrayList<Book_order>();
		
		try {
			String sql="select * from book_orders where user_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet set=ps.executeQuery();
			
			Book_order order=null;
			
			while(set.next())
			{
				order=new Book_order();
				
				order.setOrder_id(set.getInt("order_id"));
				order.setUser_id(set.getInt("user_id"));
				order.setBook_author(set.getString("book_author"));
				order.setBook_name(set.getString("book_name"));
				order.setBook_price(set.getString("book_price"));
				order.setPaymentType(set.getString("payment"));
				order.setUserAddress(set.getString("address"));
				order.setUserName(set.getString("user_name"));
				order.setUserPhone(set.getString("phone"));
				order.setUserEmail(set.getString("user_email"));
				order.setCurrent_date(set.getString("current_date"));
				order.setCurrent_time(set.getString("current_time"));
				
				list.add(order);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Book_order> getBook() {
		List<Book_order> list=new ArrayList<Book_order>();
		
		try {
			String sql="select * from book_orders";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet set=ps.executeQuery();
			
			Book_order order=null;
			
			while(set.next())
			{
				order=new Book_order();
				
				order.setOrder_id(set.getInt("order_id"));
				order.setUser_id(set.getInt("user_id"));
				order.setBook_author(set.getString("book_author"));
				order.setBook_name(set.getString("book_name"));
				order.setBook_price(set.getString("book_price"));
				order.setPaymentType(set.getString("payment"));
				order.setUserAddress(set.getString("address"));
				order.setUserName(set.getString("user_name"));
				order.setUserPhone(set.getString("phone"));
				order.setUserEmail(set.getString("user_email"));
				order.setCurrent_date(set.getString("current_date"));
				order.setCurrent_time(set.getString("current_time"));
				
				list.add(order);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void removeOrderedBookFromCarts(int id) {
		try {
			String sql="delete from cart where user_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	
	
}
