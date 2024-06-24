package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
		boolean f = false;
		try {
			String sql = "Insert into cart(book_id,user_id,book_name,book_author,book_price,total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,c.getBook_id());
			ps.setInt(2,c.getUser_id());
			ps.setString(3, c.getBook_name());
			ps.setString(4, c.getBook_author());
			ps.setDouble(5, c.getBook_price());
			ps.setDouble(6, c.getTotal_price());
			
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
	public List<Cart> getCartByUser(int user_id) {
		List<Cart> list=new ArrayList<Cart>();
		try {
			String sql="select * from cart where user_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			
			Double totalPrice = 0.0;
			
			Cart c=null;
			
			ResultSet set=ps.executeQuery();
			while(set.next())
			{
				c=new Cart();
				c.setCart_id(set.getInt(1));
				c.setBook_id(set.getInt(2));
				c.setUser_id(set.getInt(3));
				c.setBook_name(set.getString(4));
				c.setBook_author(set.getString(5));
				c.setBook_price(set.getDouble(6));
				totalPrice=totalPrice+set.getDouble(7);
				c.setTotal_price(totalPrice);
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean deleteBookCard(int cart_id) {
		boolean f=false;
		try {
			String sql="delete from cart where cart_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, cart_id);
			
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

}
