<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>판매 업체</h1>
		<%for(int i=0;i<.size();i++){ %>
			<article>
				<div>
					<a href="<%=.get(i).%>">
					<img alt="abcd" src="<%=.get(i).%>"></a>
				</div>
				<div>
					업체명 : <%=.get(i). %>
					<div>
						<span>주소 : <%=.get(i). %></span><br>
						<span>연락처 : <%=.get(i). %></span>
					</div>
					<div>
						업체 소개 : <%=.get(i). %>
					</div>
				</div>				
			</article>
		<%} %>
	</body>
</html>