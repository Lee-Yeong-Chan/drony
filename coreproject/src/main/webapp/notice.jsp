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
	<title>DRONY</title>
	<meta charset="utf-8" />
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
													<li>
														<article class="box side-info">
															<h1><a href="userInquiry.jsp">문의사항</a></h1>
														</article>	
													</li>
												</c:when>
										 		<c:otherwise>
													<li>
														<article class="box side-info">
															<h1><a href="expertInquiry.jsp">문의사항</a></h1>
														</article>
													</li>
										 		</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<li>
												<article class="box side-info">
													<h1><a href="login.jsp">문의사항</a></h1>
												</article>
											</li>
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
   							<article class="box page-content"  style="width: 80%;">
   								<header>
   									<h3>공지사항</h3>
   								</header>
   								
   								<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
   								<section class="mycontent" style="margin-left: 50px;">
								<c:if test="${(not empty loginUser and loginUser.user_id eq 'admin')or(not empty loginExpert and loginExpert.exp_id eq 'admin')}">
									<span><a href="noticeInsert.jsp">공지 작성하기</a></span>
								</c:if>
								<table>
									<thead>
										<tr>
											<td width="50%">제목</td>
											<td>작성자</td>
											<td align="right">날짜</td>
										</tr>
									</thead>
									<tbody>
										<%for(int i=0; i<AllNotice.size(); i++){ %>
										<tr>
											<td><a href="noticeView.jsp?number=<%=AllNotice.get(i).getNotice_idx()%>"><%=AllNotice.get(i).getNotice_title()%></a></td>
											<td>관리자</td>
											<td align="right"><%=AllNotice.get(i).getCreated_at() %></td>
										</tr>
										<%} %>
									</tbody>
								</table>
								</section>
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