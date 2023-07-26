<%@page import="com.smhrd.domain.droneCompanyDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.droneCompanyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	droneCompanyDAO droneCompanyDAO=new droneCompanyDAO();
	List <droneCompanyDTO> dcRepairList=droneCompanyDAO.selectRepairDroneCompany();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>수리 업체</h1>
		<%for(int i=0;i<dcRepairList.size();i++){ %>
			<article>
				<div>
					<a href="<%=dcRepairList.get(i).getDc_homepage()%>">
					<img alt="abcd" src="<%=dcRepairList.get(i).getDc_img()%>"></a>
				</div>
				<div>
					업체명 : <%=dcRepairList.get(i).getDc_name() %>
					<div>
						<span>주소 : <%=dcRepairList.get(i).getDc_addr() %></span><br>
						<span>연락처 : <%=dcRepairList.get(i).getDc_tel() %></span>
					</div>
					<div>
						업체 소개 : <%=dcRepairList.get(i).getDc_info() %>
					</div>
				</div>				
			</article>
		<%} %>
	</body>
</html>