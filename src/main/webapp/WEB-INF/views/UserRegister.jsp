<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<jsp:include page="head.jsp" />
<script type="text/javascript" src="webjars/jquery/2.2.3/jquery.min.js"></script>

<script type="text/javascript">
	function show_alert() {
		
		alert("Faculty added successfully!");
	}
</script>

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			
			<!-- sidebar-->
			<jsp:include page="sidebar.jsp" />
			<!-- Layout container -->
			<div class="layout-page">
				<!-- navbar -->
				<jsp:include page="header.jsp" />
	
				<!-- Hoverable Table rows -->
				<div class="container-xxl">
					<div class="authentication-wrapper authentication-basic container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">Tables /</span> Add Faculty
						</h4>
						
						<!-- Register Card -->
						<div class="card">
							<div class="card-body">
								
								<!-- Logo -->
								<h1 style="text-align: center;">Add Faculty</h1><br>
								<p style="position: absolute !important; margin-top: -40px;">
									<c:set var="message" scope="page" value="${message}" />
									<c:if test="${not empty message}">
										<div class="alert" role="alert" style="position: absolute !important; color: green; margin-top: -58px; margin-left: -50px;">
											<b> ${message}</b>
										</div>
									</c:if>
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
								<form id="formAuthentication" class="needs-validation was-validated mb-3" action="/saveUser1" method="POST">
									<div class="mb-3">
										<div class="row g-2">
											<div class="col mb-0">
												<label for="emailBasic" class="form-label">First Name</label> <input
													type="text" id="emailBasic" name="firstName" class="form-control"
													placeholder="Enter your First name" required="required" pattern="[A-Za-z]{2,20}"/>
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
											placeholder="Enter your username" autofocus required="required" minLength="2"/>
									</div>
									
									<div class="mb-3">
										<div class="row g-2">
											<div class="col mb-0">
												<label for="email" class="form-label">Email</label> <input
													type="text" class="form-control" id="email" name="email"
													placeholder="xxxx@xxx.xx"
													pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-zA-Z]{2,4}$"
													title=" Invalid Email" required="required"/>
											</div>
											<div class="col mb-0">
												<label for="mobileNo" class="form-label">Mobile No</label> <input
													type="text" id="mobileNo" name="mobileNo" class="form-control"
													placeholder="Enter your mobile no" required="required" pattern="[789][0-9]{9}" maxLength="10"/>
											</div>
										</div>
									</div>
									
									<div class="mb-3 form-password-toggle">
										<div class="d-flex justify-content-between">
											<label class="form-label" for="password">Password</label>
										</div>
										<div class="input-group input-group-merge">
											<input type="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
												title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
												class="form-control" name="password" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
												aria-describedby="password" required="required"/> <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
										</div>									
									</div>
									<button type="submit" class="btn btn-primary d-grid w-100">Add Faculty</button>
								</form>
							</div>
						</div>
					</div>
					<jsp:include page="footer.jsp" />
				</div>
			</div>
		</div>
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
</body>
</html>
