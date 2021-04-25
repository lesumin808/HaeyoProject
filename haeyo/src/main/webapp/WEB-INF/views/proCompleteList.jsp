<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="resources/css/header.css" rel="stylesheet">
    <link href="resources/css/proMypage/Profession_rsv_complete.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!--  <script src="resources/js/proMypage/Profession_rsv_complete.js" defer></script>-->
    <script>
    
    $(document).ready(function(){
    	completelist();
    	completeCount();
    })
    
    function completelist(){
    	
    	var date = $("#dateForm").serialize(); //온 클릭을 걸어줘야되나?
    
    	$.ajax({
	        url:"getProCompleteList.do",
	        type: "GET",
	        data: JSON.stringify(date),
	        dataType: "json",
	        contentType : "application/json; charset=UTF-8",
	        success: function(result){
	           console.log(result);
	           $.each(result, function(index, item){
		            result_one = "<tr id='table-complete'>" 		            	
		              +"<th id='no', onclick='link("+item.rsvNo+");'>"+item.rsvNo+"</th>"
		              +"<td>"+item.uName+"</td>"
		              +"<td>"+item.rsvCredate+"</td>"
		              +"<td>"+item.rsvDate+"</td>"
		              +"</tr>"
	          	 $('#table_list').append(result_one);
	           }) //each end
	           console.log(result.length);
	           document.getElementById("total_count").innerText = result.length;
	        } //success end
	     });
    }
    
    var mCount = [];

    function completeCount(){
    	       
    	$.ajax({
	        url:"getCompleteCount.do",
	        type: "GET",
	        data:{"pNo" : ${profession.pNo}},
	        dataType: "json",
	        contentType : "application/json; charset=UTF-8",
	        success: function(result){
	           console.log(result);
	           mCount.push( result.jan, result.feb,
	        		   		result.mar, result.apr,
	        		   		result.may, result.jun,
	        		   		result.jul, result.aug,
	        		   		result.sep, result.oct,
	        		   		result.nov, result.dec
	           ); //push end
	           console.log(mCount);
	           createGraph();
	        } //success end
	     });
    }
    
    function createGraph(){
    var ctx = document.getElementById('monthchart').getContext('2d'); 
    var chart = new Chart(ctx, { 
        // The type of chart we want to create 
        type: 'bar', 
        // The data for our dataset 
        data: { 
            labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            datasets: [{ 
                label: '완료된 서비스 수',
                backgroundColor: '#05C3A7',
                borderColor: '#dddee2',
                data: mCount
            }] 
        }, 
        // Configuration options go here 
        options: { 
            title: { 
                display: true, 
                text: '연간 완료 서비스 차트',
                fontSize: 25, 
                fontColor: '#353535'
            }, 
            legend: { 
                labels: {
                    fontColor: '#353535', 
                    fontSize: 13
                } 
            }, 
            scales: {
                 xAxes: [{
                      ticks: {
                           fontColor: '#353535', 
                           fontSize: '15' 
                        } 
                    }], 
                 yAxes: [{ 
                     ticks: {
                        beginAtZero: true, 
                        fontColor: '#353535', 
                        fontSize: '15' 
                    } 
                }] 
            } 
        } 
    });
  }
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
                                <span class="d-none d-lg-block">
                                  <img id="img-user-pic" src="/resources/image/${profession.pPic}" alt="" />
                                </span>
                            </a>
                        </div>
                        <div id="user-info">
                            <p id="user-name">${users.uName} 전문가님</p>
                            <p id="user-email">${users.uEmail}</p>
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
                            <li class="nav-item"><a class="nav-link" href=#>예약된 일정 보기</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>완료된 일정 보기</a></li>
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

                
             <!-- profession complete -->
                <section>
                    <div id="page-title">
                        <h2>나의 완료된 일정</h2>
                    </div>
                    <!-- <div id="pro_complete_page"> -->

                    <div id="com_page_content">
                        <div class="com_content_count">
                            <form id="dateForm">
                                <input type="date" name="startDate" id="start_date">
                                <input type="date" name="endDate" id="end_date">
                            </form>
                              <input type="button" id="date_btn" value="확인" onclick="completelist()"/>
                            <div id="total_com">총 <span id="total_count"></span>건</div>
                            <div id="review">별점 평점 / 후기 개수</div>
                        </div>
                    
                        <div id="com_content_list">
                            <span id="com_service_list">
                                <p>최근 완료한 서비스</p>
                            </span>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">예약 번호</th>
                                        <th scope="col">신청자</th>
                                        <th scope="col">신청 일자</th>
                                        <th scope="col">서비스 진행 일자</th>
                                        <!--  <th scope="col">서비스 분야</th>-->
                                    </tr>
                                </thead>
                                <tbody id="table_list">
                                    <!--<tr id="table-complete">
                                        <th></th>
                                        <td></td>
                                        <td></td>
                                        <td></td>  
                                    </tr>-->
                                </tbody>
                            </table>

                           <!-- <div>
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
                            </div>-->
                        </div>

                        <div class="com_content_month">
                            <canvas id="monthchart"></canvas>
                        </div>

                    </div>
                    <!-- </div> -->
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