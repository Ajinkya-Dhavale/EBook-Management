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
a:hover {
	text-decoration: none;
}
</style>
</head>
<body class="bg-light">
	<%@include file="all/Navbar.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="index.jsp" />
	</c:if>
	<div class="container-fluid bg-light">
		<div class="row">
			<div class="col-md-4 bg-white border mt-3 pb-3 offset-md-4 col-0 ">
				<h2 class="text-center text-primary mt-4">Add Address</h2>

				<c:if test="${not empty successMsg}">
					<p class="text-center text-success">${successMsg}</p>
					<c:remove var="successMsg" scope="session" />
				</c:if>
				<c:if test="${not empty failedMsg}">
					<p class="text-center text-success">${failedMsg}</p>
					<c:remove var="failedMsg" scope="session" />
				</c:if>
				<form action="" method="post"
					enctype="multipart/form-data" class="row">
					<div class="form-group col-md-6">
						<label for="inputEmail4">Address</label> <input type="text"
							class="form-control" name="address">
					</div>
					<div class="form-group col-md-6">
						<label for="inputEmail4">landmark</label> <input type="email"
							class="form-control" name="landmark">
					</div>
					<div class="form-group col-md-6">
						<label for="inputEmail4">City</label> <input type="email"
							class="form-control" name="city">
					</div>
					<div class="form-group col-md-3">
						<label for="inputEmail4">State</label> <input type="email"
							class="form-control" name="state">
					</div>
					<div class="form-group col-md-3">
						<label for="inputEmail4">Pincode</label> <input type="email"
							class="form-control" name="pincode">
					</div>
					<div class="form-group col-md-12 text-center">
						<button class="btn btn-outline-dark">Add Address</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="all/Footer.jsp"%>
	<script>
		AOS.init();
	</script>
</body>
</html>