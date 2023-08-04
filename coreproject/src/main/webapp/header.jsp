<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>DRONY</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
		<header id="header">
			<div class="logo container">
				<div>
					<span><a href="main.jsp" id="logo">DRONY</a></span>
				</div>	
				<div class="mainlog">
					<c:choose>
	         			<c:when test="${not empty loginUser or not empty loginExpert}">
	            			<c:choose>
	               				<c:when test="${not empty loginUser}">
	                  				<span><a href="mypageUser.jsp">마이페이지</a></span> &nbsp;
	               				</c:when>
	               				<c:otherwise>
	                 				<span><a href="mypageExpert.jsp">마이페이지</a></span> &nbsp;
	               				</c:otherwise>
	            			</c:choose>
	            			<span><a href="logoutCon">로그아웃</a></span>
	         			</c:when>
	         			<c:otherwise>
	            			<span><a href="join.jsp">회원가입</a></span> &nbsp;
	            			<span><a href="login.jsp">로그인</a></span>
	        			</c:otherwise>
	        		</c:choose>
				</div>
			</div>
		</header>
	</body>
</html>