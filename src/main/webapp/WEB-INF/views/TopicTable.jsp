<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<jsp:include page="head.jsp" />
<script type="text/javascript" src="webjars/jquery/2.2.3/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.table .eBtn1').on('click', function(event) { event.preventDefault(); var href = $(this).attr('href');
			$.get(href, function(topicMaster, status) { updateModal
				$('.myForm1 #topicId').val(topicMaster.topicId);
				$('.myForm1 #subjectName').val(topicMaster.subjectName);
				$('.myForm1 #topicName').val(topicMaster.topicName);
			});
			$('.myForm1 #updateModal').modal();
		});
	});
</script>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			
			<!-- sidebar-->
			<jsp:include page="sidebarUser.jsp" />
			<!-- Layout container -->
			<div class="layout-page">
				<!-- navbar -->
				<jsp:include page="header.jsp" />
	
				<!-- Hoverable Table rows -->
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">Tables /</span> Topic Table
						</h4>
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
						<!-- Add Topic Form -->
						<form action="saveTopic" method="post">
							<div class="modal fade" id="basicModal" tabindex="-1" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel1">Add Topic</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close">
											</button>
										</div>
										<div class="modal-body">
											<div class="row">
												<div class="mb-3">
													<label class="form-label" for="country">Subject Name </label> 
													<select name="subjectMaster" class="select2 form-select">
														<option value="open this select menu...">
															Select Subject
														</option>
														<c:forEach items="${subject}" var="subject">
															<option value="${subject.subjectId}" selected>
																${subject.subjectName}
															</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="mb-3">
												<label class="form-label" for="basic-icon-default-fullname">Topic Name</label>
												<div class="input-group input-group-merge">
													<span id="basic-icon-default-fullname2"
														class="input-group-text"><i class="bx bx-list-ul"></i>
													</span>
													<input type="text" name="topicName" class="form-control"
														id="basic-icon-default-fullname" required
														placeholder="Enter Topic Name"
														aria-label="Enter Subject Name"
														aria-describedby="basic-icon-default-fullname2">
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-outline-secondary"
												data-bs-dismiss="modal">Close
											</button>
											<button type="submit" class="btn btn-primary">Save changes</button>
										</div>
									</div>
								</div>
							</div>
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal" style="float: right;">
								<i class='bx bx-plus'></i></span>&nbsp; Add
							</button> <br> <br>
						</form>

						<!-- Start Subject Table Design -->
						<div class="card">
							<h5 class="card-header">Topic Table</h5>
							<div class="table-responsive text-nowrap">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>sr.No</th>
											<th>Subject Name</th>
											<th>Topic Name</th>
											<th>Actions</th>
										</tr>
									</thead>

									<tbody class="table-border-bottom-0">
										<c:forEach items="${topicMaster}" var="topicMaster">
											<tr>
												<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
													<strong><c:set var="count" value="${count + 1}"
															scope="page" /> <c:out value="${count}" />
													</strong>
												</td>
												<td>${topicMaster.subjectMaster.subjectName}</td>
												<td>${topicMaster.topicName}</td>

												<td>
													<a href="findOne1/${topicMaster.topicId}" class="eBtn1">
														<button type="submit" class="table-actbtn pushable "
															data-bs-toggle="modal" data-bs-target="#updateModal">
															<i class="material-icons front">create</i>
														</button>
													</a>&nbsp;&nbsp;&nbsp; <a href="deleteTopic/${topicMaster.topicId}">
														<button type="submit" class="table-actbtn pushable">
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
				</div>
			</div>
		</div>
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>

	<!--  Update Subject Form Button trigger modal -->
	<div class="myForm1">
		<form action="save1" method="post">
			<div class="modal fade" id="updateModal" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel1">Update Topic</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col mb-3">
									<input type="hidden" id="topicId" name="topicId" class="form-control" placeholder="Enter Name" readonly/>									
								</div>
							</div>

							<div class="row">
								<div class="col mb-3">
									<label for="nameBasic" class="form-label">Subject Name</label>
									<select name="subjectMaster" id="subjectMaster" class="select2 form-select">
										<option value="open this select menu...">Select Subject</option>
										<c:forEach items="${subject}" var="subject">
											<option value="${subject.subjectId}" selected="selected">${subject.subjectName}
											</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col mb-3">
									<label for="exampleFormControlTextarea1" class="form-label">Topic Name</label> 
									<input type="text" id="topicName" name="topicName" class="form-control" placeholder="Enter Name" required="required"/>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-secondary"
									data-bs-dismiss="modal">Close
								</button>
								<button type="submit" class="btn btn-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
