<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<jsp:include page="head.jsp" />

<script type="text/javascript">
	function show_alert() {
		alert("Subject Added Successfully..!");
	}
</script>

<script type="text/javascript" src="webjars/jquery/2.2.3/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.table .eBtn').on('click', function(event) {
			event.preventDefault();
			var href = $(this).attr('href');

			$.get(href, function(subject, status) {
				updateModal
				$('.myForm #subjectId').val(subject.subjectId);
				$('.myForm #subjectName').val(subject.subjectName);
				$('.myForm #description').val(subject.description);
			});
			$('.myForm #updateModal').modal();
		});
	});
</script>

<script type="text/javascript">
	function show_alert1() {
		alert("Subject Deleted Successfully..!");
	}
</script>

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
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">Tables /</span> Subject Table
						</h4>
						<!-- Add Subject Form -->
						<!-- Button trigger modal -->
						<form action="saveSubject" method="post">
							<div class="modal fade" id="basicModal" tabindex="-1" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel1">Add Subject</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close">
											</button>
										</div>
										<div class="modal-body">
											<div class="row">
												<div class="mb-3">
													<label class="form-label" for="basic-icon-default-fullname">Subject Name</label>
													<div class="input-group input-group-merge">
														<span id="basic-icon-default-fullname2"
															class="input-group-text"><i class="bx bxs-book"></i></span>
														<input type="text" name="subjectName" class="form-control"
															id="basic-icon-default-fullname"
															placeholder="Enter Subject Name"
															aria-label="Enter Subject Name"
															aria-describedby="basic-icon-default-fullname2">
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col mb-3">
													<label for="exampleFormControlTextarea1" class="form-label">Description</label>
													<textarea class="form-control" name="description" id="exampleFormControlTextarea1" rows="3"> </textarea>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-outline-secondary"
												data-bs-dismiss="modal">Close
											</button>
											<button type="submit" class="btn btn-primary"
												onclick="show_alert()">Save changes
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- End Subject Form -->

							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal"
								style="float: right;">
								<i class='bx bx-plus'></i></span>&nbsp; Add
							</button><br><br>
						</form>

						<!-- Start Subject Table Design -->
						<div class="card">
							<h5 class="card-header">Subject Table</h5>
							<div class="table-responsive text-nowrap">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>sr.No</th>
											<th>Subject Name</th>
											<th>Description</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
										<c:forEach items="${subject}" var="subject">
											<tr>
												<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
													<strong><c:set var="count" value="${count + 1}"
															scope="page" /> <c:out value="${count}" />
													</strong>
												</td>
												<td>${subject.subjectName}</td>
												<td>${subject.description}</td>
												<td>
													<a href="findOne/${subject.subjectId}" class="eBtn">
														<button type="submit" class="table-actbtn pushable"
																data-bs-toggle="modal" data-bs-target="#updateModal">
																<i class="material-icons front">create</i>
														</button>
													</a>&nbsp;&nbsp;&nbsp; 
													<a href="deleteSubject/${subject.subjectId}">
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
		<form action="save" method="post">
			<div class="modal fade" id="updateModal" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel1">Update Subject</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>

						<div class="modal-body">
							<div class="row">
								<div class="col mb-3">
									<label for="subjectId" class="form-label">Subject Id</label> 
									<input type="text" id="subjectId" name="subjectId" class="form-control" placeholder="Enter Name" />
								</div>
							</div>
							<div class="row">
								<div class="col mb-3">
									<label for="subjectName" class="form-label"> Subject Name</label> 
									<input type="text" id="subjectName" name="subjectName"
										class="form-control" placeholder="Enter Name" />
								</div>
							</div>
							<div class="row">
								<div class="col mb-3">
									<label for="description" class="form-label">Description</label>
									<textarea class="form-control" id="description"
										name="description" rows="3">
									</textarea>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close </button>
							<button type="submit" class="btn btn-primary">Save changes</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>