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
<link href="resources/css/togetherMain.css?v=<%=System.currentTimeMillis()%>" rel="stylesheet">
<script src="resources/js/togetherMain.js?v=<%=System.currentTimeMillis()%>"></script>
<title>함께해요 메인페이지</title>
</head>
<body>
	<!------- navigation start---------->
	<section id="navWrap" class="clearfix">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
			id="t_navbar1">
			<div class="collapse navbar-collapse" id="t_navbar2">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active" class="t_navbar-items"><a
						class="nav-link" href="t_openBoardList.do?tHeader=함께먹어요">함께 먹어요 <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="t_openBoardList.do?tHeader='함께출퇴근해요'">함께 출퇴근해요</a></li>
					<li class="nav-item"><a class="nav-link"
						href="t_openBoardList.do?tHeader='함께나눠요'">함께 나눠요</a></li>
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
	<div id="upperChange"><!--CSS추가 노노 -->
		<div id="t_uppercontents">
			<div id="t_uppercontent">
				<h2>
					<span>혼자하는 것</span>이 익숙한 사람
				</h2>
				<h2>
					<span>혼자하고 싶은</span> 사람
				</h2>
				<div id="pWrap">
					<p>지금 바로 해요의 커뮤니티에 당신의 일상을</p>
					<p>함께 공유해보세요</p>
					<div>
						<a href="t_getWritingBoard.do">
							<button type="submit" id="heayo_writing_Mainbtn">글 작성하기</button>
						</a>
					</div>
				</div>
			</div>
		</div>
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
						<a href="t_getBoard.do?tNo=${board.tNo}&tHeader=${board.tHeader}"> <img
							src="/WEB-INF/boardImages/${board.tPic1}" height="250" width="250">
						</a>
					</div>
					<div id="tTitle">${board.tTitle}</div>
					<div id="tHeader">
						<button type="submit" class="heayo_btn">${board.tHeader}</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="paging_box">
		</div>
	</div>
	<!------- contents end --------->
</body>
</html>