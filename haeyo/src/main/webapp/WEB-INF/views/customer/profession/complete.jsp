<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<link href="resources/css/header.css" rel="stylesheet">
<link href="resources/css/profession/complete.css" rel="stylesheet">
<script type="text/javascript">
<script>
window.onload = function() {
	wsOpen();
}
</script>
<main>
	<input type="hidden" id="sessionId" value="">
	<div id="txtWrap">
		<div id="txt">
			<h1>결제가 완료되었습니다.</h1>
			<h1>
				<span>${user.uNick}님 감사합니다.</span>
			</h1>
		</div>
		<form action="chat.do" method="get" target="_blank">
			<input type="hidden" id="uNick" name="uNick" value="${user.uNick}" />
			<!-- <input type="hidden" id="pNo" name="pNo" value=""> -->
			<button id="mybtn" type="submit">전문가 채팅 연결하기</button>
		</form>
	</div>
</main>
