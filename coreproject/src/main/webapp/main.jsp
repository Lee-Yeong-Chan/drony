<%@page import="com.smhrd.domain.expertDTO"%>
<%@page import="com.smhrd.domain.userDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
	userDTO loginUser=(userDTO)session.getAttribute("loginUser");
	expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:choose>
			<c:when test="${not empty loginUser or not empty loginExpert}">
				<a href="logoutCon">로그아웃</a>
				<c:if test=""></c:if>
				<c:choose>
					<c:when test="${not empty loginUser}">
						<a href="mypageUser.jsp">mypage</a>
					</c:when>
					<c:otherwise>
						<a href="mypageExpert.jsp">mypage</a>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<a href="join.jsp">회원가입</a>
				<a href="login.jsp">로그인</a>
			</c:otherwise>
		</c:choose>
	</body>
</html>