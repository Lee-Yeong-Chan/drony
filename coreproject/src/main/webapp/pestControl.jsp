<%@page import="com.smhrd.domain.expertDTO"%>
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
   					
   					
   					<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3>방역·방제·살포</h3>
   								</header>
   							</article>
   						</div>
   						
   						<!-- 검색창 -->
   						<form action="pestControl.jsp" method="get" name="searchForm">
   							<div class="searchfi">
   								<input type="text" placeholder="검색어 입력" name="searchText">
   								<input type="button" onclick="submit()" value="검색">
   							</div>
   						</form>
   						<%
							workDAO workDAO=new workDAO();
   							workDAO workDAO2=new workDAO();
   							request.setCharacterEncoding("utf-8");
   							String searchText=request.getParameter("searchText");
   							List<workDTO> pestControl=workDAO.selectAllWork("P");
   							if(!"".equals(searchText)&&searchText!=null){
   								pestControl=workDAO2.selectSearchWork("P", searchText);
   							}
   							String pageN=request.getParameter("pageNum");
   							if(pageN==null){
   								pageN="1";
   							}
   							int pageNum=Integer.valueOf(pageN);
   							int startRow=(pageNum-1)*9+1;
   							int startPage=0, endPage=0;
   							if(pestControl.size()!=0){
   								int pageCount=pestControl.size()/9+(pestControl.size()%9==0?0:1);
   								if(pageNum<=3){
   									startPage=((pageNum-1)/5)*5+1;
   								}
   								else if(pageNum>=pageCount-2){
   									startPage=pageCount-4;
   								}
   								else{
   									startPage=pageNum-2;
   								}	
   								endPage=startPage+4;
   								if(endPage>pageCount){
   									endPage=pageCount;
   								}
   							}
						%>
   						<!-- 수정하는 부분 -->
   						<div>
   						<c:choose>
   							<c:when test="${not empty loginExpert}">
								<div align="right">
									<span><a href='postInsert.jsp'>글 작성하기</a></span>
								</div>
							</c:when>
							<c:otherwise>
								<br>
							</c:otherwise>
   						</c:choose>
   							<div class="row comlist workfield">
   								<%if(pageNum==pestControl.size()/9+1){
									for(int i=(pestControl.size()/9)*9; i<pestControl.size(); i++){ %>
		   								<div class="col-3 col-6-medium col-12-small">
		   									<section class="box feature droneCom">
		   										<a href="postDetail.jsp?w_idx=<%=pestControl.get(i).getW_idx()%>">
												<img onerror=this.src="images/farm.png" src="upload/<%=pestControl.get(i).getW_img()%>">
												<p><%=pestControl.get(i).getExp_id()%></p>
												<h5><%=pestControl.get(i).getW_title()%></h5>
												<h6><%=pestControl.get(i).getW_price()%>원~</h6>
												</a>
		   									</section>
		   								</div>
								<%	} 
								}
								else if(pageNum<pestControl.size()/9+1){
									for(int i=(pageNum-1)*9; i<9*pageNum; i++){ %>
	   								<div class="col-3 col-6-medium col-12-small">
	   									<section class="box feature droneCom">
	   										<a href="postDetail.jsp?w_idx=<%=pestControl.get(i).getW_idx()%>">
											<img onerror=this.src="images/farm.png" src="upload/<%=pestControl.get(i).getW_img()%>">
											<p><%=pestControl.get(i).getExp_id()%></p>
											<h5><%=pestControl.get(i).getW_title()%></h5>
											<h6><%=pestControl.get(i).getW_price()%>원~</h6>
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
   						</div>
   						<div class="page-wrap">
							<ul class="page-nation">
							<%for(int i=startPage;i<=endPage;i++){%>
								<li><a href="pestControl.jsp?pageNum=<%=i%>"><%=i%></a></li>
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
	<script type="text/javascript">
		var form = document.searchForm;
		function submit(){
			if(!form.searchText.value){
				alert("검색어를 입력해주세요.");
				form.searchText.focus();
				return;
			}
			form.submit();
		}
	</script>
	</body>
</html>