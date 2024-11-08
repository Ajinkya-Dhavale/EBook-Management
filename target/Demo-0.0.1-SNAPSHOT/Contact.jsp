<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<%@include file="all/allCss.jsp"%>
</head>
<body>
	<%@include file="all/Navbar.jsp"%>
	
<c:if test="${empty userObj }">
	<c:redirect url="/"/>
</c:if>
	<style>
    .box_circle {
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }
</style>
<div class="container mb-2">
    <div class="row justify-content-center">
        <div class="col-md-3  mt-5 ml-md-0 ml-5 mr-5 shadow text-center pr-4 pl-4 pt-3 pb-2" style="height:230px">
            <a href="https://goo.gl/maps/v1MjZ1ErRrKWfidBA" target="blank" class="box_circle">
                <i class="fa-solid fa-location-dot h1 mt-2"></i>
            </a>
            <h5>New Art College Boys Hostel</h5>
            <p>4P3J+RCJ, Tarakpur, Ahmednagar, Maharashtra 414001</p>
        </div>
        <div class="col-md-3  mt-5 ml-5 mr-5 shadow text-center pr-4 pl-4 pt-3 pb-2" style="height:230px">
            <a href="https://goo.gl/maps/v1MjZ1ErRrKWfidBA" target="blank" class="box_circle">
                <i class="fa-solid fa-phone h1 mt-2"></i>
            </a>
            <h4 class="mt-3 mb-4">Phone </h4>
            <p style="margin-top:-10px;" class="p-0">Call - 9604912407</p>
            <p style="margin-top:-10px;" class="p-0">whatsapp call - 9604912407</p>
        </div>
        <div class="col-md-3  mt-5 ml-5 mr-5 mr-md-0 shadow text-center pr-4 pl-4 pt-3 pb-2" style="height:230px">
            <a href="https://goo.gl/maps/v1MjZ1ErRrKWfidBA" target="blank" class="box_circle">
                <i class="fa-solid fa-envelope h1 mt-2 mb-4"></i>
            </a>
            <h4 class="mb-3">Email</h4>
            <a href="mailto:ajinkyadhavale9604@gmail.com">ajinkyadhavale9604<br>@gmail.com</a>
        </div>
    </div>
</div><div class="container mt-5 mb-4">
    <div class="row justify-content-center">
        <div class="col-md-6 mt-4 border shadow p-3" style="border-radius:10px;">
            <form action="save_contact" method="post">
                <h2 class="text-danger text-center mt-4 mb-4">Contact Us</h2>
                Name : 
                <input class="form-control rounded-pill mb-4 mt-2" type="text" name="user_name">
                Email : 
                <input class="form-control rounded-pill mb-4 mt-2" type="email" name="user_email">
                Phone : 
                <input class="form-control rounded-pill mb-4 mt-2" type="number" name="user_phone">
                Message : 
                <textarea class="form-control rounded-pill mb-4 mt-2" name="user_message"></textarea>                
                <div class="text-center mb-4">
                    <button class="btn btn-outline-danger rounded-pill">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
	<%@include file="all/Footer.jsp"%>
</body>
</html>