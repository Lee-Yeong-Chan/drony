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
		<form action="updateUserCon" method="post">
			변경할 비밀번호 : <input type="password" name="pw"><br>
			변경할 이름 : <input type="text" placeholder="<%=loginUser.getUser_name() %>" name="name"><br>
			변경할 이메일 : <input type="text" placeholder="<%=loginUser.getUser_email() %>" name="email"><br>
			변경할 전화번호 : <input type="text" placeholder="<%=loginUser.getUser_phone() %>" name="phone"><br>
			<input type="submit" name="수정">			
		</form>
	</body>
</html>