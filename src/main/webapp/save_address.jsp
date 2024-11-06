<%@page
	import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>
<%@page import="com.entity.user"%>
<%@page import="com.DAO.UserDAO"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.CartDAOImpl"%>
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
<title>Save Address</title>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<%@include file="all/allCss.jsp"%>
</head>
<body class="bg-light">

	<%@include file="all/Navbar.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="index.jsp" />
	</c:if>
	<div class="container">
		<div class="row pb-md-5 pt-md-5 p-0">
		<div class="col-md-3 col-0"></div>
			<div class="col-md-6 ">
				<div class="card">
					<h3 class="mt-4 text-center text-success">Save Your Address</h3>
					<c:if test="${not empty successMsg}">
						<p class="text-center text-success">${successMsg}</p>
						<c:remove var="successMsg" scope="session" />
					</c:if>
					<c:if test="${not empty failedMsg}">
						<p class="text-center text-success">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session" />
					</c:if>
					<div class="card-body">
					<%
							user u = (user) session.getAttribute("userObj");
					%>
						<form action="save_address" method="post">

							<input type="hidden" name="user_id" value="<%=u.getId()%>"
								readonly required>


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" name="user_name" value="<%=u.getName()%>"
										readonly required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Email</label> <input type="email"
										class="form-control" name="user_email"
										value="<%=u.getEmail()%>" readonly required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile No</label> <input type="number"
										class="form-control" name="user_phone"
										value="<%=u.getPhone()%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input type="text"
										class="form-control" name="user_address" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" name="user_landmark" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" name="user_city" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" name="user_state" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Pincode</label> <input type="number"
										class="form-control" name="user_pincode" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group mt-3 col-md-12 text-center">
									<a><button class="btn btn-warning">Save Address</button></a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>