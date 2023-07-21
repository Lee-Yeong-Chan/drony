<%@page import="com.smhrd.domain.userDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	userDTO loginUser=(userDTO)session.getAttribute("loginUser");
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<a href="mypageUser.jsp">내 프로필</a>
		<a href="updateUser.jsp">개인 정보 수정</a>
		<a href="workUser.jsp">작업 진행 상황</a>
		<table>
			<tr>
				<td>아이디</td>
				<td><%=loginUser.getUser_id() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=loginUser.getUser_name() %></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%=loginUser.getUser_email() %></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=loginUser.getUser_phone() %></td>
			</tr>
		</table>
	</body>
</html>