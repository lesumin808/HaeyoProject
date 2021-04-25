<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전문가 예약 일정리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="resources/css/header.css" rel="stylesheet"/>
    <link href="resources/css/proMypage/Profession_rsv_list.css" rel="stylesheet"/>
    <link href='resources/packages/core/main.css' rel='stylesheet' />
	<link href='resources/packages/daygrid/main.css' rel='stylesheet' />
	<link href='resources/packages/timegrid/main.css' rel='stylesheet' />
	<link href='resources/packages/list/main.css' rel='stylesheet' /> 
    <!--  <script src="https://cdn.jsdelivr.net/combine/npm/@fullcalendar/core@5.6.0,npm/@fullcalendar/interaction@5.6.0,npm/@fullcalendar/daygrid@5.6.0,npm/@fullcalendar/timegrid@5.6.0,npm/@fullcalendar/list@5.6.0"></script>
    -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src='resources/packages/core/main.js'></script>
    <script src='resources/packages/interaction/main.js'></script>
	<script src='resources/packages/daygrid/main.js' ></script>
	<script src='resources/packages/timegrid/main.js'></script>
	<script src='resources/packages/list/main.js'></script>
    <!--<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script> -->
    <script>
    document.addEventListener('DOMContentLoaded', function (){
    	var calendarEl = document.getElementById('rsv-calendar');
        //var all_events = loadingEvents();
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
        height: 'parent',
    	header: {
    		left: 'prev,next today',
    		center: 'title',
    		right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    	},
    	defaultView: 'dayGridMonth',
    	locale: 'ko',
    	navLinks: true, // can click day/week names to navigate views
    	editable: false,
    	allDaySlot: false,
    	eventLimit: true, // allow "more" link when too many events
        eventBorderColor : '#ffffff', 
        eventBackgroundColor : '#05C3A7',
        events: function (info, successCallback, failureCallback){
        	
        	$.ajax({
    			url: "getReservationList.do",
    			type: 'get',
    			data: {"pNo" : ${profession.pNo}}, //받아온 데이터 전달..
    			dataType: 'json',
    			success: function(data) {   //data > 결과값
    				console.log('ajax 함수 완료');
    				console.log(data);
    				var events =[];
    				
    	           $.each(data, function(index, item){
    	        	   events.push({
    	        		   id:item.rsvNo,
    	        		   title:item.title + "님의 신청",
    	        		   start:item.start 
    	        	   }); //push end
    	           });//each end
    	           console.log(events);
    	           console.log(events.length);
    	           document.getElementById("total-rsv").innerText = events.length;
    			   successCallback(events);
    			} //sucsess end 
    	    }); //ajax end
          } // events end 
          
        }); // calendar end
        
      calendar.render();
    });
    </script>
</head>

<body>
	<wrap>
        <!------- headerStart ------->
        <header id="header">
            <nav id="nav">
                <logo id="logo">
                    <a href="index.html"><img src="resources/image/logo2.png" alt="로고"></a>
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
                                <span class="d-none d-lg-block"><img id="img-user-pic" src="/resources/image/${profession.pPic}" /></span>
                            </a>
                        </div>
                        <div id="user-info">
                            <p id="user-name">${user.uName} 전문가님</p>
                            <p id="user-email">${user.uEmail}</p>
                        </div>
                    </div>
                    <div class="pro-mypage-list" id="pro-profile">
                        <p>나의 정보</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href=#>나의 회원 정보</a></li>
                            <li class="nav-item"><a class="nav-link" href="getProfile.do">나의 전문가 프로필</a></li>
                        </ul>
                    </div>
                    <div class="pro-mypage-list" id="pro-rsv">
                        <p>전문가 예약</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href="#">예약된 일정 보기</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>완료된 일정 보기</a></li>
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

                
                <section>
                    <div id="page-title">
                        <h2>예약 일정 리스트</h2>
                    </div>
                    <div id="pro-rsv-content">
                        <div id="pro-rsv-wrap">
                            <div id="rsv-content">
                                <p>전체 예약 일정 <span id="total-rsv"></span> 건</p>
                                <div id="calendar-wrap">
                                    <div id="rsv-calendar"></div>
                                </div>
                            </div>
                        </div>
                    </div>
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
                <p>(주)해요모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.
                </p>
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