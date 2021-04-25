<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a53c0b810ce1d051d15c474f3785be1d&libraries=services"></script>
    <link href="resources/css/main.css" rel="stylesheet">
    <link href="resources/css/common.css" rel="stylesheet">
    <script defer src="resources/js/common.js"></script>
	<link href="resources/css/togetherInsertBoard.css?v=<%=System.currentTimeMillis()%>" rel="stylesheet">
<title>함께해요 게시글 작성</title>
    
</head>
<body>
    <!------- headerStart ------->
    <header id="header">
        <nav id="nav">
            <logo id="logo">
                <a href="index.html"><img src="resources/image/logo.png" alt="로고"></a>
            </logo>
            <ul>
                <li><a href="t_getBoardList.do">같이해요</a></li>
                <li><a href="#">혼자해요</a></li>
                <li><a href="#">전문가 신청</a></li>
                <li><a href="Testlogin.jsp">로그인</a></li>
                <li class="btn-group">
                    <ul class="dropdown-toggle bell" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-bell"></i></ul>
                    <div class="dropdown-menu dropdown-menu-right alarm1">
                        <p>알림</p>
                        <div id="alarmTxt">회원님이 결제를 완료하셨습니다.</div>
                        <span>23분전</span>
                    </div>
                </li>
                <li class="btn-group">
                    <div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${user.uNic}님</div>
                    <div class="dropdown-menu dropdown-menu-right" id="profile">
                        <div id="profiteTxt"><span>반갑습니다! </span>${user.uNic}님</div>
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

<!------- contents start --------->
	<div id="contents">
		<div id="writingheader">글 작성</div>
		<div id="insertForm">
			<form action="t_insertBoard.do" method="post" enctype="multipart/form-data">
				<div class="form-inline">
					<label for="exampleSelect1">말머리</label>
					<select class="form-control" id="tHeader" name="tHeader" onchange="dSearchLocShow(this.value);">
						<option value="함께먹어요">함께 먹어요</option>
						<option value="함께출퇴근해요">함께 출퇴근해요</option>
						<option value="함께나눠요">함께 나눠요</option>
					</select>
				</div>	
				<div class="form-group">
	     			<label for="tTitle">제목</label>
	    			<input type="text" class="form-control" id="tTitle" name="tTitle">
	  			</div>
					
				<div class="form-inline">
   					<label>모임 장소</label><br>
                      <input type="text" id="searchLoc1" name="tAddress" value="" class="form-control" /><input type="button" id="searchBtn1"
                          onclick="PostCode()" value="주소 검색" class="btn btn-primary"/>
                    <div id="map"></div>
                    <input type="hidden" id="tLocX" name="tLocX" value="" />
                    <input type="hidden" id="tLocY" name="tLocY" value="" />
	  			</div>
				<div class="form-inline" id="dSearchLoc">
	  			</div>
				<div class="form-group">
	     			<label for="tJoinDate">날짜</label>
	    			<input type="datetime-local" class="form-control" id="tJoinDate" name="tJoinDate">
	  			</div>
				<div class="form-inline">
					<label for="tJoinMax">참여가능 인원수</label>
					<select class="form-control" id="tJoinMax" name="tJoinMax">
						   <option>1</option>
						   <option>2</option>
						   <option>3</option>
						   <option>4</option>
						   <option>5</option>
						   <option>6</option>
						   <option>7</option>
						   <option>8</option>
						   <option>9</option>
						   <option>10</option>
					</select>
				</div>	
				<div class="form-group">
					<label for="tContent">내용</label>
					<textarea class="form-control" id="tContent" name="tContent" cols="8" rows="8"></textarea>
				</div>
				<div class="form-group">
					<label for="uploadFile1">썸네일 첨부</label>
					<input type="file" class="form-control-file" id="uploadFile1" name="uploadFile1" onchange="loadFile(event);">
				</div>
				<div class="form-group">
					<label for="uploadFile2">사진 첨부</label>
					<input type="file" class="form-control-file" id="uploadFile2" name="uploadFile2" onchange="loadFile(event);"/>
				</div>
				<input type="hidden" id="hNo" name="hNo" value="10001">
				<div id="insertbutton">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-primary">다시 쓰기</button>
					<button type="button" onclick="location.href='t_getBoardMain.do'" class="btn btn-primary">취소</button>
				</div>
			</form>
		</div>
	</div>
	
<!------- footerStart ------->
        <footer id="footer">
            <section id="bottom" class="clearfix">
                <div class="phone">
                    <p><span>1599-2121</span></p>
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
                <p>(주)해요모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</p>
                <p>상호명:(주)해요모바일 · 대표이사:1조 · 개인정보책임관리자:1조 · 주소:서울특별시 마포구 거구장, 지하 1층(커틀 타워)</p>
                <p>사업자등록번호:111-22-34323 · 통신판매업신고증:제 2015-서울강남-00567 호 · 직업정보제공사업 신고번호:서울청 제 2019-21호</p>
                <p>고객센터:1599-2121 · 이메일:heayo@heayo.com</p>
                <p class="copy">Copyright heayo Web Inc. All Rights Reserved.</p>
            </section>
        </footer>
<!------- footerEND ------->
    <script src="resources/js/togetherInsertBoard.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>