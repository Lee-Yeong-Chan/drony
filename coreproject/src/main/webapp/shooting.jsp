<%@page import="com.smhrd.domain.workDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.workDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>촬영</title>
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
   				
   					<!-- Sidebar row 밑에 위치-->
   					<%@include file="fisidebar.jsp" %>
   					<!-- 사이드바끝 -->
   					
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
								<header>
									<h3>영상촬영·편집</h3>
								</header>
							</article>	
						</div>
						
						<!-- 검색창 -->
   						<form action="shooting.jsp" method="get">
   							<div class="searchfi">
   								<input type="text" placeholder="검색어 입력" name="searchText">
   								<button type="submit" value="검색">검색</button>
   							</div>
   						</form>
   						<%
							workDAO workDAO=new workDAO();
   							workDAO workDAO2=new workDAO();
   							request.setCharacterEncoding("utf-8");
   							String searchText=request.getParameter("searchText");
   							List<workDTO> shooting=workDAO.selectAllWork("S");
   							if(searchText!=null){
   								shooting=workDAO2.selectSearchWork("S", searchText);
   							}
   							String pageN=request.getParameter("pageNum");
   							if(pageN==null){
   								pageN="1";
   							}
   							int pageNum=Integer.valueOf(pageN);
   							int startRow=(pageNum-1)*9+1;
   							int startPage=0, endPage=0;
   							if(shooting.size()!=0){
   								int pageCount=shooting.size()/9+(shooting.size()%9==0?0:1);
   								startPage=((pageNum-1)/5)*5+1;
   								endPage=startPage+4;
   								if(endPage>pageCount){
   									endPage=pageCount;
   								}
   							}
						%>
						<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
						<div>
							<c:if test="${not empty loginExpert}">
								<div align="right">
									<span><a href='postInsert.jsp'>글 작성하기</a></span>
								</div>
							</c:if>
							<div class="row comlist workfield">
   								<%if(pageNum==shooting.size()/9+1){
									for(int i=(shooting.size()/9)*9; i<shooting.size(); i++){ %>
		   								<div class="col-3 col-6-medium col-12-small">
		   									<section class="box feature droneCom">
		   										<a href="postDetail.jsp?w_idx=<%=shooting.get(i).getW_idx()%>">
												<img onerror=this.src="images/camera.png" src="upload/<%=shooting.get(i).getW_img()%>">
												<p><%=shooting.get(i).getExp_id()%></p>
												<h5><%=shooting.get(i).getW_title()%></h5>
												<h6><%=shooting.get(i).getW_price()%>원~</h6>
												</a>
		   									</section>
		   								</div>
								<%	} 
								}
								else if(pageNum<shooting.size()/9+1){
									for(int i=(pageNum-1)*9; i<9*pageNum; i++){ %>
	   								<div class="col-3 col-6-medium col-12-small">
	   									<section class="box feature droneCom">
	   										<a href="postDetail.jsp?w_idx=<%=shooting.get(i).getW_idx()%>">
											<img onerror=this.src="images/camera.png" src="upload/<%=shooting.get(i).getW_img()%>">
											<p><%=shooting.get(i).getExp_id()%></p>
											<h5><%=shooting.get(i).getW_title()%></h5>
											<h6><%=shooting.get(i).getW_price()%>원~</h6>
											</a>
	   									</section>
	   								</div>
								<%	} 
								}
								else{
								%>
	   								<div class="col-3 col-6-medium col-12-small">
	   									<section class="box feature droneCom">
	   										<a>
											<img>
											<p></p>
											<h5></h5>
											<h6></h6>
											</a>
	   									</section>
	   								</div>
								<%} %>
							</div>
							<div class="page-wrap">
									<ul class="page-nation">
									<%for(int i=startPage;i<=endPage;i++){%>
										<li><a href="shooting.jsp?pageNum=<%=i%>"><%=i%></a></li>
									<%}%>
									</ul>
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