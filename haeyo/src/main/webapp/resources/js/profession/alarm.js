/**
 * 
 */
window.onload = function() {
	wsOpen();
}
var ws;

function wsOpen(){
	ws = new WebSocket("ws://" + location.host + "/project/chating");
	wsEvt();
}
	//소켓이 연결되었을 떄 실행
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			console.log(msg);
			if(msg != null && msg.trim() != ''){
				var message = JSON.parse(msg);
				console.log(message);
				if(message.type == "alarm" && message.pEmail == "${user.uEmail}"){
					var si = message.sessionId != null ? message.sessionId : "";
					$("#sessionId").val(si);
					$("#alarmTxt").append("<div>" + message.msg + "</div>");	
				}else if( message.uEmail == "${user.uEmail}"){
					$("#alarmTxt").append("<div>" + "결제가 완료되었습니다." + "</div>");
				}
			}else{
				console.warn("unknown type!");
			}
		}
	
	}
	
	//소켓에 메세지 보내기
	function send() {
		//메시지 보낼때 json형태로 보낸다
		//type은 메세지, type이 message인 경우에 채팅이 발생한 경우
		//sessioId 값은 상대방과 자신을 구분할 수 있는 session값
		var option = {
				type: "alarm",
				sessionId : $("#sessionId").val(),
				pNo : "60001",
				pName : "황순근",
				uNo : "10001",
				uEmail : "soomin@bit.com",
				uNick : "${user.uNick}",
				pEmail : "wendy@bit.com",
				msg : "${user.uNick}" + "님이 회원님을 예약하셨습니다."
			}
		ajaxSend(option);
		let sendMsg = JSON.stringify(option);
		console.log();
		ws.send(sendMsg);
	}