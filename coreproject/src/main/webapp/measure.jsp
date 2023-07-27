<%@page import="com.smhrd.domain.workDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.workDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	workDAO workDAO=new workDAO();
	List<workDTO> mesure=workDAO.selectAllWork("M");
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>측량</h1>
		<%for(int i=0;i<mesure.size();i++){ %>
			<article>
				<a href="postDetail.jsp?w_idx=<%=mesure.get(i).getW_idx()%>">
					<div>
						<img onerror=this.src="images/measure.png" src="<%=mesure.get(i).getW_img()%>">
						<div>
							<span><%=mesure.get(i).getW_title()%></span><br>
							<span><%=mesure.get(i).getCreated_at().substring(0, mesure.get(i).getCreated_at().length()-2)%></span><br>
							<span><%=mesure.get(i).getW_price()%></span>							
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
	</body>
</html>