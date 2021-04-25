<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.haeyo.biz.user.UserVO"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/main.css" rel="stylesheet">
    <link href="resources/css/header.css" rel="stylesheet">
    <link href="resources/css/UserMypage/01_User_mypageInfoUpdate.css" rel="stylesheet">
    <script defer src="resources/js/userMypage/01_User_mypage_out_modal.js"></script>
    <script defer src="resources/js/userMypage/01_User_mypage_profilePic_change.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>내정보수정하기</title>
</head>
<body>
	<%
	session = request.getSession();
	UserVO user = (UserVO) session.getAttribute("user");
	%>
    
	<!------- headerStart -------> <header id="header">
		<nav id="nav">
			<logo id="logo"> <a href="index"><img
				src="resources/image/logo.png" alt="로고"></a> </logo>
			<ul>
				<li><a href="t_getBoardMain.do">같이해요</a></li>
				<li><a href="#">혼자해요</a></li>
				<li><a href="checklist.jsp">전문가 신청</a></li>
				<li class="btn-group">
					<ul class="dropdown-toggle bell" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-bell"></i>
					</ul>
				<li>
					<!-- 로그인을 하지 않은 상태  --> <c:if test="${user == null}">
						<a href="Login.jsp">로그인</a>
					</c:if> <!-- 로그인한 상태  --> <c:if test="${user != null}">
						<a href="logout.do">로그아웃</a>
					</c:if>
				</li>

				<div class="dropdown-menu dropdown-menu-right alarm1">
					<p>알림</p>
					<div id="alarmTxt">회원님이 결제를 완료하셨습니다.</div>
					<span>23분전</span>
				</div>
				</li>
				<li class="btn-group">
					<c:if test="${user != null}">
						<div class="dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">${user.uNick}님</div>
						<div class="dropdown-menu dropdown-menu-right" id="profile">
							<div id="profiteTxt">
								<span>반갑습니다! </span>${user.uNick}님</div>
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
                        <li class="nav-item"><a class="nav-link" href="mypageinfo.do">내가 작성한 글</a></li>
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
            <!-- User mypage navigation -->
            <!-- User mypage My information-->
            <section>
                <div id="main-header">
                    <h5>나의 정보</h5>
                    <p>회원 정보 관리</p>
                </div>
                
              <form action = "updateMypage.do" name="form" method="post" enctype="multipart/form-data">
                
                <div id="user-mypage-content">
                    <h2>${user.uNick}님의 프로필</h2>
                    <div id="user-mypage-profile">
                    
                <!-- 마이페이지 사진 업로드 -->
                        <div id="user-mypage-thumb">  
                          <img id="thumb-img" src="/resources/image/${user.uPic}">
                            <label class="click-icon" for="user-thumb"><i class="fas fa-camera"></i></label> 
            			 <div>
                         	<input type='file' name='uploadFile'id="user-thumb" class="upload-box upload-plus" accept="image/*" onchange="thumbnail(event)">
                         </div>
                         </div>
                         <div id="user-nickname"> <input type="text" id="user-nickname-field" value="${user.uNick}" name="uNick"></div>
                               <!-- </div> -->
<%--                         <div id="user-nickname">${user.uNick} </div> --%>

                        <div class="user-mypage-info">
                            <div class="info-content1">
                                <div class="content"><span class="content-text">이 름</span></div>
                                <div class="content"><span class="content-text">${user.uName}</span></div>
                                <div class="block"></div>
                            </div>
                            <div class="info-content1">
                                <div class="content"><span class="content-text">이메일 주소</span></div>
                                <div class="content"><span class="content-text">${user.uEmail}</span></div>
                                <div class="block"></div>
                            </div>
                            <div class="info-content1">
                                <div class="content"><span class="content-text">비밀번호</span></div>
                                <div class="content"><span class="content-text">${user.uPwd}</span></div>
                                <div id="adjustBtn"><a href="UserMypagePwd.do"><i class="fas fa-angle-right"></a></i></div>

                            </div>
                            <div class="info-content1">
                                <div class="content"><span class="content-text">휴대전화 번호</span></div>
                                <div class="content"><span class="content-text">${user.uPhone}</span></div>
                                <div id="adjustBtn"><i class="fas fa-angle-right"></i></div>
                            </div>

   
                 
                            	<input type="hidden" name="uNo" value="${user.uNo}"/> 
                            <button class="modify_button" type ="submit">저장하기</button>
                            <button class="modify_button" onclick="location.href = ''">취소하기</button>
                        </div>
                    </div>
                </div>
     
        
        </form>
        </section>

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
    </wrap>
</body>

</html>

