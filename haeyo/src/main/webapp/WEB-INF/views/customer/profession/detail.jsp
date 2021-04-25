<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link href="resources/css/profession/professionDetail.css" rel="stylesheet">
<script src="resources/js/profession/professionDetail.js" defer></script>
<script src="resources/js/jquery-1.12.4.min.js"></script>
<script>
let proObj = {
		pNo: ${proDetail.pNo},
		pCategory: "${proDetail.pCategory}"
}

window.onload = function(){
	wsOpen();
	ajaxTest(proObj);
	startScore();
}

function ajaxTest(proObj){
	$.get({ // 컨트롤러와 통신
			data: proObj,
			url: "subCategory.do",
			success : function(data) {
				console.log(data);
				console.log(JSON.parse(data));
				console.log(data.pToilet);
				console.log();                                
				//정보 추출
				//console.log(subCategory);
				//subCategory();
				obj = JSON.parse(data);
				let array = [];
				//해당 배열 담기
				for(prop in obj)  {
					if(obj[prop] == 1){
						document.getElementById(prop).style.display = "flex";
						array.push(prop);
					}
				}
				console.log(array);
				labelAdd(array);
			}
	});
}

function ajaxReview(){
		var form = $('.reviewContent')[0];
		var data = new FormData(form);
		$.ajax({
			url:"",
			type: "GET",
			contentType : "application/json; charset=UTF-8",
			data: data,
			dataType: "json",
			success: function(result){
				console.log(result);
			}
		});
}

</script>
<!--modalStart-->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">
					<p>${proDetail.uName}전문가님에게</p>
					어떤 서비스 견적을 받고 싶으신가요?
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div id="modal-body">
				<form action="application.do" method="GET">
					<input type="hidden" name="pNo" value="${proDetail.pNo}" />
					<input type="hidden" name="pCategory" value="${proDetail.pCategory}" />
					<input type="hidden" name="pName" value="${proDetail.uName}"/>
					<input type="hidden" name="pEmail" value="${proDetail.uEmail}"/>
					<div id="sub_cateWrap">
						<ul id="sub_category" class="clearfix">
						</ul>
					</div>
					<button type="submit" class="btn-secondary">제출하기</button>
				</form>
			</div>
		</div>
	</div>
</div>
<!--modalEnd-->
<main>
	<section id="profileWrap">
		<div id="profile_top">
			<h1>전문가 상세 정보</h1>
			<h3>
				<i class="fas fa-map-marker-alt"></i> ${proDetail.pAddress}
			</h3>
		</div>

		<div id="profile_t" class="clearfix">
			<div id="pro_img" class="clearfix">
			<img src="resources/image/${proDetail.pPic}.jpg">
			</div>
			<div id="pro_txt">
				<div id="nameWrap">
					<h2>${proDetail.uName}</h2>
					<span id="pcategory">${proDetail.pCategory}</span>
				</div>
				<div class="starWrap" class="clearfix">
					<ul class="star" class="clearfix">
					</ul>
					<span class="score">${proDetail.score}</span>
				</div>
				<ul id="pro_rev">
					<li>후기 <span id="pro_span">${proDetail.count}</span></li>
					<li>찜하기 <span>2</span></li>
				</ul>
			</div>
			<div id="pro_req">
				<div id="book">북마크</div>
				<button id="reqBtn" data-toggle="modal"
					data-target="#exampleModalCenter">견적 요청하기</button>
			</div>
		</div>
	</section>

	<section id="contentsWrap">
		<div id="con01">
			<h3>한줄소개</h3>
			<p>${proDetail.pIntroduce}</p>
		</div>
		<div id="con02" class="clearfix">
			<div id="subCon01">
				<h3>추가 데이터</h3>
				<!-- <span><img src="resources/image/${proDetail.certification}.jpg"></span> -->
			</div>
			<div id="subCon02">
				<h3>제공 서비스</h3>
				<div id="pLiving">생활수리</div>
				<div id="pElectric">전기설치수리</div>
				<div id="pDoor">문설치수리</div>
				<div id="pTransportation">용달화물운송</div>
				<div id="pOneroom">소형원룸이사</div>
				<div id="pKeep">짐보관</div>
				<div id="pRefrigerator">냉장고청소</div>
				<div id="pToilet">화장실청소</div>
				<div id="pWaterpipe">수도설치수리</div>
				<div id="pTrash">철거정리</div>
				<div id="pArrangement">정리수납컨설팅</div>
				<div id="pHomein">입주이사청소</div>
			</div>
		</div>
		<div id="con03">
			<h3>일정</h3>
			<button onclick="window.open('viewproCalendar.do?pNo=${proDetail.pNo}','_blank','width=880px, height=600px, left=300px, top=100px')">
				<i class="far fa-calendar-alt"></i> 전문가 일정 확인하기<i
					class="fas fa-arrow-right"></i>
			</button>
			<!-- <div id="schedual">일정</div>-->
			<a href="#Top">
				<div id="top">
					<i class="fas fa-arrow-up"></i>
				</div>
			</a>
		</div>
		<!--<div id="reqBtn_b">견적 요청하기</div>-->
	</section>

	<section id="reviewWrap">
		<div id="reviewTit">
			<h1>
				후기 <span>${proDetail.count}</span>
			</h1>
		</div>
		<c:forEach var="proReview" items="${proReview}">
			<div class="scoreWrap clearfix">
				<ul class="star clearfix">
				</ul>
				<span class="score">${proReview.score}</span> <span class="redate">${proReview.reviewDate}</span>
			</div>
			<div class="userReview clearfix">
				<span class="userImage"><img
					src="resources/image/${proReview.uPic}.jpg"></span>
				<h1>${proReview.uNick}</h1>
				<input id="reviewCon" type="text" value="${proReview.reviewContent}" disabled>
				<!--<p id="reviewP">${proReview.reviewContent}</p>  -->
				<input class="reviewEmail" type="hidden" value="${proReview.uEmail}"/>
				<c:if test="${user.uEmail eq proReview.uEmail}">
				<span class="reviewBtn">
				<button class="revModifyBtn" type="button" onclick="showModify()">수정</button>
				<button class="revModifyBtn" type="button">삭제</button>
				</span>
				</c:if>
			</div>
				<div id="textWrap">
					<form id="reviewModify">
						<textarea name="reviewContent" rows="3" cols="100" maxlength="100" autofocus>${proReview.reviewContent}
						</textarea>
						<input id="reviewNo" name="reviewNo" type="hidden" value="${proReview.reviewNo}"/>
					</form>
						<button type="button" onclick="updateReview()">등록</button>
						<button type="button" onclick="cancelModify()">취소</button>
				</div>	
		</c:forEach>
	</section>
</main>
<!--main -->