<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link href="resources/css/main.css" rel="stylesheet">
<!DOCTYPE html>
<script>
window.onload = function(){
	wsOpen();
	let uEmail = "${user.uEmail}";
	selectArlam(uEmail);
}
</script>
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">어떤 서비스를
					원하시나요?</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div id="modal-body">
				<form action="#" method="get">
					<button type="button" class="btn-secondary"
						onclick="location.href='#.jsp'">수 리</button>
					<button type="button" class="btn-secondary">이 사</button>
					<button type="button" class="btn-secondary">청 소</button>
				</form>
			</div>
		</div>
	</div>
</div>
<!--modalEnd-->

<main id="main">
	<section id="visual" class="clearfix">
		<p>수리! 청소! 이사!</p>
		<p>
			<span>혼자사는 당신</span>을 위한 <span>전문가</span>를 소개해드립니다.
		</p>
		<button type="button" id="heayo" class="heayo_btn" data-toggle="modal"
			data-target="#exampleModalCenter">전문가 견적받기</button>
		<span class="vimg_01"><img src="resources/image/repair.png"></span>
		<span class="vimg_02"><img src="resources/image/chair.png"></span>
		<span class="vimg_03"><img src="resources/image/clean.png"></span>
	</section>
	<section id="con01">
		<div class="withDo conwidth">
			<div></div>
		</div>
	</section>
	<section id="con02">
		<div class="selfDo conwidth">
			<h3>혼자해요</h3>
		</div>
	</section>
</main>