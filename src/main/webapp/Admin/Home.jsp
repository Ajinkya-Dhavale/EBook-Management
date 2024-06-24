<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Home</title>
<%@include file="allCss.jsp"%>
<style>
a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
<c:if test="${empty userObj }">
	<c:redirect url="../index.jsp"/>
</c:if>
	<%@include file="Navbar.jsp"%>
	<div class="container mb-5">
		<div class="row mb-5">
			<div class="col-md-12 text-danger text-center mt-4">
				<h1 class="mt-1">Hello, Admin</h1>
			</div>
			<div class="col-md-3 text-center p-3 mt-4">
				<a href="add_book.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fas fa-plus-square fa-3x text-primary"></i>
							<h3 class="text-primary mt-2">Add Book</h3>
							----------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 text-center p-3 mt-4">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fas fa-book-open fa-3x text-danger"></i>
							<h3 class="text-danger mt-2">All Books</h3>
							----------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 text-center p-3 mt-4">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fas fa-box-open fa-3x text-warning"></i>
							<h3 class="text-warning mt-2">Orders</h3>
							----------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3 text-center p-3 mb-2 mt-4">
				<a data-toggle="modal" data-target="#staticBackdrop">
					<div class="card">
						<div class="card-body">
							<i class="fas fa-sign-out-alt fa-3x text-primary"></i>
							<h3 class="text-primary mt-2">Logout</h3>
							----------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>