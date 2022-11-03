<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List,java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<jsp:include page="head.jsp" />
<script type="text/javascript" src="webjars/jquery/2.2.3/jquery.min.js"></script>
<script src="../assets/js/app.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
#error {
	color: red;
	text-align: center;
}

.desk {
	text-align: center;
}

.user-pic {
	width: 150px;
	height: 150px;
	overflow: hidden;
	border-radius: 100%;
	margin: 20px auto 20px;
	border-left: 3px solid #ddd;
	border-right: 3px solid #ddd;
	border-top: 3px solid #007bff;
	border-bottom: 3px solid #007bff;
	transform: rotate(-30deg);
	transition: 0.5s;
}

.card-box:hover .user-pic {
	transform: rotate(0deg);
	transform: scale(1.1);
}

.card-box {
	padding: 15px;
	background-color: #fdfdfd;
	margin: 20px 0px;
	border-radius: 10px;
	border: 1px solid #eee;
	box-shadow: 0px 0px 8px 0px #d4d4d4;
	transition: 0.5s;
}

.card-box:hover {
	border: 1px solid #007bff;
}

.card-box p {
	color: #808080;
}
</style>

<meta http-equiv="Content-type"
	content="application/x-www-form-urlencoded; charset=UTF-8" />

<body>
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<jsp:include page="sidebarUser.jsp" />
			<div class="layout-page">
				<jsp:include page="header.jsp" />
				<div class="content-wrapper">
					<div class="content-wrapper">
						<div class="container-xxl flex-grow-1 container-p-y">
							<div class="row">
								<div class="modal-body">
									<div class="row">
										<div class="col mb-3">
											<div class="card">
												<div class="container">
													<div class="row">
														<div class="container">
															<div class="row">
																<div class="col-sm-6 offset-sm-3 mt-4 mb-4">
																	<h2 class="text-center">Our Expert Team</h2>
																	<p class="text-center">Lorem Ipsum is simply dummy
																		text of the printing and typesetting industry</p>
																</div>
															</div>

															<div class="row">
																<div class="col-md-4">
																	<div class="card-box text-center">
																		<div class="user-pic">
																			<img src="/images/user-img-1.jpg" class="img-fluid"
																				alt="User Pic">
																		</div>
																		<h4>Rajnish Kumar</h4>
																		<h6>Web Designer</h6>
																		<hr>
																		<p>Lorem Ipsum is simply dummy text of the
																			printing and typesetting industry. Lorem Ipsum has
																			been the industry's standard dummy text ever since
																			the 1500s</p>
																		<hr>
																		<a href="#" class="btn btn-primary">Know More</a>
																	</div>
																</div>

																<div class="col-md-4">
																	<div class="card-box text-center">
																		<div class="user-pic">
																			<img src="/images/user-img-2.jpg" class="img-fluid"
																				alt="User Pic">
																		</div>
																		<h4>Satyam Tiwari</h4>
																		<h6>Web Developer</h6>
																		<hr>
																		<p>Lorem Ipsum is simply dummy text of the
																			printing and typesetting industry. Lorem Ipsum has
																			been the industry's standard dummy text ever since
																			the 1500s.</p>
																		<hr>
																		<a href="#" class="btn btn-primary">Know More</a>
																	</div>
																</div>

																<div class="col-md-4">
																	<div class="card-box text-center">
																		<div class="user-pic">
																			<img src="/images/user-img-3.jpg" class="img-fluid"
																				alt="User Pic">
																		</div>
																		<h4>Salim Malik</h4>
																		<h6>Front End Developer</h6>
																		<hr>
																		<p>Lorem Ipsum is simply dummy text of the
																			printing and typesetting industry. Lorem Ipsum has
																			been the industry's standard dummy text ever since
																			the 1500s.</p>
																		<hr>
																		<a href="#" class="btn btn-primary">Know More</a>
																	</div>
																</div>
															</div>
															<div class="container">
															<div class="row">
																<div class="col-sm-6 offset-sm-3 mt-4 mb-4">
																	<h2 class="text-center">Our Expert Team</h2>
																	<p class="text-center">Lorem Ipsum is simply dummy
																		text of the printing and typesetting industry</p>
																</div>
															</div>

															<div class="row">
																<div class="col-md-4">
																	<div class="card-box text-center">
																		<div class="user-pic">
																			<img src="/images/user-img-1.jpg" class="img-fluid"
																				alt="User Pic">
																		</div>
																		<h4>Rajnish Kumar</h4>
																		<h6>Web Designer</h6>
																		<hr>
																		<p>Lorem Ipsum is simply dummy text of the
																			printing and typesetting industry. Lorem Ipsum has
																			been the industry's standard dummy text ever since
																			the 1500s</p>
																		<hr>
																		<a href="#" class="btn btn-primary">Know More</a>
																	</div>
																</div>

																<div class="col-md-4">
																	<div class="card-box text-center">
																		<div class="user-pic">
																			<img src="/images/user-img-2.jpg" class="img-fluid"
																				alt="User Pic">
																		</div>
																		<h4>Satyam Tiwari</h4>
																		<h6>Web Developer</h6>
																		<hr>
																		<p>Lorem Ipsum is simply dummy text of the
																			printing and typesetting industry. Lorem Ipsum has
																			been the industry's standard dummy text ever since
																			the 1500s.</p>
																		<hr>
																		<a href="#" class="btn btn-primary">Know More</a>
																	</div>
																</div>

															
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="footer.jsp" />
			</div>
		</div>
	</div>
	<div class="layout-overlay layout-menu-toggle"></div>
</body>
</html>
