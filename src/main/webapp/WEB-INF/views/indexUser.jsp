<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<jsp:include page="head.jsp" />
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">

			<!-- sidebar -->
			<jsp:include page="sidebarUser.jsp" />

			<!-- Layout container -->
			<div class="layout-page">
			
				<!-- navbar -->
				<jsp:include page="header.jsp" />
				
				<!-- include container -->
				<jsp:include page="containerUser.jsp" />
				
				<!-- Content wrapper -->
				<jsp:include page="footer.jsp" />
				<!-- / Layout page -->
			</div>
		</div>
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
</body>
</html>