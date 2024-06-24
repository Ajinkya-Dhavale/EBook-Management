<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div class="container-fluid bg-white" style="background: white">
	<div class="row">
		<div class="col-md-12 header_div narbar_back_color"></div>
	</div>
	<div class="row p-3">
		<div class="col-md-4 col-12">
			<h2 class="text-success">
				<i class="fa-solid fa-book mr-2"></i>E-Book
			</h2>
		</div>
		<div class="col-md-5 col-0">
			<form>
				<div class="container-fluid d-md-block d-none">
					<div class="row ">
						<div class="col-md-3 col-0"></div>
						<div class="col-md-5 p-0">
							<input type="text" class="form-control">
						</div>
						<div class="col-md-4 col-0">
							<a href="" class="btn btn-primary ">Search</a>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-3 ">
			<c:if test="${not empty userObj}">
				<button class="btn btn-primary">
					<i class="fas fa-user-plus"></i> ${userObj.name}
				</button>
			
				<a data-toggle="modal" data-target="#staticBackdrop">

					<button class="btn btn-success" data-toggle="modal"
						data-target="#staticBackdrop">
						<i class="fa-solid fa-right-to-bracket"></i> Logout
					</button>

				</a>
			</c:if>
			<c:if test="${empty userObj}">
				<button class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModal1">
					<i class="fas fa-user-plus"></i> Login
				</button>
				<button class="btn btn-success" data-toggle="modal"
					data-target="#exampleModal">
					<i class="fa-solid fa-right-to-bracket"></i> Register
				</button>
			</c:if>

		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">Logout Screen</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<h4>Do You Want Logout</h4>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="../logout">
					<button type="button" class="btn btn-primary">Logout</button>
				</a>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>



<div class="container-fluid narbar_back_color">
	<div class="row">
		<div class="col-9 p-0">
			<nav class="navbar navbar-expand-md ">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#collapsibleNavbar">
					<span class="fa fa-bars"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">

					<ul class="navbar-nav">
						<button class="btn">
							<i class="mb-2 fa fa-home text-white"></i>
						</button>
						<li class="nav-item "><a class="nav-link"
							href="Home.jsp">
								<button class="btn btn-outline-light">Home</button>
						</a></li>

					</ul>
				</div>
			</nav>
		</div>

	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="column" id="main">
					<h2 class="text-center mb-0">Sign Up</h2>

					<c:if test="${not empty successMsg}">
						<p class="text-center text-success">${successMsg}</p>
						<c:remove var="successMsg" scope="session" />
					</c:if>
					<c:if test="${not empty failedMsg}">
						<p class="text-center text-success">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session" />
					</c:if>

					<form method="post" action="register">
						<div class="form-group mt-0">
							<label>Name </label> <input type="text" class="form-control"
								placeholder="Name" name="name" required>
						</div>
						<div class="form-group mt-0">
							<label>E-mail </label> <input type="email" class="form-control"
								placeholder="E-mail" name="email" required>
						</div>
						<div class="form-group mt-0">
							<label>Phone No </label> <input type="text" class="form-control"
								placeholder="Phone No" name="phone" required>
						</div>
						<div class="form-group mt-0">
							<label>Address </label> <input type="text" class="form-control"
								placeholder="Address" value="" name="address" required>
						</div>
						<div class="form-group mt-0">
							<label>Password</label> <input type="password"
								class="form-control" placeholder="Password" name="password"
								required>
						</div>
						<div class="form-group m-0">
							<input type="checkbox" name="check"> Agree Terms and
							Condition
						</div>
						<div class="w-100 text-center m-0">
							<button type="submit" class="btn m-0 btn-primary">Register</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="column" id="main">
					<h2 class="text-center mt-3">Sign In</h2>
					<c:if test="${not empty failedMsg}">
						<p class="text-center text-success">${failedMsg}</p>
						<c:remove var="failedMsg" scope="session" />
					</c:if>
					<form action="login" method="post">
						<div class="form-group mt-3">
							<label>E-mail </label> <input type="email" class="form-control"
								placeholder="E-mail" name="email">
						</div>
						<div class="form-group mt-3">
							<label>Password</label> <input type="password"
								class="form-control" name="password" placeholder="Password">
						</div>
						<div class="w-100 text-center mt-4">
							<button type="submit" class="btn btn-primary mt-3">Login</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
