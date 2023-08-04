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
			   					<h3 class="major"><span>🍀<%=loginExpert.getExp_id() %>님의 마이페이지</span></h3>
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
								<table>
							     	 <tr>
							         	<td colspan='2' align="right" style="font-size: 0.8em;">
							         		<a href="updateExpert.jsp">개인정보수정</a> &nbsp;
							         		<a href="deleteExpertCon">회원탈퇴</a>	
							         	</td>
							         </tr>
							     </table>
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
											<table>
												<tr>
													<td class="co1">변경할 비밀번호 : </td>
													<td class="co2"><input type="password" name="pw"></td>
												</tr>
												<tr>
													<td class="co1">변경할 이름 : </td>
													<td class="co2"><input type="text" value="<%=loginExpert.getExp_name() %>" name="name"></td>
												</tr>
												<tr>
													<td class="co1">변경할 이메일 : </td>
													<td class="co2"><input type="text" value="<%=loginExpert.getExp_email() %>" name="email"></td>
												</tr>
												<tr>
													<td class="co1">변경할 전화번호 : </td>
													<td class="co2"><input type="text" value="<%=loginExpert.getExp_phone() %>" name="phone"></td>
												</tr>
												<tr>
													<td class="co1">변경할 사업자번호 : </td>
													<td class="co2"><input type="text" value="<%=loginExpert.getBno() %>" name="bno"></td>
												</tr>
												<tr>
													<td class="co1">변경할 업체명 : </td>
													<td class="co2"><input type="text" value="<%=loginExpert.getCompany_name() %>" name="cname"></td>
												</tr>
												<tr>
													<td class="co1">변경할 업체 주소 : </td>
													<td class="co2"><input type="text" value="<%=loginExpert.getCompany_addr() %>" name="cadd"></td>
												</tr>
												<tr>
													<td class="co1">변경할 작업 지역 : </td>
													<td class="co2"><input type="text" value="<%=loginExpert.getWorking_area() %>" name="warea"></td>
												</tr>
												<tr>
													<td class="co1">변경할 작업 분야 : </td>
													<td class="co2"><input type="text" value="<%=loginExpert.getWorking_field() %>" name="wfield"></td>
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