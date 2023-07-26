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
	<body class="is-preload">
	
	<div id="page-wrapper">
   		
   		<!-- Header -->
		<%@include file="header.jsp" %>
   		 
   		<!-- Main -->
   		<section id="main">
   			<div class="container">
   				<div class="row">
   					<div class="col-3 col-12-medium">
   						<div class="sidebar">
   							
   							<!-- Sidebar 시작-->
   							
   								
   								<ul class="divided">
   									<li>
   										<article class="box side-info">
											<h1><a href="notice.jsp">공지사항</a></h1>
										</article>
   									</li>
   									<c:choose>
										<c:when test="${not empty loginUser or not empty loginExpert}">
											<c:choose>
												<c:when test="${not empty loginUser}">
													<li style="white-space: nowrap;"><a href="userInquiry.jsp">문의사항</a></li>
												</c:when>
										 		<c:otherwise>
													<li style="white-space: nowrap;"><a href="expertInquiry.jsp">문의사항</a></li>
										 		</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<li><a href="login.jsp">문의사항</a></li>
										</c:otherwise>
									</c:choose>
									<li>
										<article class="box side-info">
											<h1><a href="sale.jsp">판매업체</a></h1>
										</article>
									</li>
									<li>
										<article class="box side-info">
											<h1><a href="repair.jsp">수리업체</a></h1>
										</article>
									</li>
									<li>
										<article class="box side-info">
											<h1><a href="flight.jsp">비행지도</a></h1>
										</article>
									</li>
									<li>
										<article class="box side-info">
											<h1><a href="civilComplaint.jsp">원스탑민원서비스</a></h1>
										</article>
									</li>
   								</ul>
   							
   						</div>
   					</div>
   							<!-- Sidebar 끝-->
   					
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3>문의사항</h3>
   								</header>
   								
   								<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
   																
								<table>
									<thead>
										<tr>
											<td>순번</td>
											<td>제목</td>
											<td>작성자</td>
											<td>작성일자</td>
										</tr>
									</thead>
									<tbody>
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
									</tbody>
								</table>
								<button onclick="location.href='userInquiryInsert.jsp'">문의 작성하기</button>
								
   							<!-- 여기까지 -->
   							</article>
   							
   						</div>
   					</div>
   				</div>
   			</div>
   		</section>
       
	</div>
			
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