<%@page import="com.smhrd.domain.userDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	userDTO loginUser=(userDTO)session.getAttribute("loginUser");
%>
<html>
	<head>
		<title>개인정보 수정</title>
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
   				
   					<!-- Sidebar 여기서부터-->
   					<div class="col-3 col-12-medium">
   						<div class="sidebar">
		   					<h3 class="major"><span><%=loginUser.getUser_id() %>님의 마이페이지</span></h3>
		   					<ul class="divided">
		   						<li>
                               		<article class="box mypage-menu">
                                		<h1><a href="mypageUser.jsp">내 프로필</a></h1>
                                	</article>
                               	</li>
                          	    <li>
                      	            <article class="box mypage-menu">
                	                    <h1><a href="workUser.jsp">작업의뢰 현황</a></h1>
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
   									<h3><%=loginUser.getUser_id() %>님의 프로필</h3>
   								</header>
   								
   								<section class="mypageupdate">
   									<form action="updateUserCon" method="post">
										<table>
											<tr>
												<td class="co1">변경할 비밀번호 : </td>
												<td class="co2"><input type="password" name="pw"></td>
											</tr>
											<tr>
												<td class="co1">변경할 이름 : </td>
												<td class="co2"><input type="text" placeholder="<%=loginUser.getUser_name() %>" name="name"></td>
											</tr>
											<tr>
												<td class="co1">변경할 이메일 : </td>
												<td class="co2"><input type="text" placeholder="<%=loginUser.getUser_email() %>" name="email"></td>
											</tr>
											<tr>
												<td class="co1">변경할 전화번호 : </td>
												<td class="co2"><input type="text" placeholder="<%=loginUser.getUser_phone() %>" name="phone"></td>
											</tr>
											<tr>
												<td colspan='2' align="right"><input type="submit" value="수정"></td>
											</tr>
										</table>
										
										
										
											
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