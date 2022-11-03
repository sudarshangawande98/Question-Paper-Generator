<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>
	<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
		<div class="app-brand demo">
			<a href="/index"><img src="../assets/img/avatars/b.png" style="width: 146px; height: 79px;" /></a> </a> <a
				href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
				<i class="bx bx-chevron-left bx-sm align-middle"></i>
			</a>
		</div><br>
		<div class="menu-inner-shadow"></div>

		<ul class="menu-inner py-1" style="background: lavender;"</ul>

		<!-- Dashboard -->
		<li class="menu-item active"><a href="/index" class="menu-link">
			<i class="menu-icon tf-icons bx bx-home-circle" style="font-size: 25px; color: blue;"></i>
			<div data-i18n="Analytics">
				<b>Dashboard</b>
			</div></a>
		</li>

		<!-- Components -->
		<li class="menu-header small text-uppercase"><span class="menu-header-text"><b>&nbsp;&nbsp;Components</b></span></li>

		<li class="menu-item"><a href=/UserRegister class="menu-link">
			<i class="menu-icon tf-icons bx bxs-spreadsheet" style="font-size: 25px; color: blue;"></i>
			<div data-i18n="Basic">
				<b>Add Faculty</b>
			</div></a>
		</li>
		
		<li class="menu-item"><a href=/manageUser class="menu-link">
			<i class="menu-icon tf-icons bx bxs-info-square" style="font-size: 25px; color: blue;"></i>
			<div data-i18n="Basic">
				<b> Faculty Info</b>
			</div></a>
		</li>

		<!-- Cards -->
		<li class="menu-item"><a href="/subjectTable" class="menu-link">
			<i class="menu-icon tf-icons bx bxs-book-open" style="font-size: 25px; color: blue;"></i>
			<div data-i18n="Basic">
				<b>Subject</b>
			</div></a>
		</li>

		<li class="menu-item"><a href="/logout" class="menu-link"> <i class="menu-icon tf-icons bx bx-log-out-circle"
			style="font-size: 25px; color: blue;"></i>
			<div data-i18n="Basic">
				<b>LogOut</b>
			</div></a>
		</li>
		</ul>
	</aside>

	<script type="text/javascript">
		$(document).ready(function() {
			$('li').click(function() {
				$('li.menu-item.active').removeClass("active");
				$(this).addClass("active");
			});
		})
	</script>
</body>
</html>