<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<script src="resources/js/profession/professionList.js" defer></script>
<link href="resources/css/profession/professionList.css" rel="stylesheet">
<!---------------------MainStrart--------------------->
	<main>
		<section id="recommendWrap">
			<div id="recommend" class="clearfix">
				<h1>맞춤 전문가</h1>
				<c:forEach var="proRecom" items="${proRecom}">
					<div class="box">
						<a href="detail.do?pNo=${proRecom.pNo}&pCategory=${proRecom.pCategory}">
							<div class="box_image">
								<span class="pCate">${proRecom.pCategory}</span>
								<h1>${proRecom.uName}</h1>
								<h2>${proRecom.pAddress}</h2>
								<div class="prostarWrap">
									<ul class="prostar">
									</ul>
									<span class="proscore">${proRecom.score}</span>
								</div>
							</div>
						</a> <span class="profile_img"><img
							src="resources/image/${proRecom.pPic}.jpg"></span>
						<div class="book" onclick="bookplus(${proRecom.pNo},${user.uNo})"></div>
					</div>
				</c:forEach>

				<h3 id="location">
					<i class="fas fa-map-marker-alt"></i> ${serchloc}
				</h3>
			</div>
		</section>

		<section id="listWrap">
			<div id="professionList">
				<h1>전문가 리스트</h1>
				<select id="order" name="order" onchange="selectList(this.value)">
					<option value="">등록순</option>
					<option value="1">평점순</option>
					<option value="2">리뷰순</option>
					<option value="3">거리순</option>
				</select>
				<div id="proWrap">
					<c:forEach var="proList" items="${proList}">
					<div class="pro clearfix">
						<span class="proList_img"><img src="resources/image/${proList.pPic}.jpg"></span>
						<div class="pro_txt">
							<div class="proName_txt clearfix">
								<h1>${proList.uName}</h1>
								<span class="pCate">${proList.pCategory}</span>
							</div>
							<h2>${proList.pAddress}</h2>
							<p>${proList.pIntroduce}</p>
							<div class="starWrap">
								<ul class="star clearfix">
								</ul>
								<span class="score">${proList.score}</span>
							</div>
							<div class="rihgt_txt">
								<span class="book2" onclick="bookplus(${proList.pNo},${user.uNo})"></span>
								<button class="proList_btn" onclick="location.href='detail.do?pNo=${proList.pNo}&pCategory=${proList.pCategory}'">
									상세 보기 <i class="fas fa-arrow-right"></i>
								</button>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</section>
	</main>
	<!---------------------MainEnd--------------------->