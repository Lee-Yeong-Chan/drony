<%@page import="com.smhrd.domain.expertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
%>
<html>
	<head>
	<title>DRONY</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
	
	<div class="page-wrapper">
   		
   		<!-- Header -->
		<%@include file="header.jsp" %>
   
   		<!-- Main -->
   		<section id="main">
   			<div class="container">
   				<div class="row">
   					<div class="col-3 col-12-medium">
   						<div class="sidebar">
   							<!-- Sidebar 여기서부터-->
   							<!-- My page -->
   							
   								<h3 class="major"><span><%=loginExpert.getExp_id() %> 님의 마이페이지</span></h3>
   								<ul class="divided">
   									<li>
   										<article class="box mypage-menu">
											<h1><a href="mypageExpert.jsp">내프로필</a></h1>
										</article>
   									</li>
   									<li>
										<article class="box mypage-menu">
											<h1><a href="#">내게시글</a></h1>
										</article>
									</li>
									<li>
										<article class="box mypage-menu">
											<h1><a href="workExpert.jsp">작업목록</a></h1>
										</article>
									</li>
									<li>
										<article class="box mypage-menu">
											<h1><a href="#">드론관리</a></h1>
										</article>
									</li>
   								</ul>
   							
   							
   						</div>
   					</div>
   					<!-- 여기까지 유지되는 부분 -->
   					
   					
   					<!-- 오른쪽 메인페이지 변경하는 부분-->
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3><%=loginExpert.getExp_id() %>님의 프로필</h3>
   								</header>
   								
   								<section class="mypageupdate">
   									<form action="updateExpertCon" method="post">
										변경할 비밀번호 : <input type="password" name="pw"><br>
										변경할 이름 : <input type="text" placeholder="<%=loginExpert.getExp_name() %>" name="name"><br>
										변경할 이메일 : <input type="text" placeholder="<%=loginExpert.getExp_email() %>" name="email"><br>
										변경할 전화번호 : <input type="text" placeholder="<%=loginExpert.getExp_phone() %>" name="phone"><br>
										변경할 사업자번호 : <input type="text" placeholder="<%=loginExpert.getBno() %>" name="bno"><br>
										변경할 사업자명 : <input type="text" placeholder="<%=loginExpert.getCompany_name() %>" name="cname"><br>
										변경할 사업자 주소 : <input type="text" placeholder="<%=loginExpert.getCompany_addr() %>" name="cadd"><br>
										변경할 작업 구역 : <input type="text" placeholder="<%=loginExpert.getWorking_area() %>" name="warea"><br>
										변경할 작업 가능 분야 : <input type="text" placeholder="<%=loginExpert.getWorking_field() %>" name="wfield"><br>
										<input type="submit" name="수정">	
									</form>
   								</section>
   								
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