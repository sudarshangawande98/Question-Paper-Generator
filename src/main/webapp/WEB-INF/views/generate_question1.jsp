<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List,java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<jsp:include page="head.jsp" />
<script type="text/javascript" src="webjars/jquery/2.2.3/jquery.min.js"></script>
<script src="../assets/js/app.js"></script>
<style>
#error {
	color: red;
	text-align: center;
}

.desk {
	text-align: center;
}
</style>

<script>
$(document).ready(function(){
	$('#subjectbox').on('change', function(){
		var subjectId = $(this).val();
		console.log(subjectId);
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath}/getTopicDropdown/' + subjectId,
			success: function(result) {
				console.log(result);				
				var s = '';
				for(var i = 0; i < result.length; i++) {
					s += '<tr  onchange="validateForm()" ><td><div class="form-check mt-3" ><input value="' + result[i].topicId + 
					'" type="checkbox"> <label class="form-check-label" for="defaultCheck1"> '+ result[i].topicName+ 
					'</label></div></td><td><input type="text" class="form-control" id="' + "hard" + result[i].topicId + '" placeholder="Enter No of Hard Question" " name="hard1" /></td><td><input type="text" class="form-control" id="' + "medium" + result[i].topicId + '" placeholder="Enter No of Medium Question" /></td><td><input type="text" class="form-control" id="' + "low" + result[i].topicId + '" placeholder="Enter No of Low Question" /></td>';
	                    s+='</tr>';                          
	    				console.log(result[i].topicId);
				}
				$('#check').html(s);
			}
		});
	});
});
</script>

<script>
    function GetSelected() {
        var selected = new Array();
        var selected1 = {};
        var list = document.getElementById("check");

        //Reference all the CheckBoxes in Table.
        var chks = list.getElementsByTagName("INPUT");
        
        // Loop and push the checked CheckBox value in Array.
        for (var i = 0; i < chks.length; i++) {      
            if (chks[i].checked) {         	 
            	var s=document.getElementById("subjectbox");
            	var subjectName = s.options[s.selectedIndex].text;
           	    console.log("The selected value=" + subjectName);
           		var s1=document.getElementById("subjectbox").value;
            	var d=document.getElementById("duration").value;
            	var t=document.getElementById("testDate").value;
            	var h=document.getElementById("hard"+chks[i].value).value;
            	 
                var m=document.getElementById("medium"+chks[i].value).value;
                var l=document.getElementById("low"+chks[i].value).value;
                totalnoquestion
                var totalnoquestion=document.getElementById("totalnoquestion").value;
            	var tqno=document.getElementById("totalnoquestion").value;  																													
                selected.push({"subjectMaster":{"subjectId":s1,"subjectName":subjectName},"totalNoOfQuestion":tqno,"duration":d,"testDate":t,"topicMaster": {
                    "topicId":chks[i].value},"totalNoOfHardQuestion":h,"totalNoOfMediumQuestion":m,"totalNoOfLowQuestion":l});  
            }  
        }    
        var hidden=document.getElementById("hidden_id");
        hidden.value=JSON.stringify(selected);
    };
    
    function validateForm() {
    	var list = document.getElementById("check");

         //Reference all the CheckBoxes in Table.
         var chks = list.getElementsByTagName("INPUT");
         var temp=0;
         var tq1=document.getElementById("totalnoquestion").value;

         // Loop and push the checked CheckBox value in Array.
		 for (var i = 0; i < chks.length; i++) {
        	if (chks[i].checked) {
         		var h=document.getElementById("hard"+chks[i].value).value;
                var m=document.getElementById("medium"+chks[i].value).value;
                var l=document.getElementById("low"+chks[i].value).value;
                var addition = (+h)+(+m)+(+l);
                temp=temp+addition;
             }
             
             var error = document.getElementById("error");
             var  alert="Please Enter ";
        	 console.log(chks[i].value);
			 if(+tq1 < +h || +m > +tq1 || +l > +tq1 || +temp > +tq1 ) {
             console.log(alert);
         	 	error.textContent = alert;
         	 	if(chks[i].value=="") { 
         	 		chks[i].disabled=true;
         	 	}
            }
            else{
         		error.textContent = "";
         		chks[i].disabled=false;
         	  }
    	}  
    }

    function MaximumNValidate() {
        var min = document.getElementById("minN").value;
        var max = document.getElementById("maxN").value;
        if (max < min) {
            alert("Maximum value must be greater than minimum value.");
        }
    }
</script>

<script>
   function selectedSubjectName() {
      var subjectIdNode = document.getElementById('subjectbox');
      var value =
      subjectIdNode.options[subjectIdNode.selectedIndex].text;
      console.log("The selected value=" + value);
   }
</script>

<meta http-equiv="Content-type" content="application/x-www-form-urlencoded; charset=UTF-8" />

<body>
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<jsp:include page="sidebar.jsp" />
			<div class="layout-page">
				<jsp:include page="header.jsp" />
				<div class="content-wrapper">
					<div class="content-wrapper">
						<div class="container-xxl flex-grow-1 container-p-y">
							<h4 class="fw-bold py-3 mb-4">
								<span class="text-muted fw-light">Forms/</span> generate Question Paper
							</h4>
							<div class="row">
								<div class="modal-body">
									<div class="row">
										<div class="col mb-3">
											<div class="card">
												<h5 class="card-header">Bordered Table</h5>
												<div class="card-body">
													<form action="/pdf" method="post"
														onsubmit="return GetSelected()" name="myForm">
														<div class="table-responsive text-nowrap">
															<table class="table table-bordered">
																<tr>
																	<th>Subject</th>
																	<td>
																		<div class="mb-3">
																			<input type="hidden" name="hiddenData" id="hidden_id">
																			<br> <select class="select1 form-select"
																				onchange="selectedSubjectName()" id="subjectbox">
																				<option value="open this select menu...">Select
																					Subject</option>
																				<c:forEach items="${subject}" var="subject">
																					<option value="${subject.subjectId}" id="abc">${subject.subjectName}
																					</option>
																				</c:forEach>
																			</select>
																		</div>
																	</td>
																	<th>Total Questions</th>
																	<td><input type="text" class="form-control"
																		id="totalnoquestion" size="5" pattern="[0-9]+"
																		title="please enter number only" required="required" /></td>
																	<th>Duration</th>
																	<td><input type="text" class="form-control"
																		id="duration" pattern="[0-9]+" size="5"
																		title="please enter number only" required="required" /></td>
																	<th>Conducted Date</th>
																	<td><input type="date" class="form-control"
																		id="testDate" pattern="[0-9]+"
																		title="please enter number only" required="required" /></td>
																</tr>
															</table>
														</div>
														<br>
														<br>
														<div class="table-responsive text-nowrap">
															<div class="desk">
																<span id="error" style="text-align: center;"></span>
															</div>
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th>Topic</th>
																		<th>Hard Question</th>
																		<th>Medium Level Question</th>
																		<th>Low Level Question</th>
																	</tr>
																</thead>
																<tbody id="check">
																	<tr>
																		<td><div class="form-check mt-3">
																				<input class="form-check-input" type="checkbox"
																					value="" id="defaultCheck1"> <label
																					class="form-check-label" for="defaultCheck1">Select
																					Topics </label>
																			</div></td>
																		<td><input type="text" class="form-control"
																			id="hard" placeholder="Enter No of Hard Question" />
																		</td>
																		<td><input type="text" class="form-control"
																			id="medium" placeholder="Enter No of Medium Question" /></td>
																		<td><input type="text" class="form-control"
																			id="low" placeholder="Enter No of Low Question" />
																		</td>
																	</tr>
																</tbody>
															</table>
															<div class="modal-footer">
																<button type="submit" class="btn btn-primary"
																	onclick="selectedSubjectName()";>Save changes
																</button>
															</div>
														</div>
													</form>
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
