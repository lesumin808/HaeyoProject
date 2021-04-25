<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.haeyo.biz.user.UserVO"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/UserMypage/01_User_mypage.css" rel="stylesheet">
    <script defer src="resources/js/userMypage/01_User_mypage_out_modal.js"></script>
    <script defer src="resources/js/userMypage/01_User_mypage_profilePic_change.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
   <%
   session = request.getSession();
   UserVO user = (UserVO) session.getAttribute("user");
   %>
    

        <!-- sidebar  start -->
        <div id="container">
            <!-- profession mypage navigation -->
            <nav id="user-side-nav">
                <div class="user-mypage-list" id="user-info">
                    <div id="user-img-box">
                        <a href="#user-page-top">
                            <span class="d-none d-lg-block"><img id="img-user-pic" src="/resources/image/${user.uPic}.jpg"/></span>
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
                          <img id = "thumb-img"  src="/resources/image/${user.uPic}.jpg"/>   <!-- <img id="thumb-img" > -->
                           </div>
                           
                           
                         <div id="user-nickname">${user.uNick}님, 반가워요:)</div>
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
                                 <div id="buttons">
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
         <!------- sidebar end --------->
