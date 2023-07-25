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
	<div class="is-preload">
   		
   		<!-- Header -->
		<%@include file="header.jsp" %>
   
   		<!-- Main -->
   		<section id="main">
   			<div class="container">
   				<div class="row">
   					<div class="col-3 col-12-medium">
   						<div class="sidebar">
   							<!-- Sidebar -->
   							
   							<!-- My page -->
   							<section>
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
   							</section>
   							
   						</div>
   					</div>
   					
   					<!-- 오른쪽 메인페이지 -->
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h2><%=loginExpert.getExp_id() %>님의 프로필</h2>
   								</header>
   								
   								<section class="mypagetable">
   									<table>
         								<tr>
            								<td>아이디</td>
            								<td><%=loginExpert.getExp_id() %></td>
         								</tr>
								         <tr>
								            <td>이름</td>
								            <td><%=loginExpert.getExp_name() %></td>
								         </tr>
								         <tr>
								            <td>이메일</td>
								            <td><%=loginExpert.getExp_email() %></td>
								         </tr>
								         <tr>
								            <td>전화번호</td>
								            <td><%=loginExpert.getExp_phone() %></td>
								         </tr>
								         <tr>
								            <td>사업자번호</td>
								            <td><%=loginExpert.getBno() %></td>
								         </tr>
								         <tr>
								            <td>사업자명</td>
								            <td><%=loginExpert.getCompany_name() %></td>
								         </tr>
								         <tr>
								            <td>사업자주소</td>
								            <td><%=loginExpert.getCompany_addr() %></td>
								         </tr>
								         <tr>
								            <td>작업가능구역</td>
								            <td><%=loginExpert.getWorking_area() %></td>
								         </tr>
								         <tr>
								            <td>작업가능분야</td>
								            <td><%=loginExpert.getWorking_field() %></td>
								         </tr>
								      </table>
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
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-DCX-BigData-7/DRONY.git
</html>