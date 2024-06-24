package com.user.servlet;

import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.user;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String address=req.getParameter("address");
			String password=req.getParameter("password");
			
			UserDAOImpl u=new UserDAOImpl(DBConnect.getConnect());
			
			if(u.checkPassword(id, password))
			{
				user u1=new user();
				u1.setId(id);
				u1.setName(name);
				u1.setAddress(address);
				u1.setEmail(email);
				u1.setPhone(phone);
				u1.setPassword(password);
				if(u.userUpdate(u1)) {
					HttpSession session=req.getSession();
					session.setAttribute("successMsg","Successfully Update");
					resp.sendRedirect("Edit_profile.jsp");
				}
				else {
					HttpSession session=req.getSession();
					session.setAttribute("failedMsg","Something went Wrong on server");
					resp.sendRedirect("Edit_profile.jsp");
				}
			}
			else {
				HttpSession session=req.getSession();
				session.setAttribute("failedMsg","Enter Correct Password");
				resp.sendRedirect("Edit_profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
