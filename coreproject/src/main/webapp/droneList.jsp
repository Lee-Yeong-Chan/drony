<%@page import="com.smhrd.domain.expertDroneDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.mypageDAO"%>
<%@page import="com.smhrd.domain.expertDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
	mypageDAO mypageDAO=new mypageDAO();
	List<expertDroneDTO> droneList=mypageDAO.selectExpertDrone(loginExpert.getExp_id());
%>
<html>
	<head>
		<title>DRONY</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style type="text/css">
			img{
				width:200px;
			}
		</style>
	</head>
	<body class="is-preload">
		<div id="page-wrapper">
			<!-- Header -->
			<%@include file="header.jsp" %>
			<!-- Sidebar -->
			<section id="main">
   				<div class="container">
   					<div class="row">
   						<div class="col-3 col-12-medium">
   							<div class="sidebar">
   							<!-- My page -->
   								<h3 class="major"><span>🍀<%=loginExpert.getExp_id() %>님</span></h3>
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
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3>드론관리</h3>
   								</header>
   								<!-- 여기서부터 오른쪽 페이지 수정 -->
   								<section class="mycontent">
								      <form action="updateDroneCon" method="post" enctype="multipart/form-data">
										<table>
											<thead>
												<tr>
													<td style="width: 35px;">순번</td>
													<td>모델명</td>
													<td>제조사</td>
													<td>일련번호</td>
													<td>설명</td>
													<td>사진</td>
												</tr>
											</thead>											
											<%for(int i=0;i<droneList.size();i++){%>
											<tr style="border-bottom: solid 1px #e7eae8;" height='58px'>
												<td style="text-align: center;"><%=i+1 %></td>
												<td> <input type="text" name="model" value=<%=droneList.get(i).getDr_model()%>></td>
												<td> <input type="text" name="maker" value=<%=droneList.get(i).getDr_maker()%>></td>
												<td> <input type="text" name="serial" value=<%=droneList.get(i).getDr_serial()%>></td>
												<td> <input type="text" name="desc" value=<%=droneList.get(i).getDr_desc()%>></td>
												<td> <img src="upload/<%=droneList.get(i).getDr_img()%>"><input type="file" name="file" value=<%=droneList.get(i).getDr_img()%>></td>
												<td> <input type="submit" value="수정" style="margin-bottom: 3px;">
													 <button type="button" onclick="location.href='deleteDroneCon?dr_idx=<%=droneList.get(i).getDr_idx()%>'">삭제</button>
												</td>
											</tr>
											<% session.setAttribute("dr_idx", droneList.get(i).getDr_idx());
											}%>
										</table>
									</form>
									<form action="insertDroneCon" method="post" enctype="multipart/form-data">
										<table>
											<thead>
											<tr>
												<td style="width: 35px;">추가</td>
												<td>모델명</td>
												<td>제조사</td>
												<td>일련번호</td>
												<td>설명</td>
												<td>사진</td>
											</tr>
											</thead>
											<tr style="border-bottom: solid 1px #e7eae8;" height='30px'>
												<td> </td>
												<td> <input type="text" name="model"></td>
												<td> <input type="text" name="maker"></td>
												<td> <input type="text" name="serial"></td>
												<td> <input type="text" name="desc"></td>
												<td> <input type="file" name="file"></td>
												<td> <input type="submit" value="추가" style="margin-right: 14px;"></td>
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