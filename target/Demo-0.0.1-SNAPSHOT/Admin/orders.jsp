<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.entity.Book_order"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="Navbar.jsp"%>
	
<c:if test="${empty userObj }">
	<c:redirect url="../index.jsp"/>
</c:if>
	<h3 class="text-center p-2">Hello, Admin</h3>
	<div class="container-fluid bg-light">
		<div class="row">
			<div class="col-md-12">
				<table class="table ">
					<tr class="bg-dark text-light">
						<th>Order Id</th>
						<th>User Id</th>
						<th>Name</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Address</th>
						<th>Book Name</th>
						<th>Book Author</th>
						<th>Book Price</th>
						<th>Payment Type</th>						
					</tr>
					
					<% 
						user u=(user)session.getAttribute("userObj");
						List<Book_order> list=new BookOrderDAOImpl(DBConnect.getConnect()).getBook();
						
						for(Book_order b:list)
						{%>
						<tr>
						<td>BOOK-ORD-00<%= b.getOrder_id() %></td>
						<td><%= b.getUser_id() %></td>
						<td><%= b.getUserName() %></td>
						<td><%= b.getUserEmail() %></td>
						<td><%= b.getUserPhone() %></td>
						<td><%= b.getUserAddress() %></td>
						<td><%= b.getBook_name() %></td>
						<td><%= b.getBook_author() %></td>
						<td><%= b.getBook_price() %></td>
						<td><%= b.getPaymentType() %></td>
					</tr>
							
						<%}
					%>
					
				</table>
			</div>
		</div>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>