<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Add Topic Form</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;;
}

.container {
	position: relative;
	max-width: 530px;
	width: 200%;
	background: #fff;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	margin: 0 20px;
}

.container .forms {
	display: flex;
	align-items: center;
	height: 470px;
	width: 200%;
	transition: height 0.2s ease;
}

.container .form {
	width: 50%;
	padding: 30px;
	background-color: #fff;
	transition: margin-left 0.18s ease;
}

.container.active .subject {
	margin-left: -50%;
	opacity: 0;
	transition: margin-left 0.18s ease, opacity 0.15s ease;
}

.container .signup {
	opacity: 0;
	transition: opacity 0.09s ease;
}

.container.active .signup {
	opacity: 1;
	transition: opacity 0.2s ease;
}

.container.active .forms {
	height: 600px;
}

.container .form .title {
	position: relative;
	font-size: 32px;
	text-align: center;
	font-weight: 600;
	color: #9549b6;
}

.form .title::before {
	content: '';
	position: absolute;
	left: 0;
	bottom: 0;
	height: 3px;
	text-align: center;
	width: 30px;
	border-radius: 25px;
}

.form .input-field {
	position: relative;
	height: 50px;
	width: 100%;
	margin-top: 30px;
}

.input-field input {
	position: absolute;
	height: 100%;
	width: 100%;
	padding: 0 35px;
	border: none;
	outline: none;
	font-size: 20px;
	border-bottom: 2px solid #ccc;
	border-top: 2px solid transparent;
	transition: all 0.2s ease;
}

.input-field label {
	position: absolute;
	height: 100%;
	width: 100%;
	padding: 0 35px;
	border: none;
	outline: none;
	font-size: 16px;
	border-bottom: 2px solid #ccc;
	border-top: 2px solid transparent;
	transition: all 0.2s ease;
}

.input-field select.list {
	position: absolute;
	width: 56%;
	font-size: large;
	margin-top: -16px;
	height: 98%;
	margin-left: 20px;
}

.input-field i {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	color: #999;
	font-size: 23px;
	transition: all 0.2s ease;
}

.input-field i.icon {
	left: 0;
}

.input-field i.showHidePw {
	right: 0;
	cursor: pointer;
	padding: 10px;
}

.form .checkbox-text {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 20px;
}

.checkbox-text .checkbox-content {
	display: flex;
	align-items: center;
}

.checkbox-content input {
	margin: 0 8px -2px 4px;
	accent-color: #464EB8;
}

.form .text {
	color: #333;
	font-size: 14px;
}

.form a:hover {
	text-decoration: underline;
}

.form .button {
	margin-top: 35px;
}

.form .button input {
	border: none;
	color: #fff;
	font-size: 17px;
	font-weight: 500;
	letter-spacing: 1px;
	border-radius: 6px;
	background-color: #9549b6;
	cursor: pointer;
	transition: all 0.3s ease;
	width: 50%;
	max-width: fit-content;
	margin-left: 141px;
}

.form .login-signup {
	margin-top: 30px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="forms">
			<div class="form subject">
				<span class="title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Add Topic</span> <br> <br>
				<form action="/saveTopic" method="post">
					<div class="input-field">
						<b style="color: #999; font-size: 20px;"><b><h9>Choose Subject :</h9></b> 
						<select name="subjectMaster" class="select2 form-select">
							<option value="open this select menu...">Open this select menu...</option>
							<c:forEach items="${subject}" var="subject">
								<option value="${subject.subjectId}" selected="selected">${subject.subjectName} </option>
							</c:forEach>
						</select>
					</div>
					<div class="input-field">
						<input type="text" name="topicName" placeholder="Enter Topic Name" required> <i class="fa fa-book"></i>
					</div>
					<div class="input-field button">
						<input type="submit" id="example3" value="Add Topic">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>