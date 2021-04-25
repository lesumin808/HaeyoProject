<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="com.haeyo.biz.user.UserVO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>해요</title>
    <link href="resources/image/icon.ico" rel="shortcut icon" type="image/x-icon">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script defer src="resources/js/userMypage/02_User_mypage_pwd.js"></script>
    <link href="resources/css/main.css" rel="stylesheet">
    <link href="resources/css/header.css" rel="stylesheet">
    <link href="resources/css/UserMypage/02_User_mypage_password.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script defer src="resources/js/common.js"></script>
    <title>유저비밀번호변경하기</title>
    <script type="text/javascript">
    	function  passwordCheckMessage() {
			var uPwd3 = $('#uPwd3').val();
			var uPwd4 = $('#uPwd4').val();
			if(uPwd3 != uPwd4) {
				$('#passwordCheckMessage').html('바꾸고자 하는 비밀번호를 동일하게 입력해주세요.')
			} else{
				$('#passwordCheckMessage').html(' good! ')

			}
		}
    </script>
</head>

<body>
	<%
	session = request.getSession();
	UserVO user = (UserVO) session.getAttribute("user");
	%>
    <wrap>
        <!------- headerStart ------->
        <header id="header">
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
                            <span class="d-none d-lg-block"><img id="img-user-pic" src="resources/image/jangNR.jpg" alt="" /></span>
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
                        <li class="nav-item"><a class="nav-link" href=#>나의 회원 정보</a></li>
                        <li class="nav-item"><a class="nav-link" href=#>회원 정보 관리</a></li>
                    </ul>
                </div>
                <div class="user-mypage-list" id="user-content">
                    <p>커뮤니티</p>
                    <ul class="nav-list">
                        <li class="nav-item"><a class="nav-link" href=#>내가 작성한 글</a></li>
                        <li class="nav-item"><a class="nav-link" href=#>내가 작성한 댓글</a></li>
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

            <section>
                <div id="main-header">
                    <h5>나의 정보</h5>
                    <p>비밀번호 변경</p>
                </div>
               <div id="user-mypage-content"> 
                    <div id="user-mypage-profile">
                    
                     <form action = "getUpdatePwdUser.do" name="form" method="post" enctype="multipart/form-data">
                    
                        <div class="user-mypage-info-pwd">
                               
                               <div class="mypage-pwd">
                                    <p>기존 비밀번호</p>
                                <div id="mypage-pwd-before"> <input type="password" id="uPwd" name="" value=""
                                   placeholder="현재 비밀번호를 입력해주세요"> </div>  
                           

                               <div class="mypage-pwd">
                                   <p>새로운 비밀번호</p> 
                                    <div id="mypage-pwd-after1"> <input type="text" id="uPwd3" name=""  value=""
                                       placeholder="영문+숫자 조합 8자리 이상 입력해주세요 "></div>  

                               </div>

                               <div class="mypage-pwd">
                                     <p>새로운 비밀번호 확인</p> 
                                    <div id="mypage-pwd-after"> <input type="password" id="uPwd4" name="uPwd" value=""
                                        placeholder="비밀번호를 한번 더 입력해주세요"></div>  
                                        
                            
                               </div>
                               <tr>
                               		<td style = "text-align: left"> <h5 style="color:red;" id="passwordCheckMessage"></h5></td>
                               </tr>
                               

								<input type="hidden" name="uNo" value="${user.uNo}"/> 
                        	    <button class="modify_button" type ="submit">수정원해요</button>
 								<button class="modify_button" onclick="location.href = ''">취소하기</button>
                      
                        </div>
                   </div>
      			  </form>	
                    </div>
              </div> 
            </section>
        </div>
    </wrap>
</body>

</html>
