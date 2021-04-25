l<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전문가 예약 일정리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="resources/css/header.css" rel="stylesheet">
    <link href="resources/css/proMypage/user_reservationList.css" rel="stylesheet">
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
    <script>
    $(document).ready(function() {
    	
    });
     
    
   
   </script>
</head>

<body>
    <wrap>
        <!------- headerStart ------->
        <header id="header">
            <nav id="nav">
                <logo id="logo">
                    <a href="index.html"><img src="image/logo2.png" alt="로고"></a>
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
                            <div id="profiteTxt"><span>반갑습니다! </span>${user.uNick}님</div>
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

        <!-------- main ----------->
        <div id="container">
            <div id="container_wrap">
                <!-- profession mypage navigation -->
                <nav id="side-nav">
                    <div class="pro-mypage-list" id="pro-info">
                        <div id="img-box">
                            <a href="#page-top">
                                <span class="d-none d-lg-block"><img id="img-user-pic" src="image/IU.jpg"
                                        alt="" /></span>
                            </a>
                        </div>
                        <div id="user-info">
                            <p id="user-name">${user.uNick}님</p>
                            <p id="user-email">${user.uEmail}</p>
                        </div>
                    </div>
                    <div class="pro-mypage-list" id="pro-profile">
                        <p>나의 정보</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href=#>나의 회원 정보</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>나의 전문가 프로필</a></li>
                        </ul>
                    </div>
                    <div class="pro-mypage-list" id="pro-rsv">
                        <p>커뮤니티</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href=#>내가 작성한 글</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>내가 작성한 댓글</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>나의 찜한 글</a></li>

                        </ul>
                    </div>
                    <div class="pro-mypage-list" id="pro-rsv">
                        <p>전문가 예약</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href=#>예약한 서비스 일정</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>완료된 서비스 내역</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>내가 찜한 전문가 보기</a></li>

                        </ul>
                    </div>
                    <div class="pro-mypage-list" id="haeyo-info">
                        <p>해요 안내</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href=#>이용 안내 </a></li>
                            <li class="nav-item"><a class="nav-link" href=#>공지 사항</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>질의 응답</a></li>
                        </ul>
                    </div>
                </nav>
                <!-- profession mypage navigation -->

                <!------------- main: user_reservation --------------->
                <section>
                    <div id="page-title">
                        <h2>전문가 예약 리스트</h2>
                    </div>
                    <div id="user-rsv-page">
                        <div id="rsv-count">
                            <p>전체 예약 일정 <span id="total-rsv">00</span> 건</p>
                        </div>
                        <div class="user-rsv-list">
                            <div class="user-rsv-content">
                                <p class="rsv-no">예약 번호</p>
                                <div class="propic-wrapper">
                                    <img class="pro-mypage-thumb" src="/resources/image/${profession.pPic}" alt="" />
                                </div>
                                <div class="rsv_info">
                                    <span id="pro-name">
                                        <h3>전문가 : ${reservation.user.uName}</h3>
                                    </span>
                                    <p>신청 서비스 : ${reservation.profession.pCategory} | 세부 카테고리</p>
                                    <p>예약 일자 : 2020년 04월 01일</p>
                                    <p>서비스 일정 : 2020년 04월 21일 13:00</p>
                                </div>
                                <div class="btn-wrap">
                                    <button class="procheck-btn">전문가 상세 보기<i class="fas fa-arrow-right"></i></button>
                                </div>
                            </div>

                            <div id="pro-info-btn">
                                <input type="button" value="일정 수정" class="propage-btn" id="rsv-update-btn" />
                                <input type="button" value="예약 취소" class="propage-btn" id="rsv-delete-btn"/>
                                <input type="button" value="예약 상세" class="propage-btn" id="rsv-info-btn" onClick="location.href='#'" />
                                <input type="button" value="채팅 하기" class="propage-btn" id="rsv-chat-btn" onClick="location.href='#'" />
                                <input type="button" value="일정 완료" class="propage-btn" id="rsv-complete-btn" onClick="location.href='#'" />
                            </div>
                        </div>

                        <div>
                            <ul class="pagination">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#">&laquo;</a>
                                </li>
                                <li class="page-item active">
                                    <a class="page-link" href="#">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">2</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">3</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">4</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">5</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="#">&raquo;</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                     <div id="rsv-update">
                        <div class="bottom-popUp">
                            <div class="popUp-content">
                               <!--   <div id="rsv-calendar"> 달력 API 자리 : 수민쓰에게 예약시스템 받아오기</div>-->
                               <form action=" ">
                                 
                               </form>
                            </div>
                        </div>
                    </div>
        
                    <div class="modal hidden">
                        <div id="out-modal-overlay"></div>
                        <div id="modal-content">
                             <h3>선택하신 예약 일정을 취소하시겠습니까?</h3>
                             <p> 확인 클릭 시, 예약이 취소 처리됩니다.</p>
                             <div id="delete-ask-btn">
                                <form action="deleteReservation.do?rsv=${rsvNo}" id="deleteRSV" method="post">
                                        <!--  <input type="hidden" name="pNo" value="${ProfessionProfile.pNo}"/>-->
                                </form>
                                <button type="reset" class="modal-btn">취 소</button>
                                <button type="submit" class="modal-btn" form="deleteRSV">확 인</button>    
                            </div>
                        </div>
                    </div>

                    <!-- <div id="rsv-complete">
                        <div class="bottom-popUp">
                            <div class="popUp-content">
                                <div id="rsv-calendar"> 달력 API 자리 : 수민쓰에게 예약시스템 받아오기</div>
                            </div>
                        </div>
                    </div>  -->
                </section>
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
        <!------- footerEnd ------->
    </wrap>
</body>
</html>