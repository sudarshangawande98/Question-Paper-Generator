<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<jsp:include page="head.jsp" />
<script type="text/javascript">
	function show_alert() {
		alert("Test Paper deleted Successfully..!");
	}
</script>
<script type="text/javascript" src="webjars/jquery/2.2.3/jquery.min.js"></script>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- sidebar -->
			<jsp:include page="sidebarUser.jsp" />
			<div class="layout-page">
				<!-- navbar  -->
				<jsp:include page="header.jsp" />

				<!-- Hoverable Table rows -->
				<div class="content-wrapper">
					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">Tables / </span>Test Papers
						</h4>
						<!-- Start Test Papers Table Design -->
						<div class="card">
							<h5 class="card-header">Test Papers</h5>
							<div class="table-responsive text-nowrap">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Sr.No</th>
											<th>Test Name</th>
											<th>Download Test</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
										<c:forEach items="${testList}" var="testList">
											<tr>
												<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
													<strong>
														<c:set var="count" value="${count + 1}" scope="page" /> <c:out value="${count}" />
													</strong>
												</td>
												<td>${testList.getTestName()}</td>
												<td>
													<a href="/downloadTest/${testList.getTestMetaDataId()}">
														<button style="color: green; border: none; background-color: white">
															<i class="material-icons "
																style="font-size: 28px; float: left;">cloud_download
															</i>
														</button>
													</a>
												</td>
												<td>
													<a href="/deleteTest/${testList.getTestMetaDataId()}">
													<button class="table-actbtn pushable" data-bs-toggle="modal"
														data-bs-target="#updateModal">
														<i class="material-icons front">delete</i>
													</button>
													</a>&nbsp;&nbsp;&nbsp; 
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
</body>
</html>
