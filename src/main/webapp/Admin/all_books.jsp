<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="com.entity.Books"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>All Books</title>
    <%@include file="allCss.jsp"%>
    <!-- Include jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Include DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
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
            <div class="col-md-12 table-responsive pt-3">
                <!-- Add an ID to the table for JavaScript to select -->
                <table id="booksTable" class="table">
                    <thead class="bg-dark text-light">
                        <tr>
                            <th>Action</th>
                            <th>Sr.no</th>
                            <th>Book Photo</th>
                            <th>Book Name</th>
                            <th>Book Author</th>
                            <th>Book Price</th>
                            <th>Book Category</th>
                            <th>Book Status</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConnect());
                            List<Books> list = dao.getBooks();
                            int i = 1;
                            for (Books b : list) {
                        %>
                        <tr>
                            <td style="white-space: nowrap" class="pt-3" width="5%"><a href="edit_book.jsp?id=<%=b.getBook_id()%>">
                                    <button class="fa fa-edit btn btn-primary"></button>
                            </a> <a href="../delete_book?id=<%=b.getBook_id()%>">
                                    <button class="fa xammfa-trash btn btn-danger"></button>
                            </a></td>
                            <td><%=i%></td>
                            <td><img src="../books/<%=b.getBook_photo()%>" height="100px" width="100px" /></td>
                            <td><%=b.getBook_name()%></td>
                            <td><%=b.getBook_author()%></td>
                            <td><%=b.getBook_price()%></td>
                            <td><%=b.getBook_category()%></td>
                            <td><%=b.getBook_status()%></td>
                            <td><%=b.getEmail()%></td>
                        </tr>
                        <% i++; } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%@include file="Footer.jsp"%>

    <!-- Initialize DataTable -->
    <script>
        $(document).ready(function() {
            $('#booksTable').DataTable();
        });
    </script>
</body>
</html>
