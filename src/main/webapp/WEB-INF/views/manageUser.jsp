<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<jsp:include page="head.jsp" />

<script type="text/javascript" src="webjars/jquery/2.2.3/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.table .eBtn').on('click', function(event) {
			event.preventDefault();
			var href = $(this).attr('href');

			$.get(href, function(user, status) {
				updateModal
				$('.myForm #userId').val(user.userId);
				$('.myForm #userName').val(user.userName);
				$('.myForm #email').val(user.email);
				$('.myForm #password').val(user.password);
			});
			$('.myForm #updateModal').modal();
		});
	});
</script>

<script type="text/javascript">
	function show_alert1() {
		alert("Faculty Deleted Successfully..!");
	}
	function show_alertMail() {
		alert("Mail send to Faculty Successfully..!");
	}
</script>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">			
			<jsp:include page="sidebar.jsp" />
			<div class="layout-page">			
				<jsp:include page="header.jsp" />
	
				<!-- Hoverable Table rows -->
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">Tables /</span> Manage Faculty
						</h4>

						<!-- Start Subject Table Design -->
						<div class="card">
							<h5 class="card-header">Faculty Table</h5>
							<div class="table-responsive text-nowrap">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>sr.No</th>
											<th>userName</th>
											<th>First Name</th>
											<th>Email</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
										<c:forEach items="${user}" var="user">
											<tr>
												<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
													<strong><c:set var="count" value="${count + 1}"
															scope="page" /> <c:out value="${count}" />
													</strong>
												</td>
												<td>${user.userName}</td>
												<td>${user.firstName}</td>
												<td>${user.email}</td>
												<td>
													<a href="getUserById/${user.userId}" class="eBtn">
														<button type="submit" class="table-actbtn pushable"
																data-bs-toggle="modal" data-bs-target="#updateModal">
																<i class="material-icons front">create</i>
														</button>
													</a>&nbsp;&nbsp;&nbsp; 
													<a href="deleteUser/${user.userId}">
														<button type="submit" class="table-actbtn pushable"
															onclick="show_alert1()">
															<i class="material-icons front">delete</i>
														</button>
													</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<jsp:include page="footer.jsp" />
					<!-- / Layout page -->
				</div>
			</div>
		</div>
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	
	<!-- UPDATE SUBJECTS FORM -->
	<div class="myForm">
		<form action="/sendMail" method="post">
			<div class="modal fade" id="updateModal" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel1">Send userName and Password to faculty</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col mb-3">
									<label for="userName" class="form-label"> Faculty userName</label> 
									<input type="text" id="userName" name="userName"
										class="form-control" placeholder="Enter Name" readonly/>
								</div>
							</div>
							<div class="row">
								<div class="col mb-3">
									<label for="email" class="form-label">Email</label>
									<input type="text" id="email" name="email"
										class="form-control" placeholder="Enter Name" readonly/>
								</div>
							</div>
							<div class="row">
								<div class="col mb-3">
									<input type="hidden" id="password" name="password"
										class="form-control" placeholder="Enter Password" readonly/>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close </button>
							<button type="submit" class="btn btn-primary" onclick="show_alertMail()">Send mail</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>