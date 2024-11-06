<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.entity.Book_order"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>All Orders</title>
    <%@include file="allCss.jsp"%>
    <!-- Include jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Include DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
</head>
<body>
    <%@include file="Navbar.jsp"%>
    <h3 class="text-center p-2">Hello, Admin</h3>
    <div class="container-fluid bg-light">
        <div class="row">
            <div class="col-md-12 table-responsive">
                <!-- Add an ID to the table for JavaScript to select -->
                <table id="ordersTable" class="table ">
                    <thead class="bg-dark text-light">
                        <tr>
                            <th style="white-space:nowrap;">Order Id</th>
                            <th style="white-space:nowrap;">User Id</th>
                            <th style="white-space:nowrap;">Name</th>
                            <th style="white-space:nowrap;">Email</th>
                            <th style="white-space:nowrap;">Phone</th>
                            <th style="white-space:nowrap;">Address</th>
                            <th style="white-space:nowrap;">Book Name</th>
                            <th style="white-space:nowrap;">Book Author</th>
                            <th style="white-space:nowrap;">Book Price</th>
                            <th style="white-space:nowrap;">Date</th>
                            <th style="white-space:nowrap;">Time</th>
                            <th style="white-space:nowrap;">Payment Type</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- JSP content here -->
                        <% 
                            user u = (user) request.getSession().getAttribute("userObj");
                            if (u != null) {
                                List<Book_order> list = new BookOrderDAOImpl(DBConnect.getConnect()).getBook();
                                for(Book_order b : list) {
                        %>
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
                            <td><%= b.getCurrent_date() %></td>
                            <td><%= b.getCurrent_time() %></td>
                            <td><%= b.getPaymentType() %></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%@include file="Footer.jsp"%>

    <!-- Initialize DataTable -->
    <script>
        $(document).ready(function() {
            $('#ordersTable').DataTable();
        });
    </script>
</body>
</html>
