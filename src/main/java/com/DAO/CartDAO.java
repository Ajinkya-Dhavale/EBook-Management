package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {
	public boolean addCart(Cart c);
	public List<Cart> getCartByUser(int user_id);
	public boolean deleteBookCard(int cart_id);
	
	
}
