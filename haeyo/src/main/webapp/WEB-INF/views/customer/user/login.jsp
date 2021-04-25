<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.haeyo.biz.user.impl.UserDAOMybatis"%>
<%@ page import="com.haeyo.biz.user.UserVO"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%
	String errMsg = (String) session.getAttribute("errMsg");
if (errMsg == null)
	errMsg = "";

session.invalidate();
%>
<link href="resources/image/icon.ico" rel="shortcut icon"
	type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="resources/css/login.css" rel="stylesheet">
<script defer src="resources/js/login.js"></script>
<%
session = request.getSession();
UserVO user = (UserVO) session.getAttribute("user");
%>
<form action="login.do" name=form method="post"
	onsubmit="return Login_proc.jsp();">
	<div id="login-body">
		<div id="login_title">
			<h1>로그인</h1>
			<span><img src="resources/image/logo2.png"></span>
		</div>
		<fieldset>
			<div class="form-group">
				<label for="uEmail">이메일을 입력하세요</label> <input type="text"
					class="form-control" id="uEmail" name="uEmail"
					value="${param.uEmail}" aria-describedby="emailHelp"
					placeholder="email@bit.com">
			</div>
			<div class="form-group">
				<label for="uPwd">비밀번호를 입력하세요</label> <input type="password"
					class="form-control" id="uPwd" name="uPwd" value="${param.uPwd}"
					placeholder="">
			</div>
			<div id="errMsg" style="color: red"><%=errMsg%></div>
			<div class="box">
				<div id="login-button">
					<button type="submit" class="btn-secondary"
						onclick="location.href='#.jsp'">로 그 인</button>
				</div>
				<div class="pass-join">
					<ul class="clearfix">
						<li><a href="find_pass.jsp">비밀번호 찾기</a></li>
						<li><a href="Join.jsp">회원가입</a></li>
					</ul>
				</div>
				<div class="sns-info">
					<p>- SNS계정으로 간편 로그인 및 회원가입 -</p>
				</div>
				<div class="sns-button">
					<!-- KAKAO Login Start -->
					<a href="javascript:kakaoLogin()"><img
						src="resources/image/kakao.png" alt="kakao-login"></a>
					<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
					<script>
							window.Kakao.init("c231490eabe1939333889bb44ba46f21");	
							
							function kakaoLogin() {
								window.Kakao.Auth.login({
									 scope:'profile, account_email, gender',	//받아올 정보
									 success: function(authObj) {		
										 console.log(authObj);
										 window.Kakao.API.request({		// 로그인 후에 받아올 유저의 정보
											url:'/v2/user/me',		// 로그인한 사용자의 정보를 받아오는 url	
										 	success: res => {
										 		const kakao_account = res.kakao_account;
										 		console.log(kakao_account);
										 	}
										 });
									 }
								})
							}</script>
					<!-- KAKAO Login End -->
					<!-- Naver Login Start -->
					<%
						String clientId = "tjFd03HRfNwCYRcx8l_F";//애플리케이션 클라이언트 아이디값";
					String redirectURI = URLEncoder.encode("http://localhost:9999/project/index.jsp", "UTF-8");
					SecureRandom random = new SecureRandom();
					String state = new BigInteger(130, random).toString();
					String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
					apiURL += "&client_id=" + clientId;
					apiURL += "&redirect_uri=" + redirectURI;
					apiURL += "&state=" + state;
					session.setAttribute("state", state);
					%>
					<a href="<%=apiURL%>"><img src="resources/image/naver.png" /></a>
					<!-- 토큰삭제 : https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=tjFd03HRfNwCYRcx8l_F&client_secret=W8CiIlnkbB&access_token=sMM761xU5GSC846U0Q&state=639377487032869747063967426466487713134&service_provider=NAVER -->
					<!-- Naver Login End -->

				</div>
			</div>
		</fieldset>
	</div>
</form>