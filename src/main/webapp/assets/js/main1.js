/**
 * 
 */
$(document).ready(function(){
    	$('.table .eBtn').on('click', function(event) {
    	event.preventDefault();
    	var href = $(this). attr('href');

    	$.get(href, function (subject, status) {

    	$('.myForm #subjectId').val(subject.subjectId);
    	 $('.myForm #subjectName').val(subject.subjectName); 
    	 $('.myForm #description').val(subject.description);

    	});

    	$('.myForm #updateModal').modal();

    	});

    	});
