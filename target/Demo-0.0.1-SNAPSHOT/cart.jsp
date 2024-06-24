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
<title>Cart Books</title>
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
			<div class="col-md-6">
				<div class="card">
					<h3 class="mt-4 text-center text-success">Your Selected Item</h3>

					<div class="card-body">
						<table class="table">

							<tr class="thead-dark">
								<th>Book Name</th>
								<th>Book Author</th>
								<th>Book Price</th>
								<th>Action</th>
							</tr>
							<%
							user u = (user) session.getAttribute("userObj");
							CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnect());
							List<Cart> list = dao.getCartByUser(u.getId());
							Double tatalPrice = 0.0;
							
							int i=0;
							for (Cart c : list) {
								tatalPrice = c.getTotal_price();
							
							%>
							<tr>
								<td><%=c.getBook_name()%></td>
								<td><%=c.getBook_author()%></td>
								<td><%=c.getBook_price()%></td>
								<td><a class="btn btn-danger"
									href="remove_book?cart_id=<%=c.getCart_id()%>"><i
										class="fa fa-trash"></i></a></td>
							</tr>
							<%
							}
							%>
							<tr>
								<th>Total Price</th>
								<td></td>
								<td></td>
								<th>&#x20B9; <%=tatalPrice%></th>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<h3 class="mt-4 text-center text-success">Your Details for
						Order</h3>
					<c:if test="${not empty successMsg}">
						<p class="text-center text-success">${successMsg}</p>
						<c:remove var="successMsg" scope="session" />
					</c:if>
					<c:if test="${not empty failedMsg}">
						<p class="text-center text-success">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="order_servlet" method="post">

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
								<div class="form-group col-md-12">
									<label for="inputEmail4">Payment Mode</label> <select
										class="form-control" name="payment_type" required
										onchange="demo()" id="value_payment">
										<option value="no_select">--Select--</option>
										<option value="online">Online</option>
										<option value="cash_on_delivery">Cash On Delivery</option>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12 text-center">
									<a><button class="btn btn-warning d-none show_btn1" id="rzp-button1">Pay
											Online</button></a> <a><button id="show_btn"
											class="btn show_btn1 btn-warning">Order Now</button></a> <a
										class="btn btn-success ml-3">Continue Shopping</a>
								</div>
							</div>

							<script>
								function demo() {
									var paymentType = document.getElementById("value_payment").value;
									var showButton = document.getElementById("show_btn");
									var showButton1 = document.getElementsByClassName("show_btn1")[0];
									if (paymentType === "online") {
										showButton1.classList.remove("d-none");
										showButton.classList.add("d-none");
									} else {
										showButton1.classList.add("d-none");
										showButton.classList.remove("d-none");
									}
								}
							</script>



						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all/Footer.jsp"%>
	<script>
		AOS.init();
	</script>


	
	<script>
var options = {
    "key": "rzp_test_AWbCxX14mGjWaN", // Enter the Key ID generated from the Dashboard
    "amount": "<%=tatalPrice * 100%>", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "EBook Store", //your business name
    "description": "",
    "image": "img/b1.jpg",
    // "order_id": "order_9A33XWu170gUtm", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1 -->
    "callback_url": "http://localhost:8181/Demo/order_servlet1",
    "prefill": { //We recommend using the prefill parameter to auto-fill customer's contact information especially their phone number
        "name": "", //your customer's name
        "email": "",
        "contact": ""
        //Provide the customer's phone number for better conversion rates 
			},
			"notes" : {
				"address" : "Razorpay Corporate Office"
			},
			"theme" : {
				"color" : "#3399cc"
			}
		};
		var rzp1 = new Razorpay(options);
		document.getElementById('rzp-button1').onclick = function(e) {
			rzp1.open();
			e.preventDefault();
		}
	</script>
</body>
</html>