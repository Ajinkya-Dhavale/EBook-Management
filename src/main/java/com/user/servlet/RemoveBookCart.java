package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int cart_id=Integer.parseInt(req.getParameter("cart_id"));
		try {
			CartDAOImpl dao=new CartDAOImpl(DBConnect.getConnect());
			dao.deleteBookCard(cart_id);
			resp.sendRedirect("cart.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
