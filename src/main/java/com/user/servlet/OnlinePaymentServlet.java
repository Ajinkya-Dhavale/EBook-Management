package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.DAO.AddressDAOImpl;
import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Address;
import com.entity.Book_order;
import com.entity.Cart;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order_online")
public class OnlinePaymentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String transactionId = request.getParameter("razorpay_payment_id");

		HttpSession session = request.getSession();
		int user_id = Integer.parseInt(request.getParameter("user_id"));

		List<Cart> b = new CartDAOImpl(DBConnect.getConnect()).getCartByUser(user_id);
		BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConnect());

		ArrayList<Book_order> list = new ArrayList<Book_order>();

//		System.out.println(b);
		LocalTime currentTime = LocalTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		String current_time = currentTime.format(formatter);

		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String current_date = currentDate.format(formatter1);

		Address a = new AddressDAOImpl(DBConnect.getConnect()).get_address(user_id);

		String user_addrss = a.getUserAddress() + "," + a.getUserLandmark() + "," + a.getUserCity() + ","
				+ a.getUserState() + "," + a.getUserPincode();

		Book_order o = null;
		for (Cart c : b) {
			o = new Book_order();
			o.setUser_id(user_id);
			o.setUserName(a.getUserName());
			o.setUserEmail(a.getUserEmail());
			o.setUserAddress(user_addrss);
			o.setUserPhone(a.getUserPhone());
			o.setBook_name(c.getBook_name());
			o.setBook_author(c.getBook_author());
			o.setBook_price(c.getBook_price() + "");
			o.setPaymentType(transactionId);
			o.setCurrent_time(current_time);
			o.setCurrent_date(current_date);

			list.add(o);
		}
		boolean b1 = dao.saveOrder(list);
		if (b1) {
			session.setAttribute("successMsg", "Order Successfully");
			dao.removeOrderedBookFromCarts(user_id);
			response.sendRedirect("order.jsp");
		} else {
			session.setAttribute("failedMsg", "Order Failed");
			response.sendRedirect("order.jsp");
		}
	}
}
