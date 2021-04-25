/*window.onload = function() {
	wsOpen();
}*/
var ws;
var uEmail = document.getElementById("uEmail").value;
var uNo = document.getElementById("uNo").value;
function wsOpen() {
	ws = new WebSocket("ws://" + location.host + "/project/chating");
	wsEvt();
}

//소켓이 연결되었을 떄 실행
function wsEvt() {
	ws.onopen = function(data) {
		//소켓이 열리면 동작
		console.log("소켓 연결됨");
	}

	ws.onmessage = function(data) {
		//메시지를 받으면 동작
		var msg = data.data;
		console.log(msg);
		if (msg.type = "alarm") {
			if (msg != null && msg.trim() != '') {
				var message = JSON.parse(msg);
				console.log(message);
				if (message.pEmail == uEmail) {
					var si = message.sessionId != null ? message.sessionId : "";
					$("#sessionId").val(si);
					$("#alarmTxt").prepend("<p class='msgtext'>" + message.uNick + "님이 예약하셨습니다." + "<span>방금 전</span></p>");
					$(".bell").css("color","#fbf07d");
				}else if (message.uEmail == uEmail) {
					$("#alarmTxt").prepend("<p class='msgtext'>" + "결제가 완료되었습니다." + "</p>");
				}
			}
		} else {
			console.warn("unknown type!");
		}
	}
}

function selectArlam(uEmail){

	let param = {"uEmail" : uEmail};

	$.ajax({
				url:"selectAlram.do",
				type: "GET",
				contentType : "application/json; charset=UTF-8",
				data: param,
				success: function(result){
					console.log(result);
					for(i=0; i < result.length ; i++){
						$("#alarmTxt").prepend("<p class='msgtext'>" + result[i].msg + "<span>" + result[i].subTime + "</span></p>");
					}
				}
			});
}
