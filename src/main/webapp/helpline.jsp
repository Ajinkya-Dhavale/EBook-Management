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
	<div class="container">
		<div class="row pb-md-5 pt-md-5 p-0">
			<div class="col-md-4 offset-md-4">
				<div class="card"> 
					<div class="card-body text-center">
					<i class="fa fa-phone fa-3x text-success mb-3 "></i>
					<h3>24*7 Service</h3>
					<h3>Helpline Number</h3>
					<p>+919604912407</p>
					<a href="index.jsp" class="btn btn-outline-dark">Home</a>
						
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="all/Footer.jsp"%>
	<script>
		AOS.init();
	</script>
</body>
</html>