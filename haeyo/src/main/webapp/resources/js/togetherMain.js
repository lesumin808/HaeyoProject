	$(document).ready(function(){
		//페이지 시작시 검색 자동 완성창 숨기기
		$('#previewSearch').hide();
	});
	
	setInterval( "setTimeBoardList()", 3000);
	
	function setTimeBoardList(){
		$.ajax({
			url:"t_getBoardMainTime.do",
			type:"GET",
			contentType: "application/json; charset=UTF-8",
//			data: param,
			success: function(result){
				console.log(result);
				
				var html = "";
				html = getBoardList(result);
				
				$('#t_content_box').html(html); //Main에 내용을 바꾼다.
			}
		});
	}
	// 글 목록 출력
	function getBoardList(boardList){
		var html = ""
		for(i in boardList){
			console.log(boardList[i].tBookmarkVO);
			html += "<div id='t_content'>"
			html +=	"  <div id='tAddress_Bookmark' class='clearfix'>"
			html += "    <div id='tAddress'>"+boardList[i].tAddress+"</div>"
			if(boardList[i].tBookmarkVO != null){
				html += "    	<div class='tBookmark select' id='"+boardList[i].tNo+"' onclick='tBookmark("+boardList[i].tNo+")'>1</div>"
			}else{
				html += "    	<div class='tBookmark' id='"+boardList[i].tNo+"' onclick='tBookmark("+boardList[i].tNo+")'>0</div>"
			}
			html += "  </div>"
			html += "  <div id='imgWrap'>"	
			html += "		<a href='t_getBoard.do?tNo="+boardList[i].tNo+"&tHeader="+boardList[i].tHeader+"'> <img src='/WEB-INF/boardImages/"+boardList[i].tPic1+"' height='250' width='250'></a>"	
			html += "  </div>"	
			html += "  <div id='tTitle'>"+boardList[i].tTitle+"</div>"
			html += "  <div id='tHeader'>"
			html += "		<button type='submit' class='heayo_btn'>"+boardList[i].tHeader+"</button>"
			html += "  </div>"
			html += "</div>"
		}
		return html;
	}
	// 북마크
	function checkBookmark(tNo){
		var bookmark = $('#'+tNo).text();
		console.log(tNo+","+bookmark);
		var param = {"tNo":tNo,"bookmark":bookmark}; //json 문자열로 만들어 넘기기때문에 잘 넘어간다.
		$.ajax({
			url:"t_checkBookmark.do",
			type: "GET",
			contentType : "application/json; charset=UTF-8",
			data: param,
			success: function(result){ //result json객체 타입으로 받아짐
				console.log(result);
				if(result == 1){
					$('#'+tNo).addClass('select');
					$('#'+tNo).text(1);
				}else if(result == 0){
					$('#'+tNo).removeClass('select');
					$('#'+tNo).text(0);
				}
			}
		});
	}
		
	//검색창
	function searchBoardList(nowPage){
		var searchInput = $('#searchInput').val();
		var param = {"searchInput":searchInput,"nowPage":nowPage};
		console.log(param);
		$.ajax({
			url:"t_searchBoardList.do",
			type:"GET",  //문제
			contentType:"application/json; charset=utf-8",
			data:param,
			dataType:"json",
			success: function(result){
				console.log(result);
				var paging = result.paging;
				var boardList = result.boardList;
				
				var html= "<div>검색결과</div>";
				html += getBoardList(boardList);

				$('#t_content_box').html(html); //Main에 내용을 바꾼다.
				$('#writingBoard').hide(); //글작성 버튼 숨기기
				$('#upperChange').hide(); 
				$('#t_contents').css("width", "900px");
				
				//페이징 출력부분
				var html2 = "";
				html2 += '<ul class="pagination">'
				
				if(paging.startPage == 1){
					html2 += '	<li class="page-item disabled">'
					html2 += '		<a class="page-link" href="#" >&laquo;</a></li>'
				}else{
					html2 += '	<li class="page-item">'
					html2 += '		<a class="page-link" href="#" onclick="searchBoardList('+(paging.startPage-1)+')">&laquo;</a></li>'
				}
										
				for(i = paging.startPage; i <= paging.endPage; i++){
					html2 += '<li class="page-item '+ (paging.nowPage == i ? "active" : "") +'">'
					html2 +=   '<a class="page-link" href="#" onclick="searchBoardList('+i+')">'+i+'</a>'
					html2 += '</li>'
				}
				
			    if(paging.endPage == paging.lastPage){
			    	html2 += '<li class="page-item disabled">'
			    	html2 += '		<a class="page-link" href="#" >&laquo;</a></li>'
			    }else{
			    	html2 += '<li class="page-item">'
			    	html2 += '		<a class="page-link" href="#" onclick="searchBoardList('+(paging.endPage+1)+')">&raquo;</a></li>'
			    }
			    html2 +='</ul>';
			  
				$('#paging_box').html(html2);
			}
		});
	//	$("span:contains('홍대')").css("color", "blue");  글자색바꾸기 나중에
	//	$("#tTitle:contains('"+searchInput+"')").css("color", "blue");
	}
	
	//검색창 자동완성(미리보기)
	function previewBoardList(){
		var searchInput = $('#searchInput').val();
		if(searchInput != ''){
			var param = {"searchInput": searchInput};
			console.log(param);
			$.ajax({
				url:"t_previewBoardList.do",
				type:"GET", 
				contentType:"application/json; charset=utf-8",
				data:param,
				dataType:"json",
				success: function(result){
					console.log(result);
					var html= "";
					for(i in result){
						html += "<a href='t_getBoard.do?tNo="+result[i].tNo+"'>"+result[i].tTitle+"</a></br>"
					}
					$('#previewSearch').html(html).show();
				}
			});
		}else{
			$('#previewSearch').hide();
			
		}
	} 
	
