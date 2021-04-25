<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="image/icon.ico" rel="shortcut icon" type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/header.css" rel="stylesheet">
<link href="resources/css/togetherBoardList.css?v=<%=System.currentTimeMillis()%>"rel="stylesheet">
<script src="resources/js/togetherBoardList.js?v=<%=System.currentTimeMillis()%>"></script>
<script>
	$(document).ready(function(){
		var tHeader = "<c:out value='${tHeader}'/>";
		console.log("tHeader"+tHeader);
		
		if(tHeader == ''){
			getTboardList("함께먹어요", 1);
		}else{
			getTboardList(tHeader, 1);
		}
		
		//페이지 시작시 검색 자동 완성창 숨기기
		$('#previewSearch').hide();
	});
</script>
<title>함께해요 메인페이지</title>
</head>
<body>
	<!------- headerStart ------->
	<header id="header">
		<nav id="nav">
			<logo id="logo"> <a href="index.html"><img
				src="resources/image/logo2.png" alt="로고"></a> </logo>
			<ul>
				<li><a href="t_getBoardMain.do">함께해요</a></li>
				<li><a href="#">혼자해요</a></li>
				<li><a href="#">전문가 신청</a></li>
				<li><a href="Testlogin.jsp">로그인</a></li>
				<li class="btn-group">
					<ul class="dropdown-toggle bell" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-bell"></i>
					</ul>
					<div class="dropdown-menu dropdown-menu-right alarm1">
						<p>알림</p>
						<div id="alarmTxt">회원님이 결제를 완료하셨습니다.</div>
						<span>23분전</span>
					</div>
				</li>
				<li class="btn-group">
					<div class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">${user.uNick}님</div>
					<div class="dropdown-menu dropdown-menu-right" id="profile">
						<div id="profiteTxt">
							<span>반갑습니다! </span>${user.uNick}님</div>
						<ul class="profileMenu">
							<li><i class="fas fa-user menuico"></i>마이페이지</li>
							<li><i class="fas fa-sign-out-alt menuico"></i>로그아웃</li>
							<li><i class="fas fa-exchange-alt menuico"></i>전문가로 전환</li>
						</ul>
					</div>
				</li>
			</ul>
		</nav>
	</header>
	<!------- headerEND ------->
	<!------- navigation start---------->
	<section id="navWrap" class="clearfix">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
			id="t_navbar1">
			<div class="collapse navbar-collapse" id="t_navbar2">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active" class="t_navbar-items"><a
						class="nav-link" href="#" onclick="getTboardList('함께먹어요', 1);">함께 먹어요<span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#" onclick="getTboardList('함께출퇴근해요', 1);">함께 출퇴근해요</a></li>
					<li class="nav-item"><a class="nav-link"
						href="#" onclick="getTboardList('함께나눠요', 1);">함께 나눠요</a></li>
					<li>
						<form class="form-inline my-2 my-lg-0">
							<input class="form-control mr-sm-2" type="text" placeholder="Search"
								 id="searchInput" onkeyup="previewBoardList();" autocomplete="off">
							<button type="button" class="btn btn-secondary my-2 my-sm-0" onclick="searchBoardList(1);">Search</button>
							<div id="previewSearch">
							</div>
						</form>
					</li>
				</ul>
			</div>
		</nav>
	</section>
	<!------- navigation end---------->
	<div id="upper_box">
	</div>
	<!------- contents start --------->
	<div id="t_contents" class="clearfix">
		<div>
			<a href="t_getWritingBoard.do" id="writingBoard">
				<button type="submit" id="heayo_writing_btn">
					글 작성<i class="fas fa-chevron-right"></i>
				</button>
			</a>
		</div>
		<div id="t_content_box">
		</div>
		<div id="paging_box">
		</div>
	</div>
	<!------- contents end --------->

	<!------- footerStart ------->
	<footer id="footer">
		<section id="bottom" class="clearfix">
			<div class="phone">
				<p>
					<span>1599-2121</span>
				</p>
				<p>평일 10:00 - 18:00</p>
				<p>(점심시간 13:00 - 14:00 제외·주말/공휴일 제외)</p>
				<ul class="sns">
					<li><i class="fab fa-facebook"></i></li>
					<li><i class="fab fa-instagram"></i></li>
					<li><i class="fab fa-youtube"></i></li>
				</ul>
			</div>
			<div class="service">
				<ul>
					<li class="sevName">해요소개</li>
					<li>회사소개</li>
					<li>채용안내</li>
				</ul>
				<ul>
					<li class="sevName">고객안내</li>
					<li>이용안내</li>
					<li>안전정책</li>
					<li>예상금액</li>
					<li>전문가소개</li>
				</ul>
				<ul>
					<li class="sevName">전문가안내</li>
					<li>이용안내</li>
					<li>전문가가이트</li>
					<li>전문가가입</li>
				</ul>
				<ul>
					<li class="sevName">고객센터</li>
					<li>공지사항</li>
					<li>자주묻는질문</li>
				</ul>
			</div>
		</section>
		<section id="bottomtxt">
			<p>(주)해요모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행,
				계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</p>
			<p>상호명:(주)해요모바일 · 대표이사:1조 · 개인정보책임관리자:1조 · 주소:서울특별시 마포구 거구장, 지하
				1층(커틀 타워)</p>
			<p>사업자등록번호:111-22-34323 · 통신판매업신고증:제 2015-서울강남-00567 호 · 직업정보제공사업
				신고번호:서울청 제 2019-21호</p>
			<p>고객센터:1599-2121 · 이메일:heayo@heayo.com</p>
			<p class="copy">Copyright heayo Web Inc. All Rights Reserved.</p>
		</section>
	</footer>
	<!------- footerEND ------->
</body>
</html>