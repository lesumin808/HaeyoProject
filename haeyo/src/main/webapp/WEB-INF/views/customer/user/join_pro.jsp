<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page import="com.haeyo.biz.user.UserVO"%>
<link href="resources/image/icon.ico" rel="shortcut icon"
	type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/join_pro.js" defer></script>
<link href="resources/css/join_pro.css" rel="stylesheet">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=52c7f3d664707319c1c8977f5f4a2421&libraries=services"></script>
<script type="text/javascript" src="resources/js/joinpro_addr.js" defer></script>
<!---------------------body--------------------->
<%
session = request.getSession();
UserVO user = (UserVO) session.getAttribute("user");
%>

<div id="join_pro-body">
	<div id="join_pro_title">
		<h1>전문가</h1>
		<span><img src="resources/image/logo2.png"></span>
	</div>
	<form action="insertPro.do" name=form method="post"
		onsubmit="return joinpro_check();">
		<fieldset>
			<div class="form-group">
				<div id="userpic-wrapper">
					<img id="thumb-img"> <label class="click-icon" for="pPic"><i
						class="fas fa-camera"></i></label> <input type="file" name="pPic"
						id="pPic" class="upload-box upload-plus" accept="image/*"
						onchange="thumbnail(event)">
				</div>
			</div>
			<div class="profile_p">
				<p>전문가님! 본인의 사진으로 신뢰도를 높여주세요!</p>
			</div>
			<div class="form-group">
				<label for="p_category">전문분야</label></br>
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
					<div id="Category">
						<input type="radio" class="option-input radio" id="pCategory0"
							name="pCategory" value="청소" checked /> <label>청소</label> <input
							type="radio" class="option-input radio" id="pCategory1"
							name="pCategory" value="이사" /> <label>이사</label> <input
							type="radio" class="option-input radio" id="pCategory2"
							name="pCategory" value="수리" /> <label>수리</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="p_gender">성 별</label></br>
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
					<div id="Gender">
						<input type="radio" class="option-input radio" id="pGender0"
							name="pGender" value="0" checked /> <label>남 자</label> <input
							type="radio" class="option-input radio" id="pGender1"
							name="pGender" value="1" /> <label>여 자</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div id="address-group" class="clearfix">
					<label for="address">활동지역</label> <input type="text"
						name="pAddress" class="form-control" id="pAddress"
						placeholder="서울시 마포구"> <input type="button"
						class="searchBtn" onclick="sample5_execDaumPostcode()"
						value="주소 검색"><br>
					<div id="map"></div>
					<input type="hidden" id="uY" name="pLocX" value="" /> <input
						type="hidden" id="uX" name="pLocY" value="" />
				</div>
			</div>

			<div class="form-group">
				<div id="certification-group" class="clearfix">
					<label for="certification">자격증</label>
					<!-- 첨부 버튼 -->
					<div id="attach">
						<label class="waves-effect waves-teal btn-flat"
							for="uploadInputBox">첨부</label> <input id="uploadInputBox"
							style="display: none" type="file" name="certification" multiple />
					</div>
					<!-- 미리보기 영역 -->
					<div id="preview" class="content"></div>
				</div>
			</div>
			<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
			<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script> -->
			<script>
				//임의의 file object영역
				var files = {};
				var previewIndex = 0;

				// image preview 기능 구현
				// input = file object[]
				function addPreview(input) {
					if (input[0].files) {
						//파일 선택이 여러개였을 시의 대응
						for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
							var file = input[0].files[fileIndex];

							if (validation(file.name))
								continue;

							var reader = new FileReader();
							reader.onload = function(img) {
								//div id="preview" 내에 동적코드추가.
								//이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
								var imgNum = previewIndex++;
								$("#preview")
										.append(
												"<div class=\"preview-box\" value=\"" + imgNum +"\">"
														+ "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
														+ "<p>"
														+ file.name
														+ "</p>"
														+ "<a href=\"#\" value=\""
														+ imgNum
														+ "\" onclick=\"deletePreview(this)\">"
														+ "삭제" + "</a>"
														+ "</div>");
								files[imgNum] = file;
							};
							reader.readAsDataURL(file);
						}
					} else
						alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
				}

				//preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
				function deletePreview(obj) {
					var imgNum = obj.attributes['value'].value;
					delete files[imgNum];
					$("#preview .preview-box[value=" + imgNum + "]").remove();
					resizeHeight();
				}

				//client-side validation
				//always server-side validation required
				function validation(fileName) {
					fileName = fileName + "";
					var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
					var fileNameExtension = fileName.toLowerCase().substring(
							fileNameExtensionIndex, fileName.length);
					if (!((fileNameExtension === 'jpg')
							|| (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
						alert('jpg, gif, png 확장자만 업로드 가능합니다.');
						return true;
					} else {
						return false;
					}
				}

				$(document)
						.ready(
								function() {
									//submit 등록. 실제로 submit type은 아니다.
									$('.submit a')
											.on(
													'click',
													function() {
														var form = $('#uploadForm')[0];
														var formData = new FormData(
																form);

														for (var index = 0; index < Object
																.keys(files).length; index++) {
															//formData 공간에 files라는 이름으로 파일을 추가한다.
															//동일명으로 계속 추가할 수 있다.
															formData
																	.append(
																			'files',
																			files[index]);
														}

														//ajax 통신으로 multipart form을 전송한다.
														$
																.ajax({
																	type : 'POST',
																	enctype : 'multipart/form-data',
																	processData : false,
																	contentType : false,
																	cache : false,
																	timeout : 600000,
																	url : '/imageupload',
																	dataType : 'JSON',
																	data : formData,
																	success : function(
																			result) {
																		//이 부분을 수정해서 다양한 행동을 할 수 있으며,
																		//여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
																		//-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
																		if (result === -1) {
																			alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
																			// 이후 동작 ...
																		} else if (result === -2) {
																			alert('파일이 10MB를 초과하였습니다.');
																			// 이후 동작 ...
																		} else {
																			alert('이미지 업로드 성공');
																			// 이후 동작 ...
																		}
																	}
																//전송실패에대한 핸들링은 고려하지 않음
																});
													});
									// <input type=file> 태그 기능 구현
									$('#attach input[type=file]').change(
											function() {
												addPreview($(this)); //preview form 추가하기
											});
								});
			</script>
			<div class="form-group">
				<label for="pIntroduce">전문가소개</label>
				<textarea class="form-control" id="pIntroduce" name="pIntroduce"
					rows="3" placeholder="자신을 소개하세요"></textarea>
			</div>
			<div class="form-group">
				<div class="pAgreeCheck">
					<input type="checkbox" class="pAgreeCheck" id="pAgreeCheck1"
						name="pAgreeCheck" value="1"> <input type="hidden"
						class="pAgreeCheck" id="pAgreeCheck0" name="pAgreeCheck" value="0"><label
						class="pAgreeCheck-label" for="pAgreeCheck">
						<p>
							'전문가'의 <span>이용약관</span> 및 <span>개인정보 처리방침</span>에 동의합니다
						</p>
					</label> <a href="agree.jsp" target="_blank">자세히</a>
				</div>
			</div>
			<div class="box">
				<div id="join_pro-button">
					<!-- <form action="#" method="get"> -->
					<button type="submit" class="btn-secondary">세부분야 선택하기</button>
					<!--</form> -->
				</div>
			</div>
		</fieldset>
	</form>
</div>