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
		<style>
		.page-nation li{
		list-style: none;
	}
	
	.page-wrap{
		text-align:center;
		font-size:0;
	}
	.page-nation{
		display: flex;
		justify-content: center;
		align-items: center;
		margin-top: 20px;
	}
	
	.page-nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size: 13px;
		color:black;
		text-decoration:none;
		font-weight:bold;
	
	}
	
	.page-nation a:hover{
		background-color: gray;
		color:  white;
		</style>
	</head>
	<body class="is-preload">
		<div id="page-wrapper">
   		<!-- Header -->
		<%@include file="header.jsp" %>
   		
   		
   		 
   		<!-- Main -->
   		<section id="main">
   			<div class="container">
   				<div class="row">
   				
   					<!-- sidebar -->
   					<%@include file="boardsidebar.jsp" %>
   					<!-- sidebar끝 -->
   					
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3>공지사항</h3>
   								</header>
   								
   								<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
   								<section class="mycontent" style="margin-left: 30px;">
								
								
								<table class="noticetable">
									<thead>
										<tr>
											<td colspan="4" align="right">
												<c:if test="${(not empty loginUser and loginUser.user_id eq 'admin')or(not empty loginExpert and loginExpert.exp_id eq 'admin')}">
													<span><a href="noticeInsert.jsp">공지 작성하기</a></span>
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="co1" style="text-align: center; width: 10%;">순번</td>
											<td class="co1" style="width: 40%;">제목</td>
											<td class="co1" style="width: 20%;">작성자</td>
											<td class="co1" style="width: 30%;">작성일자</td>
										</tr>
									</thead>
									<tbody>
										<%for(int i=0; i<AllNotice.size(); i++){ %>
										<tr>
											<td style="text-align: center;"><%=i+1 %></td>
											<td><a href="noticeView.jsp?number=<%=AllNotice.get(i).getNotice_idx()%>"><%=AllNotice.get(i).getNotice_title()%></a></td>
											<td>관리자</td>
											<td align="right"><%=AllNotice.get(i).getCreated_at() %></td>
										</tr>
										<%} %>
									</tbody>
								</table>
								<div class="page-wrap">
									<ul class="page-nation">			
										<li><a href="/board/list?p=1">1</a></li>
										<li><a href="/board/list?p=2">2</a></li>
										<li><a href="/board/list?p=3">3</a></li>
										<li><a href="/board/list?p=4">4</a></li>
										<li><a href="/board/list?p=5">5</a></li>
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