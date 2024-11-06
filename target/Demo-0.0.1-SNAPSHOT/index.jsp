<%@page import="com.entity.user"%>
<%@page import="com.entity.Books"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.*"%>
<%@page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Books Management System</title>
<%@include file="all/allCss.jsp"%>
</head>
<body class="bg-light">
	<%
	user u = (user) session.getAttribute("userObj");
	%>
	<%@include file="all/Navbar.jsp"%>
		
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 back_img">
				<h2 class="text-center mt-4">
					<i class="fa-solid fa-book-open"></i> EBook Management System
				</h2>
			</div>
		</div>
	</div>
	<section>
		<div class="container ">
			<div class="row">
				<div class="col-md-12 mt-3">
					<h3 class="text-center alert alert-secondary alert-sm ">Recent
						Books</h3>
				</div>
				<%
				BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnect());
				List<Books> list2 = dao.getRecentBooks();
				int i = 1;
				for (Books b : list2) {
				%>
				<div class="col-md-3 mt-3"
					data-aos="<%=(i == 1) ? "fade-right" : (i == 2 || i == 3) ? "fade-up" : "fade-left"%>">
					<div class="card ovf-hidden">
						<div class="view overlay">
							<img class="card-img-top" src="books/<%=b.getBook_photo()%>"
								alt="Card image cap" height="300px" width="100%">
						</div>
						<div class="card-body text-center lh-1">
							<p class=" mt-0 m-0"><%=b.getBook_name()%></p>
							<p class=" mt-0 m-0">
								-
								<%=b.getBook_author()%></p>
							<p class=" mt-0 mb-3 m-0">
								Category :
								<%=b.getBook_category()%></p>
							<div class="row">
								<%
								if (!b.getBook_category().equals("Old")) {
								%>

								<%
								if (u == null) {
								%>
								<a class="btn btn-danger btn-sm" onclick="alert('Login First')">
									<i class="fa-solid fa-cart-shopping"></i> Add Card
								</a>
								<%
								} else {
								%>
								<a
									href="cart_servlet?book_id=<%=b.getBook_id()%>&&user_id=<%=u.getId()%>"
									class="btn btn-danger btn-sm"><i
									class="fa-solid fa-cart-shopping"></i> Add Card</a>
								<%
								}
								%>
								<a href="view_details.jsp?id=<%=b.getBook_id()%>"
									class="btn btn-success btn-sm ml-1">View Detail</a> <a href=""
									class="btn btn-danger btn-sm ml-1">&#8377;<%=b.getBook_price()%></a>

								<%
								} else {
								%>

								<a href="view_details.jsp?id=<%=b.getBook_id()%>"
									class="btn btn-success btn-sm ml-5">View Detail</a> <a href=""
									class="btn btn-danger btn-sm ml-1">&#8377;<%=b.getBook_price()%></a>

								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
				<%
				i++;
				}
				%>
				<div class="col-md-12 text-center mt-3">
					<a href="all_recent_book.jsp" class="btn btn-success btn-sm">View
						All</a>
				</div>
			</div>
		</div>

		<hr />
		<div class="container ">
			<div class="row">
				<div class="col-md-12 mt-3">
					<h3 class="text-center alert alert-secondary alert-sm ">New
						Books</h3>
				</div>
				<%
				List<Books> list = dao.getNewBooks();
				i = 1;
				for (Books b : list) {
				%>
				<div class="col-md-3 mt-3"
					data-aos="<%=(i == 1) ? "fade-right" : (i == 2 || i == 3) ? "fade-up" : "fade-left"%>">
					<div class="card ovf-hidden">
						<div class="view overlay">
							<img class="card-img-top" src="books/<%=b.getBook_photo()%>"
								alt="Card image cap" height="300px" width="100%">
						</div>
						<div class="card-body text-center lh-1">
							<p class=" mt-0 m-0"><%=b.getBook_name()%></p>
							<p class=" mt-0 m-0">
								-
								<%=b.getBook_author()%></p>
							<p class=" mt-0 mb-3 m-0">
								Category :
								<%=b.getBook_category()%></p>
							<div class="row">
								<%
								if (u == null) {
								%>
								<a class="btn btn-danger btn-sm" onclick="alert('Login First')">
									<i class="fa-solid fa-cart-shopping"></i> Add Card
								</a>
								<%
								} else {
								%>
								<a
									href="cart_servlet?book_id=<%=b.getBook_id()%>&&user_id=<%=u.getId()%>"
									class="btn btn-danger btn-sm"><i
									class="fa-solid fa-cart-shopping"></i> Add Card</a>
								<%
								}
								%>
								 <a
									href="view_details.jsp?id=<%=b.getBook_id()%>"
									class="btn btn-success btn-sm ml-1">View Detail</a> <a href=""
									class="btn btn-danger btn-sm ml-1">&#8377;<%=b.getBook_price()%></a>
							</div>
						</div>
					</div>
				</div>
				<%
				i++;
				}
				%>
				<div class="col-md-12 text-center mt-3">
					<a href="all_new_book.jsp" class="btn btn-success btn-sm">View
						All</a>
				</div>
			</div>
		</div>


		<hr />


		<div class="container ">
			<div class="row">
				<div class="col-md-12 mt-3">
					<h3 class="text-center alert alert-secondary alert-sm ">Old
						Books</h3>
				</div>

				<%
				List<Books> list1 = dao.getOldBooks();
				i = 1;
				for (Books b : list1) {
				%>
				<div class="col-md-3 mt-3"
					data-aos="<%=(i == 1) ? "fade-right" : (i == 2 || i == 3) ? "fade-up" : "fade-left"%>">
					<div class="card ovf-hidden">
						<div class="view overlay">
							<img class="card-img-top" src="books/<%=b.getBook_photo()%>"
								alt="Card image cap" height="300px" width="100%">
						</div>
						<div class="card-body text-center lh-1">
							<p class=" mt-0 m-0"><%=b.getBook_name()%></p>
							<p class=" mt-0 m-0">
								-
								<%=b.getBook_author()%></p>
							<p class=" mt-0 mb-3 m-0">
								Category :
								<%=b.getBook_category()%></p>
							<div class="row">
								<a href="view_details.jsp?id=<%=b.getBook_id()%>"
									class="btn btn-success btn-sm ml-5">View Detail</a> <a href=""
									class="btn btn-danger btn-sm ml-1">&#8377;<%=b.getBook_price()%></a>
							</div>
						</div>
					</div>
				</div>
				<%
				i++;
				}
				%>
				<div class="col-md-12 text-center mt-3">
					<a href="all_old_book.jsp" class="btn btn-success btn-sm">View
						All</a>
				</div>
			</div>
		</div>
	</section>

	<%@include file="all/Footer.jsp"%>
	<script>
		AOS.init();
	</script>
</body>
</html>