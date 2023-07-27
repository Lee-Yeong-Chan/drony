<%@page import="com.smhrd.domain.expertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
%>

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
   				
   					<!-- Sidebar row 밑에 위치-->
   					<div class="col-3 col-12-medium">
   						<div class="sidebar">
		   					<h3 class="major"><span><%=loginExpert.getExp_id() %>님의 마이페이지</span></h3>
		   					<ul class="divided">
		   						<li>
		   							<article class="box mypage-menu">
										<h1><a href="mypageExpert.jsp">내프로필</a></h1>
									</article>
		   						</li>
		   						<li>
									<article class="box mypage-menu">
										<h1><a href="myPost.jsp">내게시글</a></h1>
									</article>
								</li>
								<li>
									<article class="box mypage-menu">
										<h1><a href="workExpert.jsp">작업목록</a></h1>
									</article>
								</li>
								<li>
									<article class="box mypage-menu">
										<h1><a href="droneList.jsp">드론관리</a></h1>
									</article>
								</li>
							</ul>
						</div>
   					</div>
   					
   					
   					
   					
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3><%=loginExpert.getExp_id() %>전문가님의 프로필</h3>
   								</header>
   								
   								
   								<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
   								<section class="mypagetable">
   									<table>
         								<tr>
            								<td class="co1">아이디 : </td>
            								<td class="co2"><%=loginExpert.getExp_id() %></td>
         								</tr>
								         <tr>
								            <td class="co1">이름 : </td>
								            <td class="co2"><%=loginExpert.getExp_name() %></td>
								         </tr>
								         <tr>
								            <td class="co1">이메일 : </td>
								            <td class="co2"><%=loginExpert.getExp_email() %></td>
								         </tr>
								         <tr>
								            <td class="co1">전화번호 : </td>
								            <td class="co2"><%=loginExpert.getExp_phone() %></td>
								         </tr>
								         <tr>
								            <td class="co1">사업자번호 : </td>
								            <td class="co2"><%=loginExpert.getBno() %></td>
								         </tr>
								         <tr>
								            <td class="co1">사업자명 : </td>
								            <td class="co2"><%=loginExpert.getCompany_name() %></td>
								         </tr>
								         <tr>
								            <td class="co1">사업자주소 : </td>
								            <td class="co2"><%=loginExpert.getCompany_addr() %></td>
								         </tr>
								         <tr>
								            <td class="co1">작업가능구역 : </td>
								            <td class="co2"><%=loginExpert.getWorking_area() %></td>
								         </tr>
								         <tr>
								            <td class="co1">작업가능분야 : </td>
								            <td class="co2"><%=loginExpert.getWorking_field() %></td>
								         </tr>
<<<<<<< Upstream, based on branch 'master' of https://github.com/2022-SMHRD-DCX-BigData-7/DRONY.git
								      </table>
								      <table>
								     	 <tr>
								         	<td colspan='2' align="right" style="font-size: 0.8em;">
								         		<a href="updateExpert.jsp">개인정보수정</a> &nbsp;
								         		<a href="#">회원탈퇴</a>
								         	</td>
=======
								         <tr>
								         	<td colspan='2' align="center" style="font-size: 0.8em;">
								         		<a href="updateExpert.jsp">개인정보수정</a>
								         		<a href="deleteExpertCon">회원탈퇴</a>	
											</td>
>>>>>>> 50355e0 커밋 앤 푸쉬 -> 리베이스
								         </tr>
								      </table>
   								</section>
   								
   							</article>
   							<!-- 여기까지 -->
   							
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