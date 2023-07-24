<%@page import="com.smhrd.domain.mypageDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.mypageDAO"%>
<%@page import="com.smhrd.domain.expertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
	mypageDAO dao=new mypageDAO();
	List<mypageDTO> mypageList= dao.selectExpertMypage(loginExpert.getExp_id());
%>
<html>
	<head>
		<title>DRONY</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
<<<<<<< HEAD
		<a href="mypageExpert.jsp">내 프로필</a>
		<a href="updateExpert.jsp">개인 정보 수정</a>
		<a href="myPost.jsp">올린 게시글</a>
		<a href="workExpert.jsp">작업 진행 상황</a>
		<a href="droneList.jsp">내 드론 현황</a>
		<h1>의뢰받은 계약 목록</h1>
		<table border='1'>
			<tr>
				<td>번호</td>
				<td>의뢰받은 작업명</td>
				<td>진행 상황</td>
				<td>상황 갱신 날짜</td>
				<td>채팅방</td>
			</tr>
			<%if (mypageList!=null){
				for(int i=0;i<mypageList.size();i++){%>
			<tr>
				<td><%=(i+1) %></td>
				<td><%=mypageList.get(i).getW_title()%></td>
				<td>
					<form action="updateMypageCon" method="post">
						<select name="status">
							<option value="wconsul">상담대기</option>
							<option value="consul">상담중</option>
							<option value="contra">계약완료</option>
							<option value="working">작업중</option>
							<option value="comple">작업완료</option>
						</select>
						<input type="submit" value="수정">
						<% session.setAttribute("updateStatus_idx", mypageList.get(i).getStatus_idx());%>
					</form>
				</td>
				<td><%=mypageList.get(i).getCreated_at().substring(0, mypageList.get(i).getCreated_at().length()-2)%></td>
				<td><button onclick="location.href='.jsp'">채팅</button></td>
			</tr>
			<%	}
			}%>
		</table>
=======
	
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
   									<h2>작업 목록</h2>
   								</header>
   								
   								<section class="requestlist">
   									<table class>
										<tr>
											<td>번호</td>
											<td>의뢰받은 작업명</td>
											<td>진행 상황</td>
											<td>상황 갱신 날짜</td>
											<td>채팅방</td>
										</tr>
										<%if (mypageList!=null){
											for(int i=0;i<mypageList.size();i++){%>
										<tr>
											<td><%=(i+1) %></td>
											<td><%=mypageList.get(i).getW_title()%></td>
											<td>
												<form action="updateMypageCon" method="post">
													<select name="status">
														<option value="wconsul">상담대기</option>
														<option value="consul">상담중</option>
														<option value="contra">계약완료</option>
														<option value="working">작업중</option>
														<option value="comple">작업완료</option>
													</select>
													<input type="submit" value="수정">
													<% session.setAttribute("updateStatus_idx", mypageList.get(i).getStatus_idx());%>
												</form>
											</td>
											<td><%=mypageList.get(i).getCreated_at()%></td>
											<td><button onclick="location.href='.jsp'">채팅</button></td>
										</tr>
										<%	}
										}%>
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
	
		
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-DCX-BigData-7/DRONY.git
	</body>
</html>