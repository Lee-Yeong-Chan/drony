<%@page import="com.smhrd.domain.expertDTO"%>
<%@page import="com.smhrd.domain.workDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.workDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
	int w_idx=Integer.valueOf(request.getParameter("w_idx"));
	workDAO workDAO=new workDAO();
	List<workDTO> selectPost=workDAO.selectWork(w_idx);
	
	String x, y;
	if(selectPost.get(0).getW_kind().equals("P")){
		x="farm";
		y="pestControl";
	}
	else if(selectPost.get(0).getW_kind().equals("M")){
		x="measure";
		y="measure";
	}
	else if(selectPost.get(0).getW_kind().equals("S")){
		x="camera";
		y="shooting";
	}
	else if(selectPost.get(0).getW_kind().equals("T")){
		x="delivery";
		y="transport";
	}
	else if(selectPost.get(0).getW_kind().equals("E")){
		x="hobbydrone";
		y="etc";
	}
	else{
		x="";
		y="";
	}
	session.setAttribute("postExpert", selectPost.get(0).getExp_id());
%>
<html>
	<head>
		<title>DRONY</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style type="text/css">
			#update{
				display: none;
			}
			.css-1nbuyxl {
    			color: rgb(154, 155, 167);
    			font-size: 11px;
    			font-family: 'Metro Sans',sans-serif;
    			box-sizing: border-box;
			}
			
			
			
		
		</style>
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
   					
   					<!-- 게시글 -->
   					<article id="view">
   					<div class="col-4 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<article id="view" class="post">
   								<h1><%=selectPost.get(0).getW_title()%></h1>
								<div> <img onerror=this.src="images/<%=x%>.png" src="upload/<%=selectPost.get(0).getW_img()%>"></div>
								<section class="post-content">
									<div><%=selectPost.get(0).getW_content() %></div>
									<div><span>첨부파일</span><a href="upload/<%=selectPost.get(0).getW_file() %>" download><i class="icon solid fa-download"></i></a></div>
									<div><%=selectPost.get(0).getW_price() %></div>
									<div><%=selectPost.get(0).getExp_id()%></div>
									<div><%=selectPost.get(0).getCreated_at().substring(0, selectPost.get(0).getCreated_at().length()-2) %></div>
								</section>
								<c:if test="${not empty loginExpert and loginExpert.exp_id eq postExpert}">
									<button onclick="toggleUpdate()" id="updateButton">수정</button>
									<button onclick="location.href='deletePostCon?w_idx=<%=selectPost.get(0).getW_idx()%>&w_kind=<%=selectPost.get(0).getW_kind()%>'">삭제</button>
								</c:if>
								<c:if test="${not empty loginUser}">
									<button onclick="location.href='insertWorkUserMypageCon?w_idx=<%=selectPost.get(0).getW_idx()%>&exp_id=<%=selectPost.get(0).getExp_id()%>'">의뢰하기</button>
								</c:if>
								<button onclick="location.href='<%=y %>.jsp'">목록</button>
   							</article>
   						</div>
   					</div>
   					</article>
   					
   					<!-- 어디로 넣어야하지...  -->
   					<article id="update">
						<form action="updatePostCon?w_idx=<%=selectPost.get(0).getW_idx() %>" method="post" enctype="multipart/form-data">
							<h1> 제목 : <input type="text" name="title" value="<%=selectPost.get(0).getW_title()%>"></h1>
							<div>
								
								<div> 분야 : 
									<select name="w_kind">
										<option value="">선택</option>
										<option value="P">방역·방제·살포</option>
										<option value="M">측량</option>
										<option value="S">촬영</option>
										<option value="T">물류·운송</option>
										<option value="E">기타</option>
									</select>
								</div>
								<div> 이미지 : <input type="file" name="img"> </div>
								<div> 내용 : <input type="text" name="content" value="<%=selectPost.get(0).getW_content()%>"></div>
								<div> 첨부파일 : <input type="file" name="file"></div>
								<div> 단가 : <input type="text" name="price" value="<%=selectPost.get(0).getW_price()%>"></div>
							</div>
							<input type="submit" value="수정완료">
						</form>
							
							<!-- Scripts -->
						<script>
							function toggleUpdate() {
								const update = document.getElementById('update');
								const view = document.getElementById('view');
								const updateButton = document.getElementById('updateButton');
								if(update.style.display !== 'none') {
									update.style.display = 'none';
									view.style.display='block';
									updateButton.innerText='수정';
								}
								else {
									update.style.display = 'block';
									view.style.display='none';
									updateButton.innerText='돌아가기';
								}
							}
						</script>
							
					</article>
   					
   		  						
   			<!-- 여기까지 -->				
   					
   				</div>
   			</div>
   		</section>
   		
   		      
		<!-- Footer -->
		<%@include file="footer.jsp" %>
		      
	</div>
	
	
	 <!-- 찐 -->
		
		
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