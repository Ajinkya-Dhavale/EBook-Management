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
<title>Edit Project</title>
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
				<h2 class="text-center text-primary mt-4">Edit Profile</h2>

				<c:if test="${not empty successMsg}">
					<p class="text-center text-success">${successMsg}</p>
					<c:remove var="successMsg" scope="session" />
				</c:if>
				<c:if test="${not empty failedMsg}">
					<p class="text-center text-success">${failedMsg}</p>
					<c:remove var="failedMsg" scope="session" />
				</c:if>
				<form method="post" action="update_profile">
				<input type="hidden" name="id" value="${userObj.id}"/>
						<div class="form-group mt-0">
							<label>Name </label> <input type="text" class="form-control"
								placeholder="Name" name="name" required value="${userObj.name}">
						</div>
						<div class="form-group mt-0">
							<label>E-mail </label> <input type="email" class="form-control"
								placeholder="E-mail" name="email" required value="${userObj.email}">
						</div>
						<div class="form-group mt-0">
							<label>Phone No </label> <input type="text" class="form-control"
								placeholder="Phone No" name="phone" required value="${userObj.phone}">
						</div>
						<div class="form-group mt-0">
							<label>Address </label> <input type="text" class="form-control"
								placeholder="Address" name="address" required value="${userObj.address}">
						</div>
						<div class="form-group mt-0">
							<label>Password</label> <input type="password"
								class="form-control" placeholder="Enter Old Password" name="password"
								required>
						</div>
						<div class="w-100 text-center m-0">
							<button type="submit" class="btn m-0 btn-primary">Update Profile</button>
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