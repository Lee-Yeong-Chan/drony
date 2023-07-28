<%@page import="com.smhrd.domain.workDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.workDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	workDAO workDAO=new workDAO();
	List<workDTO> shooting=workDAO.selectAllWork("S");
%>
<html>
	<head>
		<title>촬영</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">
	
		<div class="page-wrapper">
		
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
		   							<article class="box mypage-menu">
										<h1><a href="pestControl.jsp">방역·방제·살포</a></h1>
									</article>
		   						</li>
		   						<li>
									<article class="box mypage-menu">
										<h1><a href="measure.jsp">측량</a></h1>
									</article>
								</li>
								<li>
									<article class="box mypage-menu">
										<h1><a href="shooting.jsp">촬영</a></h1>
									</article>
								</li>
								<li>
									<article class="box mypage-menu">
										<h1><a href="transport.jsp">물류·운송</a></h1>
									</article>
								</li>
								<li>
									<article class="box mypage-menu">
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
									<h1>촬영</h1>
								</header>
								
								
								<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
								<section class="pest">
								<%for(int i=0;i<shooting.size();i++){ %>
								<article>
									<a href="postDetail.jsp?w_idx=<%=shooting.get(i).getW_idx()%>">
									<div>
										<img onerror=this.src="images/camera.png" src="upload/<%=shooting.get(i).getW_img()%>">
										<div>
											<span><%=shooting.get(i).getW_title()%></span><br>
											<span><%=shooting.get(i).getCreated_at().substring(0, shooting.get(i).getCreated_at().length()-2)%></span><br>
											<span><%=shooting.get(i).getW_price()%></span>							
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
						</section>
						
						<!-- 여기까지 -->
					</article>
					
				</div>
			 </div>
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
	
				
		
	</body>
</html>