<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- profession mypage navigation -->
<nav id="side-nav">
	<div class="pro-mypage-list" id="pro-info">
		<div id="img-box">
			<a href="#page-top"> <span class="d-none d-lg-block"><img
					id="img-user-pic" src="/resources/image/${professionProfile.pPic}" /></span>
			</a>
		</div>
		<div id="user-info">
			<p id="user-name">${user.uName}전문가님</p>
			<p id="user-email">${user.uEmail}</p>
		</div>
	</div>
	<div class="pro-mypage-list" id="pro-profile">
		<p>나의 정보</p>
		<ul class="nav-list">
			<li class="nav-item"><a class="nav-link" href=#>나의 회원 정보</a></li>
			<li class="nav-item"><a class="nav-link" href=#>나의 전문가 프로필</a></li>
		</ul>
	</div>
	<div class="pro-mypage-list" id="pro-rsv">
		<p>전문가 예약</p>
		<ul class="nav-list">
			<li class="nav-item"><a class="nav-link"
				href="getRsvListView.do">예약된 일정 보기</a></li>
			<li class="nav-item"><a class="nav-link"
				href="getCompleteView.do">완료된 일정 보기</a></li>
			<!-- <li class="nav-item"><a class="nav-link" href=#>나를 찜한 회원??</a></li> -->
		</ul>
	</div>
	<div class="pro-mypage-list" id="haeyo-info">
		<p>해요 안내</p>
		<ul class="nav-list">
			<li class="nav-item"><a class="nav-link" href=#>이용 안내 </a></li>
			<li class="nav-item"><a class="nav-link" href=#>공지 사항</a></li>
			<li class="nav-item"><a class="nav-link" href=#>질의 응답</a></li>
		</ul>
	</div>
</nav>
<!-- profession mypage navigation -->