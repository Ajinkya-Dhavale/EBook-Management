<%@page import="com.entity.Books"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Book</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="Navbar.jsp"%>
	
<c:if test="${empty userObj }">
	<c:redirect url="../index.jsp"/>
</c:if>
	<div class="container-fluid bg-light">
		<div class="row">
			<div class="col-md-4 bg-white border mt-3 pb-3 offset-md-4 col-0 ">
				<h2 class="text-center text-primary mt-4">Edit Book</h2>

				<c:if test="${not empty successMsg}">
					<p class="text-center text-success">${successMsg}</p>
					<c:remove var="successMsg" scope="session" />
				</c:if>
				<c:if test="${not empty failedMsg}">
					<p class="text-center text-success">${failedMsg}</p>
					<c:remove var="failedMsg" scope="session" />
				</c:if>

				<%
				int id=Integer.parseInt(request.getParameter("id"));
				BooksDAOImpl dao=new BooksDAOImpl(DBConnect.getConnect());
				Books b=dao.getBookById(id);
				
				%>


				<form action="../edit_book" method="post">
					<div class="form-group mt-4">
						<label>Book Name : </label> <input type="text"
							class="form-control" placeholder="Name" name="book_name"
							value="<%=b.getBook_name()%>">
							
							<input type="hidden" class="form-control" placeholder="hidden" name="book_id"
							value="<%=b.getBook_id()%>"> 
					</div>
					<div class="form-group mt-3">
						<label>Book Author : </label> <input type="text"
							class="form-control" placeholder="Author" name="book_author" value="<%=b.getBook_author() %>">
					</div>
					<div class="form-group mt-3">
						<label>Book Price : </label> <input type="text"
							class="form-control" placeholder="price" name="book_price" value="<%=b.getBook_price() %>">
					</div>
					<div class="form-group mt-3">
						<label>Book Status : </label> <select class="form-control"
							name="book_status">
							<option value="Active" <%= ("Active".equals(b.getBook_status())) ? "selected":"" %> >Active</option>
							<option value="Inactive" <%= ("Inactive".equals(b.getBook_status())) ? "selected":"" %> >Inactive</option>
						</select>
					</div>
					<div class="w-100 text-center mt-2">
						<button type="submit" class="btn btn-primary mt-2">Update</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>