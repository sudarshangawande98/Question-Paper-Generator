<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<style>
img {
	border-radius: 15px;
}
</style>

<body>
	<div class="content-wrapper" >
		<!-- Content -->
		<div class="container-xxl flex-grow-1 container-p-y" style="background: lavender;">
			<div class="row">
				<div class="col-lg-8 mb-4 order-0">
					<div class="card">
						<div class="d-flex align-items-end row">
							<div class="col-sm-7">
								<div class="card-body">
									<h3 class="card-title text-primary">Welcome To QBank.....Institute!</h3>

									<p class="fw-bold">
										<span class="fw-bold" style="color: black;"> Power Of Knowlege,knowlege of Power</span><br>
										<br> The Aim of the this projects is to impact "Power Of Knowlege" and "knowlege of Power" to the youth
									</p>
								</div>
							</div>
							<div class="col-sm-5 text-center text-sm-left">
								<div class="card-body pb-0 px-0 px-md-4">
									<img src="../assets/img/illustrations/man-with-laptop-light.png"
										height="140" alt="View Badge User"
										data-app-dark-img="illustrations/man-with-laptop-dark.png"
										data-app-light-img="illustrations/man-with-laptop-light.png" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 order-1">
					<div class="row">
						<div class="col-lg-6 col-md-12 col-6 mb-4">
							<div class="card">
								<div class="card-body">
									<div class="card-title d-flex align-items-start justify-content-between">
										<div class="avatar flex-shrink-0">
											<a href="#"> 
												<img src="../assets/img/icons/unicons/pencil.png" alt="chart success" class="rounded" />
											</a>
										</div>
									</div>
									<span class="fw-semibold d-block mb-1"><b>Test</b></span>
									<h3 class="card-title mb-2">${testCount}</h3>
									<small class="text-success fw-semibold">
										<i class="bx bx-up-arrow-alt"></i>
									</small>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-6 mb-4">
							<div class="card">
								<div class="card-body">
									<div class="card-title d-flex align-items-start justify-content-between">
										<div class="avatar flex-shrink-0">
											<a href="#"> 
												<img src="../assets/img/icons/unicons/question.png" alt="Credit Card" class="rounded" />
											</a>
										</div>
									</div>
									<span><b>Questions</b></span>
									<h3 class="card-title text-nowrap mb-1">${questionCount}</h3>
									<small class="text-success fw-semibold">
										<i class="bx bx-up-arrow-alt"></i>
									</small>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Total Revenue -->
				<div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
					<div class="row row-bordered g-0">
						<div class="col-md-12">

							<!-- Bootstrap carousel -->
							<div class="col-md">
								<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
									<ol class="carousel-indicators">
										<li data-bs-target="#carouselExample" data-bs-slide-to="0" class="active"></li>
										<li data-bs-target="#carouselExample" data-bs-slide-to="1"></li>
										<li data-bs-target="#carouselExample" data-bs-slide-to="2"></li>
									</ol>
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img class="d-block w-100" src="../assets/img/elements/b.png" alt="First slide" height="400" />
											<div class="carousel-caption d-none d-md-block"><br>
												<h3>
													<b>OUR VISION</b>
												</h3>
												<p>To emerge as the premier R&D institution for the design, development and 
												   deployment of world class electronic and IT solutions for economic and human advancement.
												</p>
											</div>
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" src="../assets/img/elements/s.png" alt="Second slide" height="400" />
											<div class="carousel-caption d-none d-md-block">
												<h3></h3><br>
												<p> Share experience and know-how to help build advanced competence in the 
													areas of Electronics and Information Technology.
												</p>
											</div>
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" src="../assets/img/elements/bms.png" alt="Third slide" height="400" />
											<div class="carousel-caption d-none d-md-block">
												<h3>
													<b>Mission</b>
												</h3>
												<p> Achieve rapid and effective spread of knowledge by overcoming language 
												    barriers through application of technologies.
												</p>
											</div>
										</div>
									</div>
									<a class="carousel-control-prev" href="#carouselExample" role="button" data-bs-slide="prev"
										style="align-content: center;"> 
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</a><a class="carousel-control-next" href="#carouselExample"
										role="button" data-bs-slide="next" style="align-content: center;"> <span
										class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</a>
								</div>
							</div>
							<!-- Bootstrap crossfade carousel -->
							<div class="col-md"></div>
							<div class="col-md-4">
								<div class="card-body">
									<div class="text-center"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/ Total Revenue -->
				<div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
					<div class="row">
						<div class="col-6 mb-4">
							<div class="card">
								<div class="card-body">
									<div class="card-title d-flex align-items-start justify-content-between">
										<div class="avatar flex-shrink-0">
											<a href="/subjectTable"> 
												<img src="../assets/img/icons/unicons/book.png" alt="Credit Card" class="rounded" />
											</a>
										</div>
									</div>
									<span class="d-block mb-1"><b>Subject</b></span>
									<h3 class="card-title text-nowrap mb-2">${subjectCount}</h3>
									<small class="text-success fw-semibold">
										<i class="bx bx-up-arrow-alt"></i>
									</small>
								</div>
							</div>
						</div>
						<div class="col-6 mb-4">
							<div class="card">
								<div class="card-body">
									<div class="card-title d-flex align-items-start justify-content-between">
										<div class="avatar flex-shrink-0">
											<a href="#">
												<img src="../assets/img/icons/unicons/topic.png" class="rounded" />
											</a>
										</div>
									</div>
									<span class="fw-semibold d-block mb-1"><b>Topic</b></span>
									<h3 class="card-title mb-2">${topicCount}</h3>
									<small class="text-success fw-semibold">
										<i class="bx bx-up-arrow-alt"></i>
									</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row"></div>
	</div>
</body>
</html>