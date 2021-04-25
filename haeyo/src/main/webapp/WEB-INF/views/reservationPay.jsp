<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.haeyo.biz.user.UserVO"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>해요</title>
<link href="resources/image/icon.ico" rel="shortcut icon"
	type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="resources/css/header.css" rel="stylesheet">
<link href="resources/css/profession/reservationPay.css" rel="stylesheet">
</head>
<script>
let subCate = ${Catetxt};
IMP.init('imp97586253');

window.onload = function(){
	insertCate(subCate);
}
//카테고리 담기
	function insertCate(subCate){
		let subKey = [];
		let subValue = [];
		
		for(prop in subCate)  {
			if(subCate[prop] != null && prop.indexOf("txt") == 0){
  				subKey.push(prop);
	 			subValue.push(subCate[prop]);
			}
		}
		createCate(subKey, subValue);
		console.log(subKey);
		console.log(subValue);
}
	
//카테고리 생성
function createCate(subKey, subValue){
    const sub_category = document.getElementById("subCate");
    for(i=0 ; i < subKey.length ; i++){
        const li = document.createElement("li");
        const input = document.createElement("input");
        input.type = "hidden";
        input.name = subKey[i].replace("txt","rsv");
        input.value = 1;
        li.innerText = subValue[i];
        li.appendChild(input);
        sub_category.appendChild(li);
    }
}

function pay() {
    IMP.request_pay({
        pg : 'inicis', // version 1.1.0부터 지원.
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '주문명:결제테스트',
        amount : 100,
        buyer_email : '${user.uEmail}',
        buyer_name : '${user.uName}',
        buyer_tel : '${user.uPhone}',
        buyer_addr : '${user.uAddress}',
        buyer_postcode : '123-456',
        m_redirect_url : 'https://www.yourdomain.com/payments/complete'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
            const insertForm = document.getElementById("insertForm").submit();
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
        }
        alert(msg);
    });
}
</script>
<body>
	<wrap> <!---------------------HeaderStart--------------------->
	<header id="header">
		<nav id="nav">
			<logo id="logo"> <a href="index"><img
				src="resources/image/logo2.png" alt="로고"></a> </logo>
			<ul>
				<li><a href="#">같이해요</a></li>
				<li><a href="#">혼자해요</a></li>
				<li><a href="#">전문가 신청</a></li>
				<li class="btn-group">
					<ul class="dropdown-toggle bell" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-bell"></i>
					</ul>
					<div class="dropdown-menu dropdown-menu-right alarm1">
						<p>알림</p>
						<div id="alarmTxt">회원님이 결제를 완료하셨습니다.</div>
						<span>23분전</span>
					</div>
				</li>
				<li class="btn-group">
					<div class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">${user.uNick}님</div>
					<div class="dropdown-menu dropdown-menu-right" id="profile">
						<div id="profiteTxt">
							<span>반갑습니다! </span>${user.uNick}님</div>
						<ul class="profileMenu">
							<li><i class="fas fa-user menuico"></i>마이페이지</li>
							<li><i class="fas fa-sign-out-alt menuico"></i>로그아웃</li>
							<li><i class="fas fa-exchange-alt menuico"></i>전문가로 전환</li>
						</ul>
					</div>
				</li>
			</ul>
		</nav>
	</header> <!---------------------headerEnd---------------------> <!---------------------headerEnd---------------------> <!---------------------main--------------------->
	<main>
		<section id="conbg" class="clearfix">
			<div id="checkbg"></div>
			<div id="paylistWrap">
				<form id="insertForm" action="insertReservation.do" method="post">
					<input type="hidden" id="uNo" name="uNo" value="${user.uNo}" /> <input
						type="hidden" id="pNo" name="pNo" value="${ReservationInfo.pNo}">
					<input type="hidden" id="rsvCategory" name="rsvCategory"
						value="${ReservationInfo.rsvCategory}">
					<div id="payDetail">
						<h1>예약 상세</h1>
						<div class="box">
							<ul id="subCate" class="clearfix">
							</ul>
						</div>
						<div class="box clearfix">
							<h1>위치</h1>
							<input type="text" id="rsvLoc" name="rsvLoc"
								value="${ReservationInfo.rsvLoc}" readonly/>
							<span id="showLoc">변경</span>
						</div>
						<div class="box">
							<h1>일정</h1>
							<input type="date" id="rsvDate" name="rsvDate"
								value="${ReservationInfo.rsvDate}"  readonly/>
						</div>
						<div class="box">
							<h1>세부사항</h1>
							<input type="text" id="rsvDetail" name="rsvDetail"
								value="${ReservationInfo.rsvDetail}" />
						</div>
						<div id="imgbox" class="box clearfix">
							<h1>첨부사진</h1>
							<span><img src="resources/image/img01.jpg"></span>
							<span><img src="resources/image/img02.jpg"></span>
							<span><img src="resources/image/img03.jpg"></span>
						</div>
					</div>
	   </form>
                        <div id="paylist" class="clearfix">
                            <div id="payWrap">
                                <div id="payTit">
                                    <ul>
                                        <li>최종 결제금액 <span>10,000원</span></li>
                                    </ul>
                                </div>
                                <div id="checkWrap">
                                    <input type="checkbox" checked/><p><a>결제 주문 및 개인 정보 수집에 동의합니다[필수]</a></p>
                                </div>
                                <button id="payBtn" type="submit" onclick="pay();">결제하기</button>
                            </div>
                    </div>
		</section>
	</main>
	<!------- footerStart -------> <footer id="footer">
		<section id="bottom" class="clearfix">
			<div class="phone">
				<p>
					<span>1599-2121</span>
				</p>
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
			<p>(주)해요모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행,
				계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</p>
			<p>상호명:(주)해요모바일 · 대표이사:1조 · 개인정보책임관리자:1조 · 주소:서울특별시 마포구 거구장, 지하
				1층(커틀 타워)</p>
			<p>사업자등록번호:111-22-34323 · 통신판매업신고증:제 2015-서울강남-00567 호 · 직업정보제공사업
				신고번호:서울청 제 2019-21호</p>
			<p>고객센터:1599-2121 · 이메일:heayo@heayo.com</p>
			<p class="copy">Copyright heayo Web Inc. All Rights Reserved.</p>
		</section>
	</footer> <!------- footerEND -------> </wrap>
</body>
</html>