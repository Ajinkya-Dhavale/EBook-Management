package com.user.servlet;

import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Books;
import com.entity.Cart;

@WebServlet("/cart_servlet")
public class CartServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int book_id=Integer.parseInt(req.getParameter("book_id"));
			int user_id=Integer.parseInt(req.getParameter("user_id"));
			
			BooksDAOImpl dao=new BooksDAOImpl(DBConnect.getConnect());
			Books b=dao.getBookById(book_id);
			
			Cart c=new Cart();
			c.setBook_id(book_id);
			c.setUser_id(user_id);
			c.setBook_name(b.getBook_name());
			c.setBook_author(b.getBook_author());
			c.setBook_price(Double.parseDouble(b.getBook_price()));
			c.setTotal_price(Double.parseDouble(b.getBook_price()));
			
			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConnect());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			if(f)
			{
				session.setAttribute("addCart","Book Added to Cart");
				resp.sendRedirect("all_new_book.jsp");
			}
			else {
				session.setAttribute("failedCart","Something Wrong on Server");
				resp.sendRedirect("all_new_book.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
