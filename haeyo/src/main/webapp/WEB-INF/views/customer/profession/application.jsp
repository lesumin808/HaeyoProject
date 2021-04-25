<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link href="resources/css/profession/application.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75d6c9cf371d5f0cd64d40592c350582&libraries=services"></script>
<script src="resources/js/profession/application.js" defer></script>
<script>
window.onload = function(){
    let subCate = ${Catetxt};
    insertCate(subCate);
}
</script>
<!DOCTYPE html>
<!---------------------main--------------------->
<main>
	<section id="conbg" class="clearfix">
		<div id="requestlistWrap" class="clearfix">
			<div id="requestlist" class="clearfix">
				<p>전문가 신청서</p>
				<form action="insertReser.do" method="GET">
					<input type="hidden" id="pNo" name= "pNo" value="">
					<input type="hidden" id="rsvCategory" name="rsvCategory" value="" />
					<input type="hidden" id="pName" name="pName" value="">
					<input type="hidden" id="pEmail" name="pEmail" value="">
					<div class="box">
						<ul id="sub_category" class="clearfix">
						</ul>
					</div>
					<div class="box">
						<label>사진을 첨부하시겠어요?</label><br>
						<ul>
							<li><input type="radio" name="rsvPic" value="Y"
								class="radio_btn" onclick="value_check()"><span>예</span></li>
							<li><input type="radio" name="rsvPic" value="null"
								class="radio_btn" onclick="value_check()"><span>아니요</span></li>
						</ul>
						<div id="photoWrap">
							<div id="btn_wrap" class="clearfix">
								<button type="button" onclick="addFile()">
									<i class="fas fa-plus"></i>
								</button>
							</div>
							<div id="fileWrap" class="clearfix">
								<label for="pic-thumb"></label>
								<input type="file" name="rsvPic" value="" id="pic-thumb" class="filebtn" accept="image/png, image/jpeg" onchange="thumbnail(event)"/>
							</div>
							<div id="photo" class="clearfix">
								<div id="thumb-img" class="pic_thumb">
									<img src="">
								</div>
							</div>
						</div>
					</div>
					<div class="box">
						<label>어느 지역이신가요?</label><br> <input type="text"
							id="searchLoc" name="rsvLoc" /><input type="button"
							id="searchBtn" onclick="PostCode()" value="주소 검색" />
						<div id="map"></div>
					</div>
					<div class="box">
						<label>일정을 입력해주세요</label><br>
						<input type="date" id="rsvDate"
							name="rsvDate" value="" />
						<!-- 	<input type="datetime-local" id="rsvTime" value=""/> -->
					</div>
					<div class="box">
						<label>세부사항을 입력해주세요</label><br>
						<textarea name="rsvDetail" cols="50" rows="5"></textarea>
						<br>
					</div>
					<button type="submit" class="heayo_btn">제출하기</button>
				</form>
			</div>
			<div id="checkInfo">
				<h3>
					<i class="far fa-check-circle"></i> 전문가 신청서
				</h3>
				<p>
					사소하고 작은 서비스가 필요하셨나요?<br /> 해요는 <span>1인가구를 위한 전문 서비스</span>입니다. 간단한
					수리, 청소, 이사를 해요에게 맡겨주세요 <br /> <br /> <span>서비스가 필요한 고객과 서비스를
						제공하는 전문가</span>를 쉽고 빠르게 연결해드리는 전문가 매칭 서비스입니다.<br /> 1분 내외의 요청서를 작성하면,
					고객님께 맞는 전문가 리스트를 뽑아드립니다. <br />
				<p>
					전문가에게 보여 줄 사진을 첨부하실 수 있고 지역을 입력하시면 간단하게 일정등록이 완료됩니다! 일정을 완료하기 위해선 <span
						class="red">기본 예약금 10,000원</span>을 결제 하셔야 됩니다.
				</p>
				<p>(예약 등록일 일주일전 전액환불 가능합니다)</p>
				</p>
			</div>
			<div id="chatbotWrap">
				<div id="chatTalk">
					<p>저에게 물어봐 주세요!</p>
				</div>
				<div id="chatbot">
					<span><i class="far fa-smile fa-spin fa-fw"></i></span>
				</div>
			</div>
		</div>
	</section>
</main>
