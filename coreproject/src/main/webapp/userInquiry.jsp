<%@page import="com.smhrd.domain.userInquiryDTO"%>
<%@page import="com.smhrd.domain.inquiryDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.userDTO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<%
	userDTO loginUser=(userDTO)session.getAttribute("loginUser");
	inquiryDAO inquiryDAO=new inquiryDAO();
	List<userInquiryDTO> userInquiryList=inquiryDAO.selectAllUserInquiry(loginUser.getUser_id());
%>
<html>
	<head>
		<title>Insert title here</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
		<h1>문의사항</h1>
		<table>
			<tr>
				<td>순번</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일자</td>
			</tr>
			<%if(userInquiryList!=null){
				for(int i=0;i<userInquiryList.size();i++){ %>
			<tr>
			<td><%=i+1 %></td>
			<td><a href="userInquiryView.jsp?number=<%=userInquiryList.get(i).getInq_idx()%>"><%=userInquiryList.get(i).getInq_title()%></a></td>
			<td><%=userInquiryList.get(i).getUser_id()%></td>
			<td><%=userInquiryList.get(i).getCreated_at()%></td>
			</tr>
			<%	}
			} %>
		</table>
		<button onclick="location.href='userInquiryInsert.jsp'">문의 작성하기</button>
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
	</body>
</html>