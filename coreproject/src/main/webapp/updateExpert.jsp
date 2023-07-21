<%@page import="com.smhrd.domain.expertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<a href="mypageExpert.jsp">내 프로필</a>
		<a href="updateExpert.jsp">개인 정보 수정</a>
		<a href="workExpert.jsp">작업 진행 상황</a>
		<form action="updateExpertCon" method="post">
			변경할 비밀번호 : <input type="password" name="pw"><br>
			변경할 이름 : <input type="text" placeholder="<%=loginExpert.getExp_name() %>" name="name"><br>
			변경할 이메일 : <input type="text" placeholder="<%=loginExpert.getExp_email() %>" name="email"><br>
			변경할 전화번호 : <input type="text" placeholder="<%=loginExpert.getExp_phone() %>" name="phone"><br>
			변경할 사업자번호 : <input type="text" placeholder="<%=loginExpert.getBno() %>" name="bno"><br>
			변경할 사업자명 : <input type="text" placeholder="<%=loginExpert.getCompany_name() %>" name="cname"><br>
			변경할 사업자 주소 : <input type="text" placeholder="<%=loginExpert.getCompany_addr() %>" name="cadd"><br>
			변경할 작업 구역 : <input type="text" placeholder="<%=loginExpert.getWorking_area() %>" name="warea"><br>
			변경할 작업 가능 분야 : <input type="text" placeholder="<%=loginExpert.getWorking_field() %>" name="wfield"><br>
			<input type="submit" name="수정">	
		</form>
	</body>
</html>