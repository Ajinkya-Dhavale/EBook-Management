<%@page
	import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="com.entity.Books"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="Navbar.jsp"%>
	
<c:if test="${empty userObj }">
	<c:redirect url="../index.jsp"/>
</c:if>
	<h3 class="text-center mt-3 mb-4">Hello Admin</h3>
	<c:if test="${not empty successMsg}">
		<h5 class="text-center text-success">${successMsg}</h5>
		<c:remove var="successMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg}">
		<h5 class="text-center text-success">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<div class="container-fluid bg-light">
		<div class="row">
			<div class="col-md-12">
				<table class="table ">
					<tr class="bg-dark text-light">
						<th>Action</th>
						<th>Sr.no</th>
						<th>Book Photo</th>
						<th>Book Name</th>
						<th>Book Author</th>
						<th>Book Price</th>
						<th>Book Category</th>
						<th>Book Status</th>
					</tr>
					<%
					BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnect());
					List<Books> list = dao.getBooks();
					int i = 1;
					for (Books b : list) {
					%>

					<tr>
						<td style="white-space: nowrap" class="pt-3" width="5%"><a
							href="edit_book.jsp?id=<%=b.getBook_id()%>">
								<button class="fa fa-edit btn btn-primary"></button>
						</a> <a href="../delete_book?id=<%=b.getBook_id()%>">
								<button class="fa fa-trash btn btn-danger"></button>
						</a></td>
						<td><%=i%></td>
						<td><img src="../books/<%=b.getBook_photo()%>" height="100px"
							width="100px" /></td>
						<td><%=b.getBook_name()%></td>
						<td><%=b.getBook_author()%></td>
						<td><%=b.getBook_price()%></td>
						<td><%=b.getBook_category()%></td>
						<td><%=b.getBook_status()%></td>
					</tr>

					<%
					i++;
					}
					%>


				</table>
			</div>
		</div>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>