<!DOCTYPE html>
<html lang="en" class="light-style customizer-hide" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<head>
<style>
</style>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<title>Forget Password</title>
<meta name="description" content="" />
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

<!-- Page -->
<link rel="stylesheet" href="assets/vendor/css/pages/page-auth.css" />
<!-- Helpers -->
<script src="../assets/vendor/js/helpers.js"></script>
<script src="../assets/js/config.js"></script>
</head>

<body class="body">
	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<!-- Forgot Password -->
			<div class="card">
				<div class="card-body">
					<!-- Logo -->
					<div class="app-brand justify-content-center">
						<a href="index.html" class="app-brand-link gap-2">
							<h2 class="mb-2">Change Password</h2> <br> <br> <br>
						</a>
					</div> <br>
					<p class="mb-4">Enter new password to change your password</p>
					<form id="formAuthentication" class="mb-3" method="post" action="/change-password">
						<div class="mb-3">
							<label class="form-label" for="basic-icon-default-fullname"><strong>Password</strong></label>
							<div class="input-group input-group-merge">
								<span id="basic-icon-default-fullname2" class="input-group-text"><em
									class='bx bxs-lock'></em></span> <input type="password"
									name="newpassword" class="form-control"
									id="basic-icon-default-fullname"
									placeholder="Enter your new password"
									aria-label="Enter Subject Name"
									aria-describedby="basic-icon-default-fullname2">
							</div>
						</div>
						<button class="btn btn-primary d-grid w-100" type="submit">Change Password</button>
					</form>
					<div class="text-center">
						<a href="auth-login-basic.html"
							class="d-flex align-items-center justify-content-center"> <em
							class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></em> Back to login
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="../assets/vendor/libs/jquery/jquery.js"></script>
	<script src="../assets/vendor/libs/popper/popper.js"></script>
	<script src="../assets/vendor/js/bootstrap.js"></script>
	<script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="../assets/vendor/js/menu.js"></script>
	<script src="../assets/js/main.js"></script>
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>