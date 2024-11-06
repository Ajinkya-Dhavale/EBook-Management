package com.user.servlet;

import java.io.IOException;

import com.DAO.AddressDAOImpl;
import com.DB.DBConnect;
import com.entity.Address;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/save_address")
public class SaveAddress extends HttpServlet {

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
		
		
		Address o=new Address();
		
		o.setUser_id(user_id);
		o.setUserName(user_name);
		o.setUserEmail(user_email);
		o.setUserAddress(user_addrss);
		o.setUserPhone(user_phone);
		o.setUserLandmark(user_landmark);
		o.setUserCity(user_city);
		o.setUserState(user_state);
		o.setUserPincode(user_pincode);
		
		boolean f=new AddressDAOImpl(DBConnect.getConnect()).save_address(o);
		if(f)
		{
			resp.sendRedirect("cart.jsp");
		}
		else {
			resp.sendRedirect("Home.jsp");
		}
		
	}
	
}
