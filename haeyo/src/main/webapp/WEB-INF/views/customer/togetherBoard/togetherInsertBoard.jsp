<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="image/icon.ico" rel="shortcut icon" type="image/x-icon">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a53c0b810ce1d051d15c474f3785be1d&libraries=services"></script>
    <link href="resources/css/main.css" rel="stylesheet">
    <link href="resources/css/common.css" rel="stylesheet">
    <script defer src="resources/js/common.js"></script>
	<link href="resources/css/togetherInsertBoard.css?v=<%=System.currentTimeMillis()%>" rel="stylesheet">
<title>함께해요 게시글 작성</title>
    
</head>
<body>

<!------- contents start --------->
	<div id="contents">
		<div id="writingheader">글 작성</div>
		<div id="insertForm">
			<form action="t_insertBoard.do" method="post" enctype="multipart/form-data">
				<div class="form-inline">
					<label for="exampleSelect1">말머리</label>
					<select class="form-control" id="tHeader" name="tHeader" onchange="dSearchLocShow(this.value);">
						<option value="함께먹어요">함께 먹어요</option>
						<option value="함께출퇴근해요">함께 출퇴근해요</option>
						<option value="함께나눠요">함께 나눠요</option>
					</select>
				</div>	
				<div class="form-group">
	     			<label for="tTitle">제목</label>
	    			<input type="text" class="form-control" id="tTitle" name="tTitle">
	  			</div>
					
				<div class="form-inline">
   					<label>모임 장소</label><br>
                      <input type="text" id="searchLoc1" name="tAddress" value="" class="form-control" /><input type="button" id="searchBtn1"
                          onclick="PostCode()" value="주소 검색" class="btn btn-primary"/>
                    <div id="map"></div>
                    <input type="hidden" id="tLocX" name="tLocX" value="" />
                    <input type="hidden" id="tLocY" name="tLocY" value="" />
	  			</div>
				<div class="form-inline" id="dSearchLoc">
	  			</div>
				<div class="form-group">
	     			<label for="tJoinDate">날짜</label>
	    			<input type="datetime-local" class="form-control" id="tJoinDate" name="tJoinDate">
	  			</div>
				<div class="form-inline">
					<label for="tJoinMax">참여가능 인원수</label>
					<select class="form-control" id="tJoinMax" name="tJoinMax">
						   <option>1</option>
						   <option>2</option>
						   <option>3</option>
						   <option>4</option>
						   <option>5</option>
						   <option>6</option>
						   <option>7</option>
						   <option>8</option>
						   <option>9</option>
						   <option>10</option>
					</select>
				</div>	
				<div class="form-group">
					<label for="tContent">내용</label>
					<textarea class="form-control" id="tContent" name="tContent" cols="8" rows="8"></textarea>
				</div>
				<div class="form-group">
					<label for="uploadFile1">썸네일 첨부</label>
					<input type="file" class="form-control-file" id="uploadFile1" name="uploadFile1" onchange="loadFile(event);">
				</div>
				<div class="form-group">
					<label for="uploadFile2">사진 첨부</label>
					<input type="file" class="form-control-file" id="uploadFile2" name="uploadFile2" onchange="loadFile(event);"/>
				</div>
				<input type="hidden" id="hNo" name="hNo" value="${sessionScope.user.uNo}">
				<div id="insertbutton">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-primary">다시 쓰기</button>
					<button type="button" onclick="location.href='t_getBoardMain.do'" class="btn btn-primary">취소</button>
				</div>
			</form>
		</div>
	</div>
    <script src="resources/js/togetherInsertBoard.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>