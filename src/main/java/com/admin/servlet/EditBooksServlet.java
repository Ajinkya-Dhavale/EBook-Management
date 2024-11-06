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
import com.entity.Books;

@WebServlet("/edit_book")
public class EditBooksServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("book_id"));
			String book_name = req.getParameter("book_name");
			String book_author = req.getParameter("book_author");
			String book_price = req.getParameter("book_price");
			String book_status = req.getParameter("book_status");
			
			BooksDAOImpl dao=new BooksDAOImpl(DBConnect.getConnect());
			Books b=new Books();
			b.setBook_name(book_name);
			b.setBook_author(book_author);
			b.setBook_price(book_price);
			b.setBook_status(book_status);
			b.setBook_id(id);

			boolean f=dao.updateBook(b);
			HttpSession session=req.getSession();
			if(f)
			{
				session.setAttribute("successMsg", "Book Update Successfully");
				resp.sendRedirect("Admin/all_books.jsp");
			} else {
				session.setAttribute("failedMsg", "Book Update UnSuccessfully");
				resp.sendRedirect("Admin/all_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
