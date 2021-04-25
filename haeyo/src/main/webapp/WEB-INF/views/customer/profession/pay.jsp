<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link href="resources/css/profession/reservationPay.css" rel="stylesheet">
</head>
<script>
let subCate = ${Catetxt};
IMP.init('imp97586253');

window.onload = function(){
	wsOpen();
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
            send();
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
        }
        alert(msg);
    });
}


//소켓에 메세지 보내기
function send() {
	//메시지 보낼때 json형태로 보낸다
	//type은 메세지, type이 message인 경우에 채팅이 발생한 경우
	//sessioId 값은 상대방과 자신을 구분할 수 있는 session값
	var option = {
		type: "alarm",
		sessionId: $("#sessionId").val(),
		pNo: "${ReservationInfo.pNo}",
		pName: "${ReservationInfo.pName}",
		uNo: "${user.uNo}",
		uEmail: "${user.uEmail}",
		uNick: "${user.uNick}",
		pEmail: "${ReservationInfo.pEmail}",
		msg: "${user.uNick}" + "님이 예약하셨습니다." 
	}
	ajaxSend(option);
	let sendMsg = JSON.stringify(option);
	console.log();
	ws.send(sendMsg);
}
//결제 인서트 ajax
function ajaxSend(data) {
	$.ajax({
		url: "insertAlram.do",
		type: "GET",
		data: data,
		contentType: "application/json; charset=UTF-8",
		dataType: "json",
		success: function(result) {
			$("#alarmTxt").append("<div>" + result.msg + "</div>");
		}
	});
}
</script>
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
							value="${ReservationInfo.rsvLoc}" readonly /> <span id="showLoc">변경</span>
					</div>
					<div class="box">
						<h1>일정</h1>
						<input type="date" id="rsvDate" name="rsvDate"
							value="${ReservationInfo.rsvDate}" readonly />
					</div>
					<div class="box">
						<h1>세부사항</h1>
						<input type="text" id="rsvDetail" name="rsvDetail"
							value="${ReservationInfo.rsvDetail}" />
					</div>
					<div id="imgbox" class="box clearfix">
						<h1>첨부사진</h1>
						<span><img src="resources/image/img01.jpg"></span> <span><img
							src="resources/image/img02.jpg"></span> <span><img
							src="resources/image/img03.jpg"></span>
					</div>
				</div>
			</form>
		</div>
			<div id="paylist" class="clearfix">
				<div id="payWrap">
					<div id="payTit">
						<ul>
							<li>최종 결제금액 <span>10,000원</span></li>
						</ul>
					</div>
					<div id="checkWrap">
						<input type="checkbox" checked />
						<p>
							<a>결제 주문 및 개인 정보 수집에 동의합니다[필수]</a>
						</p>
					</div>
					<button id="payBtn" type="submit" onclick="pay();">결제하기</button>
				</div>
			</div>
	</section>
</main>