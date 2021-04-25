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
    
<!------- sidebar Start -------> 
        <div id="container">
            <!-- profession mypage navigation -->
            <nav id="user-side-nav">
                <div class="user-mypage-list" id="user-info">
                    <div id="user-img-box">
                        <a href="#user-page-top">
                            <span class="d-none d-lg-block"><img id="img-user-pic" src="/resources/image/${user.uPic}.jpg"
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
                          <img id="thumb-img" src="/resources/image/${user.uPic}.jpg">
                            <label class="click-icon" for="user-thumb"><i class="fas fa-camera"></i></label> 
            			 <div>
                         	<input type='file' name='uploadFile'id="user-thumb" class="upload-box upload-plus" accept="image/*" onchange="thumbnail(event)">
                         </div>
                         </div>
                         <div id="user-nickname"> <input type="text" id="user-nickname-field" value="${user.uNick}" name="uNick"></div>
                             

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

   
                 
                            	<input type="hidden" name="uNo" value="${user.uNo}"/> 
                            <button class="modify_button" type ="submit">저장하기</button>
                            <button class="modify_button" onclick="location.href = ''">취소하기</button>
                        </div>
                    </div>
                </div>
     
        
        </form>
        </section>

        </div>
        <!-- 유저 정보 수정 end -->
        
    </wrap>
</body>

</html>

