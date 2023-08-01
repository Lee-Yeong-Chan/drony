<%@page import="java.net.URLEncoder"%>
<%@page import="com.smhrd.domain.workDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.workDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>방역 방제 농업</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	</head>
	<style>
	.css-1nbuyxl {
    color: rgb(154, 155, 167);
    font-size: 11px;
	}
	.css-kmstd8 {
    display: flex;
    width: 214px;
    flex-direction: column;
    position: relative;
    text-decoration: none;
    .droneCom h5 {
    text-align: center;
    margin: 10px 20px 0 20px;
}
	</style>
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
   					
   					
   					<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3>방역 방제 농업</h3>
   								</header>
   							</article>
   						</div>
   						<form action="pestControl.jsp" method="get">
   							<input type="text" placeholder="검색어 입력" name="searchText">
   							<button type="submit" value="검색">검색</button>		
   						</form>
   						<%
							workDAO workDAO=new workDAO();
   							workDAO workDAO2=new workDAO();
   							request.setCharacterEncoding("utf-8");
   							String searchText=request.getParameter("searchText");
   							List<workDTO> pestControl=workDAO.selectAllWork("P");
   							if(searchText!=null){
   								pestControl=workDAO2.selectSearchWork("P", searchText);
   							}
						%>
   						<!-- 수정하는 부분 -->
   						<div>
   							<c:if test="${not empty loginExpert}">
								<div align="right">
									<span><a href='postInsert.jsp'>글 작성하기</a></span>
								</div>
							</c:if>
   							<div class="row comlist workfield">
   								<%for(int i=0;i<pestControl.size();i++){ %>
   								<div class="col-3 col-6-medium col-12-small">
   									<section class="box feature droneCom">
   										<a href="postDetail.jsp?w_idx=<%=pestControl.get(i).getW_idx()%>">
										<img onerror=this.src="images/farm.png" src="upload/<%=pestControl.get(i).getW_img()%>"><br>
										<span class="css-1nbuyxl esrn31v0" style="text-align:left;">방역·방제·살포</span>
										<h5><%=pestControl.get(i).getW_title()%></h5>
										<h6><%=pestControl.get(i).getW_price()%>원~</h6>
										</a>
   									</section>
   								</div>
   								<%} %>
   							</div>
   						</div>
   			<!-- 여기까지 -->				
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