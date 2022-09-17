<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
	<jsp:include page="head.jsp" />
	
	 <script  type="text/javascript" src="webjars/jquery/2.2.3/jquery.min.js"></script>
 
 <script type="text/javascript">

 $(document).ready(function(){
     	$('.table .eBtn3').on('click', function(event) {
     	event.preventDefault();
     	var href = $(this). attr('href');

     	$.get(href, function (difficultyLevelMaster, status) {
     		updateModal
     	$('.myForm3 #levelId').val(difficultyLevelMaster.levelId);
     	 $('.myForm3 #levelName').val(difficultyLevelMaster.levelName); 
     	

     	});

     	$('.myForm3 #updateModal').modal();

     	});

     	});
       </script>
    <body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
		<!-- sidebar start-->
		<jsp:include page="sidebar.jsp" />
		<!-- sidebar end -->
		<!-- Layout container -->
		<div class="layout-page">
		<!-- navbar start -->
		<jsp:include page="header.jsp" />
		<!--  Navbar end-->
		<!-- Content wrapper -->
		<!-- include container -->
		<!-- Hoverable Table rows -->
		<div class="content-wrapper">
		<!-- Content -->
		<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
		<span class="text-muted fw-light">Tables /</span> Difficulty Level Table
		</h4>
		<!-- Add Subject Form -->
		<!-- Button trigger modal -->
		
		<form action="saveLevel" method="post">
		<div class="modal fade" id="basicModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
		<div class="modal-content">
		<div class="modal-header">
		<h5 class="modal-title" id="exampleModalLabel1">Add Difficulty Level</h5>
	    <button type="button" class="btn-close" data-bs-dismiss="modal" 
	    aria-label="Close"></button>
		</div>
		<div class="modal-body">
		<div class="row">
		<div class="mb-3">
        <label class="form-label" for="basic-icon-default-fullname">Difficulty Level</label>
        <div class="input-group input-group-merge">
        <span id="basic-icon-default-fullname2" class="input-group-text"><i class="bx bxs-book"></i></span>
        <input type="text" name="levelName" class="form-control" id="basic-icon-default-fullname" placeholder="Enter Difficulty Level" aria-label="Enter Subject Name" aria-describedby="basic-icon-default-fullname2">
         </div>
        </div>
	    
	    </div>
	    
	    
	    
	   
		
	    </div>
	    <div class="modal-footer">
	    <button type="button" class="btn btn-outline-secondary" 
	    data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">ADD LEVEL</button>
		</div>
		</div>
		</div>
		</div>
		</form>
		
		<!-- End Subject Form -->
		
		<button type="button" class="btn btn-primary"
		data-bs-toggle="modal" data-bs-target="#basicModal"
		style="float: right;">
		<i class='bx bx-plus'></i></span>&nbsp; Add
		</button>
		<br><br>
		
		<!-- Start Subject Table Design -->
		
        <div class="card">
		<h5 class="card-header">Difficulty Level Table</h5>
		<div class="table-responsive text-nowrap">
		<table class="table table-hover">
		<thead>
		<tr>
		<th><b>sr.No</b></th>
		<th><b>Difficulty Level</b></th>
		
        <th><b>Actions</b></th>
		</tr>
		</thead>
		<tbody class="table-border-bottom-0">
		
		
			<c:forEach items="${difficultyLevelMaster}" var="difficultyLevelMaster">
		
		<tr>
		<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
		<strong><c:set var="count" value="${count + 1}" scope="page" />
							<c:out value="${count}" /></strong></td>
		<td>${difficultyLevelMaster.levelName}</td>
		
	    
        <td>
        <a href="findOne3/${difficultyLevelMaster.levelId}" class="eBtn3"><button type="submit" class="table-actbtn pushable " data-bs-toggle="modal" data-bs-target="#updateModal"  >
		<i class="material-icons front">create</i>
		</button></a>&nbsp;&nbsp;&nbsp;
		<a href="deleteLevel/${difficultyLevelMaster.levelId}"><button type="submit" class="table-actbtn pushable">
		<i class="material-icons front">delete</i>
		</button></a>
		</td>
        </tr>
        </c:forEach>
        </tbody>
        </table>
		</div>
	    </div>
		</div>
        <!--/ Hoverable Table rows -->
		<!-- end container -->
		<!-- End Subject Table Design -->
		<!-- Content wrapper -->
        <jsp:include page="footer.jsp" />
		<!-- / Layout page -->
		</div>
		</div>
		</div>
		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->


        <!--  Update Subject Form
		Button trigger modal -->
		<div class="myForm3">
		<form action="save3" method="post">
		<div class="modal fade" id="updateModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
		<div class="modal-content">
		<div class="modal-header">
		<h5 class="modal-title" id="exampleModalLabel1">Update Difficulty Level</h5>
	    <button type="button" class="btn-close" data-bs-dismiss="modal" 
	    aria-label="Close"></button>
		</div>
		<div class="modal-body">
		<div class="row">
		<div class="col mb-3">
		
		<label for="nameBasic" class="form-label"> Level Id</label>
		<input type="text" name="levelId" id="levelId" class="form-control"
		placeholder="Enter Difficulty Level" />
	    </div>
	    
	    </div>
	    <div class="row">
		<div class="col mb-3">
		
		<label for="nameBasic" class="form-label">Difficulty Level</label>
		<input type="text" name="levelName" id="levelName" class="form-control"
		placeholder="Enter Difficulty Level" />
	    </div>
	    
	    </div>
	   
		
	    </div>
	    <div class="modal-footer">
	    <button type="button" class="btn btn-outline-secondary" 
	    data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Update Level</button>
		</div>
		</div>
		</div>
		</div>
		</form>
		</div>
		<!-- End Update Subject Form  -->


</body>
</html>
