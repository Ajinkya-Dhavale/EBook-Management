package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/save_contact")
public class ContactServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Contact c=new Contact();
		
		c.setUser_name(req.getParameter("user_name"));
		c.setUser_email(req.getParameter("user_email"));
		c.setUser_phone(req.getParameter("user_phone"));
		c.setUser_message(req.getParameter("user_message"));
		
		boolean f=new UserDAOImpl(DBConnect.getConnect()).ContactUs(c);
		if(f)
		{
			resp.sendRedirect("Contact.jsp");
		}
		else {

			resp.sendRedirect("Contact.jsp");
		
		}
	}
	
}
