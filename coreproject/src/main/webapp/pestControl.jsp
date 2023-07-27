<%@page import="com.smhrd.domain.workDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.workDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	workDAO workDAO=new workDAO();
	List<workDTO> pestControl=workDAO.selectAllWork("P");
%>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<title>방역 방제 농업</title>
	</head>
	<body>
		<h1>방역 방제 농업</h1>
		<%@include file="header.jsp" %> 
		<%for(int i=0;i<pestControl.size();i++){ %>
			<article>
				<a href="postDetail.jsp?w_idx=<%=pestControl.get(i).getW_idx()%>">
					<div>
						<img onerror=this.src="images/farm.png" src="<%=pestControl.get(i).getW_img()%>">
						<div>
							<span><%=pestControl.get(i).getW_title()%></span><br>
							<span><%=pestControl.get(i).getCreated_at().substring(0, pestControl.get(i).getCreated_at().length()-2)%></span><br>
							<span><%=pestControl.get(i).getW_price()%></span>							
						</div>
					</div>
				</a>				
			</article>
		<%} %>
		<c:if test="${not empty loginExpert}">
			<div>
				<button onclick="location.href='postInsert.jsp'">글 작성하기</button>
			</div>
		</c:if>
		
		<!-- Footer -->
		<%@include file="footer.jsp" %>
		
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