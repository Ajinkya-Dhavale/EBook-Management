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
<title>Sell Book</title>
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
				<h2 class="text-center text-primary mt-4">Sell Book</h2>

				<c:if test="${not empty successMsg}">
					<p class="text-center text-success">${successMsg}</p>
					<c:remove var="successMsg" scope="session" />
				</c:if>
				<c:if test="${not empty failedMsg}">
					<p class="text-center text-success">${failedMsg}</p>
					<c:remove var="failedMsg" scope="session" />
				</c:if>
				<form action="sell_old_book" method="post"
					enctype="multipart/form-data">
					<div class="form-group mt-4">
						<label>Book Name : </label> <input type="text"
							class="form-control" placeholder="Name" name="book_name">
							<input type="hidden" value="${userObj.email }" name="user_email"/>
					</div>
					<div class="form-group mt-3">
						<label>Book Author : </label> <input type="text"
							class="form-control" placeholder="Author" name="book_author">
					</div>
					<div class="form-group mt-3">
						<label>Book Price : </label> <input type="text"
							class="form-control" placeholder="price" name="book_price">
					</div>
					<div class="form-group mt-3">
						<label>Upload Photo : </label> <input type="file"
							class="form-control" name="book_photo">
					</div>
					<div class="w-100 text-center mt-2">
						<button type="submit" class="btn btn-primary mt-2">Sell</button>
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