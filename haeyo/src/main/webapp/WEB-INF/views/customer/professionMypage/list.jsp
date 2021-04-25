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
       
        <!-------- main ----------->
        <div id="container">
            <div id="container_wrap">
                <!-- profession mypage navigation -->
                <nav id="side-nav">
                    <div class="pro-mypage-list" id="pro-info">
                        <div id="img-box">
                            <a href="#page-top">
                                <span class="d-none d-lg-block"><img id="img-user-pic" src="/resources/image/${profession.pPic}.jpg" /></span>
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
   </wrap>
</body>
</html>