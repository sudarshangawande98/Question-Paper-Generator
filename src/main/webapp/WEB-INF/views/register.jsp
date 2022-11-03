<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="light-style customizer-hide" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">

<script type="text/javascript">
	function show_alert() {

		const pass = document.getElementById('password').value;
		let passw = /^[A-Za-z]\w{7,14}$/;

		if (pass.match(passw)) {
			alert("Institute registration successfully!");
			return true;
		} else {
			alert("Incorrect Password");
			return false;
		}
	}
</script>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Register</title>
<meta name="description" content="" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="../assets/img/favicon/cdacLogo.jpg" style="width:200px;height:200px" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="../assets/vendor/css/core.css" class="template-customizer-core-css" />
<link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
<link rel="stylesheet" href="../assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<!-- Page CSS -->
<link rel="stylesheet" href="../assets/vendor/css/pages/page-auth.css" />

<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>

<script src="../assets/js/config.js"></script>
</head>

<body class="body">
	
	<!-- Content -->
	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">

			<!-- Register Card -->
			<div class="card">
				<div class="card-body">
					
					<!-- Logo -->
					<h1 style="text-align: center;">Institute Registration</h1><br>
					<p style="position: absolute !important; margin-top: -40px;">
						<c:set var="wrongmessage" scope="page" value="${wrongmessage}" />
						<c:if test="${not empty wrongmessage}">
							<div class="alert" role="alert"
								style="position: absolute !important; color: red; margin-top: -41px; margin-left: -75px;">
								<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									${wrongmessage}</b>
							</div>
						</c:if>
					</p>
					<!-- /Logo -->
					<form id="formAuthentication" class="needs-validation was-validated mb-3"  action="/saveUser" method="POST">
						<div class="mb-3">
							<div class="row g-2">
								<div class="col mb-0">
									<label for="emailBasic" class="form-label">First Name</label> <input
										type="text" id="emailBasic" name="firstName" class="form-control" 
										placeholder="Enter your First name" required="required" pattern="[A-Za-z]{2,20}" />
								</div>
								<div class="col mb-0">
									<label for="dobBasic" class="form-label">Last Name</label> <input
										type="text" id="dobBasic" name="lastName" class="form-control"
										placeholder="Enter your Last name" required="required" pattern="[A-Za-z]{2,20}"/>
								</div>
							</div>
						</div>
						<div class="mb-3">
							<label for="username" class="form-label">Username</label> <input
								type="text" class="form-control" id="username" name="userName"
								placeholder="Enter your username" autofocus required="required"/>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email</label> <input
								type="text" class="form-control" id="email" name="email"
								placeholder="xxxx@xxx.xx"
								pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
								title=" Invalid Email" required/>
						</div>
						
						<div class="mb-3 form-password-toggle">
							<div class="d-flex justify-content-between">
								<label class="form-label" for="password">Password</label>
							</div>
							<div class="input-group input-group-merge">
								<input type="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
									title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
									class="form-control" name="password" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
									aria-describedby="password" required/> <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
							</div>
						</div>
						<button type="submit" class="btn btn-primary d-grid w-100">Sign up</button>
					</form>

					<p class="text-center">
						<span>Already have an account?</span> <a href="/logout"> <span>Sign in instead</span> </a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- / Content -->
	<script src="../assets/vendor/libs/jquery/jquery.js"></script>
	<script src="../assets/vendor/libs/popper/popper.js"></script>
	<script src="../assets/vendor/js/bootstrap.js"></script>
	<script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="../assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Main JS -->
	<script src="../assets/js/main.js"></script>

	<!-- Page JS -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
