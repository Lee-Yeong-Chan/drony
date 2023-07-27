<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.expertDTO"%>
<%@page import="com.smhrd.domain.mypageDAO"%>
<%@page import="com.smhrd.domain.postDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	expertDTO loginExpert=(expertDTO)session.getAttribute("loginExpert");
	mypageDAO mypageDAO=new mypageDAO();
	mypageDAO mypageDAO2=new mypageDAO();
	List <postDTO> allPost=mypageDAO.selectPost(loginExpert.getExp_id());
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
		
		
		<section id="main">
   			<div class="container">
   				<div class="row">
   					<div class="col-3 col-12-medium">
   						<div class="sidebar">
   							<!-- Sidebar 여기서부터--> 
   							<!-- My page -->
   							
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
   					<!-- 여기까지 유지되는 부분 -->
   					
   					
   					<!-- 오른쪽 페이지 article 까지는 유지 -->
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3>내게시글</h3>
   								</header>
   								
   								<section class="mypost">
   								<span><a href="#">게시글 작성</a></span>
								      <table border='1'>
								      	<thead>
										<tr>
											<td>번호</td>
											<td>작업제목</td>
											<td>작업조회수</td>
											<td>글작성일자</td>
											<td>작업단가</td>
											<td>요청받은개수</td>
										</tr>
										</thead>
										</tbody>
										<%if (allPost!=null){
											for(int i=0;i<allPost.size();i++){%>
										<tr>
											<td><%=(i+1) %></td>
											<td><%=allPost.get(i).getW_title()%></td>
											<td><%=allPost.get(i).getW_view()%></td>
											<td><%=allPost.get(i).getCreated_at()%></td>
											<td><%=allPost.get(i).getW_price()%></td>
											<td><%=mypageDAO2.selectPostToUser(loginExpert.getExp_id())%></td>
											<td><a href="?w_idx=<%=allPost.get(i).getW_idx()%>">수정</a></td>
											<td><a href="?w_idx=<%=allPost.get(i).getW_idx()%>">삭제</a></td>
										</tr>
										<%	}
										}%>
										</tbody>
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
</html>