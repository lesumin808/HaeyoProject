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

	<!------- navigation start---------->
	<section id="navWrap" class="clearfix">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
			id="t_navbar1">
			<div class="collapse navbar-collapse" id="t_navbar2">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" id="myLoc">${userVO.uAddress}</a></li>
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
</body>
</html>