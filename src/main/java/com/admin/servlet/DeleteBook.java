package com.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_book")
public class DeleteBook extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id=Integer.parseInt(req.getParameter("id"));
			
			BooksDAOImpl dao=new BooksDAOImpl(DBConnect.getConnect());
			boolean f=dao.deleteBook(id);
			HttpSession session=req.getSession();
			if(f)
			{
				session.setAttribute("successMsg", "Book Delete Successfully");
				resp.sendRedirect("Admin/all_books.jsp");
			} else {
				session.setAttribute("failedMsg", "Book Delete UnSuccessfully");
				resp.sendRedirect("Admin/all_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
