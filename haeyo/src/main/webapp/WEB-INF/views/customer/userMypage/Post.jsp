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
<link href="resources/css/UserMypage/05_User_mypage_Board.css?v=<%=System.currentTimeMillis()%>" rel="stylesheet">
<script src="resources/js/togetherMain.js?v=<%=System.currentTimeMillis()%>"></script>
<title>내가쓴글모아보기</title>
</head>

<!------- sidebar Start -------> 

        <div id="container">
            <!-- profession mypage navigation -->
            <nav id="user-side-nav">
                <div class="user-mypage-list" id="user-info">
                    <div id="user-img-box">
                        <a href="#user-page-top">
                            <span class="d-none d-lg-block"><img id="img-user-pic" src="/resources/image/${user.uPic}"
                                    alt="" /></span>
                        </a>
                    </div>
                    <div id="user-info">
                        <p id="user-name">${user.uName}님, 기다렸어요:)</p>
                        <p id="user-email">${user.uEmail}</p>
                    </div>
                </div>
                <div class="user-mypage-list" id="user-profile">
                   <p>나의 정보</p>
                    <ul class="nav-list">
                        <li class="nav-item"><a class="nav-link" href="mypageinfo.do">나의 회원 정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="UserMypageInfoUpdate.do">회원 정보 관리</a></li>
                    </ul>
                </div>
                <div class="user-mypage-list" id="user-content">
                    <p>커뮤니티</p>
                    <ul class="nav-list">
                        <li class="nav-item"><a class="nav-link" href=#>내가 작성한 글</a></li>
                        <li class="nav-item"><a class="nav-link" href="getUserReply.do?uNo=${user.uNo}">내가 작성한 댓글</a></li>
                        <li class="nav-item"><a class="nav-link" href=#>나의 찜한 글</a></li>
                    </ul>
                </div>
                <div class="user-mypage-list" id="user-rsv">
                    <p>전문가 예약</p>
                    <ul class="nav-list">
                        <li class="nav-item"><a class="nav-link" href=#>예약 일정</a></li>
                        <li class="nav-item"><a class="nav-link" href=#>완료한 일정</a></li>
                        <li class="nav-item"><a class="nav-link" href=#>내가 찜한 전문가</a></li>
                    </ul>
                </div>
                <div class="user-mypage-list" id="haeyo-info">
                    <p>해요 안내</p>
                    <ul class="nav-list">
                        <li class="nav-item"><a class="nav-link" href=#>이용 안내 </a></li>
                        <li class="nav-item"><a class="nav-link" href=#>공지 사항</a></li>
                        <li class="nav-item"><a class="nav-link" href=#>질의 응답</a></li>
                    </ul>
                </div>
            </nav>	
  <!------- sidebar end --------->
	<!-- 내가 쓴 글 모아보기 start -->
     
            <!-- User mypage My information-->
            <section>
                <div id="main-header">
                    <h5>나의 정보</h5>
                    <p>회원 정보 관리</p>
                </div>
                
	<div id="t_contents" class="clearfix">
		<div>
			<a href="t_getWritingBoard.do" id="writingBoard">
				<button type="submit" id="heayo_writing_btn">
					글 작성<i class="fas fa-chevron-right"></i>
				</button>
			</a>
		</div>
		<div id="t_content_box">
			<c:forEach var="board" items="${boardList}">
				<div id="t_content">
					<div id="tAddress_Bookmark" class="clearfix">
						<div id="tAddress">${board.tAddress}</div>
						<c:choose>
							<c:when test="${board.tBookmarkVO.tNo != null}">
								<div class="tBookmark select" id="${board.tNo}"  onclick="checkBookmark(${board.tNo})">1</div>
							</c:when>
							<c:otherwise>
								<div class="tBookmark" id="${board.tNo}" onclick="checkBookmark(${board.tNo})">0</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div id="imgWrap">
						<a href="t_getBoard.do?tNo=${board.tNo}"> <img src="/WEB-INF/boardImages/${board.tPic}" height="250" width="250">
						</a>
					</div>
					<div id="tTitle">${board.tTitle}</div>
					<div id="tHeader">
						<button type="submit" class="heayo_btn">${board.tHeader}</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!------- 내가 쓴 글 모아보기 end --------->

	
</body>
</html>