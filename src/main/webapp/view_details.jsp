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
<title>View Details</title>
<%@include file="all/allCss.jsp"%>
</head>
<body class="bg-light">

	<%@include file="all/Navbar.jsp"%>

	<%
	user u = (user) session.getAttribute("userObj");
	%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnect());
	Books b = dao.getBookById(id);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5 text-center border bg-white">
				<img src="books/<%=b.getBook_photo()%>" height="150px" width="150px" />
				<br>
				<h4 class="mt-3">
					Book Name : <span class="text-success"> <%=b.getBook_name()%>
					</span>
				</h4>
				<h4>
					Author Name : <span class="text-success"> <%=b.getBook_author()%></span>
				</h4>
				<h4>
					Book Category : <span class="text-success"> <%=b.getBook_category()%></span>
				</h4>

			</div>
			<div class="col-md-6 p-5 text-center border bg-white">
				<h2><%=b.getBook_name()%></h2>
				<%
				if ("Old".equals(b.getBook_category())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fa fa-envelope"></i> Email : <%=b.getEmail() %>
				</h5>

				<%
				}
				%>
				<div class="row mt-3">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Fast Delivery</p>
					</div>
				</div>
				<%
				if ("Old".equals(b.getBook_category())) {
				%>
				<a href="index.jsp" class="btn btn-success mt-4">Continue
					Shopping</a>
				<%
				} else {

				if (u == null) {
				%>
				<a class="btn btn-primary btn-sm mt-4 p-2" onclick="alert('Login First')">
					<i class="fa-solid fa-cart-shopping "></i> Add Card
				</a>
				<%
				} else {
				%>
				<a
					href="cart_servlet?book_id=<%=b.getBook_id()%>&&user_id=<%=u.getId()%>"
					class="btn btn-primary btn-sm mt-4 p-2"><i
					class="fa-solid fa-cart-shopping"></i> Add Card</a>
				<%
				}
				%>
				<%
				}
				%>

				<a class="btn btn-danger mt-4">&#8377; <%=b.getBook_price()%></a>
			</div>
		</div>
	</div>

	<%@include file="all/Footer.jsp"%>
	<script>
		AOS.init();
	</script>
</body>
</html>