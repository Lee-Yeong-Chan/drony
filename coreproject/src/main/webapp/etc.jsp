<%@page import="com.smhrd.domain.workDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.workDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	workDAO workDAO=new workDAO();
	List<workDTO> etc=workDAO.selectAllWork("E");
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>기타</h1>
		<%for(int i=0;i<etc.size();i++){ %>
			<article>
				<a href="postDetail?w_idx=<%=etc.get(i).getW_idx()%>">
					<div>
						<img onerror=this.src="images/hobbydrone.png" src="<%=etc.get(i).getW_img()%>">
						<div>
							<span><%=etc.get(i).getW_title()%></span><br>
							<span><%=etc.get(i).getCreated_at().substring(0, etc.get(i).getCreated_at().length()-2)%></span><br>
							<span><%=etc.get(i).getW_price()%></span>							
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