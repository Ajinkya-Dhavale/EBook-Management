package com.user.servlet;

import java.io.IOException;



import java.sql.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.user;


@WebServlet("/login-page")
public class Login extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Connection conn=DBConnect.getConnect();
			UserDAO dao=new UserDAOImpl(conn);
			HttpSession session=req.getSession();
			String email=req.getParameter("email");
			String password=req.getParameter("password");			
			
			if(email.equals("admin@gmail.com") && password.equals("admin"))
			{
				user us=new user();
				us.setName("Admin");
				session.setAttribute("userObj",us);
				resp.sendRedirect("Admin/Home.jsp");
			}
			else {
				user us=dao.login(email, password);
				if(us!=null)
				{	
					session.setAttribute("userObj",us);
					resp.sendRedirect("index.jsp");
				}
				else {
					session.setAttribute("failedMsg","Invalid Email & Password");
					resp.sendRedirect("index.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
//		System.out.println(email+" "+password);
	}
	
}
