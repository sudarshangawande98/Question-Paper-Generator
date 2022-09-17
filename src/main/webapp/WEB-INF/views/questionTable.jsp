<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<jsp:include page="head.jsp" />
<script type="text/javascript" src="webjars/jquery/2.2.3/jquery.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');

body {
	margin: 0;
}

.tab-accordian {
	width: 100%;
	border: 1px solid #cecece;
	background: transparent;
	height: 15%;
	overflow: hidden;
}

.titleWrapper {
	cursor: pointer;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: #fff;
	-webkit-user-select: none;
	user-select: none;
	transition: background-color .8s linear;
}

.desWrapper {
	background: #fff;
	max-height: 150px;
	display: none;
	padding: 20px;
	transition: max-height 1s ease-in;
}

.titleWrapper.active .collapse-icon {
	transition: all .5s ease-in-out;
	transform: rotate(180deg);
}

.titleWrapper.inactive .collapse-icon {
	transition: all .5s ease-in-out;
	transform: rotate(-180deg);
}

.titleWrapper.active .collapse-icon .acc-open {
	opacity: 0;
}
</style>
<script>
	$(document).ready( function() {
		$('#subjectbox').on('change', function() {var subjectId = $(this).val();
			console.log(subjectId);
			$.ajax({type : 'GET', url : '${pageContext.request.contextPath}/getTopicDropdown/' + subjectId, success : 
				function(result) {
					console.log(result);
					var s = '';
					for (var i = 0; i < result.length; i++) {
						s += '<option value="' + result[i].topicId + '">' + result[i].topicName + '</option>';
					}
					$('#comboboxTopic') .html(s);
				}
			});
		});
	});

	$(document).ready(
		function() {
			$('#subjectbox1').on('change',function() {
				var subjectId = $(this).val();
				console.log(subjectId);
				$.ajax({type : 'GET', url : '${pageContext.request.contextPath}/getTopicDropdown/'+ subjectId, success : 
				function(result) {
				console.log(result);
				var s = '';
				for (var i = 0; i < result.length; i++) {
					s += '<option value="' + result[i].topicId + '">'+ result[i].topicName + '</option>';
				}
				$('#comboboxTopic1').html(s);
			}
		});
	});
});
</script>

<script>
	jQuery(document).ready(function() {
		jQuery('.titleWrapper').click(function() {
			var toggle = jQuery(this).next('div#descwrapper');
			jQuery(toggle).slideToggle("slow");
		});
		jQuery('.inactive').click(function() {
			jQuery(this).toggleClass('inactive active');
		});
	});

	$(document).ready(function() {
		$('#subjectbox').on('change', function() {
			var subjectName = $('.select1 option:selected').text();
			console.log(subjectName);

			if (subjectName.match('Mathematics')) {
				document.getElementById("h").value = 2;
			} else
				document.getElementById("h").value = 4;

		});
	});
</script>


<script type="text/javascript">
	$(document).ready(function() {
		$('.titleWrapper .eBtn2').on('click', function(event) {
			event.preventDefault();
			var href = $(this).attr('href');

			$.get(href, function(questionMaster, status) {
				updateModal
				$('.myForm2 #questionId').val(questionMaster.questionId);
				$('.myForm2 #question').val(questionMaster.question);
				$('.myForm2 #option1').val(questionMaster.option1);
				$('.myForm2 #option2').val(questionMaster.option2);
				$('.myForm2 #option3').val(questionMaster.option3);
				$('.myForm2 #option4').val(questionMaster.option4);
				$('.myForm2 #correctAnswer').val(questionMaster.correctAnswer);
				$('.myForm2 #marks').val(questionMaster.marks);
				$('.myForm2 #subjectName').val(questionMaster.subjectName);
				$('.myForm2 #topictName').val(questionMaster.topicName);
				$('.myForm2 #levelName').val(questionMaster.levelName);
			});
			$('.myForm2 #updateModal').modal();
		});

	});
</script>


<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- sidebar-->
			<jsp:include page="sidebar.jsp" />

			<!-- Layout container -->
			<div class="layout-page">
				<!-- navbar  -->
				<jsp:include page="header.jsp" />

				<!-- Hoverable Table rows -->
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">Tables /</span> Question Table
						</h4>
						
						<!-- Add Question Form -->
						<form action="saveQuestion" method="post">
							<div class="modal fade" id="basicModal" tabindex="-1" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel1">Add Question</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close">
											</button>
										</div>
										<div class="modal-body">
											<div class="mb-3">
												<label class="form-label" for="basic-icon-default-fullname">
													Question Name 
												</label>
												<div class="input-group input-group-merge">
													<span id="basic-icon-default-fullname2" class="input-group-text"><i
														class="fa fa-question-circle"></i>
													</span> 
													<input type="text" name="question" class="form-control" id="basic-icon-default-fullname"
														placeholder="Enter Question " aria-label="Enter Subject Name"
														aria-describedby="basic-icon-default-fullname2">
												</div>
											</div>
											<div class="row">
												<div class="col mb-0">
													<label class="form-label" for="basic-icon-default-fullname">
														Enter Option 1 
													</label>
													<div class="input-group input-group-merge">
														<span id="basic-icon-default-fullname2" class="input-group-text"><i
															class="fa fa-check-circle-o"></i>
														</span> 
														<input type="text" name="option1" class="form-control"
															id="basic-icon-default-fullname" placeholder="Enter  Option  1 "
															aria-label="Enter Subject Name"
															aria-describedby="basic-icon-default-fullname2">
													</div>
												</div>
												<div class="col mb-0">
													<label class="form-label" for="basic-icon-default-fullname">
														Enter Option 2 
													</label>
													<div class="input-group input-group-merge">
														<span id="basic-icon-default-fullname2" class="input-group-text">
															<i class="fa fa-check-circle-o"></i>
														</span> <input type="text" name="option2" class="form-control"
															id="basic-icon-default-fullname" placeholder="Enter  Option  2 "
															aria-label="Enter Subject Name"
															aria-describedby="basic-icon-default-fullname2">
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col mb-0">
													<label class="form-label" for="basic-icon-default-fullname">
														Enter Option 3 
													</label>
													<div class="input-group input-group-merge">
														<span id="basic-icon-default-fullname2" class="input-group-text">
															<i class="fa fa-check-circle-o"></i>
														</span> 
														<input type="text" name="option3" class="form-control"
															id="basic-icon-default-fullname" placeholder="Enter  Option  3 "
															aria-label="Enter Subject Name" aria-describedby="basic-icon-default-fullname2">
													</div>
												</div>
												<div class="col mb-0">
													<label class="form-label" for="basic-icon-default-fullname">
														Enter Option 4 
													</label>
													<div class="input-group input-group-merge">
														<span id="basic-icon-default-fullname2" class="input-group-text">
															<i class="fa fa-check-circle-o"></i>
														</span> <input type="text" name="option4" class="form-control"
															id="basic-icon-default-fullname" placeholder="Enter  Option  4 "
															aria-label="Enter Subject Name"
															aria-describedby="basic-icon-default-fullname2">
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col mb-0">
													<label class="form-label" for="basic-icon-default-fullname">
														Enter Correct Option 
													</label>
													<div class="input-group input-group-merge">
														<span id="basic-icon-default-fullname2" class="input-group-text"><i
															class="fa fa-check-circle-o"></i>
														</span> 
														<input type="text" name="correctAnswer" class="form-control"
															id="basic-icon-default-fullname" placeholder="Enter Correct Option "
															aria-label="Enter Subject Name"
															aria-describedby="basic-icon-default-fullname2">
													</div>
												</div>
												<div class="col mb-0">
													<label class="form-label" for="basic-icon-default-fullname">
														Enter Marks </label>
													<div class="input-group input-group-merge">
														<span id="basic-icon-default-fullname2" class="input-group-text"><i
															class="fa fa-check-circle-o"></i>
														</span> 
														<input type="text" name="marks" class="form-control" id="h"
															placeholder="Enter Marks " aria-label="Enter Subject Name"
															aria-describedby="basic-icon-default-fullname2">
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col mb-0">
													<label class="form-label" for="basic-icon-default-fullname">
														Select Subject Name 
													</label>
													<div class="input-group input-group-merge">
														<select name="subjectMaster" class="select1 form-select" id="subjectbox">
															<option value="open this select menu...">Select Subject</option>
															<c:forEach items="${subject}" var="subject">
																<option value="${subject.subjectId}" id="abc">${subject.subjectName} </option>
															</c:forEach>

															<% String s = request.getParameter("subjectMaster"); out.println(s); %>
														</select>
													</div>
												</div>
												<div class="col mb-0">
													<label class="form-label" for="basic-icon-default-fullname">
														Enter Topic 
													</label>
													<div class="input-group input-group-merge">
														<select id="comboboxTopic" name="topicMaster" class="select2 form-select"></select>
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="mb-3">
													<label class="form-label" for="country">
														Difficulty Level Name
													</label> 
													<select name="difficultyLevelMaster" class="select2 form-select">
														<option value="open this select menu...">
															Select Level
														</option>
														<c:forEach items="${difficultyLevelMaster}"
															var="difficultyLevelMaster">
															<option value="${difficultyLevelMaster.levelId}"
																selected="selected">${difficultyLevelMaster.levelName}
															</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-outline-secondary"
												data-bs-dismiss="modal">Close
											</button>
											<button type="submit" class="btn btn-primary">Add Question</button>
										</div>
									</div>
								</div>
							</div>
						</form>
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicModal"
							style="float: right;">
							<i class='bx bx-plus'></i></span>&nbsp; Add
						</button>
						<br><br>

						<!-- Start Subject Table Design -->
						<div class="card">
							<div class="example">
								<h5 class="card-header">Question Table</h5>
								<div>
									<table class="table table-hover">
										<thead>
											<tr>
												<th>Question Name</th>
												<th>Subject Name</th>
												<th>Topic Name</th>
												<th>Difficulty level</th>
												<th>Actions</th>
											</tr>
										</thead>
									</table>
									<table class="table table-hover">
										<tbody class="table-border-bottom-0">
											<c:forEach items="${questionMaster}" var="questionMaster">
												<div class="tab-accordian">
													<div class="titleWrapper inactive row">
														<b style="padding: 40px; width: 400px;" class="col">${questionMaster.question}</b>
														<b style="padding: 30px" class="col">${questionMaster.subjectMaster.subjectName}</b>
														<b style="padding: 30px" class="col">${questionMaster.topicMaster.topicName}</b>
														<b style="padding: 30px" class="col">${questionMaster.difficultyLevelMaster.levelName}</b>
														<p style="padding: 30px" class="col">
															<a href="findOne2/${questionMaster.questionId}" class="eBtn2">
																<button type="submit" class="table-actbtn pushable"
																	data-bs-toggle="modal" data-bs-target="#updateModal">
																	<i class="material-icons front">create</i>
																</button>
															</a>&nbsp;&nbsp;&nbsp; 
															<a href="deleteQuestion/${questionMaster.questionId}">
															<button type="submit" class="table-actbtn pushable">
																<i class="material-icons front">delete</i>
															</button></a>&nbsp;&nbsp;&nbsp;
															<button type="button" class="table-actbtn pushable">
																<i class="material-icons front">visibility</i>
															</button>
														</p>
														</tr>
														<div class="collapse-icon">
															<div class="acc-close"></div>
															<div class="acc-open"></div>
														</div>
													</div>
													<div id="descwrapper" class="desWrapper">
														<ul>
															<li class="">${questionMaster.option1}</li>
															<li class="">${questionMaster.option2}</li>
															<li class="">${questionMaster.option3}</li>
															<li class="">${questionMaster.option4}</li>
														</ul>
													</div>
												</div>
											</c:forEach>
										</tbody>
									</table>
								</div>
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
	<div class="myForm2">
		<form action="save2" method="post">
			<div class="modal fade" id="updateModal" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel1">Update Questions</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col mb-3">
									<label for="nameBasic" class="form-label">Question Id</label> 
									<input type="text" id="questionId" name="questionId"
										class="form-control" placeholder="Enter Question" />
								</div>
							</div>
							<div class="row">
								<div class="col mb-3">
									<label for="nameBasic" class="form-label">Question Name</label>
									<input type="text" id="question" name="question"
										class="form-control" placeholder="Enter Question" />
								</div>
							</div>

							<div class="row">
								<div class="col mb-0">
									<label class="form-label" for="basic-icon-default-fullname"> Enter Option 1 </label>
									<div class="input-group input-group-merge">
										<span id="basic-icon-default-fullname2" class="input-group-text"><i
											class="fa fa-check-circle-o"></i></span> <input type="text"
											id="option1" name="option1" class="form-control"
											id="basic-icon-default-fullname" placeholder="Enter  Option  1 "
											aria-label="Enter Subject Name" aria-describedby="basic-icon-default-fullname2">
									</div>
								</div>
								<div class="col mb-0">
									<label class="form-label" for="basic-icon-default-fullname"> Enter Option 2 </label>
									<div class="input-group input-group-merge">
										<span id="basic-icon-default-fullname2"
											class="input-group-text"><i class="fa fa-check-circle-o"></i>
										</span> 
										<input type="text" id="option2" name="option2" class="form-control"
											id="basic-icon-default-fullname" placeholder="Enter  Option  2 "
											aria-label="Enter Subject Name" aria-describedby="basic-icon-default-fullname2">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col mb-0">
									<label class="form-label" for="basic-icon-default-fullname">
										Enter Option 3 
									</label>
									<div class="input-group input-group-merge">
										<span id="basic-icon-default-fullname2" class="input-group-text"><i
											class="fa fa-check-circle-o"></i>
										</span> 
										<input type="text" id="option3" name="option3" class="form-control"
											id="basic-icon-default-fullname" placeholder="Enter  Option  3 "
											aria-label="Enter Subject Name" aria-describedby="basic-icon-default-fullname2">
									</div>
								</div>
								<div class="col mb-0">
									<label class="form-label" for="basic-icon-default-fullname">
										Enter Option 4 
									</label>
									<div class="input-group input-group-merge">
										<span id="basic-icon-default-fullname2" class="input-group-text"><i
											class="fa fa-check-circle-o"></i></span> <input type="text"
											id="option4" name="option4" class="form-control"
											id="basic-icon-default-fullname" placeholder="Enter  Option  4 "
											aria-label="Enter Subject Name"
											aria-describedby="basic-icon-default-fullname2">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col mb-0">
									<label class="form-label" for="basic-icon-default-fullname"> Enter Correct Option </label>
									<div class="input-group input-group-merge">
										<span id="basic-icon-default-fullname2" class="input-group-text"><i
											class="fa fa-check-circle-o"></i></span> <input type="text"
											id="correctAnswer" name="correctAnswer" class="form-control"
											id="basic-icon-default-fullname" placeholder="Enter Correct Answer"
											aria-label="Enter Correct Answer"
											aria-describedby="basic-icon-default-fullname2">
									</div>
								</div>
								<div class="col mb-0">
									<label class="form-label" for="basic-icon-default-fullname"> Enter Marks </label>
									<div class="input-group input-group-merge">
										<span id="basic-icon-default-fullname2" class="input-group-text">
										<i class="fa fa-check-circle-o"></i></span> 
										<input type="text" id="marks" name="marks" class="form-control"
											id="basic-icon-default-fullname" placeholder="Enter Marks "
											aria-label="Enter Marks" aria-describedby="basic-icon-default-fullname2">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col mb-0">
									<label class="form-label" for="basic-icon-default-fullname">
										Select Subject Name </label>
									<div class="input-group input-group-merge">
										<select name="subjectMaster" class="select2 form-select" id="subjectbox1">
											<option value="open this select menu...">Select Subject</option>
											<c:forEach items="${subject}" var="subject">
												<option value="${subject.subjectId}" selected="selected">${subject.subjectName}
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col mb-0">
									<label class="form-label" for="basic-icon-default-fullname"> Enter Topic </label>
									<div class="input-group input-group-merge">
										<select id="comboboxTopic1" name="topicMaster" class="select2 form-select"></select>
									</div>
								</div>
							</div>
							<br><br>
							<div class="row">
								<div class="col mb-3">
									<label class="form-label" for="basic-icon-default-fullname"> Difficulty Level</label> 
									<select name="difficultyLevelMaster"
										id="difficultyLevelMaster" class="select2 form-select">
										<option value="open this select menu...">Select Level</option>
										<c:forEach items="${difficultyLevelMaster}"
											var="difficultyLevelMaster">
											<option value="${difficultyLevelMaster.levelId}"
												selected="selected">${difficultyLevelMaster.levelName}
											</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Update changes</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
