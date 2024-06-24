package com.admin.servlet;

import java.io.File;



import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.DAO.BooksDAOImpl;
import com.DB.DBConnect;
import com.entity.Books;

@WebServlet("/add_book")
@MultipartConfig
public class Add_Book extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String book_name = req.getParameter("book_name");
			String book_author = req.getParameter("book_author");
			String book_price = req.getParameter("book_price");
			String book_category = req.getParameter("book_category");
			String book_status = req.getParameter("book_status");
			Part part = req.getPart("book_photo");
			String fileName = part.getSubmittedFileName();
			
			long currentTimeMillis = System.currentTimeMillis();

	        long currentTimeInSeconds = currentTimeMillis / 1000;

			fileName=currentTimeInSeconds+fileName;
			Books b = new Books(book_name, book_author, book_price, book_category, book_status, fileName, "admin");
//			System.out.println(b);
			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnect());
			boolean f = dao.add_book(b);
			HttpSession session = req.getSession();
			if (f) {
				String path = getServletContext().getRealPath("") + "books";
				File file = new File(path);
				part.write("C:\\Users\\Ajinkya\\eclipse-workspace\\Demo\\src\\main\\webapp\\books" + File.separator
						+ fileName);
				session.setAttribute("successMsg", "Book Add Successfully");
				resp.sendRedirect("Admin/add_book.jsp");
			} else {
				session.setAttribute("failedMsg", "Book Add UnSuccessfully");
				resp.sendRedirect("Admin/add_book.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
