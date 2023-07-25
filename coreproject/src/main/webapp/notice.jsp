<%@page import="com.smhrd.domain.noticeDTO"%>
<%@page import="com.smhrd.domain.noticeDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.userDTO"%>
<%@page import="com.smhrd.domain.expertDTO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<%
	noticeDAO noticeDAO=new noticeDAO();
	List<noticeDTO> AllNotice= noticeDAO.selectAllNotice();
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>공지사항</h1>
		<ul>
		<%for(int i=0;i<AllNotice.size();i++){ %>
			<li><a href="noticeView.jsp?number=<%=AllNotice.get(i).getNotice_idx()%>"><%=AllNotice.get(i).getNotice_title()%></a></li>
		<%} %>
		</ul>
		<c:if test="${(not empty loginUser and loginUser.user_id eq 'admin')or(not empty loginExpert and loginExpert.exp_id eq 'admin')}">
				<button onclick="location.href='noticeInsert.jsp'">추가</button>
		</c:if>
	</body>
</html>