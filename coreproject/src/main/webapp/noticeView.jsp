<%@page import="com.smhrd.domain.userDTO"%>
<%@page import="com.smhrd.domain.expertDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.domain.noticeDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.noticeDAO"%>
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<%
	int number=Integer.valueOf(request.getParameter("number"));
	noticeDAO noticeDAO=new noticeDAO();
	List<noticeDTO> notice= noticeDAO.selectNotice(number);
%>
<html>
	<head>
		<title>DRONY</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style type="text/css">
			#update{
				display: none;
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
   				
   					<!-- sidebar -->
   					<%@include file="boardsidebar.jsp" %>
   					<!-- sidebar끝 -->
   					
   					<div class="col-9 col-12-medium imp-medium">
   						<div class="content">
   							<!-- Content -->
   							<article class="box page-content">
   								<header>
   									<h3>공지사항</h3>
   								</header>
   								
   								<!-- 여기서부터 오른쪽 페이지 수정되는 부분 -->
   								<div id="view">
   									<table class="inquiryview">
   										<thead>
   											<tr>
   												<td colspan="2"><h5><%=notice.get(0).getNotice_title() %></h5></td>
   											</tr>
   										</thead>
   										<tbody>
   											<tr>
   												<td><span>첨부파일</span><a href="notice/<%=notice.get(0).getNotice_file()%>" download><i class="icon solid fa-download"></i></a></td>
   												<td align="right"><span><%=notice.get(0).getCreated_at() %></span></td>
   											</tr>
   											<tr>
   												<td colspan="2"><span><%=notice.get(0).getNotice_content() %></span></td>
   											</tr>
   										</tbody>
   									</table>
   									<div>
   										<c:if test="${(not empty loginUser and loginUser.user_id eq 'admin')or(not empty loginExpert and loginExpert.exp_id eq 'admin')}">
											<button onclick="toggleUpdate()" id="updateButton">수정</button>
											<button onclick="location.href='deleteNoticeCon?notice_idx=<%=notice.get(0).getNotice_idx()%>'">삭제</button>
										</c:if>
										<button onclick="location.href='notice.jsp'">목록</button>
   									</div>
   								</div>
   								
								<div id="update" style="margin-left: 30px;">
									<form action="updateNoticeCon?notice_idx=<%=notice.get(0).getNotice_idx()%>" method="post" enctype="multipart/form-data">
										<table class="noticetable" height="180px">
											<tr>
   												<td>작성자</td>
   												<td>관리자</td>
   											</tr>
											<tr>
												<td>제목</td>
												<td><input type="text" name="title" value="<%=notice.get(0).getNotice_title()%>"></td>
											</tr>
											<tr>
												<td>첨부파일</td>
												<td><input type="text" name="file" value="<%=notice.get(0).getNotice_file()%>"></td>
											</tr>
											<tr>
												<td>내용</td>
												<td><textarea rows="7" cols="" name="content" value="<%=notice.get(0).getNotice_content()%>"></textarea></td>
											</tr>
											<tr>
												<td colspan='2' style="text-align:right;"><input type="submit" value="수정"></td>
											</tr>
										</table>
									</form>
								</div>
								
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
   							<!-- 여기까지 -->
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