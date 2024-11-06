<%@page import="com.entity.Book_order"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
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
			<div class="col-md-12">
				<div class="card">
					<h3 class="mt-4 text-center text-success">Your Order</h3>
					<div class="card-body">
						<table class="table">

							<tr class="thead-dark">
								<th>Order Id</th>
								<th>Name</th>
								<th>Book Name</th>
								<th>Book Author</th>
								<th>Book Price</th>
								<th>Payment Type</th>
							</tr>

							<%
							user u = (user) session.getAttribute("userObj");

							BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConnect());

							List<Book_order> list = dao.getBook(u.getId());

							for (Book_order b : list) {
							%>
							<tr>
								<td>BOOK-ODR-00<%= b.getOrder_id() %></td>
								<td><%= b.getUserName() %></td>
								<td><%= b.getBook_name() %></td>
								<td><%= b.getBook_author() %></td>
								<td><%= b.getBook_price() %></td>
								<td><%= b.getPaymentType() %></td>
							</tr>
							<%
							}
							%>
						</table>
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