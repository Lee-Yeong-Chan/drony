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
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<title>측량</title>
	</head>
	<body class="is-preload">
	
		<div id="page-wrapper">
		
		<!-- Header -->
		<%@include file="header.jsp" %>
		
		 
   		<!-- Main -->
   		<section id="main">
   			<div class="container">
   				<div class="row">
   				
   					<!-- Sidebar row 밑에 위치-->
   					<div class="col-3 col-12-medium">
   						<div class="sidebar">
		   					
		   					<ul class="divided">
		   						<li>
		   							<article class="box side-info">
										<h1><a href="pestControl.jsp">방역·방제·살포</a></h1>
									</article>
		   						</li>
		   						<li>
									<article class="box side-info">
										<h1><a href="measure.jsp">측량</a></h1>
									</article>
								</li>
								<li>
									<article class="box side-info">
										<h1><a href="shooting.jsp">촬영</a></h1>
									</article>
								</li>
								<li>
									<article class="box side-info">
										<h1><a href="transport.jsp">물류·운송</a></h1>
									</article>
								</li>
								<li>
									<article class="box side-info">
										<h1><a href="etc.jsp">기타</a></h1>
									</article>
								</li>
							</ul>
						</div>
   					</div>
   					<!-- 사이드바끝 -->
   					
   					
   					
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
									<h3>측량</h3>
								</header>
							</article>	
						</div>
						
						<!-- 수정하는 부분 -->
						<div>
							<c:if test="${not empty loginExpert}">
								<div align="right">
									<span><a href='postInsert.jsp'>글 작성하기</a>
								</div>
							</c:if>
							<div class="row comlist workfield">
								<%for(int i=0;i<mesure.size();i++){ %>
								<div class="col-3 col-6-medium col-12-small">
									<section class="box feature droneCom">	
										<a href="postDetail.jsp?w_idx=<%=mesure.get(i).getW_idx()%>">
										<img onerror=this.src="images/measure.png" src="upload/<%=mesure.get(i).getW_img()%>">
										<h5><%=mesure.get(i).getW_title()%></h5>
										<h6><%=mesure.get(i).getW_price()%></h6>							
										</a>	
									</section>			
								</div>
								<%} %>
							</div>								
						</div>
						<!-- 여기까지 -->
					</div>
				</div>
			</section>
				
		<!-- Footer -->
		<%@include file="footer.jsp" %>
		
		</div>
		
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>

		<!-- 작은화면 메뉴 -->
		<%@include file="navPanel.jsp" %>
	</body>
</html>