package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_order;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order_servlet")
public class OrderSevlet extends HttpServlet{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		int user_id=Integer.parseInt(req.getParameter("user_id"));
		String user_name=req.getParameter("user_name");
		String user_email=req.getParameter("user_email");
		String user_phone=req.getParameter("user_phone");
		String user_addrss=req.getParameter("user_address");
		String user_landmark=req.getParameter("user_landmark");
		String user_city=req.getParameter("user_city");
		String user_state=req.getParameter("user_state");
		String user_pincode=req.getParameter("user_pincode");
		String payment_type=req.getParameter("payment_type");
		
		
		LocalTime currentTime = LocalTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		String current_time = currentTime.format(formatter);

        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String current_date = currentDate.format(formatter1);

        
        
		
		user_addrss=user_addrss+","+user_landmark+","+user_city+","+user_state+","+user_pincode;
	
		//System.out.println(user_id+" " +user_name+" "+user_email+" "+user_phone+" "+user_addrss+" "+payment_type);
		List<Cart> b=new CartDAOImpl(DBConnect.getConnect()).getCartByUser(user_id);
		BookOrderDAOImpl dao=new BookOrderDAOImpl(DBConnect.getConnect());
		
		ArrayList<Book_order> list=new ArrayList<Book_order>();
		
//		System.out.println(b);
		
		Book_order o=null;
		for(Cart c:b)
		{
			o=new Book_order();
			o.setUser_id(user_id);
			o.setUserName(user_name);
			o.setUserEmail(user_email);
			o.setUserAddress(user_addrss);
			o.setUserPhone(user_phone);
			o.setBook_name(c.getBook_name());
			o.setBook_author(c.getBook_author());
			o.setBook_price(c.getBook_price()+"");
			o.setPaymentType(payment_type);
			o.setCurrent_time(current_time);
			o.setCurrent_date(current_date);
						
			list.add(o);
		}
		
		if("no_select".equals(payment_type))
		{

			session.setAttribute("failedMsg","Choice Payment Mode");
			resp.sendRedirect("cart.jsp");
		}
		else {
			boolean b1=dao.saveOrder(list);
			if(b1)
			{
				session.setAttribute("successMsg","Order Successfully");
				dao.removeOrderedBookFromCarts(user_id);
				resp.sendRedirect("order.jsp");
				//System.out.println("success");
			}else {
				session.setAttribute("failedMsg","Order Failed");
				resp.sendRedirect("order.jsp");
			}
			
		}
		
	}

}
