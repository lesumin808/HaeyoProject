<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script src="resources/js/jquery-1.12.4.min.js"></script>
<script src="resources/js/index.js" defer></script>
<link href="resources/css/header.css" rel="stylesheet">
<script>
window.onload = function(){
	wsOpen();
	//selectArlam(${user.uEmail});
}
</script>
<header id="header">
		<nav id="nav">
			<logo id="logo"> <a href="index"><img
				src="resources/image/logo2.png" alt="로고"></a> </logo>
			<ul>
				<li><a href="t_getBoardMain.do">같이해요</a></li>
				<li><a href="#">혼자해요</a></li>
				<li><a href="checkList.do">전문가 신청</a></li>
				<li class="btn-group">
                     <ul class="dropdown-toggle bell" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-bell"></i></ul>
                     <div class="dropdown-menu dropdown-menu-right alarm1">
                     	<p>알림</p>
                     	<div id="alarmTxt"></div>
                     </div>
                </li>
					<!-- 로그인을 하지 않은 상태  -->
					<c:if test="${user == null}">
						<li><a href="login.jsp">로그인</a></li>
					</c:if> <!-- 로그인한 상태  -->
					<c:if test="${user != null}">
						<li><a href="logout.do">로그아웃</a></li>
					</c:if>
				<!-- 전문가 채팅 test li -->
				<li><a href="chat.do" target="_blank">채팅창 열기</a></li>
				<li class="btn-group">
					<c:if test="${user != null}">
						<div class="dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">${user.uNick}님</div>
						<div class="dropdown-menu dropdown-menu-right" id="profile">
							<div id="profiteTxt">
								<span>반갑습니다! </span>${user.uNick}님</div>
								<input id="uEmail" type="hidden" value="${user.uEmail}" disabled/>
								<input id="uNo" type="hidden" value="${user.uNo}" disabled/>
							<ul class="profileMenu">
								<li><a href="mypageinfo.do"><i class="fas fa-user menuico"></i>마이페이지</a></li>
								<li><i class="fas fa-sign-out-alt menuico"></i>로그아웃</li>
								<li><i class="fas fa-exchange-alt menuico"></i><a href="getProfile.do">전문가로 전환></a></li>
							</ul>
						</div>
					</c:if>
					<c:if test="${user == null}">
					<!-- 로그인 기록 없을 시에 "님" 삭제 -->
					</c:if>
				</li>
			</ul>
		</nav>
	</header> <!------- headerEND ------->