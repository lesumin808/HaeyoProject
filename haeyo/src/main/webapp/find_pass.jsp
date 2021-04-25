<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.haeyo.biz.user.UserVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Join</title>
<link href="resources/image/icon.ico" rel="shortcut icon"
	type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<link href="resources/css/find_pass.css" rel="stylesheet">
<!-- <link href="css/main.css" rel="stylesheet"> -->
<link href="resources/css/header.css" rel="stylesheet">
<script defer src="resources/js/common.js"></script>
</head>

<body>
	<form:form id="signupform" class="form-horizontal" role="form"
		commandName="findvo" action="find_pass" method="post">
		<div class="form-group">
			<label for="uEmail">이메일</label> <input type="text"
				class="form-control" name="UEmail" value="${findvo.uEmail}"
				placeholder="이메일을 작성해주세요">
		</div>


		<div style="color: red; margin-top: 2px">
			<form:errors path="uEmail" />
			<form:errors />
		</div>


		<div class="form-group" style="margin-left: 82%">
			<!-- Button -->

			<div class="col-md-offset-10 col-md-9">
				<button id="btn-signup" type="submit" class="btn btn-warning">확인</button>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-12 control">
				<div
					style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
					가입하신 이메일로 아이디와 비밀번호를 전송해드리겠습니다.</div>
			</div>
		</div>

	</form:form>
</body>

</html>



