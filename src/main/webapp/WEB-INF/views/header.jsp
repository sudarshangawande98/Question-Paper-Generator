<%@ page language="java" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Dashboard - Analytics</title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="../assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="./assets/vendor/css/core.css" class="template-customizer-core-css" />
<link rel="stylesheet" href="../assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
<link rel="stylesheet" href="../assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<link rel="stylesheet" href="../assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>
<script src="../assets/js/config.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var userName = $('#userName').text();

		var intials = $('#userName').text().charAt(0);
		var profileImage = $('#profileImage').text(intials);
	});

	$(document).ready(function() {
		var userName = $('#userName').text();

		var intials = $('#userName').text().charAt(0);
		var profileImage = $('#profileImage1').text(intials);
	});
</script>

<style type="text/css">
#profileImage, #profileImage1 {
	border-radius: 50%;
	background: #696cff;
	font-size: 30px;
	color: #fff;
	text-align: center;
	margin: 20px 0;
}
</style>

</head>
</head>

<body>
	<!-- Navbar -->
	<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
		<div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
			<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
				<i class="bx bx-menu bx-sm"></i>
			</a>
		</div>

		<div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
			<!-- Search -->
			<div class="navbar-nav align-items-center">
				<div class="nav-item d-flex align-items-center">
					<i class="bx bx-search fs-4 lh-0"></i> <input type="text"
						class="form-control border-0 shadow-none" placeholder="Search..."
						aria-label="Search..." />
				</div>
			</div>
			
			<!-- /Search -->
			<ul class="navbar-nav flex-row align-items-center ms-auto">
				<!-- User -->
				<li class="nav-item navbar-dropdown dropdown-user dropdown"><a class="nav-link dropdown-toggle hide-arrow"
					href="javascript:void(0);" data-bs-toggle="dropdown" aria-expanded="false">
					<div class="avatar avatar-online" id="profileImage"> </div></a>
					<ul class="dropdown-menu dropdown-menu-end">
						<li><a class="dropdown-item" href="#">
							<div class="d-flex">
								<div class="flex-shrink-0 me-3">
									<div class="avatar avatar-online" id="profileImage1"></div>
								</div>
								<div class="flex-grow-1">
									<span id="userName" class="fw-semibold d-block">${userName}</span>
									<small class="text-muted">Account</small>
								</div>
							</div></a>
						</li>
						<li>
							<div class="dropdown-divider"></div>
						</li>
						<li><a class="dropdown-item" href="#"> 
							<i class="bx bx-user me-2"></i> <span class="align-middle">My Profile</span></a>
						</li>

						<li>
							<div class="dropdown-divider"></div>
						</li>
						<li><a class="dropdown-item" href="/logout"> 
							<i class="bx bx-power-off me-2"></i> <span class="align-middle">Log Out</span></a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

	<script src="../assets/vendor/libs/jquery/jquery.js"></script>
	<script src="../assets/vendor/libs/popper/popper.js"></script>
	<script src="../assets/vendor/js/bootstrap.js"></script>
	<script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="../assets/vendor/js/menu.js"></script>
	<script src="../assets/vendor/libs/apex-charts/apexcharts.js"></script>

	<!-- Main JS -->
	<script src="../assets/js/main.js"></script>

	<!-- Page JS -->
	<script src="../assets/js/dashboards-analytics.js"></script>

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>