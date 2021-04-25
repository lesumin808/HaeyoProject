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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/common.css" rel="stylesheet">
<link href="resources/css/togetherBoard.css?v=<%=System.currentTimeMillis()%>" rel="stylesheet">
<script src="resources/js/togetherBoard.js?v=<%=System.currentTimeMillis()%>"></script>

<title>함께해요 읽기페이지</title>

</head>
<body>
	<!------- headerStart ------->
	<header id="header">
		<nav id="nav">
			<logo id="logo"> <a href="index.html"><img
				src="resources/image/logo.png" alt="로고"></a> </logo>
			<ul>
				<li><a href="t_getBoardMain.do">같이해요</a></li>
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
						aria-haspopup="true" aria-expanded="false">${user.uNic}님</div>
					<div class="dropdown-menu dropdown-menu-right" id="profile">
						<div id="profiteTxt">
							<span>반갑습니다! </span>${user.uNic}님</div>
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
	<div id="t_upper_contents">
		<div id="t_upper_content1">${board.tHeader}</div>
	</div>
	<!------- contents start --------->
	<div id="t_contents">
		<table >
			<tr>
				<th id="t_title" >${board.tTitle}</th>
				<c:choose>
					<c:when test="${board.tBookmarkVO.tNo != null}">
						<td class="tBookmark select" onclick="checkBookmark(${board.tNo})">1</td>
					</c:when>
					<c:otherwise>
						<td class="tBookmark" onclick="checkBookmark(${board.tNo})">0</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
		<div>
			<table class="table table-striped" id="t_content">
				<tr>
					<td rowspan="5"><img src="/WEB-INF/boardImages/${board.tPic1}" height="200" width="200"></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>${board.userVO.uNick}</td>
					<td>조회수 ${board.tHits}</td>
				</tr>
				<tr>
					<th >날짜</th>
					<td>${board.tJoinDate}</td>
					<td><button class="btn btn-primary">달력보기</button></td>
				</tr>
				<tr>
					<th>모임 장소</th>
					<td>${board.tAddress}</td>
					<td><button class="btn btn-primary">지도보기</button></td>
				</tr>
				<c:if test="${board.tHeader == '함께출퇴근해요'}">
					<tr>
					<th>도착 장소</th>
					<td>${board.tDestinationVO.dAddress}</td> <!-- 여기부터 다시하자 -->
					<td><button class="btn btn-primary">지도보기</button></td>
				</tr>
				</c:if>
				<tr>
					<th>인원</th>
					<td><span id="tJoinNow">${board.tJoinNow}</span>/${board.tJoinMax}</td>
					<td><button class="btn btn-primary" id="tJoinButton"
							onclick="checkJoin(${board.tNo},${board.tJoinNow},${board.tJoinMax})">참여하기</button></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td colspan="2">${board.tContent}</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th>사진</th>
					<td colspan="3"><img src="/WEB-INF/boardImages/${board.tPic2}" height="230"
						width="300"></td>
					<td></td>
				</tr>
			</table>
			<div id="map" style="width:100%;height:350px;"></div>
			<div id="middlebuttons">
				<c:if test="${board.hNo == userVO.uNo}">
					<div class="middlebutton">
						<a href="t_getUpdateBoard.do?tNo=${board.tNo}"><button
								class="btn btn-primary">수정하기</button></a>
					</div>
					<div class="middlebutton">
						<a href="t_deleteBoard.do?tNo=${board.tNo}"><button
								class="btn btn-primary">삭제하기</button></a>
					</div>
				</c:if>
				<div class="middlebutton">
					<a href="t_openBoardList.do?tHeader=${board.tHeader}"><button
					 	class="btn btn-primary">목록으로</button></a>
				</div>
			</div>
		</div>
		<div id="t_reply">
			<div>COMMENT</div>
			<table class="table" id="t_replyTable">
				<tr>
					<!-- 접속중인 user정보 가져와야함 -->
					<td>${userVO.uPic}</td>
					<th>${userVO.uNick}</th>
					<td>
						<form id="t_replyForm" method="GET">
							<input type="text" id="trContent" name="trContent"> <input
								type="hidden" id="uNo" name="uNo" value="${userVO.uNo}">
							<input type="hidden" id="tNo" name="tNo" value="${board.tNo}">
						</form>
					</td>
					<td><button class="heayo_btn" onclick="insertReply();">등록</button></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr id="t_reply_content">
					<c:forEach var="Reply" items="${ReplyList}">
						<tr id="trNo${Reply.trNo}">
							<td>${Reply.userVO.uPic}</td>
							<th>${Reply.userVO.uNick}</th>
							<td>${Reply.trContent}</td>
							<td>${Reply.trCredate}</td>
							<c:if test="${Reply.uNo == userVO.uNo}">
								<td><button class="heayo_btn"
										onclick="editReply(${Reply.trNo},${Reply.tNo});">수정</button></td>
								<td><button class="heayo_btn" 
										onclick="deleteReply(${Reply.trNo});">삭제</button></td>
							</c:if>
						</tr>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div>

	<!------- contents end --------->

	<!------- footerStart ------->
	<div id="footer0">
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
				<p>사업자등록번호:111-22-34323 · 통신판매업신고증:제 2015-서울강남-00567 호 ·
					직업정보제공사업 신고번호:서울청 제 2019-21호</p>
				<p>고객센터:1599-2121 · 이메일:heayo@heayo.com</p>
				<p class="copy">Copyright heayo Web Inc. All Rights Reserved.</p>
			</section>
		</footer>
	</div>
	<!------- footerEND ------->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a53c0b810ce1d051d15c474f3785be1d"></script>
<script>

	var tHeader = '${board.tHeader}';
	var tLocX = '${board.tLocX}';
	var tLocY = '${board.tLocY}';
	var dLocX = '${board.tDestinationVO.dLocX}';
	var dLocY = '${board.tDestinationVO.dLocY}';
	console.log(tHeader+","+tLocX+","+tLocY+","+dLocX+","+dLocY);
	
	if(tHeader == '함께출퇴근해요'){
		getCommuteMap();
	}else{
		getMap();
	}
	
	function getMap(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(tLocX, tLocY), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(tLocX, tLocY); 
	
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	}	
	
	function getCommuteMap(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(tLocX,tLocY),
		        level: 9 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
		    startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
		    startOption = { 
		        offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		    };
		
		// 출발 마커 이미지를 생성합니다
		var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);
		
		var startDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발 마커의 드래그 이미지 주소입니다    
		    startDragSize = new kakao.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다 
		    startDragOption = { 
		        offset: new kakao.maps.Point(tLocX, tLocY) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		    };
		
		// 출발 마커의 드래그 이미지를 생성합니다
		var startDragImage = new kakao.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);
		
		// 출발 마커가 표시될 위치입니다 ***
		var startPosition = new kakao.maps.LatLng(tLocX, tLocY); 
		
		// 출발 마커를 생성합니다
		var startMarker = new kakao.maps.Marker({
		    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
		    position: startPosition,
		    draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
		    image: startImage // 출발 마커이미지를 설정합니다
		});
		
		// 출발 마커에 dragstart 이벤트를 등록합니다
		kakao.maps.event.addListener(startMarker, 'dragstart', function() {
		    // 출발 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
		    startMarker.setImage(startDragImage);
		});
		
		// 출발 마커에 dragend 이벤트를 등록합니다
		kakao.maps.event.addListener(startMarker, 'dragend', function() {
		     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
		    startMarker.setImage(startImage);
		});
		
		var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
		arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
		arriveOption = { 
		    offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		};
		
		// 도착 마커 이미지를 생성합니다
		var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);
		
		var arriveDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // 도착 마커의 드래그 이미지 주소입니다    
		    arriveDragSize = new kakao.maps.Size(50, 64), // 도착 마커의 드래그 이미지 크기입니다 
		    arriveDragOption = { 
		        offset: new kakao.maps.Point(dLocX, dLocY) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		    };
		 
		// 도착 마커의 드래그 이미지를 생성합니다
		var arriveDragImage = new kakao.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);
		
		// 도착 마커가 표시될 위치입니다 **
		var arrivePosition = new kakao.maps.LatLng(dLocX, dLocY);    
		 
		// 도착 마커를 생성합니다 
		var arriveMarker = new kakao.maps.Marker({  
		    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
		    position: arrivePosition,
		    draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
		    image: arriveImage // 도착 마커이미지를 설정합니다
		});
		
		// 도착 마커에 dragstart 이벤트를 등록합니다
		kakao.maps.event.addListener(arriveMarker, 'dragstart', function() {
		    // 도착 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
		    arriveMarker.setImage(arriveDragImage);
		});
		
		// 도착 마커에 dragend 이벤트를 등록합니다
		kakao.maps.event.addListener(arriveMarker, 'dragend', function() {
		     // 도착 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
		    arriveMarker.setImage(arriveImage);  
		});
	}
</script>
<!-- 
<script src="resources/js/togetherMap.js?v=<%=System.currentTimeMillis()%>"></script>
-->
</body>
</html>