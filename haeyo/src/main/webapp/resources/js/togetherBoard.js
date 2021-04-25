//var sessionUser = <%=session.getAttribute("user") %>;
//var sessionUno = sessionUser.uNo;
var sessionUno = 10001;

function insertReply(){
		var replyParam = $('#t_replyForm').serialize();
		console.log(replyParam);
		$('#trContent').val('');
		
		$.ajax({
			url:"t_insertReply.do",
			type: "GET",
			data: replyParam,
			contentType : "application/json; charset=UTF-8",
			dataType: "json",
			success: function(result){
				console.log(result);
				result="<tr id='trNo"+result.trNo+"'>"
					+"<td>"+result.userVO.uPic+"</td>"
					+"<th>"+result.userVO.uNick+"</th>"
					+"<td>"+result.trContent+"</td>"
					+"<td>"+result.trCredate+"</td>"
					+"<td><button class='heayo_btn' onclick='editReply("+result.trNo+","+result.tNo+");'>수정</button></td>"
					+"<td><button class='heayo_btn' onclick='deleteReply("+result.trNo+");'>삭제</button></td>"
					+"</tr>";
				$('#t_replyTable').append(result);
			}
		});
}


function deleteReply(trNo){
	var replyParam = {"trNo":trNo}
	console.log(replyParam);
	$.ajax({
		url:"t_deleteReply.do",
		type: "GET",
		contentType : "application/json; charset=UTF-8",
		data: replyParam,
		dataType: "json",
		success: function(result){
			console.log(result);
			if(result == 1 ){
				$('#trNo'+trNo).remove();
			}
		}
	});
}

function editReply(trNo,tNo){
	var uPic = $('#trNo'+trNo).children().eq(0).text();
	var uNick = $('#trNo'+trNo).children().eq(1).text();
	var trContent = $('#trNo'+trNo).children().eq(2).text();
	var trCredate = $('#trNo'+trNo).children().eq(3).text();
	console.log(uPic+","+uNick+","+trContent+","+trCredate);
	updateReplyInput = "<td>"+uPic+"</td>"
					+"<th>"+uNick+"</th>"
					+"<td><textarea cols='40' rows='3' id='updateTrContent'"
					+"name='updateTrContent'>"+trContent+"</textarea></td>"
					+"<td>"+trCredate+"</td>"
					+"<td><button class='heayo_btn' onclick='updateReply("+trNo+");'>등록</button></a></td>"
					+"<td><button class='heayo_btn' onclick='cancleReply("+trNo+","+tNo+",\""+trContent+"\");'>취소</button></a></td>";
	$('#trNo'+trNo).html(updateReplyInput);	
}

function cancleReply(trNo,tNo,trContent){
	var uPic = $('#trNo'+trNo).children().eq(0).text();
	var uNick = $('#trNo'+trNo).children().eq(1).text();
	var trCredate = $('#trNo'+trNo).children().eq(3).text();
	
	updateReplyInput = "<td>"+uPic+"</td>"
					+"<th>"+uNick+"</th>"
					+"<td>"+trContent+"</td>"
					+"<td>"+trCredate+"</td>"
					+"<td><button class='heayo_btn' onclick='editReply("+trNo+","+tNo+");'>수정</button></td>"
					+"<td><button class='heayo_btn' onclick='deleteReply("+trNo+");'>삭제</button></td>";
	console.log(uPic+","+uNick+","+trContent+","+trCredate);
	$('#trNo'+trNo).html(updateReplyInput);
}

function updateReply(trNo){
	var trContent = $('#updateTrContent').val();
	var param = {"trNo":trNo, "trContent":trContent}
	console.log(param);
	$.ajax({
		url:"t_updateReply.do",
		type: "GET",
		contentType : "application/json; charset=UTF-8",
		data: param,
		success: function(result){
			console.log(result);
			var	t_reply_content = "<tr id='trNo"+result.trNo+"'>"
				 + "<td>"+result.userVO.uPic+"</td>"
				 + "<th>"+result.userVO.uNick+"</th>"
				 + "<td>"+result.trContent+"</td>"
				 + "<td>"+result.trCredate+"</td>"
				 + "<td><button class='heayo_btn' onclick='editReply("+trNo+","+result.tNo+");'>수정</button></td>"
				 + "<td><button class='heayo_btn' onclick='deleteReply("+trNo+");'>삭제</button></td>"
				 + "</tr>";
			console.log(t_reply_content);
			$('#trNo'+trNo).replaceWith(t_reply_content);
		}
	});
}

function checkJoin(tNo,tJoinNow,tJoinMax){
	console.log("tNo: "+tNo+",tJoinNow: "+tJoinNow+",tJoinMax: "+tJoinMax);
	
	var joinOrCancle= $('#tJoinButton').text();
	
	if(tJoinNow >= tJoinMax){
		alert("이미 정원이 다 찼습니다.");
	}else{
		var param = {"tNo":tNo,"joinOrCancle":joinOrCancle};
		console.log(param);
		$.ajax({
			url:"t_checkJoin.do",
			type: "GET",
			data: param,
			dataType: 'json',
			contentType : "application/json; charset=UTF-8",
			success: function(result){
				console.log(result);
				$('#tJoinNow').text(result.tJoinNow);
				if(joinOrCancle == '참여하기'){
					$('#tJoinButton').text('참여취소');
				}else if(joinOrCancle == '참여취소'){
					$('#tJoinButton').text('참여하기');
				}
				
			}
		});
	}
}

function checkBookmark(tNo){
	var bookmark = $('.tBookmark').text();
	console.log(tNo+","+bookmark);
	var param = {"tNo":tNo,"bookmark":bookmark};
	$.ajax({
		url:"t_checkBookmark.do",
		type: "GET",
		dataType: 'json',
		data: param,
		contentType : "application/json; charset=UTF-8",
		success: function(result){
			console.log(result);
			if(result == 1){
				$('.tBookmark').addClass('select');
				$('.tBookmark').text(1);
			}else if(result == 0){
				$('.tBookmark').removeClass('select');
				$('.tBookmark').text(0);
			}
		}
	});
}



