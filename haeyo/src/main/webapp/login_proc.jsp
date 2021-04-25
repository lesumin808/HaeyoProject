<%@ page import="com.haeyo.biz.user.impl.UserDAOMybatis"%>
<%@ page import="com.haeyo.biz.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 1. 사용자 입력 정보 추출
String uEmail = request.getParameter("uEmail");
String uPwd = request.getParameter("uPwd");
System.out.println(uEmail);
System.out.println(uPwd);

// 2. DB 연동 처리
UserVO vo = new UserVO();
vo.setuEmail(uEmail);
vo.setuPwd(uPwd);

UserDAOMybatis dao = new UserDAOMybatis();
UserVO user = dao.getUser(vo);
System.out.println(user);

if (user != null) {
	session.setAttribute("uEmail", uEmail);
	response.sendRedirect("index.jsp");
} else {
	session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다.");
	response.sendRedirect("login.jsp");
}
%>