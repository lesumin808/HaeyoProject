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
    	init_period();
    	completeCount();
    })
    
    function getToday(){
    	let today = new Date();
		let dd = today.getDate();
		let mm = today.getMonth() + 1;
		let yyyy = today.getFullYear();
		if (dd < 10) { dd = '0' + dd; }
		if (mm < 10) { mm = '0' + mm; }
	
		return today = yyyy + '-' + mm + '-' + dd;
    }
    
    function beforeMonth(){
		let today = new Date();
    	
		let before_Month= new Date(Date.parse(today) - 30 * 1000 * 60 * 60 * 24); //30일전
		let day = before_Month.getDate();
		let month = before_Month.getMonth() + 1;
		let year = before_Month.getFullYear();
		if (day < 10) { day = '0' + day; }
		if (month < 10) { month = '0' + month; }
		
		return before_Month = year + '-' + month + '-' + day; 
    }
	
    function init_period(){
   		let today = getToday();
   	    let before_month = beforeMonth();
    	
   	    var params = {startDate: before_month, endDate : today }
   	    completelist(params)    	
    	
    }
    
    
    function period(){			
		$("#dateForm").click(function(){
		  var params = $("#dateForm").serialize();
		  completelist(params)
     	});
    }
    
    
	function completelist(params){
	
    	$.ajax({
	        url:"getProCompleteList.do",
	        type: "GET",
	        data: params,
	        dataType: "json",
	        contentType : "application/json; charset=UTF-8",
	        success: function(result){
	           console.log(result);
	           $('#table_list').empty();
	           $.each(result, function(index, item){
	        	   result_one = "<tr id='table-complete'>" 		            	
		              +"<th id='no', onclick='link("+item.rsvNo+");'>"+item.rsvNo+"</th>"
		              +"<td>"+item.uName+"</td>"
		              +"<td>"+item.rsvCredate+"</td>"
		              +"<td>"+item.rsvDate+"</td>"
		              +"<td>"+item.rsvCategory+"</td>"
		              +"</tr>"
	          	 $('#table_list').append(result_one);
	           }) //each end
	           console.log(result.length);
	           document.getElementById("total_count").innerText = result.length;
	        } //success end
	     });
    }
    

    function completeCount(){
    	
    	var mCount = [];
    	       
    	$.ajax({
	        url:"getCompleteCount.do",
	        type: "GET",
	        //data: {pNo : ${profession.pNo}},
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
	           createGraph(mCount);
	        } //success end
	     });
    }
    
    function createGraph(mCount){
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
        <!-------- main ----------->
        <div id="container">
            <div id="container_wrap">
                <!-- profession mypage navigation -->
                <nav id="side-nav">
                    <div class="pro-mypage-list" id="pro-info">
                        <div id="img-box">
                            <a href="#page-top">
                                <span class="d-none d-lg-block">
                                  <img id="img-user-pic" src="/resources/image/${profession.pPic}.jpg" alt="" />
                                </span>
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
                            <li class="nav-item"><a class="nav-link" href="getReservationList.do">예약된 일정 보기</a></li>
                            <li class="nav-item"><a class="nav-link" href="getCompleteView.do">완료된 일정 보기</a></li>
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
                                <input type="button" id="date_btn" value="확인" onclick="period()"/>
                            </form>
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
                                        <th scope="col">서비스 분야</th>
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
    </wrap>
</body>
</html>