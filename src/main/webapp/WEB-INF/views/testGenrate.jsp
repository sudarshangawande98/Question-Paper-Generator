<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<jsp:include page="head.jsp" />

<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" crossorigin="anonymous">
<link rel="stylesheet" href="pdf.css" />
<script src="pdf.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

<script type="text/javascript">
window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
            const invoice = this.document.getElementById("invoice");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 1,
                filename: 'myfile.pdf',              
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
            };
            const formData = new FormData();
            formData.append('file', html2pdf().from(invoice).set(opt).save());
            alert(JSON.stringify(formData));
        })
}
</script>

<style>
h6 {
	text-align: center;
}

p {
	text-align: center;
}

div1 {
	text-align: center;
}

div.a {
	text-align: center;
	margin-top: 20px;
}

table {
	counter-reset: section;
}

.count:before {
	counter-increment: section;
	content: counter(section);
}

.center {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 50%;
}
</style>
</head>

<body>
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<jsp:include page="sidebar.jsp" />
			<div class="layout-page">
				<jsp:include page="header.jsp" />
				<body>
					<form action="/testmetadata">
						<div class="container d-flex justify-content-center mt-50 mb-50">
							<div class="row">
								<div class="col-md-12 text-right mb-3"></div>
								<div class="col-md-12">
									<div class="card"><br>
										<img src="../assets/img/favicon/logo.jpg "
											style="width: 40%; height: 40%" class="center">
										<h6 class="card-title text-black">
											<br><b>Preparation Test</b>
										</h6>
										<h6 class="card-title text-black">
											<b>MCQ Test</b>
										</h6>
										<div class="card-body">
											<div class="row">
												<div class="col-sm-6">
													<div class="mb-4 pull-left">
														<ul class="list list-unstyled mb-0 text-left"> <br>
															<li><h5>Duration : ${duration} Hours.</h5></li>
														</ul>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="mb-4 ">
														<div class="text-sm-right"> <br>
															<c:set var="markTotal" value="${0}" />
															<c:forEach var="list" items="${list}">
																<c:set var="markTotal" value="${markTotal + list.marks}" />
															</c:forEach>
															<h5>Total marks : ${markTotal}</h5>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="table-responsive">
											<table class="table table-lg">
												<tbody>
													<c:forEach items="${list}" var="list">
														<tr>
															<td class="count">) ${list.question}
																<ul class="list list-unstyled mb-0 text-left"> <br>
																	<li>A) ${list.option1}</li>
																	<li>B) ${list.option2}</li>
																	<li>C) ${list.option3}</li>
																	<li>D) ${list.option4}</li>
																</ul>
															</td>
															<td></td>
															<td></td>
															<td><span class="font-weight-semibold"
																value="${list.marks}">${list.marks}</span></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<br><br><br>
								<div class="a">
									<button class="btn btn-primary" style="text-align: center;">download pdf</button>
								</div>
								<div class="layout-overlay layout-menu-toggle"></div>
							</div>
					</form>
				</body>
</html>



