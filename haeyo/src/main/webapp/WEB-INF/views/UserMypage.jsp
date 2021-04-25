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
    <link href="resources/css/common.css" rel="stylesheet">
    <link href="resources/css/UserMypage/01_User_mypage.css" rel="stylesheet">
    <script defer src="resources/js/userMypage/01_User_mypage_out_modal.js"></script>
    <script defer src="resources/js/userMypage/01_User_mypage_profilePic_change.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>내정보보기</title>
</head>
<body>
	<%
	session = request.getSession();
	UserVO user = (UserVO) session.getAttribute("user");
	%>
    

    <wrap>
         <!------- headerStart ------->
         <header id="header">
                       <form action = "UserMypageInfoUpdate.do" name="form" method="post" enctype="multipart/form-data">
         
            <nav id="nav">
                <logo id="logo">
                    <a href="index.html"><img src="resources/image/logo.png" alt="로고"></a>
                </logo>
                <ul>
                    <li><a href="#">같이해요</a></li>
                    <li><a href="#">혼자해요</a></li>
                    <li><a href="#">전문가 신청</a></li>
                    <li><a href="Testlogin.jsp">로그인</a></li>
                    <li class="btn-group">
                        <ul class="dropdown-toggle bell" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"><i class="fas fa-bell"></i></ul>
                        <div class="dropdown-menu dropdown-menu-right alarm1">
                            <p>알림</p>
                            <div id="alarmTxt">회원님이 결제를 완료하셨습니다.</div>
                            <span>23분전</span>
                        </div>
                    </li>
                    <li class="btn-group">
                        <div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            회원님</div>
                        <div class="dropdown-menu dropdown-menu-right" id="profile">
                            <div id="profiteTxt"><span>반갑습니다! </span>${user.uName} 전문가님</div>
                            <ul class="profileMenu">
                                <li><i class="fas fa-user menuico"></i>마이페이지</li>
                                <li><i class="fas fa-sign-out-alt menuico"></i>로그아웃</li>
                                <li><i class="fas fa-exchange-alt menuico"></i>회원으로 전환</li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
        </header>
        <!------- headerEND ------->
        <div id="container">
            <!-- profession mypage navigation -->
            <nav id="user-side-nav">
                <div class="user-mypage-list" id="user-info">
                    <div id="user-img-box">
                        <a href="#user-page-top">
                            <span class="d-none d-lg-block"><img id="img-user-pic" src="/resources/image/${user.uPic}"/></span>
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
            <!-- User mypage navigation -->
            <!-- User mypage My information-->
            <section>
                <div id="main-header">
                    <h5>나의 정보</h5>
                    <p>회원 정보 관리</p>
                </div>
                <div id="user-mypage-content">
                    <h2>${user.uNick}님의 프로필</h2>
                    <div id="user-mypage-profile">
                            
                        <div id="user-mypage-thumb"><!--<div id="user-mypage-thumb">  -->
                          <img id = "thumb-img"  src="/resources/image/${user.uPic}">	<!-- <img id="thumb-img" > -->
                           </div>
                           
                           
                         <div id="user-nickname"> <span id="user-nickname-field">${user.uNick}님, 반가워요</span></div>
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
                                <div id="adjustBtn"><a href="getUpdatePwdUser.do"><i class="fas fa-angle-right"></a></i></div>

                            </div>
                            <div class="info-content1">
                                <div class="content"><span class="content-text">휴대전화 번호</span></div>
                                <div class="content"><span class="content-text">${user.uPhone}</span></div>
                                <div id="adjustBtn"><i class="fas fa-angle-right"></i></div>
                            </div>
                            <div class="info-content1">
                                <div class="content"><span id="openButton">계정탈퇴</span></div>
                                <div class="block2"></div>
                            </div>
                               </form>
                              <button class="modify_button"><a href="UserMypageInfoUpdate.do" type="submit">수정원해요</a></button>
                            
                            
                            
                             <div class="modal hidden">
                                <div class="out-modal-overlay"></div>
                                <div class="out-content"><h6> 정말로 해요를 탈퇴하길 원해요?</h6>
                                    <p>계정 탈퇴 시 모든 개인정보가 삭제되며
                                        구매하신 캐시는 환불되지 않아요</p>
                                    <button class ="modal_btn">다시 생각해볼게요</button>
                                  
                                    <form action = "deleteoneUser.do" name=form method="get">
                                    	<input type="hidden" name="uNo" value="${user.uNo}"/>
                                    <button class ="modal_btn" type="submit">계정 탈퇴 </button>
                                    </form>
                                </div>

                            </div>
                          
                        </div>
                    </div>
                </div>
        </div>
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

