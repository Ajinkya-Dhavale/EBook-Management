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
<title>Setting Page</title>
<%@include file="all/allCss.jsp"%>
<style>
a:hover{
	text-decoration:none;
}
</style>
</head>
<body class="bg-light">
	<%@include file="all/Navbar.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="index.jsp" />
	</c:if>
		<%
	user u2 = (user) session.getAttribute("userObj");
	%>
	<div class="container">
		<div class="row p-4">
		<div class="col-md-12 mb-4">		
			<h2 class="text-center text-danger">Hello, <%=u2.getName() %></h2>
		</div>
			<div class="col-md-4 p-4" data-aos="fade-right">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa fa-book-open fa-3x text-primary mb-3"></i>
							<h4>Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 p-4" data-aos="fade-up">
				<a href="old_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa fa-book-open fa-3x text-danger mb-3"></i>
							<h4>Old Books</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 p-4" data-aos="fade-left">
				<a href="Edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-user-plus fa-3x text-primary mb-3"></i>
							<h5 style="padding-bottom:8px">Login & Security (Edit Profile)</h5>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 p-4" data-aos="fade-left">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa fa-box-open fa-3x text-danger mb-3"></i>
							<h4>My Order</h4>
							<p>Trace Your Orders</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 p-4" data-aos="fade-up">
				<a href="save_address.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-home fa-3x text-primary mb-3"></i>
							<h4>Save Address</h4>
							<p>Your Address</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 p-4" data-aos="fade-left">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-user-plus fa-3x text-danger mb-3"></i>
							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
			
		</div>
	</div>
	<%@include file="all/Footer.jsp"%>
	<script>
		AOS.init();
	</script>
</body>
</html>