package com.user.servlet;

import java.io.IOException;




import java.sql.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.user;


@WebServlet("/register-page")
public class ResisterUser extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try {
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String address=req.getParameter("address");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
//			System.out.println(name+" "+email+" "+password+" "+phone+" "+address+" "+check);
			
			user us=new user();
			us.setName(name);
			us.setEmail(email);
			us.setPhone(phone);
			us.setAddress(address);	
			us.setPassword(password);
			
//			System.out.println(us);
			HttpSession session=req.getSession();
			if(check!=null)
			{
				Connection conn=DBConnect.getConnect();
				UserDAOImpl dao=new UserDAOImpl(conn);
				if(dao.checkingRegistrationEmail(email))
				{
					boolean b=dao.userResister(us);
					if(b)
					{
						session.setAttribute("successMsg","Registratation successfully");	
						resp.sendRedirect("index.jsp");
					}
					else {
						session.setAttribute("failedMsg","Something went wrong  ");
						resp.sendRedirect("index.jsp");
					}
				}else {
					session.setAttribute("failedMsg","Email Already Exist");
					resp.sendRedirect("index.jsp");
				}
			}
			else {
				session.setAttribute("failedMsg","Please check agree terms and condition");
				resp.sendRedirect("index.jsp");
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}		
	}
	
}
