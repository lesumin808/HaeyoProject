<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <link href="resources/css/header.css" rel="stylesheet">
   <link href="resources/css/proMypage/Profession_profile.css" rel="stylesheet">
   <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
   <script src="resources/js/proMypage/Profession_profile.js" defer></script>
   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99b9a8524e76961c89d8abd8820de6d6&libraries=services"></script>
   <script>
   //location.href='getReservationList.do?pNo=${professionProfile.pNo}'"
     
   </script> 
</head>

<body>
 
    <wrap>
        <!------- headerStart ------->
        <header id="header">
            <nav id="nav">
                <logo id="logo">
                    <a href="index.html"><img src="/resources/image/logo2.png" alt="로고"></a>
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

        <!-------- main ----------->
        <div id="container">
            <div id="container_wrap">
                <!-- profession mypage navigation -->
                <nav id="side-nav">
                    <div class="pro-mypage-list" id="pro-info">
                        <div id="img-box">
                            <a href="#page-top">
                                <span class="d-none d-lg-block"><img id="img-user-pic" src="/resources/image/${professionProfile.pPic}" /></span>
                            </a>
                        </div>
                        <div id="user-info">
                            <p id="user-name">${user.uName} 전문가님</p>
                            <p id="user-email">${user.uEmail} </p>
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
                        <p>전문가 예약</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href="getRsvListView.do">예약된 일정 보기</a></li>
                            <li class="nav-item"><a class="nav-link" href="getCompleteView.do">완료된 일정 보기</a></li>
                            <!-- <li class="nav-item"><a class="nav-link" href=#>나를 찜한 회원??</a></li> -->
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

                <!-- profession mypage 1.pro-profile(nav기준)-->
                <section>
                    <div id="page-title">
                        <h2>나의 전문가 프로필</h2>
                    </div>
                    <!--   form start-->
                    <div id="pro-mypage-content">
                        <div id="pro-mypage-profile">
                            <div class="pro-mypage-info">
                                <div id="profile-review-box">
                                    <div id="userpic-wrapper">
                                        <img id="pro-mypage-thumb" src="/resources/image/${professionProfile.pPic}"/>
                                    </div>

                                    <div id="profile-score">
                                        <span id="username">
                                            <h3>${user.uName}</h3>
                                        </span>
                                        <div class="starWrap">
                                            <ul class="star clearfix">
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star-half-alt"></i></li>
                                            </ul>
                                            <span class="score">3.5</span>
                                        </div>
                                        <ul>
                                            <li>후기 1</li>
                                            <li>찜하기 2</li>
                                        </ul>
                                    </div>
                                    <div class="btn-wrap">
                                        <button class="procheck-btn">상세 보기 <i class="fas fa-arrow-right"></i></button>
                                    </div>

                                </div>
                            </div>
                            <div class="pro-mypage-info">
                                <div class="pro-info-list service-section">
                                    <div class="subsection">
                                        <div class="info-content">
                                            <div class="content1"><span class="subtitle-text">전문 분야</span></div>
                                            <div class="content1"><span class="category-text">${professionProfile.pCategory}</span></div>
                                        </div>
                                        <div class="info-content">
                                            <div class="content1"><span class="subtitle-text">제공 서비스</span></div>
                                            <div class="content1"><span class="category-text"></span>
                                            					  <span class="category-text"></span>
                                                                  <span class="category-text"></span><span class="category-text"></span>
                                                                  <span class="category-text"></span>
                                            
                                            </div>
                                        </div>
                                    </div>
                                    <div class="subsection">
                                        <div class="info-content">
                                            <div class="content1"><span class="subtitle-text">증명서 등록</span></div>
                                            <img class="file-image" src="/resources/image/${professionProfile.certification}">
                                        </div>
                                    </div>
                                </div>

                                <div class="pro-info-list">
                                	<!--  <div class="info-content">
                                        <div class="content1"><span class="subtitle-text">성 별</span></div>
                                        <div class="content1"><span class="category-text">${professionProfile.pGender}</span></div>
                                    </div>-->
                                    <div class="info-content">
                                        <div class="content2"><span class="subtitle-text">한 줄 소개</span></div>
                                        <div class="content2"><span class="content-text">${professionProfile.pIntroduce}</span></div>
                                    </div>
                                    <div class="info-content">
                                        <div class="content2"><span class="subtitle-text">활동 지역</span></div>
                                        <div class="content2"><span class="content-text">${professionProfile.pAddress}</span></div>
                                        <div class="box content2">
                                            <div id="map" style="width:600px; height: 300px; "></div>
                                            <input type="hidden" id="locx" value="${professionProfile.pLocX}" />
                                            <input type="hidden" id="locy" value="${professionProfile.pLocY}" />
                                        </div>
                                    </div>
                                </div>

                                 <div id="pro-info-btn">
                                    <input type="button" value="수정 하기" class="propage-btn" onclick="location.href='updateProfileView.do'"/>
                                    <input type="button" value="전문가 탈퇴" class="propage-btn" id="openButton"/>
                                </div>
                            </div>
                        </div>
                    </div>
               </section>
            </div>
        </div>
        
         <!--modalStart-->
        <div class="modal hidden">
            <div class="out-modal-overlay"></div>
            <div class="modal-content">
                <h3>전문가 회원을 탈퇴하시겠습니까?</h3>
                <p>${user.uName}님의 전문가 정보만 삭제되며,<br/>일반 회원 계정은 유지됩니다.</p>
                <form action="deleteProfile.do" id="deletePro" method="post">
                    <input type="hidden" name="pNo" value="${professionProfile.pNo}"/>
                </form>
                <button type="reset"class="modal-btn">취 소</button>
                <button type="submit" class="modal-btn" form="deletePro">확 인</button>
            </div>
        </div>
        <!--modalEnd-->

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