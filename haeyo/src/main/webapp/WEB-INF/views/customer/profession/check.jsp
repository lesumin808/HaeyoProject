<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75d6c9cf371d5f0cd64d40592c350582&libraries=services"></script>
<link href="resources/css/profession/checkList.css" rel="stylesheet">
<script>
window.onload = function() {
	wsOpen();
}
</script>
<!---------------------main--------------------->
<main>
	<section id="conbg" class="clearfix">
		<div id="checklistWrap" class="clearfix">
			<div id="checklist" class="clearfix">
				<p>전문가 체크 리스트</p>
				<form action="recommend.do" method="get">
					<div class="box">
						<label>어느 지역을 찾으시나요?</label><br> <input type="text"
							id="searchLoc" name="serchloc" /><input type="button"
							id="searchBtn" onclick="PostCode()" value="주소 검색" />
						<div id="map"></div>
						<input type="hidden" id="locX" name="pickLocX" value="" /> <input
							type="hidden" id="locY" name="pickLocY" value="" />
					</div>
					<div class="box">
						<label>서비스 종류는 무엇인가요?</label><br>
						<ul>
							<li><input type="radio" name="pCategory" value="청소"
								class="radio_btn"><span>청소</span></li>
							<li><input type="radio" name="pCategory" value="이사"
								class="radio_btn"><span>이사</span></li>
							<li><input type="radio" name="pCategory" value="수리"
								class="radio_btn"><span>수리</span></li>
						</ul>
					</div>
					<div class="box">
						<label>원하시는 일정이 있으시나요?</label><br> <input type="date"
							id="startDate" name="startDate" value="" /> <input type="date"
							id="endDate" name="EndDate" max="" />
					</div>
					<button type="submit" class="heayo_btn">제출하기</button>
				</form>
				<script src="resources/js/profession/checkList.js"
					type="text/javascript"></script>
			</div>
			<div id="checkInfo">
				<h3>
					<i class="far fa-check-circle"></i> 전문가 체크
				</h3>
				<p>
					사소하고 작은 서비스가 필요하셨나요?<br /> 해요는 1인가구를 위한 전문 서비스입니다. 간단한 수리, 청소, 이사를
					해요에게 맡겨주세요 <br /> <br /> 서비스가 필요한 고객과 서비스를 제공하는 전문가를 쉽고 빠르게
					연결해드리는 전문가 매칭 서비스입니다.<br /> 1분 내외의 요청서를 작성하면, 고객님께 맞는 전문가 리스트를
					뽑아드립니다. <br />
					<br /> <span>맘에 드는 전문가의 맞춤형 서비스를 받아보세요!</span>
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