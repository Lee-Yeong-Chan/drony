<%@page import="com.smhrd.domain.expertInquiryDTO"%>
<%@page import="com.smhrd.domain.inquiryDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.expertDTO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<%
	expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
	inquiryDAO inquiryDAO=new inquiryDAO();
	List<expertInquiryDTO> expertInquiryList=inquiryDAO.selectAllExpertInquiry(loginExpert.getExp_id());
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
			<%for(int i=0;i<expertInquiryList.size();i++){ %>
			<tr>
			<td><%=i+1 %></td>
			<td><a href="expertInquiryView.jsp?number=<%=expertInquiryList.get(i).getInq_idx()%>"><%=expertInquiryList.get(i).getInq_title()%></a></td>
			<td><%=expertInquiryList.get(i).getUser_id()%></td>
			<td><%=expertInquiryList.get(i).getCreated_at()%></td>
			</tr>
			<%} %>
		</table>
		<button onclick="location.href='expertInquiryInsert.jsp'">문의하기</button>
	</body>
</html>